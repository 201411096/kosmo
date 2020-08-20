--------------------------------------------------------
--  ������ ������ - �����-6��-20-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence BOOKSALE_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."BOOKSALE_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence BOOK_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."BOOK_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 11 START WITH 235 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence BUYCARTLIST_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."BUYCARTLIST_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence BUYLIST_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."BUYLIST_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence BUYREVIEW_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."BUYREVIEW_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence BUY_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."BUY_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence QUESTION_GROUPID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."QUESTION_GROUPID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence QUESTION_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."QUESTION_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence STORE_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."STORE_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence TENDENCY_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."TENDENCY_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence WRITER_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TEAMPROJECT"."WRITER_ID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 11 START WITH 1438 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Table BOOK
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."BOOK" 
   (	"BOOK_ID" NUMBER(30,0), 
	"WRITER_ID" NUMBER(30,0), 
	"BOOK_PRICE" NUMBER(30,0), 
	"BOOK_NAME" VARCHAR2(256 BYTE), 
	"BOOK_GENRE" VARCHAR2(30 BYTE), 
	"BOOK_STORY" VARCHAR2(2048 BYTE), 
	"BOOK_PDATE" VARCHAR2(30 BYTE), 
	"BOOK_SALEPRICE" NUMBER(30,0), 
	"BOOK_CNT" NUMBER(30,0), 
	"BOOK_SCORE" NUMBER(30,2), 
	"BOOK_SCORECOUNT" NUMBER(30,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BOOKSALE
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."BOOKSALE" 
   (	"BOOKSALE_ID" NUMBER(30,0), 
	"BOOK_ID" NUMBER(30,0), 
	"STORE_ID" NUMBER(30,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BUY
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."BUY" 
   (	"BUY_ID" NUMBER(30,0), 
	"BUYLIST_ID" NUMBER(30,0), 
	"BOOK_ID" NUMBER(30,0), 
	"BUY_CNT" NUMBER(30,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BUYCARTLIST
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."BUYCARTLIST" 
   (	"BUYCARTLIST_ID" NUMBER(30,0), 
	"CUSTOMER_ID" VARCHAR2(30 BYTE), 
	"BOOK_ID" NUMBER(30,0), 
	"BUYCARTLIST_CNT" NUMBER(30,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BUYLIST
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."BUYLIST" 
   (	"BUYLIST_ID" NUMBER(30,0), 
	"CUSTOMER_ID" VARCHAR2(30 BYTE), 
	"BUY_DATE" DATE, 
	"BUYLIST_SHIPPINGADDRESS" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BUYREVIEW
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."BUYREVIEW" 
   (	"BUYREVIEW_ID" NUMBER(30,0), 
	"CUSTOMER_ID" VARCHAR2(30 BYTE), 
	"BOOK_ID" NUMBER(30,0), 
	"BUYREVIEW_CONTENT" VARCHAR2(2048 BYTE), 
	"BUYREVIEW_SCORE" NUMBER(30,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CUSTOMER
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."CUSTOMER" 
   (	"CUSTOMER_ID" VARCHAR2(30 BYTE), 
	"CUSTOMER_PASSWORD" VARCHAR2(30 BYTE), 
	"CUSTOMER_NAME" VARCHAR2(30 BYTE), 
	"CUSTOMER_TEL" VARCHAR2(30 BYTE), 
	"CUSTOMER_POINT" NUMBER(30,0), 
	"CUSTOMER_FLAG" NUMBER(30,0), 
	"CUSTOMER_EMAIL" VARCHAR2(60 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table QUESTION
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."QUESTION" 
   (	"QUESTION_ID" NUMBER(30,0), 
	"CUSTOMER_ID" VARCHAR2(30 BYTE), 
	"QUESTION_FLAG" NUMBER(30,0), 
	"QUESTION_TITLE" VARCHAR2(30 BYTE), 
	"QUESTION_CONTENT" VARCHAR2(2048 BYTE), 
	"QUESTION_GROUPID" NUMBER(30,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table STORE
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."STORE" 
   (	"STORE_ID" NUMBER(30,0), 
	"STORE_NAME" VARCHAR2(30 BYTE), 
	"STORE_ADDR" VARCHAR2(256 BYTE), 
	"STORE_POINT" VARCHAR2(256 BYTE), 
	"STORE_TEL" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TENDENCY
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."TENDENCY" 
   (	"TENDENCY_ID" NUMBER(30,0), 
	"CUSTOMER_ID" VARCHAR2(30 BYTE), 
	"ART" NUMBER(30,0), 
	"SOCIAL" NUMBER(30,0), 
	"ECONOMIC" NUMBER(30,0), 
	"TECHNOLOGY" NUMBER(30,0), 
	"LITERATURE" NUMBER(30,0), 
	"HISTORY" NUMBER(30,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table WRITER
--------------------------------------------------------

  CREATE TABLE "TEAMPROJECT"."WRITER" 
   (	"WRITER_ID" NUMBER(30,0), 
	"WRITER_NAME" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into TEAMPROJECT.BOOK
SET DEFINE OFF;
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (33,14,15000,'ħ���� ��','TECHNOLOGY','20���� ȯ���� �ְ��� ������ħ���� ����. 50�ֳ� ��� ���������� �Ⱓ �� �� å�� ��Ÿ�ӡ����� 20���⸦ ��ȭ��Ų 100�� �� �� ������� ���� ����ÿ ī���� �� å����, ȯ�� ������ �ɰ����� �߿伺�� ���ڵ鿡�� �ϱ��� �� å�̴�. ���ڴ� ģ���κ��� ���� ���� �� ���� ���� �������� ��� ���¿� �� ���輺�� �����ϰ�, �������ڷμ��� �������İ� �۰��μ��� �ɷ��� ������ ���� �������� ���� ���� ���������� ������ ȯ�� ������ ���⼺�� �˱� ���� Ǯ��´�. ���Ҿ� ���к��� ������ ������� �ı��Ǵ� �߻� �������� ����� �������ϰ� �����Ͽ�, ���°��� ������ ��� ���۵ǰ� ������ �ڿ�ȯ�濡 � ������ ��ġ���� �� ��ü������ �����Ͽ���. �̸� ���� ���ο� ������ ������ü�� ���¸� �����ϰ�, ȯ�湮���� ���� ���ߵ��� ������ ȯ���ų �� �ִ� ��ȸ�� �����Ͽ���.','2011-12-30',18000,9,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (37,18,19000,'¡���','HISTORY','���� �� �ô뿡 �ʿ��� �ݸ鱳��, �������� ��¡��ϡ��� �� �ô밡 �ʿ�� �ϴ� å�̴�. ���� �츮�� ���� ¡���ϰ� �ִ°�? �� å�� �� �������� �����ֶ��� ���������� ���� �ô� �ְ��� �������, �׸� ������� �����ֶ��� �̾߱��� �� ����. �̼����� ��Ź�Ͽ� �����ֶ��� ���������Ͽ� 7�� ������ �¸��� �̲� �庻���̶� �� �� �ֱ� �����̴�. ����� ä��� ���� ������ ���̴� ��ŵ��, �Ƿ��� ��Ű���� �ϻ� ���� ���ϵ��� �̿��ϰ� �鼺���� ���� �� ������ ���� �̲��� �̶��� ������� �̼����� �츮���� �־��ٴ� ����� ���� õ���̶� �� ���ۿ� ����.','2020-02-20',22000,22,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (40,21,11500,'������ ���','HISTORY','���ڴ� ���� �ҿ��� ����� ���� �ڱ� �ڽ��̶�� ���ϸ�, ����п��� �߿��ϰ� �ٷ�� �ο����� �ΰ����赵 �츮�� � ���� ������ ��ġ�� ��� ��� �ϳ���� ���Ѵ�. ������� ����, ���� �����ڿ� ��ġ��, ���� ������ �� �츮���� ����1% �ȿ� ��� 4õ�� ���� �����͸� ���� �м��Ͽ� ������� Ư¡�� ���� �µ��� ������� �������� �ؼ��ϰ� �����Ͽ���.','2013-02-28',14500,77,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (21,6,20000,'�ڽ���','TECHNOLOGY','���� ���缭�� �������ڽ��𽺡�. �� å���� ���ڴ� ������ ź���� ���ϰ��� ��ȭ, �¾��� ��� ����, ���ָ� ������ ������ �ǽ� �ִ� ������ �Ǵ� ����, �ܰ� ������ ���� ���� � ���� ������ �� ������ ������ �Ϸ���Ʈ�� ��鿩 ��̷Ӱ� �����Ѵ�. ���� õ������ ��ǥ�ϴ� ������ �������� ���ڴ� �� å���� ������� ������ ������, ������ ������ �����ϰ� �ؼ��ϴ� ���� �ɷ��� ������ �����Ѵ�.','2006-01-20',16000,100,15.15,4);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (22,7,18000,'�汸�� �̼���','ART','���汸�� �̼������� 2018�� �Ⱓ�� �̷� �̼��� ����ϰ� ����� ������� �������̶� ���ܿԴ� ���ߵ鿡�� ū ����� ������, ���ο� �̼� ������ ������ ������. ���� �о��� ����Ʈ������ ������ ����޾� �� ���汸�� �̼������� 2�� ���� 10�� �� �Ǹ� ����� �����ߴ�. �̸� ����ϱ� ���� Ư�������� �Ⱓ�� �̹� å�� �������̺� �̼��� ����ǡ�����, ������ �ĸ��� 3�� �̼��� �� �ϳ��� ������ �̼����� ������ �濡�� ���ϰ� ��� �� �ֵ��� �ʴ��Ѵ�.','2020-05-05',14000,100,140,6);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (95,146,12120,'�ڷγ� ���� ����','ECONOMIC','�� ������ �Ｚ���ڸ� ��� �� �� ������ �ŵ��� � �ֽ��� ������?
�������� �Ű� �Բ����ϴ� ���� �м��� ���� ����','2020-05-25',15120,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (96,150,13500,'������ 3�� ����� ����','ECONOMIC','��ſ��Դ� �̱�� ���� �ó������� �ִ°�?
�ѱ� ��ǥ �̷����� ������ �ڻ簡 �����ϴ�
�ڷγ�19 �ҵ��� ���� ���۵� �뼼������� ���� ���ϰ� �¸� ��Ģ','2020-05-11',15000,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (97,151,13000,'1�� 1Ŭ���� 1���','ART','���̷ο� Ŭ���� �������� �� �ظ� ���� ä���!','2020-01-15',17800,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (98,153,30000,'����̼���','ART','����̼��� �Թ��� �ʵ���!
������̼��硻�� �̼��̶�� �о߿� ó�� �Թ��Ͽ� ������ �����⸸ �� ������� ���� �̷��� ������ �����ϱ� ���� å�̴�.','2003-07-10',38000,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (99,154,30000,'������ ������','HISTORY','���縦 �� �� �����ϱ� ���Ͽ�
�����۵���б��� �������� �罺�� �׸����� ���츮�� ���縦 �鿩�ٺ��� ������ �� ���� ���Ⱑ �ִ١��� ���� �� �ִ�. ���ϳ���...','2020-05-25',35550,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (100,155,31000,'������, ���縦 ����','HISTORY','ǳ�亴�� �ҵ�������, �ݸ����� ����������
�������� ������ ��� 21���� ����ȭ
2008�� ó�� �ѱ��� �湮���� �� ���� �̱��� ���� ���� ������ �˹ߵ� ��ġ�� ������ �Ѻ��ǿ� �־���.','2020-05-29',35000,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (101,159,10000,'������ ��','LITERATURE','�׸����� ���� ������, ������ �� ���� �����ϴ� �����
�ø��� �� �� ��� ���� ������ �׵��� �̾߱�
�д� ���� ������ �ڱ��� ����� �۰� ���. ���� �����԰� �������� ���� �̾߱��� ���� ������ �е��� ���ڿ� ��а��鿡�� ���� �︲�� �ش�. ','2020-04-27',12500,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (102,160,11000,'������ ���','LITERATURE','��������� �Ҽ��� �� �̷��Գ� �Ƹ��ٿ�

2020��� �ѱ������� �̲�� ������ ������
������ �������� ���� �����ϰ� ���õ� ������ ����
������� �ι�° �Ҽ��� �������� ��С�. 2018�� ������ 2019�� �������� ��ǥ�� ��ǰ 6���� ���� �Ҽ����̴�.','2020-05-01',16000,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (103,161,13000,'������ ��','SOCIAL','����� �� ���������� �ΰ� �����ϴ°�?
������� ��� ���� ���踦 ������ å �������� ����. 25�� �̻� 30�� �̻��� ���� ������ ���� ���忡�� �����ϸ� ���� ���� ���� ���θ���Ʈ�� Ȱ���ؿ� ���ڰ� �߱�, �̱�, ������, ���þ�, �ѱ��� �Ϻ�, ������ī, ��ƾ �Ƹ޸�ī, �ߵ�, �ε��� ��Ű��ź, �ϱ� �� �� ���踦 10���� �������� ���� �������� ������ 21���� ����翡 ��ġ�� ������ ���������� ����ģ å�̴�.','2016-08-10',17000,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (108,162,14000,'ö���� ���','SOCIAL','���� Ȳ������ �� ������ �̾߱�� ���ƿԴ�!
�ѹݵ� 100���� ���縦 ��մ� ����ϰ� ������ ������ ��
�ѹݵ� ����� ���縦 ��մ� ��ö���� ��롻. �� ��ǰ�� ö���� ������ �ѷ��� ����� ���縦 ���� ������������� �ع� ���� �׸��� 21������� �̾����� �뵿�ڿ� ������ ���� �ǰ����� �ٷ��...','2020-06-05',20000,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (109,163,15000,'�̱��� ������','TECHNOLOGY','��Ư�� �߻�� ���� �������� 40�� �Ⱓ ������ ����� ������ �߽ɿ� �� ���� ���缭�� ���̺�!
1976��, ó�� �Ⱓ�Ǿ��� ��� ���а�� �Ϲ� ���ߵ鿡�� �������� ������ �ҷ�����Ű�� ������ ���������� ������ ���̱��� �����ڡ��� 40���̶�� ������ ������ ��ġ�� �� �߿伺�� ���̸� ����� Ȯ���ϰ� �����޾Ұ�, 25�� �̻��� ���� �����Ǿ����� �����̵��� �� �о�� �� ���а��� �������� �ڸ� ��Ҵ�.','2018-10-20',20000,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (110,164,11000,'������ �︲','TECHNOLOGY','������� �� ���� ����� �츮 ���縦 �ٶ󺸴� �ٸ� ���� �߰� �ϴ�!
����������� ������ �� ���� ���踦 �а� �����ϴ� �� �ٸ� ����� �ȳ��ϴ� �������� �︲��. ��, �ð���, ����, ���ں��� �ּ��ۿ��� ����, ī����, ��Ʈ����, ���ڿ���, ���������� �������� �ٷ�� �ٽ� ������� ������ �Ұ��ϸ鼭 ������� ���ο� �� ���� �츮 ����� ��, ������ �������� Ÿ�ڿ��� ����, ���迡 ���� �������� ���ο� Ʋ���� �ٶ� �� �ְ� �ȳ��Ѵ�.','2018-11-07',15000,100,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (2,2,3000,'�� �غ�','ECONOMIC','�ο� ����� ������ �����, ������ ���� Having! ���� ���ʷ� �̱����� ��(�)�Ⱓ�Ǿ� ���谡 ���� ã�� ���� ���� �غ�(The Having)��.','2020-03-01',12000,100,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (3,2,4000,'������ ���2','ECONOMIC','���ѹα� ���� 1%�� ���䰡 ���ϴ� ���� ������������ ��С�. �� å�� ��������� �����̴١���� ������ �������� ���� ���踦 Ǯ���, �츮�� ����� ������ ���� �ҿ��� ��ü�� �������� �鿩�ٺ���.','2013-02-28',14000,100,9,2);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (4,3,5000,'�־��� �ʰ� ����ϰ�','LITERATURE','��� �������� �������� ���� ��ȭ�����ڰ� �� ��!�������� ���� ���� �ߴ١� ����� �۰� 4�� ���� ����','2020-06-05',16000,100,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (5,4,6000,'���ο��� ����� �������� �� �¿��� ���� �Ա⵵ �ߴ�','LITERATURE','����Ʈ ���� ����������� ���� �ڱ�ȣ�� ù ��° ���������ο��� ����� �������� �� �¿��� ���� �Ա⵵ �ߴ١�) �Ⱓ!','2020-05-14',13000,100,5,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (6,4,6000,'�������','LITERATURE','�������Գ� �ִ� ������ ����� ����, ������� ������ ǥ������ ���� ���ο��ϴ� �������������� �̸��� �߶Ի��� �ձ۾��� ��� ������ ������� ������ ���� 3�� ���� �̸� �� �̵鿡�� 5,000���� ������ ���´� �ڱ�ȣ. 13�� SNS �����ڵ��� ������ �︰ ���� �̾߱⸦ ���������������. 2017�� �Ⱓ ���� ������ ���ڵ��� ������ �����ؿ� ������������� ���ο� ����� �������� ���� ���� 4���� ���� �������������� ���ڵ�� �ٽ� ������.','2019-09-09',17000,100,132.9,4);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (23,19,11500,'����� ���� ����, �ʸ� ����','ART','����Ʈ������ �󸶵��� ���� �����ϰ� ���ػ� ������ ���� �� �ִ� ����, ������ �ʸ� ������ ��� ������� �ð� �ִ�. ������ ��ȸ�� ī�޶���� SLR ī�޶���� ���⿡ �´� ī�޶�� �ڽŸ��� ������ ��� SNS�� �ø��� �������� ������ ��´�. �� å�� �ʸ� ī�޶��� �⺻ ������ ���� ��ȸ�� ī�޶� ������Ŭ���ϴ� ���, �ʸ� �������� ���� �۾��� �����ִ� �� ����� ���ͺ���� �ʸ� ������ ���� �پ��� ��ſ��� �����Ѵ�.','2020-06-01',14500,50,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (24,9,12000,'�츮 ������ �̼���','ART','���츮 ������ �̼������� ���� ���̵� �׸��� ���� �������� �ȳ��ϴ� ���׸� ���� �ǿ뼭����. �̼����� �̼� ��ȣ���� ������ �۰��� ���Ⱓ ��õ�ؿ� �׸� ������� ��Ҵ�. ���׸����� ���� ���ϱ⡵�� �̸� ���� �� ������� ���İ� �̷����� �����ϴ� ������ �ƴ�, ��ǰ�� �����ϰ� �����ϸ� ���� ���� �˷��ش�. �׸� �տ��� ������ ��� �����ؾ� ���� �����ߴ� �̵鿡�� ����� ���� ���Ͽ츦 ������ ���̴�.','2020-04-28',15000,13,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (25,10,12000,'������ ����������','SOCIAL','�����ϰ� ����ϸ� �ϻ����̰� �ڿ������� �������� �ϵ� �ӿ��� ������ �츮�� ��ġ�� �ִ� ������ ������ ������ ��ī�Ӱ� �����ϴ� �������� ���������ڡ�. ������ �簢���뿡 ���� �̵��� ���� ã�ư��� ���� Ȱ��������, ����С���ȸ�����С������� �ѳ���� �������� �ð��� �������� ������ ������ ���������� ������ �̷��� ��븦 �����ϴ� �� �����ؿ� �������� ������ ������ �ΰ� �ɸ��� ���� �������� �ֽ� ����, ���忡�� ����� ������ ���, �л���� ������ �����ؿ� ��м����� ���������� �м����������� �پ��� ������ ������ �츮 �ϻ� ������ ������ ������ �������� �����ϰ� ��Ƴ´�.','2019-07-17',15000,5,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (26,11,13500,'�츮�� ������ �翬���� �ʽ��ϴ�','SOCIAL','���츰 ���� �̻��� ���� ��� �ִ�.�� 2018�� ���ΰ����� �뵿 ȯ�濡 �Ƶ��� ���� ͺ ���� �� ��Ӵ��� �� �Ѹ���� ���� �ǹ̸� ��� �ִ�. �ѱ��� ���� ���μҵ� 3�� �Ҵ뿡 ������ ��ŭ ���������� �������� �к� ������ ���� ���ǵ� ��ü������ �� ������ ������ ������� ���� �ӿ��� �����ұ�? �߾Ӵ� �����а� �������� ���������������� ������ �贩�� ������ ���̻��� ���� ���ѹα��� ������ ������ ����ģ���츮�� ������ �翬���� �ʽ��ϴ١�. �ֿ� ���л���Ʈ �ǽð� �˻�� ������ �������� ������ ����Ų JTBC �����̳��� Ŭ�󽺡��� ������ 2���ۡ� �������� �α� ��ĳ��Ʈ ������, �ֿ��� ���źҼ ���� ��õ ���Ǽҵ����, ���� �̵鿡�� ��� ���� ������ ����� �Ȱ��־��� �贩�� ������ ������ �м��� ������ ���� �����Ͽ� �� �� ���� å�� ��Ҵ�.','2020-03-06',16500,23,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (35,17,19000,'���μ��� ���������Ƿ�','HISTORY','�ټ��� ��ۿ� �⿬�� ȭ���� ���� �� �ִ� ��Ÿ���� ���μ��� ����ְ� ���� �ִ� �ѱ��� å �����μ��� ���������Ƿϡ�. 27���� ������ �յ��� �� ������ �ҷ� ��� �ٽ����� �ֿ� ��ǵ��� Ǯ� å����, ���μ� Ư���� ���Է� �ִ� �����԰� ��ġ �ִ� ������ ����ü �״�� å���� ��Ҵ�.
���ư�, �� å�� ��̴� ��Ÿ���ϰ� ��ƴٴ� ������ ���������� ������ ��Ʈ���� �ִ�. ���̱� ������ �Ƶ�μ�, �������μ�, �ƹ����μ��� �ΰ����� ���� ������ �巯�� ������� ���ٸ� ��̸� �����Ѵ�. �������� ū �ٱ�� �ٽ��� �˰� ������, ���� �������� ���ߴ� ���ڵ鿡�� ����ϰ� ��� �� �ִ� ���� �̾߱⸦ ����� ���̴�.','2016-07-20',22000,13,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (28,13,15000,'�鼦','ECONOMIC','��� �̱��� ��2�� ��������� ���� ���� �б��� ��Ҵ°�? ������ ���� ��Ƽ�� �⽺���� ��ȭ����Ÿ����ø���, ���̿���ũ ����� ���� �� ������ũ���� �̵��� ������ �޶��⿡ ������ ������ ������ ������ �� �� �־�����? ����� ���� ���� ���� ���̴� �̵� ����, ���, �������Դ� �� ���� �������� �־���. �ٷ� �ܸ� �޴� ���̵� �� ������ ������ ������ �������� ����� �ý����� ���߾��� ��. �̵��� â�Ǽ��� ȿ������ ����ȯ �ý����� ���� ������ �б��� ���, �������� ���￡�� �¸�������, ������ �����ڵ��� ����ġ�� ������ ������� �ŵ쳵��.','2020-04-28',18000,11,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (36,16,13000,'����縦 �ٲ� 10���� ��','HISTORY','���� ������ ��ȸ�� ġ���� ���⿡ ���߷ȴ� 10���� ������ ������ ��񸶴� �η��� ������ ������ �������� ���� 10���� �࿡ ���� ��������ϰ� ������ �̾߱⸦ ���� �η� ���縦 ���캸�� ������縦 �ٲ� 10���� �ࡻ. �η� ����� ������ ���� ���� �����. ������, ���󸮾�, �ŵ�, ������ ���� ġ������ ������ ������ ���뿡 ��Ÿ�� ��ī�ο� âó�� �η��� �����ϸ� ��Ÿ��C, ����, ��ٸ���, AZT ���� ���� ���������� �����Ͽ� ����� ���а� �Ǿ��־���. ���ڴ� ���翡 ������ ���ٰ�� ��������, �׶� ���� �̷������ �ϴ� ������ ����� ������ ��� ����� �� �� ��������ϰ� ������ �ְ� �ٰ��´ٰ� �̾߱��ϸ鼭 �η� ������ �� ���� ��鿡 �����࡯�� �����ϰ�, �� ���� ��ȯ���� ������ ����� �Ǿ�ǰ�� ���踦 �̾߱��Ѵ�.','2018-05-10',16000,50,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (30,15,19000,'���丮�ڸ� BIM','TECHNOLOGY','BIM(Building Information Modeling)�̶� ��ǻ�� �ϵ����� ����Ʈ��� �ʺ� Ȱ���Ͽ� �پ��� �о��� �����ڵ� �� ������ ������� ����, ������, ������ �� ���� ���� ���鿡�� ������� ����ȭ�ϰ� �ð��� �ռ� ����������� ����ũ�� Ȯ���ϰ� �ؼ������ν� ����ȭ�� �ð� ���μ����� �����ϸ�, ���������ܰ� ���� ������, ���, ���� �� �پ��� ���鿡�� �ü��� Ȱ���� ����ȭ�ϴ� �Ϳ� ������ �� �����̴�.','2020-05-25',22000,8,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (31,12,14000,'ȫ���� �ƴ϶� �����Դϴ�','SOCIAL','����û���� ���� �� û�ʹ� �����м��뼾���� �������� ��ȫ���� �ƴ϶� �����Դϴ١�. �Ź��� ���ڿ��� ���ͳ� ������ ������� å����, û�ʹ� �����м��뼾������� �õ�̵��� ���̵� �ѳ���� ���Ӿ��� ������ �����ؿ� ������ �������� �������� �������С����� ��� ������ �Ϲ����� ȫ���� �ƴ� �����롯�� �ؾ� �Ѵٰ� ���Ѵ�. �״� �̵�� ���°��� ��ȭ�� ���� ������ ��� �޶���������, �׷����� ������ �ʴ� ������ �ٽ��� �������� ǳ���� ���� ����� ��ī�ο� �������� ¤�´�.','2020-05-25',17000,13,4,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (1,1816,12,'�׽�Ʈ','ECONOMIC','11','2020-06-16',13,1,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (15,1816,12,'�׽�Ʈ22','LITERATURE','1','2020-06-14',13,1,0,1);
Insert into TEAMPROJECT.BOOK (BOOK_ID,WRITER_ID,BOOK_PRICE,BOOK_NAME,BOOK_GENRE,BOOK_STORY,BOOK_PDATE,BOOK_SALEPRICE,BOOK_CNT,BOOK_SCORE,BOOK_SCORECOUNT) values (48,1816,12,'�׽�Ʈ22222','LITERATURE','11','2020-06-25',13,1,0,1);
REM INSERTING into TEAMPROJECT.BOOKSALE
SET DEFINE OFF;
REM INSERTING into TEAMPROJECT.BUY
SET DEFINE OFF;
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (1,1,2,3);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (2,1,3,2);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (3,1,6,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (4,1,22,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (5,1,31,2);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (21,21,22,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (22,22,37,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (23,23,37,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (24,24,2,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (25,25,2,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (26,26,2,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (27,27,2,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (28,28,2,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (29,29,2,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (30,30,2,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (31,31,2,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (32,32,2,1);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (33,33,2,20);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (34,34,2,20);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (35,35,2,20);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (36,36,2,10);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (37,37,2,15);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (38,38,2,15);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (39,39,2,15);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (40,40,2,15);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (41,41,2,40);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (42,42,2,40);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (43,43,2,40);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (44,44,2,30);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (45,45,2,30);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (46,46,2,30);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (47,47,2,30);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (48,48,2,30);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (49,49,2,30);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (50,50,3,30);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (51,51,3,30);
Insert into TEAMPROJECT.BUY (BUY_ID,BUYLIST_ID,BOOK_ID,BUY_CNT) values (52,52,3,50);
REM INSERTING into TEAMPROJECT.BUYCARTLIST
SET DEFINE OFF;
Insert into TEAMPROJECT.BUYCARTLIST (BUYCARTLIST_ID,CUSTOMER_ID,BOOK_ID,BUYCARTLIST_CNT) values (4,'bbb',2,2);
REM INSERTING into TEAMPROJECT.BUYLIST
SET DEFINE OFF;
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (1,'aaa',to_date('20/06/11','RR/MM/DD'),'��õ�� �߾ӷ� 34���� 51');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (21,'admin',to_date('20/06/13','RR/MM/DD'),'��õ�� �߾ӷ� 34���� 5d');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (22,'admin',to_date('20/06/13','RR/MM/DD'),'��õ�� �߾ӷ� 34���� 5s');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (23,'admin',to_date('20/06/13','RR/MM/DD'),'��õ�� �߾ӷ� 34���� 5s');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (24,'aaa',to_date('20/06/13','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (25,'aaa',to_date('20/06/12','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (26,'aaa',to_date('20/06/10','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (27,'aaa',to_date('20/06/09','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (28,'aaa',to_date('20/06/08','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (29,'aaa',to_date('20/06/07','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (30,'aaa',to_date('20/06/06','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (31,'aaa',to_date('20/06/05','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (32,'aaa',to_date('20/06/04','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (33,'aaa',to_date('20/06/03','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (34,'aaa',to_date('20/06/02','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (35,'aaa',to_date('20/06/01','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (36,'aaa',to_date('20/05/30','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (37,'aaa',to_date('20/05/29','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (38,'aaa',to_date('20/05/28','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (39,'aaa',to_date('20/05/27','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (40,'aaa',to_date('20/05/26','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (41,'aaa',to_date('20/05/25','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (42,'aaa',to_date('20/05/24','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (43,'aaa',to_date('20/05/23','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (44,'aaa',to_date('20/05/22','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (45,'aaa',to_date('20/05/21','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (46,'aaa',to_date('20/05/20','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (47,'aaa',to_date('19/05/20','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (48,'aaa',to_date('19/04/20','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (49,'aaa',to_date('19/03/20','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (50,'aaa',to_date('19/02/20','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (51,'aaa',to_date('19/01/20','RR/MM/DD'),'��õ��');
Insert into TEAMPROJECT.BUYLIST (BUYLIST_ID,CUSTOMER_ID,BUY_DATE,BUYLIST_SHIPPINGADDRESS) values (52,'aaa',to_date('18/01/20','RR/MM/DD'),'��õ��');
REM INSERTING into TEAMPROJECT.BUYREVIEW
SET DEFINE OFF;
REM INSERTING into TEAMPROJECT.CUSTOMER
SET DEFINE OFF;
Insert into TEAMPROJECT.CUSTOMER (CUSTOMER_ID,CUSTOMER_PASSWORD,CUSTOMER_NAME,CUSTOMER_TEL,CUSTOMER_POINT,CUSTOMER_FLAG,CUSTOMER_EMAIL) values ('admin','1234','adminname','010-1131-2222',0,0,null);
Insert into TEAMPROJECT.CUSTOMER (CUSTOMER_ID,CUSTOMER_PASSWORD,CUSTOMER_NAME,CUSTOMER_TEL,CUSTOMER_POINT,CUSTOMER_FLAG,CUSTOMER_EMAIL) values ('aaa','1234','aaaname','010-1111-2222',0,1,'lovepizza132@gmail.com');
Insert into TEAMPROJECT.CUSTOMER (CUSTOMER_ID,CUSTOMER_PASSWORD,CUSTOMER_NAME,CUSTOMER_TEL,CUSTOMER_POINT,CUSTOMER_FLAG,CUSTOMER_EMAIL) values ('bbb','1234','bbbname','010-2222-3333',0,1,null);
Insert into TEAMPROJECT.CUSTOMER (CUSTOMER_ID,CUSTOMER_PASSWORD,CUSTOMER_NAME,CUSTOMER_TEL,CUSTOMER_POINT,CUSTOMER_FLAG,CUSTOMER_EMAIL) values ('ccc','1234','cccname','010-3333-4444',0,1,null);
REM INSERTING into TEAMPROJECT.QUESTION
SET DEFINE OFF;
REM INSERTING into TEAMPROJECT.STORE
SET DEFINE OFF;
Insert into TEAMPROJECT.STORE (STORE_ID,STORE_NAME,STORE_ADDR,STORE_POINT,STORE_TEL) values (7,'������','����Ư���� ���α� ����1��','37.5615512, 126.9733249','02-123-4567');
Insert into TEAMPROJECT.STORE (STORE_ID,STORE_NAME,STORE_ADDR,STORE_POINT,STORE_TEL) values (8,'�����','����Ư���� ����� ���6.7�� ���Ϸ� 1414','37.6558348, 127.0628463','02-333-5555');
Insert into TEAMPROJECT.STORE (STORE_ID,STORE_NAME,STORE_ADDR,STORE_POINT,STORE_TEL) values (9,'���μ���','����Ư���� �Ż絿 �б�����12�� 46','37.5190935, 127.021955','02-777-8888');
Insert into TEAMPROJECT.STORE (STORE_ID,STORE_NAME,STORE_ADDR,STORE_POINT,STORE_TEL) values (10,'������','����Ư���� ��걸 ���2���� ��������� 105','37.5511789, 126.9856882','02-233-1234');
REM INSERTING into TEAMPROJECT.TENDENCY
SET DEFINE OFF;
Insert into TEAMPROJECT.TENDENCY (TENDENCY_ID,CUSTOMER_ID,ART,SOCIAL,ECONOMIC,TECHNOLOGY,LITERATURE,HISTORY) values (1,'admin',11,0,0,0,0,23);
Insert into TEAMPROJECT.TENDENCY (TENDENCY_ID,CUSTOMER_ID,ART,SOCIAL,ECONOMIC,TECHNOLOGY,LITERATURE,HISTORY) values (2,'aaa',11,12,20,0,11,0);
Insert into TEAMPROJECT.TENDENCY (TENDENCY_ID,CUSTOMER_ID,ART,SOCIAL,ECONOMIC,TECHNOLOGY,LITERATURE,HISTORY) values (3,'bbb',0,0,0,0,0,0);
Insert into TEAMPROJECT.TENDENCY (TENDENCY_ID,CUSTOMER_ID,ART,SOCIAL,ECONOMIC,TECHNOLOGY,LITERATURE,HISTORY) values (4,'ccc',0,0,0,0,0,0);
REM INSERTING into TEAMPROJECT.WRITER
SET DEFINE OFF;
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (157,'����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6,'Į ���̰�');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7,'������');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (151,'Ŭ���ս� ������');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (153,'E. H. ���긮ġ');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (146,'��ä��');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (150,'������');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (154,'���� �Ƹ��� ����Ÿ');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (155,'��ũ �ظ���');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (159,'���');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (160,'�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (161,'�� ����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (162,'Ȳ����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (163,'��ó�� ��Ų��');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (164,'����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2,'�̼���');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3,'��ä��');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4,'�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5,'�ڱ�ȣ');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9,'������');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (10,'������');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (11,'�贩��');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (12,'������');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (13,'���� ��Į');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (14,'����ÿ ī��');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (15,'������');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (16,'���� ��Ÿ��');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (17,'���μ�');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (18,'������');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (19,'�ʸ��α�');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (21,'������');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1218,'999999');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (208,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (409,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (610,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (811,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1012,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1213,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1414,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1615,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1816,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2017,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2218,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2419,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2620,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2821,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3022,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3223,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3424,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3625,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3826,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4027,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4228,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4429,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4630,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4831,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5032,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5233,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5434,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5635,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5836,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6037,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6238,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6439,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6640,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6841,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7042,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7243,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7444,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7645,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7846,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8047,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8248,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8449,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8650,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8851,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9052,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9253,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9454,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9655,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9856,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (403,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (604,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (805,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1006,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1207,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1408,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1609,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1810,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2011,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2212,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2413,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2614,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (2815,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3016,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3217,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3418,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3619,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (3820,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4021,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4222,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4423,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4624,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (4825,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5026,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5227,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5428,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5629,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (5830,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6031,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6232,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6433,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6634,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (6835,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7036,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7237,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7438,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7639,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (7840,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8041,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8242,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8443,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8644,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (8845,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9046,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9247,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9448,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9649,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (9850,'���̵�����');
Insert into TEAMPROJECT.WRITER (WRITER_ID,WRITER_NAME) values (1229,'99');
--------------------------------------------------------
--  DDL for Index BUYCARTLIST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."BUYCARTLIST_PK" ON "TEAMPROJECT"."BUYCARTLIST" ("BUYCARTLIST_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index QUESTION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."QUESTION_PK" ON "TEAMPROJECT"."QUESTION" ("QUESTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BUYREVIEW_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."BUYREVIEW_PK" ON "TEAMPROJECT"."BUYREVIEW" ("BUYREVIEW_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BOOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."BOOK_PK" ON "TEAMPROJECT"."BOOK" ("BOOK_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BUY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."BUY_PK" ON "TEAMPROJECT"."BUY" ("BUY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index TENDENCY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."TENDENCY_PK" ON "TEAMPROJECT"."TENDENCY" ("TENDENCY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BOOKSALE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."BOOKSALE_PK" ON "TEAMPROJECT"."BOOKSALE" ("BOOKSALE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index CUSTOMER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."CUSTOMER_PK" ON "TEAMPROJECT"."CUSTOMER" ("CUSTOMER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index STORE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."STORE_PK" ON "TEAMPROJECT"."STORE" ("STORE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BUYLIST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."BUYLIST_PK" ON "TEAMPROJECT"."BUYLIST" ("BUYLIST_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index WRITER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TEAMPROJECT"."WRITER_PK" ON "TEAMPROJECT"."WRITER" ("WRITER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table STORE
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."STORE" ADD CONSTRAINT "STORE_PK" PRIMARY KEY ("STORE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TENDENCY
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."TENDENCY" ADD CONSTRAINT "TENDENCY_PK" PRIMARY KEY ("TENDENCY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table WRITER
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."WRITER" ADD CONSTRAINT "WRITER_PK" PRIMARY KEY ("WRITER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BOOKSALE
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BOOKSALE" ADD CONSTRAINT "BOOKSALE_PK" PRIMARY KEY ("BOOKSALE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BUY
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BUY" ADD CONSTRAINT "BUY_PK" PRIMARY KEY ("BUY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BUYLIST
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BUYLIST" ADD CONSTRAINT "BUYLIST_PK" PRIMARY KEY ("BUYLIST_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table QUESTION
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."QUESTION" ADD CONSTRAINT "QUESTION_PK" PRIMARY KEY ("QUESTION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BOOK
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BOOK" ADD CONSTRAINT "BOOK_PK" PRIMARY KEY ("BOOK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CUSTOMER
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."CUSTOMER" ADD CONSTRAINT "CUSTOMER_PK" PRIMARY KEY ("CUSTOMER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BUYREVIEW
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BUYREVIEW" ADD CONSTRAINT "BUYREVIEW_PK" PRIMARY KEY ("BUYREVIEW_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BUYCARTLIST
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BUYCARTLIST" ADD CONSTRAINT "BUYCARTLIST_PK" PRIMARY KEY ("BUYCARTLIST_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOOK
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BOOK" ADD CONSTRAINT "WRITER_FK_1" FOREIGN KEY ("WRITER_ID")
	  REFERENCES "TEAMPROJECT"."WRITER" ("WRITER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOOKSALE
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BOOKSALE" ADD CONSTRAINT "BOOKSALE_FK_1" FOREIGN KEY ("BOOK_ID")
	  REFERENCES "TEAMPROJECT"."BOOK" ("BOOK_ID") ENABLE;
  ALTER TABLE "TEAMPROJECT"."BOOKSALE" ADD CONSTRAINT "BOOKSALE_FK_2" FOREIGN KEY ("STORE_ID")
	  REFERENCES "TEAMPROJECT"."STORE" ("STORE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BUY
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BUY" ADD CONSTRAINT "BUY_FK_1" FOREIGN KEY ("BUYLIST_ID")
	  REFERENCES "TEAMPROJECT"."BUYLIST" ("BUYLIST_ID") ENABLE;
  ALTER TABLE "TEAMPROJECT"."BUY" ADD CONSTRAINT "BUY_FK_2" FOREIGN KEY ("BOOK_ID")
	  REFERENCES "TEAMPROJECT"."BOOK" ("BOOK_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BUYCARTLIST
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BUYCARTLIST" ADD CONSTRAINT "BUYCARTLIST_FK_1" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "TEAMPROJECT"."CUSTOMER" ("CUSTOMER_ID") ENABLE;
  ALTER TABLE "TEAMPROJECT"."BUYCARTLIST" ADD CONSTRAINT "BUYCARTLIST_FK_2" FOREIGN KEY ("BOOK_ID")
	  REFERENCES "TEAMPROJECT"."BOOK" ("BOOK_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BUYLIST
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BUYLIST" ADD CONSTRAINT "BUYLIST_FK_1" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "TEAMPROJECT"."CUSTOMER" ("CUSTOMER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BUYREVIEW
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."BUYREVIEW" ADD CONSTRAINT "BUYREVIEW_FK_1" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "TEAMPROJECT"."CUSTOMER" ("CUSTOMER_ID") ENABLE;
  ALTER TABLE "TEAMPROJECT"."BUYREVIEW" ADD CONSTRAINT "BUYREVIEW_FK_2" FOREIGN KEY ("BOOK_ID")
	  REFERENCES "TEAMPROJECT"."BOOK" ("BOOK_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QUESTION
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."QUESTION" ADD CONSTRAINT "QUESTION_FK_1" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "TEAMPROJECT"."CUSTOMER" ("CUSTOMER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TENDENCY
--------------------------------------------------------

  ALTER TABLE "TEAMPROJECT"."TENDENCY" ADD CONSTRAINT "TENDENCY_FK_1" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "TEAMPROJECT"."CUSTOMER" ("CUSTOMER_ID") ENABLE;
