---
title: Data Collection - FAC - Snowflakeアカウントの設定
description: Foundation - FAC - Snowflakeアカウントの設定
kt: 5342
doc-type: tutorial
exl-id: e72cdbfc-5b42-411f-9c63-e886776deabe
source-git-commit: d26d4735c92498d56beb7859ec67a0c3e174fc25
workflow-type: tm+mt
source-wordcount: '529'
ht-degree: 0%

---

# 3.1.1Snowflake環境の設定

## 3.1.1.1 アカウントの作成

[https://snowflake.com](https://snowflake.com) に移動します。 **無料で開始** をクリックします。

![FAC](./images/sf1.png)

詳細を入力し、「**続行**」をクリックします。

![FAC](./images/sf2.png)

詳細を入力し、クラウドプロバイダーを選択して、「**開始**」をクリックします。

![FAC](./images/sf3.png)

詳細を入力するか、「**スキップ** （x2）」をクリックします。

![FAC](./images/sf4.png)

その後、これが表示されます。 メールを確認し、送信された確認メールをクリックします。

![FAC](./images/sf5.png)

確認メールに記載されているリンクをクリックして、アカウントを有効にし、ユーザー名とパスワードを定義します。 「**使ってみる**」クリックします。次の演習では、このユーザー名とパスワードを使用する必要があります。

![FAC](./images/sf6.png)

その後、Snowflakeにログインします。 **今はスキップ** をクリックします。

![FAC](./images/sf7.png)

## 3.1.1.2 データベースの作成

**データ/データベース** に移動します。 「**+ データベース**」をクリックします。

![FAC](./images/db1.png)

データベースに **CITISIGNAL** という名前を使用します。 **作成** をクリックします。

![FAC](./images/db2.png)

## 3.1.1.3 テーブルの作成

これで、Snowflakeでテーブルの作成を開始できます。 以下にスクリプトを示します。このスクリプトを実行して、テーブルを作成します。

### 表 CK_PERSONS

「**+作成**」をクリックし、「**テーブル**」をクリックして、「**標準**」をクリックします。

![FAC](./images/tb1.png)

その後、これが表示されます。 以下のクエリをコピーして、Snowflakeに貼り付けます。 テーブルを作成する前に、画面の左上隅にある **CITIGNAL** データベースを選択してください。

```sql
create or replace TABLE CITISIGNAL.PUBLIC.CK_PERSONS (
	PERSON_ID NUMBER(38,0) NOT NULL,
	NAME VARCHAR(255),
	AGE NUMBER(38,0),
	EMAIL VARCHAR(255),
	PHONE_NUMBER VARCHAR(20),
	GENDER VARCHAR(10),
	OCCUPATION VARCHAR(100),
	ISATTMOBILESUB BOOLEAN,
	primary key (PERSON_ID)
);
```

**テーブルを作成** をクリックします。

![FAC](./images/tb2.png)

スクリプトが実行されると、**データベース/CITIGNAL/PUBLIC** の下にテーブルが表示されます。

![FAC](./images/tb3.png)

### 表 CK_FAMILIES

「**+作成**」をクリックし、「**テーブル**」をクリックして、「**標準**」をクリックします。

![FAC](./images/tb1.png)

その後、これが表示されます。 以下のクエリをコピーして、Snowflakeに貼り付けます。 テーブルを作成する前に、画面の左上隅にある **CITIGNAL** データベースを選択してください。

```sql
create or replace TABLE CITISIGNAL.PUBLIC.CK_HOUSEHOLDS (
	HOUSEHOLD_ID NUMBER(38,0) NOT NULL,
	ADDRESS VARCHAR(255),
	CITY VARCHAR(100),
	STATE VARCHAR(50),
	POSTAL_CODE VARCHAR(20),
	COUNTRY VARCHAR(100),
	ISELIGIBLEFORFIBER BOOLEAN,
	PRIMARY_PERSON_ID NUMBER(38,0),
	ISFIBREENABLED BOOLEAN,
	primary key (HOUSEHOLD_ID)
);
```

**テーブルを作成** をクリックします。

![FAC](./images/tb4.png)

スクリプトが実行されると、**データベース/CITIGNAL/PUBLIC** の下にテーブルが表示されます。

![FAC](./images/tb5.png)

### テーブル CK_USERS

「**+作成**」をクリックし、「**テーブル**」をクリックして、「**標準**」をクリックします。

![FAC](./images/tb1.png)

その後、これが表示されます。 以下のクエリをコピーして、Snowflakeに貼り付けます。 テーブルを作成する前に、画面の左上隅にある **CITIGNAL** データベースを選択してください。

```sql
create or replace TABLE CITISIGNAL.PUBLIC.CK_USERS (
	USER_ID NUMBER(38,0) NOT NULL,
	PERSON_ID NUMBER(38,0),
	HOUSEHOLD_ID NUMBER(38,0),
	primary key (USER_ID),
	foreign key (PERSON_ID) references CITISIGNAL.PUBLIC.CK_PERSONS(PERSON_ID),
	foreign key (HOUSEHOLD_ID) references CITISIGNAL.PUBLIC.CK_HOUSEHOLDS(HOUSEHOLD_ID)
);
```

**テーブルを作成** をクリックします。

![FAC](./images/tb6.png)

スクリプトが実行されると、**データベース/CITIGNAL/PUBLIC** の下にテーブルが表示されます。

![FAC](./images/tb7.png)

### 表 CK_MONTHLY_DATA_USAGE

「**+作成**」をクリックし、「**テーブル**」をクリックして、「**標準**」をクリックします。

![FAC](./images/tb1.png)

その後、これが表示されます。 以下のクエリをコピーして、Snowflakeに貼り付けます。 テーブルを作成する前に、画面の左上隅にある **CITIGNAL** データベースを選択してください。

```sql
create or replace TABLE CITISIGNAL.PUBLIC.CK_MONTHLY_DATA_USAGE (
	USAGE_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 noorder,
	USER_ID NUMBER(38,0),
	MONTH DATE,
	DATA_USAGE_GB NUMBER(10,2),
	primary key (USAGE_ID)
);
```

**テーブルを作成** をクリックします。

![FAC](./images/tb8.png)

スクリプトが実行されると、**データベース/CITIGNAL/PUBLIC** の下にテーブルが表示されます。

![FAC](./images/tb9.png)

### 表 CK_MOBILE_DATA_USAGE

「**+作成**」をクリックし、「**テーブル**」をクリックして、「**標準**」をクリックします。

![FAC](./images/tb1.png)

その後、これが表示されます。 以下のクエリをコピーして、Snowflakeに貼り付けます。 テーブルを作成する前に、画面の左上隅にある **CITIGNAL** データベースを選択してください。


```sql
create or replace TABLE CITISIGNAL.PUBLIC.CK_MOBILE_DATA_USAGE (
	USAGE_ID NUMBER(38,0) NOT NULL autoincrement start 1 increment 1 noorder,
	USER_ID NUMBER(38,0),
	DATE DATE,
	TIME TIME(9),
	APP_NAME VARCHAR(255),
	DATA_USAGE_MB NUMBER(10,2),
	NETWORK_TYPE VARCHAR(50),
	DEVICE_TYPE VARCHAR(50),
	COUNTRY_CODE VARCHAR(10),
	primary key (USAGE_ID)
);
```

**テーブルを作成** をクリックします。

![FAC](./images/tb10.png)

スクリプトが実行されると、**データベース/CITIGNAL/PUBLIC** の下にテーブルが表示されます。

![FAC](./images/tb11.png)

これで、すべてのテーブルが作成されました。


## 3.1.1.4 サンプルデータの取り込み

これで、データベースへのサンプルデータの読み込みを開始できます。

...

これで、Snowflakeでの設定が完了しました。


次の手順：[3.1.2 スキーマ、データモデルおよびリンクの作成 ](./ex2.md)

[モジュール 3.1 に戻る](./fac.md)

[すべてのモジュールに戻る](../../../overview.md)
