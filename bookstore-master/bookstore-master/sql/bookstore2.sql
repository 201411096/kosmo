---------------------------------------- ���� ----------------------------------------
--1. DB ����
----1_1. ���̺�
----1_2. ������
--2. ������ �Է�
--3. SQL�� Ȯ��
--4. DB ����
--5. ������ �ʱ�ȭ
------------------------------1.DB ���� ------------------------------
--------------------1_1.���̺�--------------------
--���̺��ȣ : 1
--���̺�� : CUSTOMER
--����ϴ� ������ : X
--�����ϴ� ���̺� : X
--�����Ǵ� ���̺� : QUESTION, TENDENCY, BUYCARTLIST, RENTCARTLIST, BUYLIST, RENTLIST, BUYREVIEW, RENTREVIEW
CREATE TABLE CUSTOMER(
    CUSTOMER_ID VARCHAR2(30),
    CUSTOMER_PASSWORD VARCHAR2(30),
    CUSTOMER_NAME VARCHAR2(30),
    CUSTOMER_TEL VARCHAR2(30),
    CUSTOMER_POINT NUMBER(30),
    CUSTOMER_FLAG NUMBER(30),
    CUSTOMER_EMAIL VARCHAR2(60),
    CONSTRAINT CUSTOMER_PK PRIMARY KEY(CUSTOMER_ID)
);
alter table customer add(CUSTOMER_EMAIL VARCHAR2(60));
--���̺��ȣ : 2
--���̺�� : QUESTION
--����ϴ� ������ : QUESTION_ID_SEQ, QUESTION_GROUPID_SEQ
--�����ϴ� ���̺� : CUSTOMER
--�����Ǵ� ���̺� : X
CREATE TABLE QUESTION(
    QUESTION_ID NUMBER(30),
    CUSTOMER_ID VARCHAR2(30),
    QUESTION_FLAG NUMBER(30),
    QUESTION_TITLE VARCHAR2(30),
    QUESTION_CONTENT VARCHAR2(2048),
    QUESTION_GROUPID NUMBER(30),
    CONSTRAINT QUESTION_PK PRIMARY KEY(QUESTION_ID),
    CONSTRAINT QUESTION_FK_1 FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);
--���̺��ȣ : 3
--���̺�� : TENDENCY
--����ϴ� ������ : TENDENCY_ID_SEQ
--�����ϴ� ���̺� : CUSTOMER
--�����Ǵ� ���̺� : X
CREATE TABLE TENDENCY(
    TENDENCY_ID NUMBER(30),
    CUSTOMER_ID VARCHAR2(30),
    ART NUMBER(30),
    SOCIAL NUMBER(30),
    ECONOMIC NUMBER(30),
    TECHNOLOGY NUMBER(30),
    LITERATURE NUMBER(30),
    HISTORY NUMBER(30),
    CONSTRAINT TENDENCY_PK PRIMARY KEY(TENDENCY_ID),
    CONSTRAINT TENDENCY_FK_1 FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);
