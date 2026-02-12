-- ========================================
-- CITISIGNAL ENTERPRISE TELCO DATA MODEL
-- Optimized for Adobe Experience Platform
-- ========================================
-- 
-- Business Use Case: Family Account Optimization Campaign
-- Campaign: Multi-entity, multi-recipient sending (account holder + line users)
-- Key Feature: Device upgrades, internet speed optimization, equipment refresh
-- 
-- Tables (12):
-- 1. citisignal_products - Master product catalog
-- 2. citisignal_product_bundles - Package deals and family plans
-- 3. citisignal_product_relationships - Upsell/cross-sell intelligence
-- 4. citisignal_accounts - Billing accounts (one per family)
-- 5. citisignal_recipients - ALL messageable contacts (account holders + line users)
-- 6. citisignal_mobile_subscriptions - Active mobile lines
-- 7. citisignal_internet_subscriptions - Active home internet services
-- 8. citisignal_tv_subscriptions - TV/streaming packages
-- 9. citisignal_equipment_subscriptions - Physical devices (phones, routers)
-- 10. citisignal_mobile_usage_summary - Monthly mobile usage aggregates (CDR data)
-- 11. citisignal_internet_usage_summary - Monthly internet bandwidth analytics
-- 12. citisignal_offers - Available promotions and deals
-- 13. citisignal_offer_eligibility - Pre-calculated offer eligibility (marketing automation)
-- ========================================

-- ========================================
-- LAYER 1: PRODUCT CATALOG
-- ========================================

-- Master product catalog
CREATE TABLE citisignal_products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category VARCHAR(50) NOT NULL,
    product_type VARCHAR(50) NOT NULL,
    product_name VARCHAR(200) NOT NULL,
    product_display_name VARCHAR(200),
    plan_data_limit_gb INTEGER,
    plan_unlimited BOOLEAN,
    plan_hotspot_gb INTEGER,
    plan_international BOOLEAN,
    monthly_price DECIMAL(10,2),
    device_type VARCHAR(50),
    device_manufacturer VARCHAR(100),
    device_model VARCHAR(100),
    device_storage_gb INTEGER,
    device_msrp DECIMAL(10,2),
    internet_speed_mbps INTEGER,
    internet_upload_mbps INTEGER,
    internet_connection_type VARCHAR(50),
    internet_unlimited BOOLEAN,
    tv_channel_count INTEGER,
    tv_includes_premium BOOLEAN,
    tv_dvr_hours INTEGER,
    equipment_type VARCHAR(50),
    equipment_model VARCHAR(100),
    equipment_monthly_fee DECIMAL(10,2),
    product_status VARCHAR(50) DEFAULT 'active',
    launch_date DATE,
    retirement_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastmodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Package deals and family plans