--���̺��ȣ : 4
--���̺�� : WRITER
--����ϴ� ������ : WRITER_ID_SEQ
--�����ϴ� ���̺� : X
--�����Ǵ� ���̺� : BOOK
CREATE TABLE WRITER(
    WRITER_ID NUMBER(30),
    WRITER_NAME VARCHAR2(30),
    CONSTRAINT WRITER_PK PRIMARY KEY(WRITER_ID)
);
--���̺��ȣ : 5
--���̺�� : STORE
--����ϴ� ������ : STORE_ID_SEQ
--�����ϴ� ���̺� : X
--�����Ǵ� ���̺� : BOOKSALE
CREATE TABLE STORE(
    STORE_ID NUMBER(30),
    STORE_NAME VARCHAR2(30),
    STORE_ADDR VARCHAR2(256),
    STORE_POINT VARCHAR2(256),
    STORE_TEL VARCHAR2(30),
    CONSTRAINT STORE_PK PRIMARY KEY(STORE_ID)
);
--���̺��ȣ : 6
--���̺�� : BOOK
--����ϴ� ������ : BOOK_ID_SEQ
--�����ϴ� ���̺� : WRITER
--�����Ǵ� ���̺� : BOOKSALE, BUY
CREATE TABLE BOOK(
    BOOK_ID NUMBER(30),
    WRITER_ID NUMBER(30),
    BOOK_PRICE NUMBER(30),
    BOOK_NAME VARCHAR2(256),
    BOOK_GENRE VARCHAR2(30),
    BOOK_STORY varchar2(2048),
    BOOK_PDATE VARCHAR2(30),
    BOOK_SALEPRICE NUMBER(30),
    BOOK_CNT NUMBER(30),
    BOOK_SCORE NUMBER(30, 2),
    BOOK_SCORECOUNT NUMBER(30),
    CONSTRAINT BOOK_PK PRIMARY KEY(BOOK_ID),
    CONSTRAINT WRITER_FK_1 FOREIGN KEY(WRITER_ID) REFERENCES WRITER(WRITER_ID)
);
alter table book add(book_scorecount number(30));
alter table book modify(book_score number(30, 2));
--���̺��ȣ : 7
--���̺�� : BOOKSALE
--����ϴ� ������ : BOOKSALE_ID_SEQ
--�����ϴ� ���̺� : BOOK, STORE
--�����Ǵ� ���̺� : X
CREATE TABLE BOOKSALE(
    BOOKSALE_ID NUMBER(30),
    BOOK_ID NUMBER(30),
    STORE_ID NUMBER(30),
    CONSTRAINT BOOKSALE_PK PRIMARY KEY(BOOKSALE_ID),
    CONSTRAINT BOOKSALE_FK_1 FOREIGN KEY(BOOK_ID) REFERENCES BOOK(BOOK_ID),
    CONSTRAINT BOOKSALE_FK_2 FOREIGN KEY(STORE_ID) REFERENCES STORE(STORE_ID)
);
--���̺��ȣ : 8
--���̺�� : BUYLIST
--����ϴ� ������ : BUYLIST_ID_SEQ
--�����ϴ� ���̺� : CUSTOMER
--�����Ǵ� ���̺� : BUY
CREATE TABLE BUYLIST(
    BUYLIST_ID NUMBER(30),
    CUSTOMER_ID VARCHAR2(30),
    BUY_DATE DATE,
    BUYLIST_SHIPPINGADDRESS varchar2(100),
    CONSTRAINT BUYLIST_PK PRIMARY KEY(BUYLIST_ID),
    CONSTRAINT BUYLIST_FK_1 FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);
--���̺��ȣ : 9
--���̺�� : BUY
--����ϴ� ������ : BUY_ID_SEQ
--�����ϴ� ���̺� : BUYLIST, BOOK
--�����Ǵ� ���̺� : X
CREATE TABLE BUY(
    BUY_ID NUMBER(30),
    BUYLIST_ID NUMBER(30),
    BOOK_ID NUMBER(30),
    BUY_CNT NUMBER(30),
    CONSTRAINT BUY_PK PRIMARY KEY(BUY_ID),
    CONSTRAINT BUY_FK_1 FOREIGN KEY(BUYLIST_ID) REFERENCES BUYLIST(BUYLIST_ID),
    CONSTRAINT BUY_FK_2 FOREIGN KEY(BOOK_ID) REFERENCES BOOK(BOOK_ID)
);
--���̺��ȣ : 10
--���̺�� : BUYCARTLIST
--����ϴ� ������ : BUYCARTLIST_ID_SEQ
--�����ϴ� ���̺� : CUSTOMER, BOOK
--�����Ǵ� ���̺� : X
CREATE TABLE BUYCARTLIST(
    BUYCARTLIST_ID NUMBER(30),
    CUSTOMER_ID VARCHAR2(30),
    BOOK_ID NUMBER(30),
    BUYCARTLIST_CNT NUMBER(30),
    CONSTRAINT BUYCARTLIST_PK PRIMARY KEY(BUYCARTLIST_ID),
    CONSTRAINT BUYCARTLIST_FK_1 FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
    CONSTRAINT BUYCARTLIST_FK_2 FOREIGN KEY(BOOK_ID) REFERENCES BOOK(BOOK_ID)
);
--���̺��ȣ : 11
--���̺�� : BUYREVIEW
--����ϴ� ������ : BUYREVIEW_ID_SEQ
--�����ϴ� ���̺� : CUSTOMER, BOOK
--�����Ǵ� ���̺� : X
CREATE TABLE BUYREVIEW(
    BUYREVIEW_ID NUMBER(30),
    CUSTOMER_ID VARCHAR2(30),
    BOOK_ID NUMBER(30),
    BUYREVIEW_CONTENT VARCHAR2(2048),
    BUYREVIEW_SCORE NUMBER(30),
    CONSTRAINT BUYREVIEW_PK PRIMARY KEY(BUYREVIEW_ID),
    CONSTRAINT BUYREVIEW_FK_1 FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
    CONSTRAINT BUYREVIEW_FK_2 FOREIGN KEY(BOOK_ID) REFERENCES BOOK(BOOK_ID)
);
--------------------1_2.������--------------------
--��������ȣ : 1
--�������̸� : QUESTION_ID_SEQ
--���Ǵ� ���̺� : QUESTION
CREATE SEQUENCE QUESTION_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

--��������ȣ : 2
--�������̸� : QUESTION_GROUPID_SEQ
--���Ǵ� ���̺� : QUESTION
CREATE SEQUENCE QUESTION_GROUPID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;
--��������ȣ : 3
--�������̸� : TENDENCY_ID_SEQ
--���Ǵ� ���̺� : TENDENCY
CREATE SEQUENCE TENDENCY_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

--��������ȣ : 4
--�������̸� : WRITER_ID_SEQ
--���Ǵ� ���̺� : WRITER
CREATE SEQUENCE WRITER_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

--��������ȣ : 5
--�������̸� : STORE_ID_SEQ
--���Ǵ� ���̺� : STORE
CREATE SEQUENCE STORE_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

--��������ȣ : 6
--�������̸� : BOOK_ID_SEQ
--���Ǵ� ���̺� : BOOK
CREATE SEQUENCE BOOK_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

--��������ȣ : 7
--�������̸� : BOOKSALE_ID_SEQ
--���Ǵ� ���̺� : BOOKSALE
CREATE SEQUENCE BOOKSALE_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

--��������ȣ : 8
--�������̸� : BUYLIST_ID_SEQ
--���Ǵ� ���̺� : BUYLIST
CREATE SEQUENCE BUYLIST_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

--��������ȣ : 9
--�������̸� : BUY_ID_SEQ
--���Ǵ� ���̺� : BUY
CREATE SEQUENCE BUY_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

--��������ȣ : 10
--�������̸� : BUYCARTLIST_ID_SEQ
--���Ǵ� ���̺� : BUYCARTLIST
CREATE SEQUENCE BUYCARTLIST_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

--��������ȣ : 11
--�������̸� : BUYREVIEW_ID_SEQ
--���Ǵ� ���̺� : BUYREVIEW
CREATE SEQUENCE BUYREVIEW_ID_SEQ
START WITH 1
MAXVALUE 10000
CYCLE;