CREATE TABLE citisignal_product_bundles (
    bundle_id VARCHAR(50) PRIMARY KEY,
    bundle_name VARCHAR(200) NOT NULL,
    bundle_description TEXT,
    bundle_type VARCHAR(50) NOT NULL,
    included_products TEXT NOT NULL,
    min_lines_required INTEGER,
    bundle_discount_type VARCHAR(50),
    bundle_discount_value DECIMAL(10,2),
    total_monthly_price DECIMAL(10,2),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastmodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Upsell and cross-sell relationships
CREATE TABLE citisignal_product_relationships (
    relationship_id VARCHAR(50) PRIMARY KEY,
    source_product_id VARCHAR(50) NOT NULL,
    target_product_id VARCHAR(50) NOT NULL,
    relationship_type VARCHAR(50) NOT NULL,
    recommendation_priority INTEGER DEFAULT 50,
    price_difference DECIMAL(10,2),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastmodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (source_product_id) REFERENCES citisignal_products(product_id),
    FOREIGN KEY (target_product_id) REFERENCES citisignal_products(product_id)
);

-- ========================================
-- LAYER 2: CUSTOMER & ACCOUNT MANAGEMENT
-- ========================================

-- Billing accounts (one per family/household)
CREATE TABLE citisignal_accounts (
    account_id VARCHAR(50) PRIMARY KEY,
    account_number VARCHAR(50) UNIQUE NOT NULL,
    account_type VARCHAR(50) NOT NULL,
    account_status VARCHAR(50) NOT NULL,
    account_holder_recipient_id VARCHAR(50),
    billing_address_line1 VARCHAR(200),
    billing_address_line2 VARCHAR(200),
    billing_city VARCHAR(100),
    billing_state VARCHAR(50),
    billing_zip VARCHAR(20),
    billing_country VARCHAR(3) DEFAULT 'US',
    service_address_line1 VARCHAR(200),
    service_address_line2 VARCHAR(200),
    service_city VARCHAR(100),
    service_address_state VARCHAR(50),
    service_zip VARCHAR(20),
    service_country VARCHAR(3) DEFAULT 'US',
    payment_method VARCHAR(50),
    autopay_enabled BOOLEAN DEFAULT FALSE,
    paperless_billing BOOLEAN DEFAULT FALSE,
    credit_score_tier VARCHAR(50),
    customer_since DATE,
    account_tenure_months INTEGER,
    lifetime_value DECIMAL(10,2),
    monthly_recurring_revenue DECIMAL(10,2),
    last_payment_date DATE,
    last_payment_amount DECIMAL(10,2),
    current_balance DECIMAL(10,2) DEFAULT 0.00,
    past_due_amount DECIMAL(10,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastmodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- All messageable contacts (account holders + line users)
CREATE TABLE citisignal_recipients (
    recipient_id VARCHAR(50) PRIMARY KEY,
    account_id VARCHAR(50) NOT NULL,
    recipient_type VARCHAR(50) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE,
    age INTEGER,
    gender VARCHAR(20),
    language_preference VARCHAR(10) DEFAULT 'en',
    timezone VARCHAR(50) DEFAULT 'America/New_York',
    customer_segment VARCHAR(50),
    engagement_score INTEGER,
    churn_risk_score INTEGER,
    lifetime_value DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastmodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES citisignal_accounts(account_id)
);

-- ========================================
-- LAYER 3: ACTIVE SUBSCRIPTIONS
-- ========================================

-- Active mobile lines
CREATE TABLE citisignal_mobile_subscriptions (
    subscription_id VARCHAR(50) PRIMARY KEY,
    account_id VARCHAR(50) NOT NULL,
    product_id VARCHAR(50) NOT NULL,
    line_user_recipient_id VARCHAR(50),
    phone_number VARCHAR(20),
    subscription_status VARCHAR(50) NOT NULL,
    contract_start_date DATE NOT NULL,
    contract_end_date DATE,
    contract_length_months INTEGER,
    renewal_eligibility_date DATE,
    is_upgrade_eligible BOOLEAN DEFAULT FALSE,
    current_device_id VARCHAR(50),
    plan_data_limit_gb INTEGER,
    monthly_recurring_charge DECIMAL(10,2),
    activation_date DATE,
    last_plan_change_date DATE,
    avg_data_usage_gb DECIMAL(10,2),
    avg_data_utilization_percent DECIMAL(5,2),
    has_overage_last_3mo BOOLEAN DEFAULT FALSE,
    total_overage_charges_last_3mo DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastmodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES citisignal_accounts(account_id),
    FOREIGN KEY (product_id) REFERENCES citisignal_products(product_id),
    FOREIGN KEY (line_user_recipient_id) REFERENCES citisignal_recipients(recipient_id)
);

-- Active home internet services
CREATE TABLE citisignal_internet_subscriptions (
    subscription_id VARCHAR(50) PRIMARY KEY,
    account_id VARCHAR(50) NOT NULL,
    product_id VARCHAR(50) NOT NULL,
    service_address_line1 VARCHAR(200),
    service_address_line2 VARCHAR(200),
    service_city VARCHAR(100),
    service_state VARCHAR(50),
    service_zip VARCHAR(20),
    subscription_status VARCHAR(50) NOT NULL,
    contract_start_date DATE NOT NULL,
    contract_end_date DATE,
    contract_length_months INTEGER,
    connection_type VARCHAR(50),
    advertised_speed_mbps INTEGER,
    upload_speed_mbps INTEGER,
    data_cap_gb INTEGER,
    monthly_recurring_charge DECIMAL(10,2),
    installation_date DATE,
    router_equipment_id VARCHAR(50),
    avg_bandwidth_usage_gb DECIMAL(10,2),
    peak_devices_connected INTEGER,
    avg_speed_delivered_mbps INTEGER,
    has_speed_complaints BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastmodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES citisignal_accounts(account_id),
    FOREIGN KEY (product_id) REFERENCES citisignal_products(product_id)
);

-- TV and streaming packages
CREATE TABLE citisignal_tv_subscriptions (
    subscription_id VARCHAR(50) PRIMARY KEY,
    account_id VARCHAR(50) NOT NULL,
    product_id VARCHAR(50) NOT NULL,
    subscription_status VARCHAR(50) NOT NULL,
    contract_start_date DATE NOT NULL,
    contract_end_date DATE,
    contract_length_months INTEGER,
    monthly_recurring_charge DECIMAL(10,2),
    set_top_boxes_count INTEGER DEFAULT 1,
    dvr_enabled BOOLEAN DEFAULT FALSE,
    premium_channels_count INTEGER DEFAULT 0,
    on_demand_rentals_last_month INTEGER DEFAULT 0,
    avg_viewing_hours_per_day DECIMAL(4,2),
    top_content_categories VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastmodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES citisignal_accounts(account_id),
    FOREIGN KEY (product_id) REFERENCES citisignal_products(product_id)
);

-- Physical devices (phones, routers, set-top boxes)
CREATE TABLE citisignal_equipment_subscriptions (
    equipment_id VARCHAR(50) PRIMARY KEY,
    account_id VARCHAR(50) NOT NULL,
    product_id VARCHAR(50) NOT NULL,
    linked_subscription_id VARCHAR(50),
    equipment_type VARCHAR(50) NOT NULL,
    manufacturer VARCHAR(100),
    model VARCHAR(100),
    serial_number VARCHAR(100),
    color VARCHAR(50),
    storage_capacity VARCHAR(50),
    purchase_date DATE,
    device_age_months INTEGER,
    device_condition VARCHAR(50),
    payment_status VARCHAR(50),
    original_price DECIMAL(10,2),
    remaining_balance DECIMAL(10,2) DEFAULT 0.00,
    monthly_payment DECIMAL(10,2) DEFAULT 0.00,
    payment_term_months INTEGER,
    trade_in_value DECIMAL(10,2),
    upgrade_eligible_date DATE,
    is_upgrade_eligible BOOLEAN DEFAULT FALSE,
    recommended_upgrade_product_id VARCHAR(50),
    equipment_status VARCHAR(50) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastmodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES citisignal_accounts(account_id),
    FOREIGN KEY (product_id) REFERENCES citisignal_products(product_id),
    FOREIGN KEY (linked_subscription_id) REFERENCES citisignal_mobile_subscriptions(subscription_id),
    FOREIGN KEY (recommended_upgrade_product_id) REFERENCES citisignal_products(product_id)
);

-- ========================================
-- LAYER 4: USAGE ANALYTICS
-- ========================================

-- Monthly mobile usage aggregates (CDR data)
CREATE TABLE citisignal_mobile_usage_summary (
    usage_id VARCHAR(50) PRIMARY KEY,
    account_id VARCHAR(50) NOT NULL,
    subscription_id VARCHAR(50) NOT NULL,
    usage_month VARCHAR(7) NOT NULL,
    data_usage_gb DECIMAL(10,2),
    voice_minutes INTEGER,
    sms_count INTEGER,
    international_calls_minutes INTEGER,
    roaming_charges DECIMAL(10,2) DEFAULT 0.00,
    overage_charges DECIMAL(10,2) DEFAULT 0.00,
    total_usage_charges DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastmodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES citisignal_accounts(account_id),
    FOREIGN KEY (subscription_id) REFERENCES citisignal_mobile_subscriptions(subscription_id)
);

-- Monthly internet bandwidth analytics
CREATE TABLE citisignal_internet_usage_summary (
    usage_id VARCHAR(50) PRIMARY KEY,
    account_id VARCHAR(50) NOT NULL,
    subscription_id VARCHAR(50) NOT NULL,
    usage_month VARCHAR(7) NOT NULL,
    total_bandwidth_gb DECIMAL(10,2),
    peak_bandwidth_gb DECIMAL(10,2),
    avg_daily_usage_gb DECIMAL(10,2),
    peak_devices_connected INTEGER,
    avg_speed_mbps INTEGER,
    utilization_percent DECIMAL(5,2),
    speed_complaints_count INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastmodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES citisignal_accounts(account_id),
    FOREIGN KEY (subscription_id) REFERENCES citisignal_internet_subscriptions(subscription_id)
);

-- ========================================
-- LAYER 5: MARKETING & OFFERS
-- ========================================

-- Available promotions and deals
CREATE TABLE citisignal_offers (
    offer_id VARCHAR(50) PRIMARY KEY,
    offer_name VARCHAR(200) NOT NULL,
    offer_type VARCHAR(50) NOT NULL,
    offer_category VARCHAR(50) NOT NULL,
    target_product_id VARCHAR(50),
    offer_description TEXT,
    discount_type VARCHAR(50),
    discount_value DECIMAL(10,2),
    discount_duration_months INTEGER,
    min_contract_months INTEGER,
    requires_trade_in BOOLEAN DEFAULT FALSE,
    requires_autopay BOOLEAN DEFAULT FALSE,
    requires_paperless BOOLEAN DEFAULT FALSE,
    stacking_allowed BOOLEAN DEFAULT FALSE,
    eligible_customer_segments VARCHAR(200),
    eligible_account_types VARCHAR(100),
    min_tenure_months INTEGER DEFAULT 0,
    valid_from DATE,
    valid_to DATE,
    is_active BOOLEAN DEFAULT TRUE,
    offer_code VARCHAR(50),
    offer_priority INTEGER DEFAULT 5,
    estimated_monthly_savings DECIMAL(10,2),
    estimated_total_value DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastmodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (target_product_id) REFERENCES citisignal_products(product_id)
);

-- Pre-calculated offer eligibility (marketing automation)
CREATE TABLE citisignal_offer_eligibility (
    eligibility_id VARCHAR(50) PRIMARY KEY,
    account_id VARCHAR(50) NOT NULL,
    recipient_id VARCHAR(50),
    offer_id VARCHAR(50) NOT NULL,
    subscription_id VARCHAR(50),
    is_eligible BOOLEAN NOT NULL,
    eligibility_score INTEGER,
    eligibility_reason TEXT,
    disqualification_reason TEXT,
    estimated_savings DECIMAL(10,2),
    recommendation_priority INTEGER DEFAULT 50,
    valid_from DATE,
    valid_to DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastmodified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES citisignal_accounts(account_id),
    FOREIGN KEY (recipient_id) REFERENCES citisignal_recipients(recipient_id),
    FOREIGN KEY (offer_id) REFERENCES citisignal_offers(offer_id),
    FOREIGN KEY (subscription_id) REFERENCES citisignal_mobile_subscriptions(subscription_id)
);