------------------------------2.������ �Է� ------------------------------
--------------------2_1.CUSTOMER--------------------
INSERT INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_PASSWORD, CUSTOMER_NAME, CUSTOMER_TEL, CUSTOMER_POINT, CUSTOMER_FLAG) VALUES('admin', '1234', 'adminname', '010-1131-2222', 0, 0); -- ������ ����?..
INSERT INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_PASSWORD, CUSTOMER_NAME, CUSTOMER_TEL, CUSTOMER_POINT, CUSTOMER_FLAG, CUSTOMER_EMAIL) VALUES('aaa', '1234', 'aaaname', '010-1111-2222', 0, 1, 'lovepizza132@gmail.com');
INSERT INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_PASSWORD, CUSTOMER_NAME, CUSTOMER_TEL, CUSTOMER_POINT, CUSTOMER_FLAG) VALUES('bbb', '1234', 'bbbname', '010-2222-3333', 0, 1);
INSERT INTO CUSTOMER(CUSTOMER_ID, CUSTOMER_PASSWORD, CUSTOMER_NAME, CUSTOMER_TEL, CUSTOMER_POINT, CUSTOMER_FLAG) VALUES('ccc', '1234', 'cccname', '010-3333-4444', 0, 1);
--------------------2_3.TENDENCY-------------------
INSERT INTO TENDENCY(TENDENCY_ID, CUSTOMER_ID, ART, SOCIAL, ECONOMIC, TECHNOLOGY, LITERATURE, HISTORY) VALUES(TENDENCY_ID_SEQ.NEXTVAL, 'admin', 0, 0, 0, 0, 0, 0);
INSERT INTO TENDENCY(TENDENCY_ID, CUSTOMER_ID, ART, SOCIAL, ECONOMIC, TECHNOLOGY, LITERATURE, HISTORY) VALUES(TENDENCY_ID_SEQ.NEXTVAL, 'aaa', 0, 0, 0, 0, 0, 0);
INSERT INTO TENDENCY(TENDENCY_ID, CUSTOMER_ID, ART, SOCIAL, ECONOMIC, TECHNOLOGY, LITERATURE, HISTORY) VALUES(TENDENCY_ID_SEQ.NEXTVAL, 'bbb', 0, 0, 0, 0, 0, 0);
INSERT INTO TENDENCY(TENDENCY_ID, CUSTOMER_ID, ART, SOCIAL, ECONOMIC, TECHNOLOGY, LITERATURE, HISTORY) VALUES(TENDENCY_ID_SEQ.NEXTVAL, 'ccc', 0, 0, 0, 0, 0, 0);
--------------------2_4.WRITER--------------------
--INSERT INTO WRITER(WRITER_ID, WRITER_NAME) VALUES(WRITER_ID_SEQ.NEXTVAL, '�̼���');
--INSERT INTO WRITER(WRITER_ID, WRITER_NAME) VALUES(WRITER_ID_SEQ.NEXTVAL, '��ä��');
--INSERT INTO WRITER(WRITER_ID, WRITER_NAME) VALUES(WRITER_ID_SEQ.NEXTVAL, '�����');
--INSERT INTO WRITER(WRITER_ID, WRITER_NAME) VALUES(WRITER_ID_SEQ.NEXTVAL, '�ڱ�ȣ');
--INSERT INTO WRITER(WRITER_ID, WRITER_NAME) VALUES(WRITER_ID_SEQ.NEXTVAL, 'Į ���̰�');
--INSERT INTO WRITER(WRITER_ID, WRITER_NAME) VALUES(WRITER_ID_SEQ.NEXTVAL, '������');
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
--------------------2_5.STORE--------------------
Insert into TEAMPROJECT.STORE (STORE_ID,STORE_NAME,STORE_ADDR,STORE_TEL,STORE_POINT) values (7,'������','����Ư���� ���α� ����1��','02-123-4567','37.5615512, 126.9733249');
Insert into TEAMPROJECT.STORE (STORE_ID,STORE_NAME,STORE_ADDR,STORE_TEL,STORE_POINT) values (8,'�����','����Ư���� ����� ���6.7�� ���Ϸ� 1414','02-333-5555','37.6558348, 127.0628463');
Insert into TEAMPROJECT.STORE (STORE_ID,STORE_NAME,STORE_ADDR,STORE_TEL,STORE_POINT) values (9,'���μ���','����Ư���� �Ż絿 �б�����12�� 46','02-777-8888','37.5190935, 127.021955');
Insert into TEAMPROJECT.STORE (STORE_ID,STORE_NAME,STORE_ADDR,STORE_TEL,STORE_POINT) values (10,'������','����Ư���� ��걸 ���2���� ��������� 105','02-233-1234','37.5511789, 126.9856882');
--------------------2_6.BOOK--------------------
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

--------------------2_10.BUYCARTLIST--------------------
INSERT INTO BUYCARTLIST(BUYCARTLIST_ID, CUSTOMER_ID, BOOK_ID, BUYCARTLIST_CNT) VALUES(BUYCARTLIST_ID_SEQ.NEXTVAL, 'aaa', 2, 3);
INSERT INTO BUYCARTLIST(BUYCARTLIST_ID, CUSTOMER_ID, BOOK_ID, BUYCARTLIST_CNT) VALUES(BUYCARTLIST_ID_SEQ.NEXTVAL, 'aaa', 3, 2);
INSERT INTO BUYCARTLIST(BUYCARTLIST_ID, CUSTOMER_ID, BOOK_ID, BUYCARTLIST_CNT) VALUES(BUYCARTLIST_ID_SEQ.NEXTVAL, 'aaa', 1, 1);
INSERT INTO BUYCARTLIST(BUYCARTLIST_ID, CUSTOMER_ID, BOOK_ID, BUYCARTLIST_CNT) VALUES(BUYCARTLIST_ID_SEQ.NEXTVAL, 'bbb', 2, 2);
--------------------2_99. ���� ������--------------------
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2020/07/12', '����� ����� ��� 7��');
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2020/07/09', '����� ����� ��� 7��');   

INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2020/08/05', '����� �߱��� ��Ű�峪');
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2020/09/21', '����� ������ ');     
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2020/10/03', '���� ���ϱ� ���� 449-22123');
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2020/11/28', '����� ���Ǳ� �������');     
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2020/12/22', '���� ������ �������');  

INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2020/05/03', '����� ����� ��� 7��');      
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2020/04/12', '����� ����� ��� 7��');     
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2020/03/21', '����� ����� ��� 7��');        
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2020/02/01', '����� ����� ��� 7��');   
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2020/01/11', '����� ����� ��� 7��'); 
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2019/12/20', '����� ����� ��� 7��');       
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2019/11/19', '��⵵ ������');      
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2019/10/18', '��⵵ ������');           

INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2019/09/17', '��⵵ ������');          
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2019/08/16', '��⵵ ������');          
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2019/07/15', '��⵵ ������');    
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2019/06/14', '��⵵ ������');       
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2019/05/13', '��⵵ ������');          
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2019/04/12', '��⵵ ������');          
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2019/03/11', '��⵵ ������');          
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2019/02/10', '��⵵ ������');          
        
INSERT INTO BUYLIST(BUYLIST_ID, CUSTOMER_ID, BUY_DATE, BUYLIST_SHIPPINGADDRESS) 
      VALUES(BUYLIST_ID_SEQ.NEXTVAL, 'bbb', '2019/01/09', '��⵵ ������');    
------------------------------3.SQL�� Ȯ�� ------------------------------
--------------------2_1.CUSTOMER--------------------
select * from customer;
--------------------2_6.BOOK--------------------
select * from book;
SELECT b.BOOK_ID AS BOOK_ID, b.WRITER_ID AS WRITER_ID, b.BOOK_PRICE AS BOOK_PRICE, 
b.BOOK_NAME AS BOOK_NAME, b.BOOK_GENRE AS BOOK_GENRE, b.BOOK_STORY AS BOOK_STORY, 
b.BOOK_PDATE AS BOOK_PDATE, b.BOOK_SALEPRICE AS BOOK_SALEPRICE, b.BOOK_CNT AS BOOK_CNT, TO_CHAR(b.BOOK_SCORE, '999.00' ) AS BOOK_SCORE,
w.WRITER_ID AS WRITER_ID, w.WRITER_NAME AS WRITER_NAME
FROM BOOK b JOIN WRITER w 
ON b.WRITER_ID = w.WRITER_ID
WHERE REGEXP_LIKE (BOOK_NAME, '(*)��(*)') OR REGEXP_LIKE (WRITER_NAME, '(*)��(*)');
--WHERE BOOK_NAME = '������ ���';
select b.BOOK_ID AS BOOK_ID, b.WRITER_ID AS WRITER_ID, b.BOOK_PRICE AS BOOK_PRICE, b.BOOK_NAME AS BOOK_NAME, b.BOOK_GENRE AS BOOK_GENRE, b.BOOK_STORY AS BOOK_STORY, b.BOOK_PDATE AS BOOK_PDATE, b.BOOK_SALEPRICE AS BOOK_SALEPRICE, b.BOOK_CNT AS BOOK_CNT, b.BOOK_SCORE AS BOOK_SCORE, b.BOOK_SCORECOUNT AS BOOK_SCORECOUNT from (select * from book where book_genre = 'LITERATURE' order by book_score/book_scorecount desc) b where rownum=1;
--------------------2_13.BUYCARTLIST--------------------
ALTER TABLE BUYCARTLIST ADD (BUYCARTLIST_CNT NUMBER(30));
select SUM(BOOK_SALEPRICE) from book where book_id in ( select book_id from buycartlist WHERE customer_id='aaa' );
select SUM(BOOK_SALEPRICE) from book where book_id in ( select book_id from buycartlist WHERE customer_id='aaa' );
select book_id from buycartlist WHERE customer_id='aaa';
select b.book_id as book_id, b.book_name as book_name, l.buycartlist_cnt as book_cnt, b.book_price as book_price,(b.book_price*l.buycartlist_cnt) as book_totalprice
from book b 
inner join buycartlist l
on b.book_id = l.book_id
where customer_id='aaa';
------------------------------4.DB ���� ------------------------------
----- ���̺�1 �� ���� ������ ���� -----
DROP TABLE CUSTOMER;
----- ���̺�2 �� ���� ������ ���� -----
DROP TABLE QUESTION;
DROP SEQUENCE QUESTION_ID_SEQ;
DROP SEQUENCE QUESTION_GROUPID_SEQ;
----- ���̺�3 �� ���� ������ ���� -----
DROP TABLE TENDENCY;
DROP SEQUENCE TENDENCY_ID_SEQ;
----- ���̺�4 �� ���� ������ ���� -----
DROP TABLE WRITER;
DROP SEQUENCE WRITER_ID_SEQ;
----- ���̺�5 �� ���� ������ ���� -----
DROP TABLE STORE;
DROP SEQUENCE STORE_ID_SEQ;
----- ���̺�6 �� ���� ������ ���� -----
DROP TABLE BOOK;
DROP SEQUENCE BOOK_ID_SEQ;
----- ���̺�7 �� ���� ������ ���� -----
DROP TABLE BOOKSALE;
DROP SEQUENCE BOOKSALE_ID_SEQ;
----- ���̺�8 �� ���� ������ ���� -----
DROP TABLE BUYLIST;
DROP SEQUENCE BUYLIST_ID_SEQ;
----- ���̺�9 �� ���� ������ ���� -----
DROP TABLE BUY;
DROP SEQUENCE BUY_ID_SEQ;
----- ���̺�10 �� ���� ������ ���� -----
DROP TABLE BUYCARTLIST;
DROP SEQUENCE BUYCARTLIST_ID_SEQ;
----- ���̺�11 �� ���� ������ ���� -----
DROP TABLE BUYREVIEW;
DROP SEQUENCE BUYREVIEW_ID_SEQ;
------------------------------5. ������ �ʱ�ȭ------------------------------
-------------------------5_1. Template -------------------------
SELECT SEQUENCE_NAME FROM USER_SEQUENCES WHERE SEQUENCE_NAME='SEQUENCE_NAME';
SELECT SEQNENCE_NAME.CURRVAL FROM DUAL;
ALTER SEQUENCE SEQUENCE_NAME INCREMENT BY NUMBER;
-------------------------5_2. Example -------------------------
SELECT SEQUENCE_NAME FROM USER_SEQUENCES;
SELECT WRITER_ID_SEQ.NEXTVAL FROM DUAL;
SELECT WRITER_ID_SEQ.CURRVAL FROM DUAL;
insert into writer(WRITER_ID, WRITER_NAME) values(WRITER_ID_SEQ.nextval, '���̵�����');
ALTER SEQUENCE WRITER_ID_SEQ INCREMENT BY 11;
------------------------------6. sample------------------------------
select * from book where book_genre = 'LITERATURE' order by book_score/book_scorecount desc;
select b.* from (select * from book where book_genre = 'LITERATURE' order by book_score/book_scorecount desc) b where rownum=1;

--����Ʈ���� 5���� �������� sql��
select b.BOOK_ID AS BOOK_ID, b.WRITER_ID AS WRITER_ID, b.BOOK_PRICE AS BOOK_PRICE, 
      b.BOOK_NAME AS BOOK_NAME, b.BOOK_GENRE AS BOOK_GENRE, b.BOOK_STORY AS BOOK_STORY, 
      b.BOOK_PDATE AS BOOK_PDATE, b.BOOK_SALEPRICE AS BOOK_SALEPRICE, b.BOOK_CNT AS BOOK_CNT, b.BOOK_SCORE AS BOOK_SCORE,
      w.WRITER_ID AS WRITER_ID, w.WRITER_NAME AS WRITER_NAME
from book b
inner join writer w
on b.writer_id = w.writer_id
where book_id in (select book_id
from (
select rownum, book_id
from (select book_id, sum(buy_cnt) as buy_cnt
                            from buy
                            group by book_id
                            order by buy_cnt desc)
where rownum<=5
));

update book
set book_score = book_score + 5,
    book_scorecount = book_scorecount + 1
where book_id = 23;


select *
from buy bu
inner join book bo
on bo.book_id = bu.book_id
inner join buylist bl
on bu.buylist_id = bl.buylist_id;

select bu.buy_id, bu.buy_cnt as buy_cnt, bo.book_saleprice as book_saleprice, bu.buy_cnt*bo.book_saleprice as buyprice, bl.buy_date
from buy bu
inner join book bo
on bo.book_id = bu.book_id
inner join buylist bl
on bu.buylist_id = bl.buylist_id;

select sum(bu.buy_cnt*bo.book_saleprice) as buyprice, to_char(bl.buy_date, 'YYMMDD') as buy_date
from buy bu
inner join book bo
on bo.book_id = bu.book_id
inner join buylist bl
on bu.buylist_id = bl.buylist_id
group by buy_date;

select bu.buy_cnt*bo.book_saleprice as buyprice, to_char(bl.buy_date, 'YYMMDD') as buy_date
from buy bu
inner join book bo
on bo.book_id = bu.book_id
inner join buylist bl
on bu.buylist_id = bl.buylist_id;


select sum(buyprice), buy_date
from (
select bu.buy_cnt*bo.book_saleprice as buyprice, to_char(bl.buy_date, 'YYMMDD') as buy_date
from buy bu
inner join book bo
on bo.book_id = bu.book_id
inner join buylist bl
on bu.buylist_id = bl.buylist_id
        )
group by buy_date;

		update CUSTOMER
		SET CUSTOMER_PASSWORD = '2345'
		WHERE CUSTOMER_EMAIL = 'korea5781@naver.com' and
			  CUSTOMER_ID = 'bbb';
              
	SELECT WRITER_ID, WRITER_NAME
	FROM writer
	where REGEXP_LIKE (WRITER_NAME, '(*)'|| '��' ||'(*)')
	ORDER BY WRITER_ID ASC;
    
    select *
    from (
    SELECT WRITER_ID, WRITER_NAME
	FROM writer
	where REGEXP_LIKE (WRITER_NAME, '(*)'|| '��' ||'(*)')
	ORDER BY WRITER_ID ASC
            ) where rownum>=1 and rownum<=10;

    select count(*)
    from (
    SELECT WRITER_ID, WRITER_NAME
	FROM writer
	where REGEXP_LIKE (WRITER_NAME, '(*)'|| '��' ||'(*)')
	ORDER BY WRITER_ID ASC
            );    
        select *
	    from (
			SELECT rownum as rnum, WRITER_ID, WRITER_NAME
			FROM writer
			where REGEXP_LIKE (WRITER_NAME, '(*)'||''||'(*)')
			ORDER BY WRITER_ID ASC
		) where rnum>=11 and rnum<=20;
        
        select writer_id, writer_name, rownum
        from
        (			SELECT WRITER_ID, WRITER_NAME
			FROM writer
			where REGEXP_LIKE (WRITER_NAME, '(*)'||''||'(*)')
			ORDER BY WRITER_ID ASC );
            
        select writer_id, writer_name
        from (select writer_id, writer_name, rownum
        from
        (			SELECT WRITER_ID, WRITER_NAME
			FROM writer
			where REGEXP_LIKE (WRITER_NAME, '(*)'||''||'(*)')
			ORDER BY WRITER_ID ASC ) )
        where rownum>=11 and rownum<=20;
----------------------pagingnation �ϱ� �� ����----------------------
SELECT b.BOOK_ID AS BOOK_ID, b.WRITER_ID AS WRITER_ID, b.BOOK_PRICE AS BOOK_PRICE, 
   b.BOOK_NAME AS BOOK_NAME, b.BOOK_GENRE AS BOOK_GENRE, b.BOOK_STORY AS BOOK_STORY, 
   b.BOOK_PDATE AS BOOK_PDATE, b.BOOK_SALEPRICE AS BOOK_SALEPRICE, b.BOOK_CNT AS BOOK_CNT, b.BOOK_SCORE AS BOOK_SCORE, b.BOOK_SCORECOUNT AS BOOK_SCORECOUNT, b.BOOK_SCORE/b.BOOK_SCORECOUNT AS BOOK_SCOREDIVIDEBYCOUNT,
   w.WRITER_ID AS WRITER_ID, w.WRITER_NAME AS WRITER_NAME
   FROM BOOK b JOIN WRITER w 
   ON b.WRITER_ID = w.WRITER_ID
   WHERE REGEXP_LIKE (BOOK_NAME, '(*)'||'��'||'(*)') OR REGEXP_LIKE (WRITER_NAME, '(*)'||'��'||'(*)') OR REGEXP_LIKE (BOOK_GENRE, '(*)'||'��'||'(*)')
   order by b.BOOK_SCORE/b.BOOK_SCORECOUNT desc;
   
   --���͸� ����
select *
from book bo
inner join buy bu
on bo.book_id = bu.book_id
inner join buylist bl
on bu.buylist_id = bl.buylist_id
inner join writer w
on w.writer_id = bo.writer_id
where to_char(buy_date, 'yymmdd') = to_char(sysdate, 'yymmdd') and book_genre = 'ECONOMIC' and book_cnt <=100; --���� ���Ű� �־�����

select *
from 
(
select rownum as rnum, bo.book_id as book_id, w.writer_name as writer_name, bo.book_price as book_price, bo.book_name as book_name, bo.book_genre as book_genre, bo.book_story as book_story, bo.book_saleprice as book_saleprice, bo.book_pdate as book_pdate, bo.book_cnt as book_cnt, bo.BOOK_SCORE AS BOOK_SCORE, bo.BOOK_SCORECOUNT AS BOOK_SCORECOUNT, bo.BOOK_SCORE/bo.BOOK_SCORECOUNT AS BOOK_SCOREDIVIDEBYCOUNT
from book bo
inner join buy bu
on bo.book_id = bu.book_id
inner join buylist bl
on bu.buylist_id = bl.buylist_id
inner join writer w
on w.writer_id = bo.writer_id
where to_char(buy_date, 'yymmdd') = to_char(sysdate, 'yymmdd') and book_genre = 'ECONOMIC' and book_cnt <=100
)
where rnum >= 2 and rnum<=3;

select *
from 
(
select rownum as rnum, bo.book_id as book_id, w.writer_name as writer_name, bo.book_price as book_price, bo.book_name as book_name, bo.book_genre as book_genre, bo.book_story as book_story, bo.book_saleprice as book_saleprice, bo.book_pdate as book_pdate, bo.book_cnt as book_cnt, bo.BOOK_SCORE AS BOOK_SCORE, bo.BOOK_SCORECOUNT AS BOOK_SCORECOUNT, bo.BOOK_SCORE/bo.BOOK_SCORECOUNT AS BOOK_SCOREDIVIDEBYCOUNT
from book bo
inner join buy bu
on bo.book_id = bu.book_id
inner join buylist bl
on bu.buylist_id = bl.buylist_id
inner join writer w
on w.writer_id = bo.writer_id
where to_char(buy_date, 'yymmdd') = to_char(sysdate, 'yymmdd') and book_genre = 'ECONOMIC' and book_cnt <=100
);
		select count(*)
		from 
		(
			select rownum as rnum, bo.writer_id as writer_id, bo.book_id as book_id, w.writer_name as writer_name, bo.book_price as book_price, bo.book_name as book_name, bo.book_genre as book_genre, bo.book_story as book_story, bo.book_saleprice as book_saleprice, bo.book_pdate as book_pdate, bo.book_cnt as book_cnt, bo.BOOK_SCORE AS BOOK_SCORE, bo.BOOK_SCORECOUNT AS BOOK_SCORECOUNT, bo.BOOK_SCORE/bo.BOOK_SCORECOUNT AS BOOK_SCOREDIVIDEBYCOUNT
			from book bo
			inner join writer w
			on w.writer_id = bo.writer_id
			where  book_cnt <=100
            );
