-------------------------------------------------
-- Export file for user DUKEPU                 --
-- Created by magic_dk on 2019/12/10, 18:08:26 --
-------------------------------------------------

spool MES_SQL_20191207.log

prompt
prompt Creating table APPLICATION_AVAILABILITY
prompt =======================================
prompt
create table DUKEPU.APPLICATION_AVAILABILITY
(
  PRODUCT_NAME    NVARCHAR2(30) not null,
  RELEASE_VERSION VARCHAR2(20) not null,
  UPDATE_TIME     DATE default sysdate
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index DUKEPU.IX_SW_NAME on DUKEPU.APPLICATION_AVAILABILITY (PRODUCT_NAME)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AR_1905_0624_BAK
prompt ===============================
prompt
create table DUKEPU.AR_1905_0624_BAK
(
  START_DATE         DATE,
  END_DATE           DATE,
  TABULATION_TIME    DATE,
  FINGERPRINT_DATE   DATE,
  JOB_NUMBER         NVARCHAR2(30),
  NAME               NVARCHAR2(10),
  DEPT               NVARCHAR2(10),
  SHEET_NAME         NVARCHAR2(10),
  FPT_FIRST_TIME     DATE,
  FPT_LAST_TIME      DATE,
  SEQ                INTEGER,
  RECORD_TIME        DATE,
  NOT_FINGER_PRINT   INTEGER,
  DELAY_TIME         NUMBER,
  LEAVE_EARLY_NUM    NUMBER,
  MEAL_SUBSIDY       INTEGER,
  RANDOM_STR         VARCHAR2(50),
  COME_NUM           NUMBER,
  COME_LATE_NUM      NUMBER,
  ASK_FOR_LEAVE_DAYS NUMBER,
  ASK_FOR_LEAVE_TYPE NVARCHAR2(20),
  FILL_UP_REMARK     NVARCHAR2(100),
  FILE_PATH          NVARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AR_1905_BAK
prompt ==========================
prompt
create table DUKEPU.AR_1905_BAK
(
  START_DATE         DATE,
  END_DATE           DATE,
  TABULATION_TIME    DATE,
  FINGERPRINT_DATE   DATE,
  JOB_NUMBER         NVARCHAR2(30),
  NAME               NVARCHAR2(10),
  DEPT               NVARCHAR2(10),
  SHEET_NAME         NVARCHAR2(10),
  FPT_FIRST_TIME     DATE,
  FPT_LAST_TIME      DATE,
  SEQ                INTEGER,
  RECORD_TIME        DATE,
  NOT_FINGER_PRINT   INTEGER,
  DELAY_TIME         NUMBER,
  LEAVE_EARLY_NUM    NUMBER,
  MEAL_SUBSIDY       INTEGER,
  RANDOM_STR         VARCHAR2(50),
  COME_NUM           NUMBER,
  COME_LATE_NUM      NUMBER,
  ASK_FOR_LEAVE_DAYS NUMBER,
  ASK_FOR_LEAVE_TYPE NVARCHAR2(20),
  FILL_UP_REMARK     NVARCHAR2(100),
  FILE_PATH          NVARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AR_DELAY_TIME_EACH_STAFF
prompt =======================================
prompt
create table DUKEPU.AR_DELAY_TIME_EACH_STAFF
(
  DEPT             NVARCHAR2(20),
  NAME             NVARCHAR2(20),
  FPT_FIRST_TIME   DATE,
  FPT_LAST_TIME    DATE,
  IS_ORDINARY_DAY  INTEGER,
  IS_OVERTIME_DAY  INTEGER,
  DELAY_TIME       NUMBER,
  UPDATE_TIME      DATE default sysdate,
  AR_JOB_NUMBER    NVARCHAR2(20),
  FINGERPRINT_DATE DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.AR_DELAY_TIME_EACH_STAFF.IS_ORDINARY_DAY
  is '是否为 平日 ';
comment on column DUKEPU.AR_DELAY_TIME_EACH_STAFF.IS_OVERTIME_DAY
  is '是否 为加班日';
comment on column DUKEPU.AR_DELAY_TIME_EACH_STAFF.DELAY_TIME
  is '延时';
comment on column DUKEPU.AR_DELAY_TIME_EACH_STAFF.UPDATE_TIME
  is '更新时间';
comment on column DUKEPU.AR_DELAY_TIME_EACH_STAFF.AR_JOB_NUMBER
  is '工号';
comment on column DUKEPU.AR_DELAY_TIME_EACH_STAFF.FINGERPRINT_DATE
  is '刷卡日期';

prompt
prompt Creating table AR_DETAIL
prompt ========================
prompt
create table DUKEPU.AR_DETAIL
(
  START_DATE       DATE,
  END_DATE         DATE,
  TABULATION_TIME  DATE,
  FINGERPRINT_DATE DATE,
  JOB_NUMBER       VARCHAR2(30),
  NAME             NVARCHAR2(10),
  DEPT             NVARCHAR2(10),
  FPT_FIRST_TIME   DATE,
  FPT_LAST_TIME    DATE,
  COME_LATE_NUM    VARCHAR2(10),
  LEAVE_EARLY_NUM  VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AR_SAME_PINYIN
prompt =============================
prompt
create table DUKEPU.AR_SAME_PINYIN
(
  JOB_NUMBER              VARCHAR2(20),
  NAME                    NVARCHAR2(20),
  ATTENDANCE_MACHINE_FLAG INTEGER,
  ROW_INDEX               INTEGER,
  RECORD_TIME             DATE default sysdate
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AR_SUMMARY
prompt =========================
prompt
create table DUKEPU.AR_SUMMARY
(
  DEPT                         NVARCHAR2(20),
  NAME                         NVARCHAR2(20),
  AR_JOB_NUMBER                VARCHAR2(20),
  AR_NAME                      NVARCHAR2(20),
  LATEST_OFF_DUTY              DATE,
  OVERTIME_WORKDAY_ONE_MONTH   NUMBER,
  OVERTIME_RESTDAY_ONE_MONTH   NUMBER,
  REMARK                       NVARCHAR2(50),
  SEQ                          INTEGER not null,
  BELONG_TO_MONTH              DATE,
  DAYS_OF_SHOULD_BE_ATTENDANCE INTEGER,
  DAYS_OF_REAL_ATTENDANCE      INTEGER,
  NOT_FINGER_PRINT             INTEGER,
  COME_LATE_NUM                INTEGER,
  LEAVE_EARLY_NUM              INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.AR_SUMMARY.DEPT
  is '此部门信息，来自产量报表。';
comment on column DUKEPU.AR_SUMMARY.NAME
  is '产量 报表中的姓名。';
comment on column DUKEPU.AR_SUMMARY.OVERTIME_WORKDAY_ONE_MONTH
  is '平日延迟 ';
comment on column DUKEPU.AR_SUMMARY.OVERTIME_RESTDAY_ONE_MONTH
  is '加班日工作时长';
comment on column DUKEPU.AR_SUMMARY.BELONG_TO_MONTH
  is '所属月份';
comment on column DUKEPU.AR_SUMMARY.DAYS_OF_SHOULD_BE_ATTENDANCE
  is '应出勤天数 ';
comment on column DUKEPU.AR_SUMMARY.DAYS_OF_REAL_ATTENDANCE
  is '实出勤天数';
comment on column DUKEPU.AR_SUMMARY.NOT_FINGER_PRINT
  is '未打卡次数';
comment on column DUKEPU.AR_SUMMARY.COME_LATE_NUM
  is '迟到次数';
comment on column DUKEPU.AR_SUMMARY.LEAVE_EARLY_NUM
  is '早退次数';
create unique index DUKEPU.IX_DEPT_NAME_BELONGTOMONTH on DUKEPU.AR_SUMMARY (DEPT, NAME, BELONG_TO_MONTH)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table AR_SUMMARY_FINAL
prompt ===============================
prompt
create table DUKEPU.AR_SUMMARY_FINAL
(
  JOB_NUMBER                  VARCHAR2(60),
  NAME                        NVARCHAR2(20),
  DAYS_OF_REAL_ATTENDANCE     INTEGER,
  NOT_FINGER_PRINT            INTEGER,
  OVERTIME_OF_WORKDAY         NUMBER,
  OVERTIME_OF_RESTDAY         NUMBER,
  COME_LATE_NUM               INTEGER,
  LEAVE_EARLY_NUM             INTEGER,
  MEAL_SUBSIDY                INTEGER,
  BELONG_TO_MONTH             DATE,
  VACATION_TOTAL_TIME         INTEGER,
  OVERTIME_OF_WEE_HOURS_OF_WD NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.AR_SUMMARY_FINAL.VACATION_TOTAL_TIME
  is '请假时长';
comment on column DUKEPU.AR_SUMMARY_FINAL.OVERTIME_OF_WEE_HOURS_OF_WD
  is '凌晨加班时长  至17:00 结束。';

prompt
prompt Creating table AR_SUMMARY_FOR_LN
prompt ================================
prompt
create table DUKEPU.AR_SUMMARY_FOR_LN
(
  AR_JOB_NUMBER                VARCHAR2(20),
  AR_NAME                      NVARCHAR2(20),
  LATEST_OFF_DUTY              DATE,
  OVERTIME_WORKDAY_ONE_MONTH   NUMBER,
  OVERTIME_RESTDAY_ONE_MONTH   NUMBER,
  REMARK                       NVARCHAR2(50),
  DAYS_OF_SHOULD_BE_ATTENDANCE INTEGER,
  DAYS_OF_REAL_ATTENDANCE      INTEGER,
  NOT_FINGER_PRINT             INTEGER,
  COME_LATE_NUM                INTEGER,
  LEAVE_EARLY_NUM              INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.AR_SUMMARY_FOR_LN.DAYS_OF_SHOULD_BE_ATTENDANCE
  is '应出勤天数';
comment on column DUKEPU.AR_SUMMARY_FOR_LN.DAYS_OF_REAL_ATTENDANCE
  is '实际出勤天数 ';
comment on column DUKEPU.AR_SUMMARY_FOR_LN.NOT_FINGER_PRINT
  is '未打卡次数';

prompt
prompt Creating table AR_SUMMARY_NEW
prompt =============================
prompt
create global temporary table DUKEPU.AR_SUMMARY_NEW
(
  NAME                   NVARCHAR2(20),
  ACTUAL_ATTENDANCE_DAYS INTEGER,
  NOT_BRUSH_FINGERPRINT  INTEGER,
  DELAY_TIME             NUMBER,
  COME_LATE_NUM          INTEGER,
  LEAVE_EARLY_NUM        NVARCHAR2(20),
  MEAL_SUBSIDY           INTEGER,
  DEPT                   NVARCHAR2(20),
  JOB_NUMBER             VARCHAR2(20)
)
on commit preserve rows;
comment on column DUKEPU.AR_SUMMARY_NEW.NAME
  is '姓名 ';
comment on column DUKEPU.AR_SUMMARY_NEW.ACTUAL_ATTENDANCE_DAYS
  is '实际出勤 天数';
comment on column DUKEPU.AR_SUMMARY_NEW.NOT_BRUSH_FINGERPRINT
  is '未刷指纹次数';
comment on column DUKEPU.AR_SUMMARY_NEW.DELAY_TIME
  is '延时';
comment on column DUKEPU.AR_SUMMARY_NEW.LEAVE_EARLY_NUM
  is '考勤记录表中的用户名';
comment on column DUKEPU.AR_SUMMARY_NEW.MEAL_SUBSIDY
  is '餐补';
comment on column DUKEPU.AR_SUMMARY_NEW.DEPT
  is '部门';
comment on column DUKEPU.AR_SUMMARY_NEW.JOB_NUMBER
  is '工号 ';

prompt
prompt Creating table AR_TEMP
prompt ======================
prompt
create table DUKEPU.AR_TEMP
(
  JOB_NUMBER              VARCHAR2(20),
  NAME                    NVARCHAR2(20),
  RECORD_TIME             DATE default sysdate,
  ATTENDANCE_MACHINE_FLAG INTEGER,
  ROW_INDEX               INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.AR_TEMP.ATTENDANCE_MACHINE_FLAG
  is '考勤机编号 ';
comment on column DUKEPU.AR_TEMP.ROW_INDEX
  is '行号 ';

prompt
prompt Creating table ASK_FOR_LEAVE
prompt ============================
prompt
create table DUKEPU.ASK_FOR_LEAVE
(
  SEQ              INTEGER,
  JOB_NUMBER       NVARCHAR2(20),
  LEAVE_START_TIME DATE,
  LEAVE_END_TIME   DATE,
  RECORD_TIME      DATE,
  TYPE             NVARCHAR2(20),
  NO               VARCHAR2(20),
  NAME             NVARCHAR2(20),
  YEAR_AND_MONTH   VARCHAR2(20),
  LEAVE_DATE       DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.ASK_FOR_LEAVE.LEAVE_START_TIME
  is '请假 起始时间';
comment on column DUKEPU.ASK_FOR_LEAVE.LEAVE_END_TIME
  is '请假 结束时间';
comment on column DUKEPU.ASK_FOR_LEAVE.RECORD_TIME
  is '记录时间';
comment on column DUKEPU.ASK_FOR_LEAVE.TYPE
  is '假期类型';
comment on column DUKEPU.ASK_FOR_LEAVE.NO
  is '请假单编号';
comment on column DUKEPU.ASK_FOR_LEAVE.YEAR_AND_MONTH
  is '年月字符串';
comment on column DUKEPU.ASK_FOR_LEAVE.LEAVE_DATE
  is '请假日期';
create index DUKEPU.IX_JN_A_F_L on DUKEPU.ASK_FOR_LEAVE (JOB_NUMBER)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ASK_FOR_LEAVE_TEMP
prompt =================================
prompt
create table DUKEPU.ASK_FOR_LEAVE_TEMP
(
  JOB_NUMBER       NVARCHAR2(20),
  LEAVE_START_TIME DATE,
  LEAVE_END_TIME   DATE,
  RECORD_TIME      DATE,
  TYPE             NVARCHAR2(20),
  NO               VARCHAR2(20),
  NAME             NVARCHAR2(20),
  YEAR_AND_MONTH   VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.ASK_FOR_LEAVE_TEMP.NO
  is '请假单编号';
comment on column DUKEPU.ASK_FOR_LEAVE_TEMP.YEAR_AND_MONTH
  is '年月字符串.';

prompt
prompt Creating table ATTENDANCE_RECORD_201905_BAK
prompt ===========================================
prompt
create table DUKEPU.ATTENDANCE_RECORD_201905_BAK
(
  START_DATE         DATE,
  END_DATE           DATE,
  TABULATION_TIME    DATE,
  FINGERPRINT_DATE   DATE,
  JOB_NUMBER         NVARCHAR2(30),
  NAME               NVARCHAR2(10),
  DEPT               NVARCHAR2(10),
  SHEET_NAME         NVARCHAR2(10),
  FPT_FIRST_TIME     DATE,
  FPT_LAST_TIME      DATE,
  SEQ                INTEGER,
  RECORD_TIME        DATE,
  NOT_FINGER_PRINT   INTEGER,
  DELAY_TIME         NUMBER,
  LEAVE_EARLY_NUM    NUMBER,
  MEAL_SUBSIDY       INTEGER,
  RANDOM_STR         VARCHAR2(50),
  COME_NUM           NUMBER,
  COME_LATE_NUM      NUMBER,
  ASK_FOR_LEAVE_DAYS NUMBER,
  ASK_FOR_LEAVE_TYPE NVARCHAR2(20),
  FILL_UP_REMARK     NVARCHAR2(100),
  FILE_PATH          NVARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ATTENDANCE_RECORD_BAK
prompt ====================================
prompt
create table DUKEPU.ATTENDANCE_RECORD_BAK
(
  START_DATE         DATE,
  END_DATE           DATE,
  TABULATION_TIME    DATE,
  FINGERPRINT_DATE   DATE,
  JOB_NUMBER         NVARCHAR2(100),
  NAME               NVARCHAR2(10),
  DEPT               NVARCHAR2(10),
  SHEET_NAME         NVARCHAR2(10),
  FPT_FIRST_TIME     DATE,
  FPT_LAST_TIME      DATE,
  SEQ                INTEGER,
  RECORD_TIME        DATE default sysdate,
  NOT_FINGER_PRINT   INTEGER,
  DELAY_TIME         NUMBER,
  LEAVE_EARLY_NUM    NUMBER default 0,
  MEAL_SUBSIDY       INTEGER,
  RANDOM_STR         VARCHAR2(50),
  COME_NUM           NUMBER,
  COME_LATE_NUM      NUMBER default 0,
  ASK_FOR_LEAVE_DAYS NUMBER,
  ASK_FOR_LEAVE_TYPE NVARCHAR2(20),
  FILL_UP_REMARK     NVARCHAR2(100),
  FILE_PATH          NVARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.ATTENDANCE_RECORD_BAK.RECORD_TIME
  is '记录时间 ';
comment on column DUKEPU.ATTENDANCE_RECORD_BAK.NOT_FINGER_PRINT
  is '未打开次数';
comment on column DUKEPU.ATTENDANCE_RECORD_BAK.DELAY_TIME
  is '加班延时';
comment on column DUKEPU.ATTENDANCE_RECORD_BAK.LEAVE_EARLY_NUM
  is '早退次数';
comment on column DUKEPU.ATTENDANCE_RECORD_BAK.MEAL_SUBSIDY
  is '超过4小时但小于8小时,计为0.5;  超过8小时计算为1;';
comment on column DUKEPU.ATTENDANCE_RECORD_BAK.RANDOM_STR
  is '随即字符串';
comment on column DUKEPU.ATTENDANCE_RECORD_BAK.COME_NUM
  is '来刷卡次数,只要刷卡一次,就计为1';
comment on column DUKEPU.ATTENDANCE_RECORD_BAK.COME_LATE_NUM
  is '迟到次数';
comment on column DUKEPU.ATTENDANCE_RECORD_BAK.ASK_FOR_LEAVE_DAYS
  is '请假天数';
comment on column DUKEPU.ATTENDANCE_RECORD_BAK.ASK_FOR_LEAVE_TYPE
  is '请假类型.';
comment on column DUKEPU.ATTENDANCE_RECORD_BAK.FILL_UP_REMARK
  is '补卡描述 ';
comment on column DUKEPU.ATTENDANCE_RECORD_BAK.FILE_PATH
  is '文件路径';
create index DUKEPU.IX_FINGERPRINT_DATE on DUKEPU.ATTENDANCE_RECORD_BAK (FINGERPRINT_DATE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DUKEPU.IX_FPT_F_T_AND_FP_DATE on DUKEPU.ATTENDANCE_RECORD_BAK (FPT_FIRST_TIME, FINGERPRINT_DATE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DUKEPU.IX_FPT_L_T_AND_FP_D on DUKEPU.ATTENDANCE_RECORD_BAK (FPT_LAST_TIME, FINGERPRINT_DATE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DUKEPU.IX_JN_AND_FP_D_AND_F_F_T on DUKEPU.ATTENDANCE_RECORD_BAK (FINGERPRINT_DATE, FPT_FIRST_TIME)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DUKEPU.IX_JN_AND_FP_D_AND_F_L_T on DUKEPU.ATTENDANCE_RECORD_BAK (FINGERPRINT_DATE, FPT_LAST_TIME)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DUKEPU.IX_JN_FP_D_AND_F_F_T_AND_F_L_T on DUKEPU.ATTENDANCE_RECORD_BAK (JOB_NUMBER, FINGERPRINT_DATE, FPT_FIRST_TIME, FPT_LAST_TIME)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index DUKEPU.IX_JN_NAME_FPD on DUKEPU.ATTENDANCE_RECORD_BAK (SUBSTR(JOB_NUMBER,1,9), NAME, FINGERPRINT_DATE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DUKEPU.IX_NAME_AND_FP_D on DUKEPU.ATTENDANCE_RECORD_BAK (NAME, FINGERPRINT_DATE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ATTENDANCE_RECORD_BRIEFLY
prompt ========================================
prompt
create table DUKEPU.ATTENDANCE_RECORD_BRIEFLY
(
  START_DATE                  DATE,
  END_DATE                    DATE,
  TABULATION_TIME             DATE,
  FINGER_PRINT_DATE           DATE,
  JOB_NUMBER                  NVARCHAR2(100),
  NAME                        NVARCHAR2(10),
  DEPT                        NVARCHAR2(10),
  SHEET_NAME                  NVARCHAR2(10),
  FPT_FIRST_TIME              DATE,
  SEQ                         INTEGER,
  RECORD_TIME                 DATE default sysdate,
  RANDOM_STR                  VARCHAR2(50),
  FILE_PATH                   NVARCHAR2(300),
  FPT_LAST_TIME               DATE,
  COME_LATE_NUM               INTEGER,
  LEAVE_EARLY_NUM             INTEGER,
  COME_NUM                    INTEGER,
  NOT_FINGER_PRINT            INTEGER,
  DELAY_TIME                  INTEGER,
  DINNER_SUBSIDY              INTEGER,
  OVERTIME_OF_WEE_HOURS_OF_WD NUMBER,
  MIDDAY_FPT_FIRST_TIME       DATE,
  MIDDAY_FPT_LAST_TIME        DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.ATTENDANCE_RECORD_BRIEFLY.COME_LATE_NUM
  is '用于在输出时，表示表格颜色';
comment on column DUKEPU.ATTENDANCE_RECORD_BRIEFLY.LEAVE_EARLY_NUM
  is '用于在输出时，表示表格颜色';
comment on column DUKEPU.ATTENDANCE_RECORD_BRIEFLY.COME_NUM
  is '出勤天数';
comment on column DUKEPU.ATTENDANCE_RECORD_BRIEFLY.MIDDAY_FPT_FIRST_TIME
  is '中午第一次按指纹时间';
comment on column DUKEPU.ATTENDANCE_RECORD_BRIEFLY.MIDDAY_FPT_LAST_TIME
  is '中午最后一次按指纹时间';
create unique index DUKEPU.IX_NAME_FINGERPRINTDATE on DUKEPU.ATTENDANCE_RECORD_BRIEFLY (JOB_NUMBER, FINGER_PRINT_DATE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ATTENDANCE_RECORD_DETAIL
prompt =======================================
prompt
create table DUKEPU.ATTENDANCE_RECORD_DETAIL
(
  START_DATE        DATE,
  END_DATE          DATE,
  TABULATION_TIME   DATE,
  FINGER_PRINT_DATE DATE,
  JOB_NUMBER        NVARCHAR2(1000),
  NAME              NVARCHAR2(10),
  DEPT              NVARCHAR2(10),
  SHEET_NAME        NVARCHAR2(10),
  FINGER_PRINT_TIME DATE,
  SEQ               INTEGER,
  RECORD_TIME       DATE default sysdate,
  RANDOM_STR        VARCHAR2(50),
  FILE_PATH         NVARCHAR2(300)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.ATTENDANCE_RECORD_DETAIL.FINGER_PRINT_TIME
  is '刷卡时间';
alter table DUKEPU.ATTENDANCE_RECORD_DETAIL
  add constraint IX_SEQ_ATTENDANCE_R_DETAIL unique (SEQ)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DUKEPU.IX_NAME_A_R_DETAIL on DUKEPU.ATTENDANCE_RECORD_DETAIL (FINGER_PRINT_DATE, NAME)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ATTENDANCE_RECORD_DETAIL_BAK
prompt ===========================================
prompt
create table DUKEPU.ATTENDANCE_RECORD_DETAIL_BAK
(
  START_DATE        DATE,
  END_DATE          DATE,
  TABULATION_TIME   DATE,
  FINGER_PRINT_DATE DATE,
  JOB_NUMBER        NVARCHAR2(100),
  NAME              NVARCHAR2(10),
  DEPT              NVARCHAR2(10),
  SHEET_NAME        NVARCHAR2(10),
  FINGER_PRINT_TIME DATE,
  SEQ               INTEGER,
  RECORD_TIME       DATE,
  RANDOM_STR        VARCHAR2(50),
  FILE_PATH         NVARCHAR2(300)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ATTENDANCE_RECORD_SUMMARY
prompt ========================================
prompt
create table DUKEPU.ATTENDANCE_RECORD_SUMMARY
(
  START_DATE         DATE,
  END_DATE           DATE,
  TABULATION_TIME    DATE,
  FINGERPRINT_DATE   DATE,
  JOB_NUMBER         NVARCHAR2(30),
  NAME               NVARCHAR2(10),
  DEPT               NVARCHAR2(10),
  SHEET_NAME         NVARCHAR2(10),
  FPT_FIRST_TIME     DATE,
  FPT_LAST_TIME      DATE,
  SEQ                INTEGER,
  RECORD_TIME        DATE,
  NOT_FINGER_PRINT   INTEGER,
  DELAY_TIME         NUMBER,
  LEAVE_EARLY_NUM    NUMBER,
  MEAL_SUBSIDY       INTEGER,
  RANDOM_STR         VARCHAR2(50),
  COME_NUM           NUMBER,
  COME_LATE_NUM      NUMBER,
  ASK_FOR_LEAVE_DAYS NUMBER,
  ASK_FOR_LEAVE_TYPE NVARCHAR2(20),
  FILL_UP_REMARK     NVARCHAR2(100),
  FILE_PATH          NVARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BR_DICT
prompt ======================
prompt
create table DUKEPU.BR_DICT
(
  ID      NUMBER not null,
  D_ITEM  VARCHAR2(32),
  D_VALUE VARCHAR2(32),
  D_TYPE  VARCHAR2(32),
  D_SORT  NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DUKEPU.BR_DICT
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CHECK_PRODUCTS_COST_DOC
prompt ======================================
prompt
create table DUKEPU.CHECK_PRODUCTS_COST_DOC
(
  SUMMARY_PROCESS  NVARCHAR2(20),
  SPECIFIC_PROCESS NVARCHAR2(80),
  ROW_INDEX        INTEGER,
  SEQ_P_C_RECORD   INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.CHECK_PRODUCTS_COST_DOC.SEQ_P_C_RECORD
  is '序号';
create unique index DUKEPU.IX_SUMMARYP_SPECIFICP on DUKEPU.CHECK_PRODUCTS_COST_DOC (SUMMARY_PROCESS, SPECIFIC_PROCESS)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DAILY_CAPACITY
prompt =============================
prompt
create table DUKEPU.DAILY_CAPACITY
(
  NAME                   NVARCHAR2(20) not null,
  JOB_NUMBER             NVARCHAR2(20),
  SUMMARY_PROCESS        NVARCHAR2(30) not null,
  SPECIFIC_PROCESS       NVARCHAR2(50) not null,
  MANUFACTURE_QUANTITIES NUMBER not null,
  YIELDS_TIME            DATE not null,
  UPDATE_TIME            DATE default SYSDATE,
  PRODUCTS_NAME          NVARCHAR2(30) not null,
  SEQ                    INTEGER,
  SUBMIT_PERSON          NVARCHAR2(20),
  RANDOM_STR             NVARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index DUKEPU.IX_J_N_AND_M_T on DUKEPU.DAILY_CAPACITY (JOB_NUMBER, SPECIFIC_PROCESS, TRUNC(YIELDS_TIME))
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DAILY_CAPACITY_HISTORY
prompt =====================================
prompt
create table DUKEPU.DAILY_CAPACITY_HISTORY
(
  SEQ                    NUMBER,
  JOB_NUMBER             NVARCHAR2(20) not null,
  PRODUCTS_NAME          NVARCHAR2(20) not null,
  SUMMARY_PROCESS        NVARCHAR2(20) not null,
  SPECIFIC_PROCESS       NVARCHAR2(30) not null,
  MANUFACTURE_QUANTITIES NUMBER not null,
  YIELDS_TIME            DATE not null,
  SUBMIT_PERSON          NVARCHAR2(10),
  UPDATE_TIME            DATE,
  SAVED_HISTORY_TIME     DATE default SYSDATE,
  NAME                   NVARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DAILY_CAPACITY_TEMP
prompt ==================================
prompt
create table DUKEPU.DAILY_CAPACITY_TEMP
(
  NAME                   NVARCHAR2(20) not null,
  JOB_NUMBER             NVARCHAR2(20) not null,
  SUMMARY_PROCESS        NVARCHAR2(30) not null,
  SPECIFIC_PROCESS       NVARCHAR2(50) not null,
  MANUFACTURE_QUANTITIES NUMBER not null,
  YIELDS_TIME            DATE not null,
  UPDATE_TIME            DATE,
  PRODUCTS_NAME          NVARCHAR2(30) not null,
  SEQ                    INTEGER,
  SUBMIT_PERSON          NVARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table EMPLOYEES
prompt ========================
prompt
create table DUKEPU.EMPLOYEES
(
  NAME          NVARCHAR2(30),
  JOB_NUMBER    NVARCHAR2(20),
  DEPARTMENT    NVARCHAR2(20),
  CONTACT_WAY   NVARCHAR2(20),
  POSITION      NVARCHAR2(20),
  ROLE          NVARCHAR2(20),
  UPDATE_TIME   DATE default sysdate,
  IS_ON_THE_JOB INTEGER default 1,
  RANDOM_STR    NVARCHAR2(40),
  SEQ           INTEGER,
  AR_NAME       NVARCHAR2(30),
  AR_JOB_NUMBER VARCHAR2(20),
  REPORT_TIME   DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.EMPLOYEES.AR_NAME
  is '考勤记录表中的姓名.';
comment on column DUKEPU.EMPLOYEES.AR_JOB_NUMBER
  is '考勤记录表中的工号';
comment on column DUKEPU.EMPLOYEES.REPORT_TIME
  is '报表时间';
create unique index DUKEPU.IX_NAME on DUKEPU.EMPLOYEES (NAME, DEPARTMENT)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table EMPLOYEES_TEMP
prompt =============================
prompt
create table DUKEPU.EMPLOYEES_TEMP
(
  NAME          NVARCHAR2(30),
  JOB_NUMBER    NVARCHAR2(20),
  DEPARTMENT    NVARCHAR2(20),
  CONTACT_WAY   NVARCHAR2(20),
  POSITION      NVARCHAR2(20),
  ROLE          NVARCHAR2(20),
  UPDATE_TIME   DATE,
  IS_ON_THE_JOB INTEGER,
  RANDOM_STR    NVARCHAR2(40),
  AR_NAME       NVARCHAR2(30),
  AR_JOB_NUMBER INTEGER,
  REPORT_TIME   DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table EXCEL_PROGRESS
prompt =============================
prompt
create table DUKEPU.EXCEL_PROGRESS
(
  APP_NAME NVARCHAR2(50),
  MSG      NVARCHAR2(50),
  VALUE    INTEGER,
  MAXIMUM  INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.EXCEL_PROGRESS.APP_NAME
  is '应用程序名';
comment on column DUKEPU.EXCEL_PROGRESS.VALUE
  is '当前值 ';
comment on column DUKEPU.EXCEL_PROGRESS.MAXIMUM
  is '最大值 ';

prompt
prompt Creating table FINISH_MESSAGE
prompt =============================
prompt
create table DUKEPU.FINISH_MESSAGE
(
  PROMPT              NVARCHAR2(193),
  FLAG                INTEGER not null,
  NAME_OF_THE_HANDLER NVARCHAR2(50),
  UPDATE_TIME         DATE default SYSDATE,
  FILE_NAME           NVARCHAR2(40),
  RANDOM_STR          NVARCHAR2(30),
  FINISH_FLAG         INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.FINISH_MESSAGE.FLAG
  is '此字段 由于 对前台 信息 显示 控件  背景颜色。';

prompt
prompt Creating table LEARNING
prompt =======================
prompt
create table DUKEPU.LEARNING
(
  NAME NVARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table DUKEPU.LEARNING
  is '用于8:30以后上班的人员名单。';

prompt
prompt Creating table MSG
prompt ==================
prompt
create table DUKEPU.MSG
(
  PROMPT       NVARCHAR2(50),
  FLAG         INTEGER,
  OPERATE_TIME DATE,
  SUBJECT      NVARCHAR2(50),
  RANDOM_STR   NVARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORA_ASPNET_APPLICATIONS
prompt ======================================
prompt
create table DUKEPU.ORA_ASPNET_APPLICATIONS
(
  APPLICATIONNAME        NVARCHAR2(256) not null,
  LOWEREDAPPLICATIONNAME NVARCHAR2(256) not null,
  APPLICATIONID          RAW(16) default SYS_GUID() not null,
  DESCRIPTION            NVARCHAR2(256)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_APPLICATIONS
  add primary key (APPLICATIONID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_APPLICATIONS
  add unique (APPLICATIONNAME)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_APPLICATIONS
  add unique (LOWEREDAPPLICATIONNAME)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ORA_ASPNET_USERS
prompt ===============================
prompt
create table DUKEPU.ORA_ASPNET_USERS
(
  APPLICATIONID    RAW(16) not null,
  USERID           RAW(16) default SYS_GUID() not null,
  USERNAME         NVARCHAR2(256) not null,
  LOWEREDUSERNAME  NVARCHAR2(256) not null,
  MOBILEALIAS      NVARCHAR2(16),
  ISANONYMOUS      INTEGER default 0 not null,
  LASTACTIVITYDATE DATE not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_USERS
  add primary key (USERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_USERS
  add constraint FK_USERS_APPID foreign key (APPLICATIONID)
  references DUKEPU.ORA_ASPNET_APPLICATIONS (APPLICATIONID);
create unique index DUKEPU.ASPNET_USERS_INDEX on DUKEPU.ORA_ASPNET_USERS (APPLICATIONID, LOWEREDUSERNAME)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index DUKEPU.ASPNET_USERS_INDEX2 on DUKEPU.ORA_ASPNET_USERS (APPLICATIONID, LASTACTIVITYDATE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ORA_ASPNET_MEMBERSHIP
prompt ====================================
prompt
create table DUKEPU.ORA_ASPNET_MEMBERSHIP
(
  APPLICATIONID                  RAW(16) not null,
  USERID                         RAW(16) not null,
  PASSWORD                       NVARCHAR2(128) not null,
  PASSWORDFORMAT                 INTEGER default 0 not null,
  PASSWORDSALT                   NVARCHAR2(128) not null,
  MOBILEPIN                      NVARCHAR2(16),
  EMAIL                          NVARCHAR2(256),
  LOWEREDEMAIL                   NVARCHAR2(256),
  PASSWORDQUESTION               NVARCHAR2(256),
  PASSWORDANSWER                 NVARCHAR2(128),
  ISAPPROVED                     INTEGER not null,
  ISLOCKEDOUT                    INTEGER not null,
  CREATEDATE                     DATE not null,
  LASTLOGINDATE                  DATE not null,
  LASTPASSWORDCHANGEDDATE        DATE not null,
  LASTLOCKOUTDATE                DATE not null,
  FAILEDPWDATTEMPTCOUNT          INTEGER not null,
  FAILEDPWDATTEMPTWINSTART       DATE not null,
  FAILEDPWDANSWERATTEMPTCOUNT    INTEGER not null,
  FAILEDPWDANSWERATTEMPTWINSTART DATE not null,
  COMMENTS                       NCLOB
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_MEMBERSHIP
  add primary key (USERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_MEMBERSHIP
  add constraint FK_MEMBERSHIP_APPID foreign key (APPLICATIONID)
  references DUKEPU.ORA_ASPNET_APPLICATIONS (APPLICATIONID);
alter table DUKEPU.ORA_ASPNET_MEMBERSHIP
  add constraint FK_MEMBERSHIP_USERID foreign key (USERID)
  references DUKEPU.ORA_ASPNET_USERS (USERID);

prompt
prompt Creating table ORA_ASPNET_PATHS
prompt ===============================
prompt
create table DUKEPU.ORA_ASPNET_PATHS
(
  APPLICATIONID RAW(16) not null,
  PATHID        RAW(16) default SYS_GUID() not null,
  PATH          NVARCHAR2(256) not null,
  LOWEREDPATH   NVARCHAR2(256) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_PATHS
  add primary key (PATHID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_PATHS
  add constraint FK_PATHS_APPID foreign key (APPLICATIONID)
  references DUKEPU.ORA_ASPNET_APPLICATIONS (APPLICATIONID);
create unique index DUKEPU.ORA_ASPNET_PATHS_INDEX on DUKEPU.ORA_ASPNET_PATHS (APPLICATIONID, LOWEREDPATH)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ORA_ASPNET_PERSONALIZNALLUSERS
prompt =============================================
prompt
create table DUKEPU.ORA_ASPNET_PERSONALIZNALLUSERS
(
  PATHID          RAW(16),
  PAGESETTINGS    BLOB not null,
  LASTUPDATEDDATE DATE not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_PERSONALIZNALLUSERS
  add constraint PERSONALIZATIONALLUSERS_PATHID foreign key (PATHID)
  references DUKEPU.ORA_ASPNET_PATHS (PATHID) on delete cascade;

prompt
prompt Creating table ORA_ASPNET_PERSONALIZNPERUSER
prompt ============================================
prompt
create table DUKEPU.ORA_ASPNET_PERSONALIZNPERUSER
(
  ID              RAW(16) default SYS_GUID() not null,
  PATHID          RAW(16),
  USERID          RAW(16),
  PAGESETTINGS    BLOB not null,
  LASTUPDATEDDATE DATE not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_PERSONALIZNPERUSER
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_PERSONALIZNPERUSER
  add constraint PERSONALIZATIONPERUSER_PATHID foreign key (PATHID)
  references DUKEPU.ORA_ASPNET_PATHS (PATHID);
alter table DUKEPU.ORA_ASPNET_PERSONALIZNPERUSER
  add constraint PERSONALIZATIONPERUSER_USERID foreign key (USERID)
  references DUKEPU.ORA_ASPNET_USERS (USERID);
create unique index DUKEPU.PERSONALIZATIONPERUSER_INDEX2 on DUKEPU.ORA_ASPNET_PERSONALIZNPERUSER (PATHID, USERID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index DUKEPU.PERSONALIZNPERUSER_USERIDINDEX on DUKEPU.ORA_ASPNET_PERSONALIZNPERUSER (USERID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ORA_ASPNET_PROFILE
prompt =================================
prompt
create table DUKEPU.ORA_ASPNET_PROFILE
(
  USERID               RAW(16) not null,
  PROPERTYNAMES        NCLOB not null,
  PROPERTYVALUESSTRING NCLOB not null,
  PROPERTYVALUESBINARY BLOB not null,
  LASTUPDATEDDATE      DATE not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_PROFILE
  add primary key (USERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_PROFILE
  add constraint FK_PROFILE_USERID foreign key (USERID)
  references DUKEPU.ORA_ASPNET_USERS (USERID);

prompt
prompt Creating table ORA_ASPNET_ROLES
prompt ===============================
prompt
create table DUKEPU.ORA_ASPNET_ROLES
(
  APPLICATIONID   RAW(16) not null,
  ROLEID          RAW(16) default SYS_GUID() not null,
  ROLENAME        NVARCHAR2(256) not null,
  LOWEREDROLENAME NVARCHAR2(256) not null,
  DESCRIPTION     NVARCHAR2(256)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_ROLES
  add primary key (ROLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_ROLES
  add constraint FK_APPLICATIONID foreign key (APPLICATIONID)
  references DUKEPU.ORA_ASPNET_APPLICATIONS (APPLICATIONID);
create unique index DUKEPU.ASPNET_ROLES_INDEX1 on DUKEPU.ORA_ASPNET_ROLES (APPLICATIONID, LOWEREDROLENAME)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ORA_ASPNET_SESSIONAPPLICATIONS
prompt =============================================
prompt
create table DUKEPU.ORA_ASPNET_SESSIONAPPLICATIONS
(
  APPID   RAW(16) not null,
  APPNAME NVARCHAR2(280) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_SESSIONAPPLICATIONS
  add primary key (APPID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index DUKEPU.ASPNET_SESSIONSTATE_APP_INDEX on DUKEPU.ORA_ASPNET_SESSIONAPPLICATIONS (APPNAME)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ORA_ASPNET_SESSIONS
prompt ==================================
prompt
create table DUKEPU.ORA_ASPNET_SESSIONS
(
  SESSIONID        NVARCHAR2(116) not null,
  CREATED          DATE default SYS_EXTRACT_UTC(SYSTIMESTAMP) not null,
  EXPIRES          DATE not null,
  LOCKDATE         DATE not null,
  LOCKDATELOCAL    DATE not null,
  LOCKCOOKIE       INTEGER not null,
  TIMEOUT          INTEGER not null,
  LOCKED           INTEGER not null,
  SESSIONITEMSHORT RAW(2000),
  SESSIONITEMLONG  BLOB,
  FLAGS            INTEGER default 0 not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_SESSIONS
  add primary key (SESSIONID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create index DUKEPU.ASPNET_SESSIONSTATE_INDEX on DUKEPU.ORA_ASPNET_SESSIONS (EXPIRES)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ORA_ASPNET_SITEMAP
prompt =================================
prompt
create table DUKEPU.ORA_ASPNET_SITEMAP
(
  APPLICATIONID RAW(16) not null,
  ID            NUMBER(10) not null,
  TITLE         NVARCHAR2(32),
  DESCRIPTION   NVARCHAR2(512),
  URL           NVARCHAR2(512),
  ROLES         NVARCHAR2(512),
  PARENT        NUMBER(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_SITEMAP
  add constraint PK_SITEMAP_APPID_ID primary key (APPLICATIONID, ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_SITEMAP
  add constraint FK_SITEMAP_APPID foreign key (APPLICATIONID)
  references DUKEPU.ORA_ASPNET_APPLICATIONS (APPLICATIONID) on delete cascade;

prompt
prompt Creating table ORA_ASPNET_USERSINROLES
prompt ======================================
prompt
create table DUKEPU.ORA_ASPNET_USERSINROLES
(
  USERID RAW(16) not null,
  ROLEID RAW(16) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_USERSINROLES
  add constraint PK_ASPNET_USERSINROLES primary key (USERID, ROLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table DUKEPU.ORA_ASPNET_USERSINROLES
  add constraint FK_ASPNET_USERSINROLES_ROLEID foreign key (ROLEID)
  references DUKEPU.ORA_ASPNET_ROLES (ROLEID);
alter table DUKEPU.ORA_ASPNET_USERSINROLES
  add constraint FK_ASPNET_USERSINROLES_USERID foreign key (USERID)
  references DUKEPU.ORA_ASPNET_USERS (USERID);
create index DUKEPU.ASPNET_USERSINROLES_INDEX on DUKEPU.ORA_ASPNET_USERSINROLES (ROLEID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ORA_ASPNET_WEBEVENTS
prompt ===================================
prompt
create table DUKEPU.ORA_ASPNET_WEBEVENTS
(
  EVENTID                CHAR(32),
  EVENTTIMEUTC           DATE,
  EVENTTIME              DATE,
  EVENTTYPE              NVARCHAR2(256),
  EVENTSEQUENCE          NUMBER(19),
  EVENTOCCURENCE         NUMBER(19),
  EVENTCODE              NUMBER(10),
  EVENTDETAILCODE        NUMBER(10),
  MESSAGE                NVARCHAR2(1000),
  APPLICATIONPATH        NVARCHAR2(256),
  APPLICATIONVIRTUALPATH NVARCHAR2(256),
  MACHINENAME            NVARCHAR2(256),
  REQUESTURL             NVARCHAR2(256),
  EXCEPTIONTYPE          NVARCHAR2(256),
  DETAILS                NCLOB
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table PRODUCTS_COST
prompt ============================
prompt
create table DUKEPU.PRODUCTS_COST
(
  SEQ                   NUMBER,
  SUMMARY_PROCESS       NVARCHAR2(30),
  SPECIFIC_PROCESS      NVARCHAR2(50),
  MAN_HOURS             NUMBER,
  LABOUR_COST           NUMBER default 0.00244,
  SUPPLIER              NVARCHAR2(30),
  UPDATE_TIME           DATE default sysdate,
  PRODUCT_NAME          NVARCHAR2(30),
  SEQ_P_C_RECORD        INTEGER,
  FINAL_LABOUR_COST     NUMBER,
  AMOUNT                INTEGER,
  EACH_COST             NUMBER,
  SPECIFIC_EACH_PROCESS NVARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.PRODUCTS_COST.SUMMARY_PROCESS
  is '主要工序 ';
comment on column DUKEPU.PRODUCTS_COST.SPECIFIC_PROCESS
  is '具体工序 ';
comment on column DUKEPU.PRODUCTS_COST.MAN_HOURS
  is '工时 ';
comment on column DUKEPU.PRODUCTS_COST.LABOUR_COST
  is '工价 ';
comment on column DUKEPU.PRODUCTS_COST.SUPPLIER
  is '提交者 ';
comment on column DUKEPU.PRODUCTS_COST.UPDATE_TIME
  is '更新时间';
comment on column DUKEPU.PRODUCTS_COST.PRODUCT_NAME
  is '产品名 ';
comment on column DUKEPU.PRODUCTS_COST.SEQ_P_C_RECORD
  is '原始表格中的序号 ';
create unique index DUKEPU.IX_PC_PN_SUMP_SPECP on DUKEPU.PRODUCTS_COST (PRODUCT_NAME, SUMMARY_PROCESS, SPECIFIC_PROCESS)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PRODUCTS_COST_BAK
prompt ================================
prompt
create table DUKEPU.PRODUCTS_COST_BAK
(
  SEQ              NUMBER,
  SUMMARY_PROCESS  NVARCHAR2(30),
  SPECIFIC_PROCESS NVARCHAR2(50),
  MAN_HOURS        NUMBER,
  LABOUR_COST      NUMBER,
  SUPPLIER         NVARCHAR2(30),
  UPDATE_TIME      DATE,
  PRODUCTS_NAME    NVARCHAR2(30),
  SEQ_P_C_RECORD   INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PRODUCTS_COST_FINAL
prompt ==================================
prompt
create table DUKEPU.PRODUCTS_COST_FINAL
(
  SEQ              NUMBER,
  SUMMARY_PROCESS  NVARCHAR2(30),
  SPECIFIC_PROCESS NVARCHAR2(30),
  PROCESS_COST     NUMBER,
  SUPPLIER         NVARCHAR2(30),
  UPDATE_TIME      DATE,
  PRODUCTS_NAME    NVARCHAR2(30)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index DUKEPU.IX_PCF_PN_SUMMP_SPECP on DUKEPU.PRODUCTS_COST_FINAL (PRODUCTS_NAME, SUMMARY_PROCESS, SPECIFIC_PROCESS)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PRODUCTS_COST_HEADER
prompt ===================================
prompt
create table DUKEPU.PRODUCTS_COST_HEADER
(
  SEQ             INTEGER,
  PRODUCTS_NAME   NVARCHAR2(20),
  SUMMARY_PROCESS NVARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PRODUCTS_COST_HISTORY
prompt ====================================
prompt
create table DUKEPU.PRODUCTS_COST_HISTORY
(
  SEQ                NUMBER,
  SUMMARY_PROCESS    NVARCHAR2(30),
  SPECIFIC_PROCESS   NVARCHAR2(30),
  MAN_HOURS          NUMBER,
  LABOUR_COST        NUMBER,
  SUPPLIER           NVARCHAR2(30),
  INSERT_TIME        DATE,
  PRODUCT_NAME       NVARCHAR2(30),
  SEQ_P_C_RECORD     INTEGER,
  CREATE_TIME_OF_P_C DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.PRODUCTS_COST_HISTORY.SEQ_P_C_RECORD
  is '记录 中 的 序号 ';
comment on column DUKEPU.PRODUCTS_COST_HISTORY.CREATE_TIME_OF_P_C
  is 'Products_Cost 中的创建时间';

prompt
prompt Creating table PRODUCTS_COST_TEMP
prompt =================================
prompt
create table DUKEPU.PRODUCTS_COST_TEMP
(
  SEQ              NUMBER,
  SUMMARY_PROCESS  NVARCHAR2(30),
  SPECIFIC_PROCESS NVARCHAR2(30),
  MAN_HOURS        NUMBER,
  LABOUR_COST      NUMBER,
  SUPPLIER         NVARCHAR2(30),
  UPDATE_TIME      DATE,
  PRODUCTS_NAME    NVARCHAR2(30)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index DUKEPU.IX_PCT_PN_SUMP_SPCP on DUKEPU.PRODUCTS_COST_TEMP (PRODUCTS_NAME, SUMMARY_PROCESS, SPECIFIC_PROCESS)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PRODUCTS_PICTURE
prompt ===============================
prompt
create table DUKEPU.PRODUCTS_PICTURE
(
  ID           INTEGER,
  PICTURE      BLOB,
  PRODUCT_NAME NVARCHAR2(30),
  RECORD_TIME  DATE default sysdate
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.PRODUCTS_PICTURE.PRODUCT_NAME
  is '成衣名称';
comment on column DUKEPU.PRODUCTS_PICTURE.RECORD_TIME
  is '记录时间';

prompt
prompt Creating table PRODUCTS_RECORD
prompt ==============================
prompt
create table DUKEPU.PRODUCTS_RECORD
(
  SEQ                          INTEGER,
  NAME                         NVARCHAR2(20),
  REPORT_DEPT                  NVARCHAR2(20),
  PRODUCTS_NAME                NVARCHAR2(20),
  SUMMARY_PROCESS              NVARCHAR2(20),
  SPECIFIC_PROCESS             NVARCHAR2(50),
  QUANTITIES                   INTEGER,
  MAN_HOURS                    NUMBER,
  SHEET_NAME                   NVARCHAR2(30),
  FILE_NAME                    NVARCHAR2(50),
  UPDATE_TIME                  DATE default sysdate,
  REPORT_SPECIFIC_MONTH        DATE,
  TOTAL_HOURS_OF_THE_STAFF     NUMBER,
  AR_JOB_NUMBER                VARCHAR2(20),
  AR_NAME                      NVARCHAR2(20),
  DEPT                         NVARCHAR2(20),
  SUBMIT_DATE                  DATE,
  DAYS_OF_SHOULD_BE_ATTENDANCE INTEGER,
  DAYS_OF_REAL_ATTENDANCE      INTEGER,
  NUMBERS_OF_NOT_FINGER_PRINT  INTEGER,
  NUMBERS_OF_COME_LATE         INTEGER,
  NUMBERS_OF_LEAVE_EARLY       INTEGER,
  RANDOM_STR                   VARCHAR2(40),
  SEQ_OF_P_R                   INTEGER,
  UNIT_PRICE                   NUMBER,
  AMOUNT_OF_MONEY              NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.PRODUCTS_RECORD.SEQ
  is '序号';
comment on column DUKEPU.PRODUCTS_RECORD.NAME
  is '姓名';
comment on column DUKEPU.PRODUCTS_RECORD.REPORT_DEPT
  is '报表中的部门';
comment on column DUKEPU.PRODUCTS_RECORD.PRODUCTS_NAME
  is '品名';
comment on column DUKEPU.PRODUCTS_RECORD.SUMMARY_PROCESS
  is '概要工序';
comment on column DUKEPU.PRODUCTS_RECORD.SPECIFIC_PROCESS
  is '制定工序';
comment on column DUKEPU.PRODUCTS_RECORD.QUANTITIES
  is '件数';
comment on column DUKEPU.PRODUCTS_RECORD.MAN_HOURS
  is '工时 ';
comment on column DUKEPU.PRODUCTS_RECORD.SHEET_NAME
  is '表名';
comment on column DUKEPU.PRODUCTS_RECORD.FILE_NAME
  is '文件名';
comment on column DUKEPU.PRODUCTS_RECORD.UPDATE_TIME
  is '更新时间';
comment on column DUKEPU.PRODUCTS_RECORD.REPORT_SPECIFIC_MONTH
  is '报表月份';
comment on column DUKEPU.PRODUCTS_RECORD.TOTAL_HOURS_OF_THE_STAFF
  is '某人的总工时 ';
comment on column DUKEPU.PRODUCTS_RECORD.AR_JOB_NUMBER
  is '考勤表工号';
comment on column DUKEPU.PRODUCTS_RECORD.AR_NAME
  is '考勤表中姓名 ';
comment on column DUKEPU.PRODUCTS_RECORD.DEPT
  is '员工所属部门';
comment on column DUKEPU.PRODUCTS_RECORD.DAYS_OF_SHOULD_BE_ATTENDANCE
  is '应出勤天数';
comment on column DUKEPU.PRODUCTS_RECORD.DAYS_OF_REAL_ATTENDANCE
  is '实际出勤天数';
comment on column DUKEPU.PRODUCTS_RECORD.NUMBERS_OF_NOT_FINGER_PRINT
  is '未打卡次数';
comment on column DUKEPU.PRODUCTS_RECORD.NUMBERS_OF_COME_LATE
  is '迟到次数';
comment on column DUKEPU.PRODUCTS_RECORD.NUMBERS_OF_LEAVE_EARLY
  is '早退次数';
comment on column DUKEPU.PRODUCTS_RECORD.RANDOM_STR
  is '随机字符串 ';
comment on column DUKEPU.PRODUCTS_RECORD.SEQ_OF_P_R
  is '产量表格中的工序序号';
comment on column DUKEPU.PRODUCTS_RECORD.UNIT_PRICE
  is '单价';
comment on column DUKEPU.PRODUCTS_RECORD.AMOUNT_OF_MONEY
  is '该条记录的金额';
create index DUKEPU.IX_RD_AND_SPECIFIC_MONTH on DUKEPU.PRODUCTS_RECORD (REPORT_DEPT, REPORT_SPECIFIC_MONTH)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
create unique index DUKEPU.IX_RD_AND_YEAR_AND_MONTH_PR on DUKEPU.PRODUCTS_RECORD (REPORT_DEPT, NAME, PRODUCTS_NAME, SUMMARY_PROCESS, SPECIFIC_PROCESS, REPORT_SPECIFIC_MONTH)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PRODUCTS_RECORD_BAK_181112
prompt =========================================
prompt
create table DUKEPU.PRODUCTS_RECORD_BAK_181112
(
  SEQ              INTEGER,
  JOB_NUMBER       NVARCHAR2(20),
  NAME             NVARCHAR2(20),
  REPORTDEPT       NVARCHAR2(20),
  PRODUCTS_NAME    NVARCHAR2(20),
  SUMMARY_PROCESS  NVARCHAR2(20),
  SPECIFIC_PROCESS NVARCHAR2(30),
  QUANTITIES       INTEGER,
  PROCESS_COST     NUMBER,
  SHEET_NAME       NVARCHAR2(30),
  PATH             NVARCHAR2(200),
  UPDATE_TIME      DATE,
  YEAR_AND_MONTH   VARCHAR2(20),
  AMOUNT           NUMBER,
  SUBMIT_DATE      DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PRODUCTS_RECORD_TEMP
prompt ===================================
prompt
create table DUKEPU.PRODUCTS_RECORD_TEMP
(
  SEQ                   INTEGER,
  JOB_NUMBER            NVARCHAR2(20),
  NAME                  NVARCHAR2(20),
  DEPT                  NVARCHAR2(20),
  PRODUCTS_NAME         NVARCHAR2(20),
  SUMMARY_PROCESS       NVARCHAR2(20),
  SPECIFIC_PROCESS      NVARCHAR2(30),
  QUANTITIES            INTEGER,
  PROCESS_COST          NUMBER,
  SHEET_NAME            NVARCHAR2(30),
  PATH                  NVARCHAR2(200),
  UPDATE_TIME           DATE,
  IP_ADDR               VARCHAR2(16),
  REPORT_SPECIFIC_MONTH VARCHAR2(20),
  RANDOM_STR            VARCHAR2(40),
  AMOUNT                NUMBER,
  REPORT_DEPT           NVARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.PRODUCTS_RECORD_TEMP.DEPT
  is '人员所属部门';
comment on column DUKEPU.PRODUCTS_RECORD_TEMP.RANDOM_STR
  is '随即字符串.只存在于临时表中,用于对核实工号的追踪.';
comment on column DUKEPU.PRODUCTS_RECORD_TEMP.AMOUNT
  is '此工序,工作所得金额';
comment on column DUKEPU.PRODUCTS_RECORD_TEMP.REPORT_DEPT
  is '报表所属部门';

prompt
prompt Creating table PRODUCT_TYPES
prompt ============================
prompt
create table DUKEPU.PRODUCT_TYPES
(
  PRODUCT_TYPE_ID INTEGER not null,
  NAME            VARCHAR2(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DUKEPU.PRODUCT_TYPES
  add constraint PRODUCT_TYPES_PK primary key (PRODUCT_TYPE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PROD_CAPACITY_TEMP
prompt =================================
prompt
create table DUKEPU.PROD_CAPACITY_TEMP
(
  JOB_NUMBER       NVARCHAR2(30),
  NAME             NVARCHAR2(30),
  QUANTITIES       INTEGER,
  PRODUCTS_NAME    NVARCHAR2(30),
  SUMMARY_PROCESS  NVARCHAR2(30),
  SPECIFIC_PROCESS NVARCHAR2(30),
  YIELDS_TIME      DATE,
  CREATE_TIME      DATE,
  RANDOM_STR       NVARCHAR2(50),
  SUBMIT_PERSON    NVARCHAR2(30),
  SHEET_NAME       NVARCHAR2(40)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PROGRESS_INFO
prompt ============================
prompt
create table DUKEPU.PROGRESS_INFO
(
  MAX_VALUE           INTEGER,
  CURRENT_VALUE       INTEGER,
  NAME_OF_THE_HANDLER NVARCHAR2(40),
  UPDATE_TIME         DATE default sysdate,
  FINISH_FLAG         INTEGER,
  MSG                 NVARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.PROGRESS_INFO.FINISH_FLAG
  is '结束标志位';

prompt
prompt Creating table P_C_TEMPLATE
prompt ===========================
prompt
create table DUKEPU.P_C_TEMPLATE
(
  SEQ              INTEGER,
  SUMMARY_PROCESS  NVARCHAR2(20),
  SPECIFIC_PROCESS NVARCHAR2(50),
  MAN_HOURS        INTEGER,
  LABOUR_COST      NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.P_C_TEMPLATE.SEQ
  is '序号';
comment on column DUKEPU.P_C_TEMPLATE.SUMMARY_PROCESS
  is '部位 ';
comment on column DUKEPU.P_C_TEMPLATE.SPECIFIC_PROCESS
  is '工序名称';
comment on column DUKEPU.P_C_TEMPLATE.MAN_HOURS
  is '工时';
comment on column DUKEPU.P_C_TEMPLATE.LABOUR_COST
  is '单价 ';

prompt
prompt Creating table RADR
prompt ===================
prompt
create table DUKEPU.RADR
(
  SEQ             NUMBER,
  JOB_NUMBER      NVARCHAR2(20),
  NAME            NVARCHAR2(20),
  STYLE           NVARCHAR2(20),
  QUANTITIES      INTEGER,
  MAN_HOUR        INTEGER,
  LABOUR_COST     NUMBER,
  AMOUNT_OF_MONEY NUMBER,
  BILL_NO         NVARCHAR2(40),
  UPDATE_TIME     DATE,
  SHEET_NAME      NVARCHAR2(20),
  YEAR_AND_MONTH  VARCHAR2(20),
  DEPT            NVARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.RADR.YEAR_AND_MONTH
  is '记录日期';
comment on column DUKEPU.RADR.DEPT
  is '产量报表中部门';

prompt
prompt Creating table RADR_TEMP
prompt ========================
prompt
create table DUKEPU.RADR_TEMP
(
  JOB_NUMBER      NVARCHAR2(20),
  NAME            NVARCHAR2(20),
  STYLE           NVARCHAR2(20),
  QUANTITIES      INTEGER,
  MAN_HOUR        INTEGER,
  LABOUR_COST     NUMBER,
  AMOUNT_OF_MONEY NUMBER,
  UPDATE_TIME     DATE,
  BILL_NO         NVARCHAR2(40),
  SHEET_NAME      NVARCHAR2(20),
  YEAR_AND_MONTH  VARCHAR2(20),
  DEPT            NVARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.RADR_TEMP.STYLE
  is '款式';
comment on column DUKEPU.RADR_TEMP.QUANTITIES
  is '数量';
comment on column DUKEPU.RADR_TEMP.MAN_HOUR
  is '工时';
comment on column DUKEPU.RADR_TEMP.LABOUR_COST
  is '工价';
comment on column DUKEPU.RADR_TEMP.AMOUNT_OF_MONEY
  is '合计';
comment on column DUKEPU.RADR_TEMP.BILL_NO
  is '单据编号';
comment on column DUKEPU.RADR_TEMP.YEAR_AND_MONTH
  is '记录日期.';
comment on column DUKEPU.RADR_TEMP.DEPT
  is '报表中部门';

prompt
prompt Creating table REALTIME_MESSAGE
prompt ===============================
prompt
create table DUKEPU.REALTIME_MESSAGE
(
  MSG                 NVARCHAR2(30),
  FLAG                INTEGER,
  NAME_OF_THE_HANDLER NVARCHAR2(30)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.REALTIME_MESSAGE.NAME_OF_THE_HANDLER
  is 'TCP SERVER 端的 处理程序 名称';

prompt
prompt Creating table REPORT_DEALWITH_STATUS
prompt =====================================
prompt
create table DUKEPU.REPORT_DEALWITH_STATUS
(
  FILE_PATH           NVARCHAR2(70),
  SHEET_VISUAL_COUNTS INTEGER,
  SHEET_INDEX         INTEGER,
  SHEET_NAME          NVARCHAR2(20),
  CURRENT_ROW_INDEX   INTEGER,
  STATUS_DESCRIPTION  NVARCHAR2(60),
  STATUS_FLAG         INTEGER,
  UPDATE_TIME         DATE,
  MAX_ROW_INDEX       INTEGER,
  FILE_NAME           NVARCHAR2(30),
  MAX_COL_INDEX       INTEGER,
  CURRENT_COL_INDEX   INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.REPORT_DEALWITH_STATUS.FILE_PATH
  is '报表路径 ';
comment on column DUKEPU.REPORT_DEALWITH_STATUS.SHEET_VISUAL_COUNTS
  is '报表 个数 ';
comment on column DUKEPU.REPORT_DEALWITH_STATUS.SHEET_INDEX
  is '索引   报表 索引';
comment on column DUKEPU.REPORT_DEALWITH_STATUS.SHEET_NAME
  is '报表名称';
comment on column DUKEPU.REPORT_DEALWITH_STATUS.CURRENT_ROW_INDEX
  is '正在处理的当前行数';
comment on column DUKEPU.REPORT_DEALWITH_STATUS.STATUS_DESCRIPTION
  is '状态描述 ';
comment on column DUKEPU.REPORT_DEALWITH_STATUS.STATUS_FLAG
  is '状态标志位   false:  未处理完  true:  已处理完';
comment on column DUKEPU.REPORT_DEALWITH_STATUS.UPDATE_TIME
  is '更新时间';
comment on column DUKEPU.REPORT_DEALWITH_STATUS.MAX_ROW_INDEX
  is '最大行数 ';
comment on column DUKEPU.REPORT_DEALWITH_STATUS.FILE_NAME
  is '表格名称 ';
comment on column DUKEPU.REPORT_DEALWITH_STATUS.MAX_COL_INDEX
  is '最大列数';
comment on column DUKEPU.REPORT_DEALWITH_STATUS.CURRENT_COL_INDEX
  is '当前列索引';
create unique index DUKEPU.IX_REPORT_DEALWITH_STATUS on DUKEPU.REPORT_DEALWITH_STATUS (FILE_NAME, SHEET_NAME)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table REST_DAY
prompt =======================
prompt
create table DUKEPU.REST_DAY
(
  REST_DAY    DATE,
  UPDATE_TIME DATE,
  NAME        NVARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SALARIES_AIRTHMETIC
prompt ==================================
prompt
create table DUKEPU.SALARIES_AIRTHMETIC
(
  PROCESS          NVARCHAR2(30),
  SPECIFIC_PROCESS NVARCHAR2(50),
  LABOUR_COST      NUMBER,
  SUPPLIER_PEOPLE  NVARCHAR2(30)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table DUKEPU.SALARIES_AIRTHMETIC
  add constraint IX_SPECIFIC_PROCESS unique (SPECIFIC_PROCESS)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCATTERED_RECORD
prompt ===============================
prompt
create table DUKEPU.SCATTERED_RECORD
(
  SEQ                   INTEGER,
  NAME                  NVARCHAR2(20),
  PARTICULARS           NVARCHAR2(30),
  TOTAL_HOURS           NUMBER,
  LABOUR_COST           NUMBER,
  AGGREGATE_AMOUNT      NUMBER,
  UPDATE_TIME           DATE,
  SHEET_NAME            NVARCHAR2(20),
  REPORT_DEPT           NVARCHAR2(20),
  QUANTITIES            INTEGER,
  REPORT_SPECIFIC_MONTH DATE,
  AR_JOB_NUMBER         VARCHAR2(20),
  AR_NAME               NVARCHAR2(20),
  DEPT                  NVARCHAR2(20),
  FILE_NAME             NVARCHAR2(30),
  SUBMIT_DATE           DATE,
  RANDOM_STR            VARCHAR2(40)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.SCATTERED_RECORD.TOTAL_HOURS
  is '时间';
comment on column DUKEPU.SCATTERED_RECORD.SHEET_NAME
  is '表格名';
comment on column DUKEPU.SCATTERED_RECORD.REPORT_DEPT
  is '部门';
comment on column DUKEPU.SCATTERED_RECORD.QUANTITIES
  is '件数';
comment on column DUKEPU.SCATTERED_RECORD.REPORT_SPECIFIC_MONTH
  is '用于月报表';
comment on column DUKEPU.SCATTERED_RECORD.AR_JOB_NUMBER
  is '考勤表工号';
comment on column DUKEPU.SCATTERED_RECORD.AR_NAME
  is '考勤表姓名';
comment on column DUKEPU.SCATTERED_RECORD.DEPT
  is '员工所属部门';
comment on column DUKEPU.SCATTERED_RECORD.FILE_NAME
  is '文件名称';
comment on column DUKEPU.SCATTERED_RECORD.RANDOM_STR
  is '随机字符串 ';
create index DUKEPU.IX_RD_AND_SUBMIT_DATE on DUKEPU.SCATTERED_RECORD (REPORT_DEPT, REPORT_SPECIFIC_MONTH)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SCATTERED_RECORD_TEMP
prompt ====================================
prompt
create table DUKEPU.SCATTERED_RECORD_TEMP
(
  JOB_NUMBER            NVARCHAR2(30),
  NAME                  NVARCHAR2(20),
  PARTICULARS           NVARCHAR2(30),
  HOURS                 INTEGER,
  LABOUR_COST           NUMBER,
  AGGREGATE_AMOUNT      NUMBER,
  UPDATE_TIME           DATE,
  SHEET_NAME            NVARCHAR2(20),
  REPORT_SPECIFIC_MONTH VARCHAR2(20),
  REPORT_DEPT           NVARCHAR2(20),
  QUANTITIES            INTEGER,
  RANDOM_STR            VARCHAR2(40),
  REPORT_SPECIFIC_DAY   DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.SCATTERED_RECORD_TEMP.PARTICULARS
  is '事由';
comment on column DUKEPU.SCATTERED_RECORD_TEMP.HOURS
  is '用时';
comment on column DUKEPU.SCATTERED_RECORD_TEMP.LABOUR_COST
  is '工价';
comment on column DUKEPU.SCATTERED_RECORD_TEMP.AGGREGATE_AMOUNT
  is '总金额';
comment on column DUKEPU.SCATTERED_RECORD_TEMP.SHEET_NAME
  is '表格名';
comment on column DUKEPU.SCATTERED_RECORD_TEMP.REPORT_SPECIFIC_MONTH
  is '月报表 ';
comment on column DUKEPU.SCATTERED_RECORD_TEMP.REPORT_DEPT
  is '部门';
comment on column DUKEPU.SCATTERED_RECORD_TEMP.QUANTITIES
  is '件数';
comment on column DUKEPU.SCATTERED_RECORD_TEMP.RANDOM_STR
  is '随即字符串.';
comment on column DUKEPU.SCATTERED_RECORD_TEMP.REPORT_SPECIFIC_DAY
  is '用于日报表';

prompt
prompt Creating table SHOPPING
prompt =======================
prompt
create table DUKEPU.SHOPPING
(
  U_ID  INTEGER,
  GOODS NVARCHAR2(10),
  NUM   INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SOCKET_MESS
prompt ==========================
prompt
create table DUKEPU.SOCKET_MESS
(
  PROCESS_NAME  NVARCHAR2(30),
  RESULT        NVARCHAR2(60),
  STATUS        NVARCHAR2(40),
  CURRENT_VALUE INTEGER,
  TOTAL_VALUE   INTEGER,
  UPDATE_TIME   DATE,
  FLAG          INTEGER,
  TASK_STATUS   NVARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.SOCKET_MESS.TASK_STATUS
  is '状态:  正在处理：processing   已完成: finished.';

prompt
prompt Creating table STUDENT_SCORE
prompt ============================
prompt
create table DUKEPU.STUDENT_SCORE
(
  NAME    VARCHAR2(20),
  SUBJECT VARCHAR2(20),
  SCORE   NUMBER(4,1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T
prompt ================
prompt
create table DUKEPU.T
(
  NUM  NUMBER,
  NAME NVARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T1
prompt =================
prompt
create table DUKEPU.T1
(
  FNAME  VARCHAR2(20),
  FMONEY INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T2
prompt =================
prompt
create table DUKEPU.T2
(
  FNAME  VARCHAR2(20),
  FMONEY INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TEMP_FOR_DUTY_NUM
prompt ================================
prompt
create table DUKEPU.TEMP_FOR_DUTY_NUM
(
  NUM       INTEGER,
  TIMEPOINT VARCHAR2(30),
  CATEGORY  VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TEST
prompt ===================
prompt
create table DUKEPU.TEST
(
  ID       INTEGER not null,
  THE_DATE DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DUKEPU.TEST
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TEST1
prompt ====================
prompt
create table DUKEPU.TEST1
(
  ID INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TMP
prompt ==================
prompt
create table DUKEPU.TMP
(
  RQ      VARCHAR2(10),
  SHENGFU VARCHAR2(5)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_TEST
prompt =====================
prompt
create table DUKEPU.T_TEST
(
  ID     INTEGER,
  MONTH  INTEGER,
  AMOUNT INTEGER,
  TEST   FLOAT
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USER_INFO
prompt ========================
prompt
create table DUKEPU.USER_INFO
(
  PASSWORD     NVARCHAR2(20) default 123456,
  UPDATE_TIME  DATE default SYSDATE,
  DEPARTMENT   NVARCHAR2(50),
  ACTION       NVARCHAR2(20),
  USER_NAME    NVARCHAR2(20),
  PRODUCT_NAME NVARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.USER_INFO.PRODUCT_NAME
  is '软件对应的 产品名称';

prompt
prompt Creating table WMS_TEST
prompt =======================
prompt
create table DUKEPU.WMS_TEST
(
  STATUS                   NVARCHAR2(20),
  COLLECT_THE_GOODS_TIME   DATE,
  QUANLITY_INSPECTION_PLAN NVARCHAR2(20),
  WAY_BILL_NO              NVARCHAR2(20),
  CUSTOMER_ORDER           NVARCHAR2(20),
  ITEM_NO                  NVARCHAR2(20),
  NAME                     NVARCHAR2(20),
  SUPPLIER_NO              NVARCHAR2(20),
  COBBING                  NVARCHAR2(20),
  MATERIAL_NO              NVARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.WMS_TEST.COLLECT_THE_GOODS_TIME
  is '收货 时间 ';
comment on column DUKEPU.WMS_TEST.QUANLITY_INSPECTION_PLAN
  is '质检计划 ';
comment on column DUKEPU.WMS_TEST.WAY_BILL_NO
  is '运单号 ';
comment on column DUKEPU.WMS_TEST.CUSTOMER_ORDER
  is '客户订单号 ';
comment on column DUKEPU.WMS_TEST.ITEM_NO
  is '货号 ';
comment on column DUKEPU.WMS_TEST.NAME
  is '名称 ';
comment on column DUKEPU.WMS_TEST.SUPPLIER_NO
  is '供方货号 ';
comment on column DUKEPU.WMS_TEST.COBBING
  is '小块料 ';
comment on column DUKEPU.WMS_TEST.MATERIAL_NO
  is '物料编码';

prompt
prompt Creating table WORK_SCHEDULE
prompt ============================
prompt
create table DUKEPU.WORK_SCHEDULE
(
  SEQ                INTEGER,
  DEPT               NVARCHAR2(10),
  ON_DUTY_TIME       DATE,
  RECORD_TIME        DATE,
  WORK_AND_REST_DATE DATE,
  WORK_OR_REST       INTEGER,
  OFF_DUTY_TIME      DATE,
  FP_NUMBER          INTEGER,
  REST_NUMBER        INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.WORK_SCHEDULE.REST_NUMBER
  is '休息人数.';

prompt
prompt Creating table WORK_SUMMARY
prompt ===========================
prompt
create table DUKEPU.WORK_SUMMARY
(
  SEQ                INTEGER,
  DEPT               NVARCHAR2(10),
  ON_DUTY_TIME       DATE,
  RECORD_TIME        DATE,
  WORK_AND_REST_DATE DATE,
  WORK_OR_REST       INTEGER,
  OFF_DUTY_TIME      DATE,
  FP_NUMBER          INTEGER,
  REST_NUMBER        INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column DUKEPU.WORK_SUMMARY.FP_NUMBER
  is '上下班都按了指纹的人数。';
comment on column DUKEPU.WORK_SUMMARY.REST_NUMBER
  is '休息人数.';

prompt
prompt Creating sequence SEQ_AR_SUMMARY
prompt ================================
prompt
create sequence DUKEPU.SEQ_AR_SUMMARY
minvalue 1
maxvalue 99999999999999999999
start with 1381
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ASK_FOR_LEAVE
prompt ===================================
prompt
create sequence DUKEPU.SEQ_ASK_FOR_LEAVE
minvalue 1
maxvalue 9999999999999
start with 3143581
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ATTENDANCE_RECORD_BRIEFLY
prompt ===============================================
prompt
create sequence DUKEPU.SEQ_ATTENDANCE_RECORD_BRIEFLY
minvalue 1
maxvalue 999999999
start with 140681
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ATTENDANCE_RECORD_DETAIL
prompt ==============================================
prompt
create sequence DUKEPU.SEQ_ATTENDANCE_RECORD_DETAIL
minvalue 1
maxvalue 999999999
start with 303481
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DAILY_CAPACITY
prompt ====================================
prompt
create sequence DUKEPU.SEQ_DAILY_CAPACITY
minvalue 1
maxvalue 999999999999999999999999999
start with 580
increment by 1
nocache;

prompt
prompt Creating sequence SEQ_DAILY_CAPACITY_TEMP
prompt =========================================
prompt
create sequence DUKEPU.SEQ_DAILY_CAPACITY_TEMP
minvalue 1
maxvalue 999999999999999999999999999
start with 441
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_EMPLOYEES
prompt ===============================
prompt
create sequence DUKEPU.SEQ_EMPLOYEES
minvalue 1
maxvalue 9999999999999
start with 2701
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PRODUCTS_COST
prompt ===================================
prompt
create sequence DUKEPU.SEQ_PRODUCTS_COST
minvalue 1
maxvalue 999999999999999999999999999
start with 21941
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PRODUCTS_COST_HISTORY
prompt ===========================================
prompt
create sequence DUKEPU.SEQ_PRODUCTS_COST_HISTORY
minvalue 1
maxvalue 999999999999999999999999999
start with 4301
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PRODUCTS_RECORD
prompt =====================================
prompt
create sequence DUKEPU.SEQ_PRODUCTS_RECORD
minvalue 1
maxvalue 999999999999999999999999999
start with 64201
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PRODUCTS_RECORD_TEMP
prompt ==========================================
prompt
create sequence DUKEPU.SEQ_PRODUCTS_RECORD_TEMP
minvalue 1
maxvalue 9999999999999
start with 208453
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_C_BAK
prompt =============================
prompt
create sequence DUKEPU.SEQ_P_C_BAK
minvalue 1
maxvalue 999999999999999999999999999
start with 12881
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_P_C_F
prompt ===========================
prompt
create sequence DUKEPU.SEQ_P_C_F
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_RADR
prompt ==========================
prompt
create sequence DUKEPU.SEQ_RADR
minvalue 1
maxvalue 999999999999999
start with 101
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SCATTERED_RECORD
prompt ======================================
prompt
create sequence DUKEPU.SEQ_SCATTERED_RECORD
minvalue 1
maxvalue 999999999999999
start with 7855
increment by 1
nocache;

prompt
prompt Creating sequence SEQ_WORK_SCHEDULE
prompt ===================================
prompt
create sequence DUKEPU.SEQ_WORK_SCHEDULE
minvalue 1
maxvalue 9999999999999
start with 23061
increment by 1
cache 20
cycle;

prompt
prompt Creating sequence SEQ_WORK_SUMMARY
prompt ==================================
prompt
create sequence DUKEPU.SEQ_WORK_SUMMARY
minvalue 1
maxvalue 9999999999999
start with 641
increment by 1
cache 20
cycle;

prompt
prompt Creating sequence S_ATTENDANCERECORD
prompt ====================================
prompt
create sequence DUKEPU.S_ATTENDANCERECORD
minvalue 1
maxvalue 99999999999999
start with 438201
increment by 1
cache 20
cycle;

prompt
prompt Creating view ORA_VW_ASPNET_APPLICATIONS
prompt ========================================
prompt
CREATE OR REPLACE VIEW DUKEPU.ORA_VW_ASPNET_APPLICATIONS AS
SELECT ApplicationName,
       LoweredApplicationName,
       ApplicationId,
       Description
FROM ora_aspnet_Applications
WITH READ ONLY;

prompt
prompt Creating view ORA_VW_ASPNET_MEMUSERS
prompt ====================================
prompt
CREATE OR REPLACE VIEW DUKEPU.ORA_VW_ASPNET_MEMUSERS AS
SELECT m.UserId,
       m.PasswordFormat,
       m.MobilePIN,
       m.Email,
       m.LoweredEmail,
       m.PasswordQuestion,
       m.PasswordAnswer,
       m.IsApproved,
       m.IsLockedOut,
       m.CreateDate,
       m.LastLoginDate,
       m.LastPasswordChangedDate,
       m.LastLockoutDate,
       m.FailedPwdAttemptCount,
       m.FailedPwdAttemptWinStart,
       m.FailedPwdAnswerAttemptCount,
       m.FailedPwdAnswerAttemptWinStart,
       m.Comments,
       u.ApplicationId,
       u.UserName,
       u.MobileAlias,
       u.IsAnonymous,
       u.LastActivityDate
FROM ora_aspnet_Membership m, ora_aspnet_Users u
WHERE m.UserId = u.UserId
WITH READ ONLY;

prompt
prompt Creating view ORA_VW_ASPNET_PROFILES
prompt ====================================
prompt
CREATE OR REPLACE VIEW DUKEPU.ORA_VW_ASPNET_PROFILES AS
SELECT UserId,
       LastUpdatedDate,
       DBMS_LOB.GETLENGTH(PropertyNames) +
       DBMS_LOB.GETLENGTH(PropertyValuesString) +
       DBMS_LOB.GETLENGTH(PropertyValuesBinary) DataSize
FROM ora_aspnet_Profile
WITH READ ONLY;

prompt
prompt Creating view ORA_VW_ASPNET_ROLES
prompt =================================
prompt
CREATE OR REPLACE VIEW DUKEPU.ORA_VW_ASPNET_ROLES AS
SELECT ApplicationId, RoleId, RoleName, LoweredRoleName, Description
  FROM ora_aspnet_Roles
   WITH READ ONLY;

prompt
prompt Creating view ORA_VW_ASPNET_SESSIONS
prompt ====================================
prompt
CREATE OR REPLACE VIEW DUKEPU.ORA_VW_ASPNET_SESSIONS AS
SELECT SessionId, Created, Expires, LockDate, LockDateLocal, LockCookie, Timeout,
        Locked, LENGTH(SessionItemShort) + LENGTH(SessionItemLong) DataSize, Flags
  FROM ora_aspnet_Sessions
   WITH READ ONLY;

prompt
prompt Creating view ORA_VW_ASPNET_UIR
prompt ===============================
prompt
CREATE OR REPLACE VIEW DUKEPU.ORA_VW_ASPNET_UIR AS
SELECT UserId, RoleId
   FROM ora_aspnet_UsersInRoles
    WITH READ ONLY;

prompt
prompt Creating view ORA_VW_ASPNET_USERS
prompt =================================
prompt
CREATE OR REPLACE VIEW DUKEPU.ORA_VW_ASPNET_USERS AS
SELECT ApplicationId,
       UserId,
       UserName,
       LoweredUserName,
       MobileAlias,
       IsAnonymous,
       LastActivityDate
FROM ora_aspnet_Users
WITH READ ONLY;

prompt
prompt Creating view V_AR_DETAIL
prompt =========================
prompt
CREATE OR REPLACE VIEW DUKEPU.V_AR_DETAIL AS
SELECT
           start_date ,
    end_date ,
    tabulation_time ,
    finger_print_date,
    --cast(job_number as int) as job_number ,
    job_number ,
    name,
    dept ,
    fpt_first_time,
    fpt_last_time
FROM Attendance_Record_Briefly ARBriefly
order by job_number asc,
      finger_print_date ASC;

prompt
prompt Creating view V_AR_DETAIL_CHINESE
prompt =================================
prompt
CREATE OR REPLACE VIEW DUKEPU.V_AR_DETAIL_CHINESE AS
SELECT
           start_date ,
    end_date ,
    tabulation_time ,
    fingerprint_date,
    cast(job_number as int) as job_number ,
    name,
    dept ,
    fpt_first_time,
  fpt_last_time,
    come_Late_Num,
    leave_early_num
FROM Attendance_Record AR
order by job_number asc,
      Fingerprint_Date ASC;

prompt
prompt Creating view V_AR_RESULT
prompt =========================
prompt
create or replace view dukepu.v_ar_result as
select TRUNC(fingerprint_date,'MM') AS fingerprint_date,
         DEPT AS DEPT,
         cast(JOB_NUMBER as INT) AS JOB_NUMBER,
         NAME AS NAME,
         SUM(COME_NUM) AS COME_NUM,
         SUM(CASE not_finger_print
                  WHEN NULL THEN 0
                  ELSE not_finger_print
             END) AS not_finger_print,
         SUM(CASE DELAY_TIME
                  WHEN NULL THEN 0
                  ELSE DELAY_TIME
             END) AS DELAY_TIME,
         SUM(CASE COME_LATE_NUM
                  WHEN NULL THEN 0
                  ELSE COME_LATE_NUM
             END) AS COME_LATE_NUM,
         SUM(
             CASE LEAVE_EARLY_NUM
                  WHEN NULL THEN 0
                  ELSE LEAVE_EARLY_NUM
             END
         ) AS LEAVE_EARLY_NUM,
         SUM(
             Meal_Subsidy
         ) AS Meal_Subsidy
FROM Attendance_Record AR
GROUP BY TRUNC(fingerprint_date,'MM'),
         DEPT,
         JOB_NUMBER,
         NAME
ORDER BY
         CAST(JOB_NUMBER AS INT) ASC;

prompt
prompt Creating view V_AR_RESULT_CHINESE
prompt =================================
prompt
create or replace view dukepu.v_ar_result_chinese as
select TRUNC(fingerprint_date,'MM') AS "出勤月",
         DEPT AS "部门",
         cast(JOB_NUMBER as INT) AS "工号",
         NAME AS "姓名",
         SUM(COME_NUM) AS "出勤天数",
         SUM(CASE not_finger_print
                  WHEN NULL THEN 0
                  ELSE not_finger_print
             END) AS "未打卡次数",
         SUM(CASE DELAY_TIME
                  WHEN NULL THEN 0
                  ELSE DELAY_TIME
             END) AS "延时(小时)",
         SUM(CASE COME_LATE_NUM
                  WHEN NULL THEN 0
                  ELSE COME_LATE_NUM
             END) AS "迟到次数",
         SUM(
             CASE LEAVE_EARLY_NUM
                  WHEN NULL THEN 0
                  ELSE LEAVE_EARLY_NUM
             END
         ) AS "早退次数",
         SUM(
             Meal_Subsidy
         ) AS "餐补"
FROM Attendance_Record AR
GROUP BY TRUNC(fingerprint_date,'MM'),
         DEPT,
         JOB_NUMBER,
         NAME
ORDER BY
         CAST(JOB_NUMBER AS INT) ASC;

prompt
prompt Creating view V_ATTENDANCE_BRIEFLY
prompt ==================================
prompt
CREATE OR REPLACE VIEW DUKEPU.V_ATTENDANCE_BRIEFLY AS
SELECT
           start_date ,
    end_date ,
    tabulation_time ,
    finger_print_date,
    --cast(job_number as int) as job_number ,
    job_number ,
    name,
    dept ,
    fpt_first_time,
    fpt_last_time
FROM Attendance_Record_Briefly ARBriefly
order by job_number asc,
      finger_print_date ASC;

prompt
prompt Creating view V_A_R_SUMMARY_DETAIL
prompt ==================================
prompt
CREATE OR REPLACE VIEW DUKEPU.V_A_R_SUMMARY_DETAIL AS
SELECT
           start_date ,
    end_date ,
    tabulation_time ,
    fingerprint_date,
    --cast(job_number as int) as job_number ,
    job_number ,
    name,
    dept ,
    fpt_first_time,
    fpt_last_time,
    come_Late_Num,
    leave_early_num
FROM Attendance_Record_Summary AR
order by job_number asc,
      Fingerprint_Date ASC;

prompt
prompt Creating view V_DAILY_CAPACITY
prompt ==============================
prompt
create or replace view dukepu.v_daily_capacity as
select D_C.name,
          D_C.job_number,
          NVL(D_C.summary_process,'NULL') SUMMARY_PROCESS,
          D_C.specific_process,
          D_C.manufacture_quantities,
          D_C.yields_time,
          D_C.update_time,
          D_C.products_name,
          D_C.seq,
          D_C.submit_person
    from Daily_Capacity D_C INNER JOIN EMPLOYEES EMPS
         ON (D_C.Job_Number = EMPS.Job_NUMBER AND EMPS.Is_On_The_Job = 1);

prompt
prompt Creating view V_IMPORT_DC_FROM_PROD_DC
prompt ======================================
prompt
CREATE OR REPLACE VIEW DUKEPU.V_IMPORT_DC_FROM_PROD_DC AS
SELECT
              D_C.Seq,
              D_C.JOB_NUMBER,
              D_C.NAME,
              D_C.PRODUCTS_NAME,
              D_C.SUMMARY_PROCESS,
              D_C.Specific_Process,
              D_C.MANUFACTURE_QUANTITIES,
              D_C.YIELDS_TIME,
              D_C.UPDATE_TIME,
              D_C.Submit_Person,
              D_C.Random_Str
       FROM Daily_Capacity D_C,PROD_CAPACITY_TEMP PROD_C_T,EMPLOYEES EMPS
       WHERE D_C.Random_Str = PROD_C_T.Random_Str
             AND D_C.Job_Number = EMPS.Job_Number
             AND D_C.Products_Name = PROD_C_T.Products_Name
             AND D_C.Summary_Process = PROD_C_T.Summary_Process
             AND D_C.Specific_Process = PROD_C_T.Specific_Process
             AND EMPS.Is_On_The_Job = 1
       ORDER BY D_C.JOB_NUMBER DESC,
                D_C.Products_Name DESC,
                D_C.Summary_Process dESC,
                D_C.Specific_Process DESC;

prompt
prompt Creating view V_IMPORT_DC_JUST_NOW
prompt ==================================
prompt
CREATE OR REPLACE VIEW DUKEPU.V_IMPORT_DC_JUST_NOW AS
SELECT
              D_C.Seq,
              D_C.JOB_NUMBER,
              D_C.NAME,
              D_C.PRODUCTS_NAME,
              D_C.SUMMARY_PROCESS,
              D_C.Specific_Process,
              D_C.MANUFACTURE_QUANTITIES,
              D_C.YIELDS_TIME,
              D_C.UPDATE_TIME,
              D_C.Submit_Person
       FROM Daily_Capacity D_C,Daily_Capacity_Temp D_C_T,EMPLOYEES EMPS
       WHERE D_C.Job_Number = D_C_T.Job_Number
             AND TRUNC(D_C.Yields_Time) = TRUNC(D_C_T.Yields_Time)
             AND D_C.Job_Number = EMPS.Job_Number
             AND EMPS.Is_On_The_Job = 1;

prompt
prompt Creating view V_IMPORT_EMPS_JUST_NOW
prompt ====================================
prompt
create or replace view dukepu.v_import_emps_just_now as
select EMPS.JOB_NUMBER,
        EMPS.NAME,
        EMPS.Department,
        EMPS.Position,
        EMPS.Role,
        EMPS.Contact_Way,
        EMPS.UPDATE_TIME
 from employees EMPS INNER JOIN EMPLOYEES_TEMP EMPS_T
      ON EMPS.Job_Number = EMPS_T.Job_Number
 WHERE EMPS.Is_On_The_Job = 1
 ORDER BY EMPS.UPDATE_TIME DESC;

prompt
prompt Creating view V_PRODUCTS_COST
prompt =============================
prompt
create or replace view dukepu.v_products_cost as
select seq,
       PRODUCTS_NAME,
       summary_process,
       specific_process,
       man_hours,
       labour_cost,
       ROUND(man_hours * labour_cost,5) AS process_cost,   ---每道工序的造价
       supplier,
       update_time
from products_cost;

prompt
prompt Creating view V_PRODUCTS_COST_SUMMARY
prompt =====================================
prompt
create or replace view dukepu.v_products_cost_summary as
select Product_Name,
         SUM(Man_Hours) total_man_hours,
         SUM(Labour_Cost) total_labour_cost,
         Supplier,
         Max(update_time) latest_update_time
  from Products_Cost
  group by Product_Name,Supplier
  ORDER BY NLSSORT(PRODUCT_NAME,'NLS_SORT= SCHINESE_PINYIN_M') ASC;

prompt
prompt Creating view V_PRODUCTS_RECORD
prompt ===============================
prompt
CREATE OR REPLACE VIEW DUKEPU.V_PRODUCTS_RECORD AS
SELECT
         REPORT_DEPT,
         DEPT,
         NAME,
         Products_Name,
         SUMMARY_PROCESS,
         SPECIFIC_PROCESS,
         MAN_HOURS,
         QUANTITIES,
         SHEET_NAME,
         TO_CHAR(REPORT_SPECIFIC_MONTH,'yyyy-MM') AS REPORT_SPECIFIC_MONTH,
         UPDATE_TIME,
         FILE_NAME
  FROM PRODUCTS_RECORD;

prompt
prompt Creating view V_PRODUCTS_RECORD_CHINESE
prompt =======================================
prompt
CREATE OR REPLACE VIEW DUKEPU.V_PRODUCTS_RECORD_CHINESE AS
SELECT
         REPORT_DEPT AS "报表部门",
         DEPT AS "部门",
         NAME AS "姓名",
         Products_Name AS "产品名",
         SUMMARY_PROCESS AS "概要工序",
         SPECIFIC_PROCESS AS "指定工序",
         MAN_HOURS AS "工时",
         QUANTITIES AS "数量",
         SHEET_NAME AS "表格名",
         TO_CHAR(REPORT_SPECIFIC_MONTH,'yyyy-MM') AS "报表日期",
         UPDATE_TIME AS "更新日期",
         FILE_NAME AS "文件名"
  FROM PRODUCTS_RECORD;

prompt
prompt Creating view V_P_C
prompt ===================
prompt
CREATE OR REPLACE VIEW DUKEPU.V_P_C AS
SELECT SEQ,
        NVL(SUMMARY_PROCESS,'NULL') Summary_P,
         SPECIFIC_PROCESS,
         MAN_HOURS,
         LABOUR_COST,
         SUPPLIER,
         UPDATE_TIME,
         PRODUCTS_NAME
  FROM PRODUCTS_COST;

prompt
prompt Creating view V_P_C_S
prompt =====================
prompt
create or replace view dukepu.v_p_c_s as
SELeCT CASE GROUPING(SUMMARY_PROCESS)
                    WHEN 1 THEN N'ALL SUMMARY PROCESS'
                         ELSE SUMMARY_PROCESS
                    END SUMMARY_PROCESS,
               CASE GROUPING(SPECIFIC_PROCESS)
                    WHEN 1 THEN N'ALL SPECIFIC_PROCESS'
                         ELSE SPECIFIC_PROCESS
                    END SPECIFIC_PROCESS,
               ROUND(SUM(PROCESS_COST),3) AS PROCESS_COST
        FROM V_PRODUCTS_COST
        GROUP BY ROLLUP(PRODUCTS_NAME,SUMMARY_PROCESS,SPECIFIC_PROCESS)
        ORDER BY SPECIFIC_PROCESS DESC,SUMMARY_PROCESS DESC;

prompt
prompt Creating view V_P_C_SUMMARY
prompt ===========================
prompt
CREATE OR REPLACE VIEW DUKEPU.V_P_C_SUMMARY AS
SELECT SUMMARY_PROCESS,Specific_PROCESS,ROUND(SUM(PROCESS_COST),2) AS PROCESS_COST
       FROM v_Products_Cost
       GROUP BY ROLLUP(SUMMARY_PROCESS,Specific_Process)
       ORDER BY SUMMARY_PROCESS ASC;

prompt
prompt Creating view V_P_C_SUMMARY_CHINESE
prompt ===================================
prompt
create or replace view dukepu.v_p_c_summary_chinese as
select Product_Name AS "成衣名称",
         SUM(Man_Hours) AS "工时",
         SUM(Labour_Cost) AS "单价",
         Supplier AS "提供者",
         Max(update_time) AS "更新时间"
  from Products_Cost
  group by Product_Name,Supplier
  ORDER BY NLSSORT(PRODUCT_NAME,'NLS_SORT= SCHINESE_PINYIN_M') ASC;

prompt
prompt Creating view V_P_C_S_WITH_PNAME
prompt ================================
prompt
create or replace view dukepu.v_p_c_s_with_pname as
SELeCT
        PRODUCTS_NAME,
          CASE GROUPING(SUMMARY_PROCESS)
                 WHEN 1 THEN N'ALL SUMMARY PROCESS'
               ELSE SUMMARY_PROCESS
          END SUMMARY_P,
          CASE GROUPING(SPECIFIC_PROCESS)
                 WHEN 1 THEN N'ALL SPECIFIC PROCESS'
               ELSE SPECIFIC_PROCESS
          END SPECIFIC_P,
          ROUND(SUM(PROCESS_COST),3) AS PROCESS_COST
        FROM V_PRODUCTS_COST
        GROUP BY PRODUCTS_NAME,
              ROLLUP(SUMMARY_PROCESS,SPECIFIC_PROCESS)
        ORDER BY INSTR(Specific_P,'A') ASC,SUMMARY_P DESC;

prompt
prompt Creating view V_P_C_TEMPLATE
prompt ============================
prompt
create or replace view dukepu.v_p_c_template as
select 1 AS "序号",
       2 AS "部位",
       3 AS "工序",
       4 AS "工时",
       5 AS "单价"
from p_c_template;

prompt
prompt Creating view V_SALARY_EMPS
prompt ===========================
prompt
create or replace view dukepu.v_salary_emps as
select distinct AR_JOB_NUMBER as "工号",
         name as "姓名",
         report_Dept as "报表部门",
         ar_job_number as "考勤工号",
         ar_name as "考勤姓名",
         dept as "部门",
         REPORT_SPECIFIC_MONTH AS "报表月份"
    from Products_Record;

prompt
prompt Creating view V_SAL_OF_EMPS
prompt ===========================
prompt
create or replace view dukepu.v_sal_of_emps as
select
         D_C.JOB_NUMBER,
         D_C.NAME,
         D_C.Products_Name,
         D_C.SUMMARY_PROCESS,
         D_C.Specific_Process,
         D_C.MANUFACTURE_QUANTITIES,
         ROUND(p_c.man_hours,1) MAN_HOURS,
         p_c.LABOUR_COST,
         ROUND(D_C.MANUFACTURE_QUANTITIES*ROUND(p_c.LABOUR_COST*p_c.man_hours,5),3) AS Salaries,
         TRUNC(D_C.YIELDS_TIME) AS TRUNC_YIELDS_TIME,
         D_C.Update_Time D_C_UPDATETIME,
         P_C.UPDATE_TIME P_C_UPDATETIME,
         D_C.Submit_Person,
         p_c.supplier
    from Daily_Capacity D_C
                        INNER JOIN EMPLOYEES EMPS
                             ON D_C.Job_Number = EMPS.Job_Number
                        INNER JOIN products_cost p_c
                             ON (
                                   D_C.Specific_Process = p_c.Specific_Process
                                  AND D_C.Products_Name = P_C.Products_Name
                                  AND D_C.Summary_Process = P_C.Summary_Process
                                )
    WHERE EMPS.Is_On_The_Job = 1
    ORDER bY
          D_C.Job_Number DESC,
          TRUNC(YIELDS_TIME) DESC,
          D_C.Products_Name dESC,
          D_C.Summary_Process DESC,
          D_C.Specific_Process DESC;

prompt
prompt Creating view V_SAME_COMPONENT_OF_GARMENT
prompt =========================================
prompt
CREATE OR REPLACE VIEW DUKEPU.V_SAME_COMPONENT_OF_GARMENT AS
SELECT row_number() over(partition by products_name,summary_process,garment_component order by products_name,summary_process) row_ID,
                           products_Name,
                           summary_Process,
                           garment_Component
                    FROM
                    (
                      SELECT Products_Name,
                             Summary_Process,
                             MAX(specific_process_Spliced) AS garment_Component
                      FROM(
                            select products_name,
                                    summary_process,
                                    wm_concat(to_char(specific_process))
                                    over(partition by products_name,summary_process order by NLSSORT(Products_Name,'NLS_SORT= SCHINESE_PINYIN_M') ASC,
                                                   NLSSORT(summary_process,'NLS_SORT= SCHINESE_PINYIN_M') ASC,
                                                   NLSSORT(specific_process,'NLS_SORT= SCHINESE_PINYIN_M') ASC) specific_process_Spliced
                            FROM Products_Cost
                      ) Temp
                      GROUP BY Products_Name,
                               Summary_Process
                     ) T
                      order by NLSSORT(Products_Name,'NLS_SORT= SCHINESE_PINYIN_M') ASC,
                               NLSSORT(summary_process,'NLS_SORT= SCHINESE_PINYIN_M') ASC,
                               NLSSORT(GARMENT_COMPONENT,'NLS_SORT= SCHINESE_PINYIN_M') ASC;

prompt
prompt Creating view V_SAME_PROCESS
prompt ============================
prompt
CREATE OR REPLACE VIEW DUKEPU.V_SAME_PROCESS AS
SELECT T.Summary_Process AS "部位",
          T.Specific_Process AS "指定工序",
          T.count_num AS "出现次数",
          T.Concatenated_M_H_AND_L_C AS "工时_单价",
          T.belongToPN AS "所属成衣"
   FROM
  (
    SELECT    P_C.Summary_Process,
              P_C.Specific_Process,
              wm_concat(P_C.Man_Hours||'_'||trim(TO_CHAR(P_C.Labour_Cost,'0.999'))) AS Concatenated_M_H_AND_L_C,
              wm_concat(TO_CHAR(P_C.product_Name)) AS belongToPN,
              wm_concat(P_C.seq_P_C_Record) seq_p_c_record_concat,
              CAST(substr(wm_concat(P_C.seq_P_C_Record),1,instr(wm_concat(P_C.seq_P_C_Record),',')-1) AS INT) min_SEQ_of_group,
               count(1) as count_num
    FROM
    (
       select row_number() over(partition by summary_Process,specific_process
                                         order by  NLSSORT(summary_Process,'NLS_SORT= SCHINESE_PINYIN_M') ASC,
                                               NLSSORT(specific_process,'NLS_SORT= SCHINESE_PINYIN_M') ASC) row_ID,
             summary_process,
             specific_process
       from Products_Cost
     ) TEMP INNER JOIN Products_COST P_C
       ON (
             TEMP.SUMMARY_PROCESS = P_C.SUMMARY_PROCESS
            AND TEMP.SPECIFIC_PROCESS = P_C.Specific_Process
            )
     WHERE TEMP.row_ID !=1
     GROUP BY P_C.Summary_Process,
              P_C.Specific_Process
   ) T
   WHERE T.count_num != 1
   ORDER BY  T.min_SEQ_of_group asc,
             NLSSORT(T.Summary_process,'NLS_SORT = SCHINESE_PINYIN_M') ASC,
             NLSSORT(T.SPECIFIC_PROCESS,'NLS_SORT = SCHINESE_PINYIN_M') ASC,
             T.Concatenated_M_H_AND_L_C ASC;

prompt
prompt Creating view V_SAME_PROCESS_AND_MAN_HOURS
prompt ==========================================
prompt
CREATE OR REPLACE VIEW DUKEPU.V_SAME_PROCESS_AND_MAN_HOURS AS
SELECT summary_process AS "部位",
         Specific_Process AS "具体工序",
         Man_Hours AS "工时",
         Labour_Cost AS "单价",
         Count_Num AS "出现次数",
         belongToPN AS "所属成衣"
  FROM
  (
      select P_C.summary_process,
             P_C.specific_process,
             P_C.Man_Hours,
             P_C.Labour_Cost,
             count(1) AS count_num,
             wm_concat(TO_CHAR(P_C.products_Name)) AS belongToPN,
             wm_concat(P_C.seq_P_C_Record) seq_p_c_record_concat,
             CAST(substr(wm_concat(P_C.seq_P_C_Record),1,instr(wm_concat(P_C.seq_P_C_Record),',')-1) AS INT) min_SEQ_of_group
      from  Products_Cost P_C
      group by P_C.summary_process,
               P_C.specific_process,
               P_C.Man_Hours,
               P_C.Labour_Cost
      order by min_SEQ_of_group asc,
            NLSSORT(Summary_process,'NLS_SORT = SCHINESE_PINYIN_M') ASC,
            NLSSORT(SPECIFIC_PROCESS,'NLS_SORT = SCHINESE_PINYIN_M') ASC,
            Man_hours ASC,
            LABOUR_COST ASC
   )
   TEMP
   WHERE Count_NUM !=1;

prompt
prompt Creating view V_SCATTERED_RECORD
prompt ================================
prompt
create or replace view dukepu.v_scattered_record as
select
       report_dept,
        dept,
        name,
        particulars,
        labour_cost,
        quantities,
        total_hours,
        aggregate_amount,
        sheet_name,
        report_specific_month,
        update_time,
        file_name
from Scattered_record;

prompt
prompt Creating view V_SCATTERED_RECORD_CHINESE
prompt ========================================
prompt
create or replace view dukepu.v_scattered_record_chinese as
select
       report_dept AS "报表部门",
        dept AS "部门",
        name AS "姓名",
        particulars AS "事由",
        labour_cost AS "单价",
        quantities AS "数量",
        total_hours AS "总工时",
        aggregate_amount AS "金额",
        sheet_name AS "表格名",
        report_specific_month AS "指定月份",
        update_time AS "更新时间",
        file_name AS "文件名"
from Scattered_record;

prompt
prompt Creating view V_WORK_SCHEDULE
prompt =============================
prompt
CREATE OR REPLACE VIEW DUKEPU.V_WORK_SCHEDULE AS
SELECT  DEPT,
          WORK_AND_REST_DATE,
          SUBSTR(TO_CHAR(ON_Duty_Time,'yyyy-MM-dd HH24:MI:SS'),12,5) AS ON_Duty_Time,
          SUBSTR(TO_CHAR(OFF_Duty_Time,'yyyy-MM-dd HH24:MI:SS'),12,5) AS OFF_Duty_Time,
          (
            CASE
            WHEN WORK_OR_REST =1 THEN N'工作'
            ELSE N'休息'
            END
          ) AS Work_OR_REST,
          FP_NUMBER,
          REST_NUMBER
  FROM Work_Schedule
  ORDER BY WORK_AND_REST_DATE ASC,
  DEPT ASC;

prompt
prompt Creating view V_WORK_SCHEDULE_CH
prompt ================================
prompt
CREATE OR REPLACE VIEW DUKEPU.V_WORK_SCHEDULE_CH AS
SELECT  DEPT AS "部门",
          WORK_AND_REST_DATE AS "日期",
          SUBSTR(TO_CHAR(ON_Duty_Time,'yyyy-MM-dd HH24:MI:SS'),12,5) AS "上班时间",
          SUBSTR(TO_CHAR(OFF_Duty_Time,'yyyy-MM-dd HH24:MI:SS'),12,5) AS "下班时间",
          (
            CASE
            WHEN WORK_OR_REST =1 THEN N'工作'
            ELSE N'休息'
            END
          ) AS "工作/休息",
          FP_NUMBER AS "按指纹人数",
          REST_NUMBER AS "休息人数"
  FROM Work_Schedule
  ORDER BY "日期" ASC,
  "部门" ASC;

prompt
prompt Creating view V_YIELDS_WITH_DEPTS
prompt =================================
prompt
create or replace view dukepu.v_yields_with_depts as
select
         D_C.JOB_NUMBER,
         D_C.NAME,
         EMPS.Department,
         D_C.Products_Name,
         D_C.SUMMARY_PROCESS,
         D_C.Specific_Process,
         D_C.MANUFACTURE_QUANTITIES,
         TRUNC(D_C.YIELDS_TIME) YIELDS_DATE,
         D_C.Update_Time D_C_UPDATETIME,
         D_C.Submit_Person
    FROM Daily_Capacity D_C
                        INNER JOIN EMPLOYEES EMPS
                             ON D_C.Job_Number = EMPS.Job_Number
    WHERE EMPS.Is_On_The_Job = 1
    ORDER bY
          EMPS.Department DESC,
          D_C.Job_Number DESC,
          TRUNC(YIELDS_TIME) DESC,
          D_C.Products_Name dESC,
          D_C.Summary_Process DESC,
          D_C.Specific_Process DESC;

prompt
prompt Creating package GETHZPY
prompt ========================
prompt
create or replace package dukepu.GetHZPY is

  -- Author  : ADMINISTRATOR
  -- Created : 2006-10-8 上午 11:51:16
  -- Purpose : 获得汉字拼音编码

  -- Public type declarations
  TYPE THZPY_LIST is VARRAY (526) OF  VARCHAR2(6);
  TYPE TROMA_NUM_LIST is VARRAY (94) OF  VARCHAR2(2);
  TYPE TGREECE_ALPHABET_LIST is VARRAY (24) OF  VARCHAR2(2);
  TYPE TPYIndex_191_list IS VARRAY(191) OF NUMBER;
  TYPE TPYIndex_list IS VARRAY(10) OF TPYIndex_191_list;

  -- Public constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
  --<VariableName> <Datatype>;

  -- Public function and procedure declarations
  function GetHzPY_by_index(p_PY_Index number) RETURN VARCHAR2;
  FUNCTION get_greece_alphabet_py(p_Index NUMBER) RETURN NUMBER;
  FUNCTION get_roma_num_py(p_Index NUMBER) RETURN NUMBER;
  FUNCTION get_py_index_01(p_Index1 NUMBER, p_Index NUMBER) RETURN NUMBER;
  FUNCTION get_py_index_02(p_Index1 NUMBER, p_Index NUMBER) RETURN NUMBER;
  FUNCTION get_py_index_03(p_Index1 NUMBER, p_Index NUMBER) RETURN NUMBER;
  FUNCTION get_py_index_04(p_Index1 NUMBER, p_Index NUMBER) RETURN NUMBER;
  FUNCTION get_py_index_05(p_Index1 NUMBER, p_Index NUMBER) RETURN NUMBER;
  FUNCTION get_py_index_06(p_Index1 NUMBER, p_Index NUMBER) RETURN NUMBER;
  FUNCTION get_py_index_07(p_Index1 NUMBER, p_Index NUMBER) RETURN NUMBER;
  FUNCTION get_py_index_08(p_Index1 NUMBER, p_Index NUMBER) RETURN NUMBER;
  FUNCTION get_py_index_09(p_Index1 NUMBER, p_Index NUMBER) RETURN NUMBER;
  FUNCTION get_py_index_10(p_Index1 NUMBER, p_Index NUMBER) RETURN NUMBER;
  FUNCTION get_py_index_11(p_Index1 NUMBER, p_Index NUMBER) RETURN NUMBER;
  FUNCTION get_py_index_12(p_Index1 NUMBER, p_Index NUMBER) RETURN NUMBER;
  FUNCTION get_py_index_13(p_Index1 NUMBER, p_Index NUMBER) RETURN NUMBER;
  FUNCTION GetHzFullPY(p_String varchar2) RETURN VARCHAR2;
  FUNCTION GetHzPYCAP(p_String varchar2) RETURN VARCHAR2;
end ;
/

prompt
prompt Creating package GET_AR_SUMMARY
prompt ===============================
prompt
create or replace package dukepu.get_AR_Summary is

  -- Author  : ADMIN
  -- Created : 2019-2-12 16:12:48
  -- Purpose :

  -- Public type declarations
  type t_cur is ref cursor;

   --获取某月某考勤机的员工数目
  function get_nums_of_staffs(v_attendance_machine_NO int,v_year_month_str varchar2) return int;

  --获取该月的考勤天数
  function get_nums_of_ar_days(v_attendance_machine_NO int,v_year_month_str varchar2) return int;

  function get_machines_no(v_year_month_str varchar2) return t_cur;
  -- Public function and procedure declarations
  --依据 yyyy-MM,卡机编号,例：1 返回  工号，姓名，部门的 游标
  function get_Statff_Info(v_attendance_machine_NO int,v_year_month_str varchar2) return t_cur;

  --依据 卡机编号,yyyy-MM  获取每个人 的 考勤 记录。
  function get_AR_Of_Each_Staff(v_attendance_machine_no int,v_year_month_str varchar2) return t_cur;

  ---依据 卡机编号,yyyy-MM 获取 每个人的   考勤 汇总
  function Get_AR_Summary(v_attendance_machine_no int,v_year_month_str varchar2) return t_cur;



end get_AR_Summary;
/

prompt
prompt Creating package IMPORT_PRODUCTS_COST
prompt =====================================
prompt
create or replace package dukepu.Import_Products_Cost is

  -- Author  : ADMIN
  -- Created : 2018-11-15 14:47:06
  -- Purpose : 导入成衣成本

  -- Public type declarations
--



  -- Public function and procedure declarations
   function ifExists(v_PN nvarchar2) return int ;
   function add(v_summary_process nvarchar2,
                v_specific_process nvarchar2,
                v_man_hours number,
                v_labour_cost number,
                v_supplier nvarchar2,
                v_products_name nvarchar2) return int;
end Import_Products_Cost;
/

prompt
prompt Creating package ORA_ASPNET_PROF_PKG
prompt ====================================
prompt
CREATE OR REPLACE PACKAGE DUKEPU.ora_aspnet_Prof_pkg wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
9
9200000
1
4
0
7
2 :e:
1PACKAGE:
1ORA_ASPNET_PROF_PKG:
1TYPE:
1ASSOCARRAYNVARCHAR2_T:
1NVARCHAR2:
1256:
1BINARY_INTEGER:
0

0
0
17
2
0 a0 97 a0 9d a0 51 a5
1c a0 1c 40 a8 c 77 a0
:2 aa 59 58 1d 17 b5
17
2
0 3 7 11 3c 19 1d 20
21 29 2d 35 36 37 15 43
47 49 4b 4e 51 52 5b
17
2
0 1 9 1 6 28 33 32
28 :2 41 :3 1f 1 5 :7 1
17
4
0 :2 1 :c 2 3
:7 1
5d
4
:3 0 1 :3 0 2
:6 0 1 :2 0 3
:3 0 4 0 d
10 5 :3 0 6
:2 0 3 5 7
:6 0 7 :3 0 9
:7 0 a 5 c
8 :3 0 4 d
4 :4 0 2 :3 0
7 12 0 12
10 11 13 2
12 15 0 14
13 16 :8 0
9
4
:3 0 1 6 1
b 1 e
1
4
0
15
0
1
14
1
2
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
2 0 1
4 1 0
0
/

prompt
prompt Creating package ORA_ASPNET_ROLES_PKG
prompt =====================================
prompt
create or replace package dukepu.ORA_ASPNET_ROLES_PKG wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
9
9200000
1
4
0
1a
2 :e:
1PACKAGE:
1ORA_ASPNET_ROLES_PKG:
1TYPE:
1ASSOCARRAYVARCHAR2_T:
1NVARCHAR2:
1256:
1BINARY_INTEGER:
1ROLE_ALREADY_EXISTS:
1CONSTANT:
1INTEGER:
1-:
13000:
1ROLE_NOT_FOUND:
13001:
1THIS_USER_ALREADY_IN_ROLE:
13002:
1THIS_USER_ALREADY_NOT_IN_ROLE:
13003:
1THIS_USER_NOT_FOUND:
13004:
1ROLE_IS_NOT_EMPTY:
13005:
1UNIQUE_CONSTRAINT_VIOLATED:
1PRAGMA:
1EXCEPTION_INIT:
11:
0

0
0
5f
2
0 a0 97 a0 9d a0 51 a5
1c a0 1c 40 a8 c 77 87
:2 a0 1c 7e 51 b4 2e 1b b0
87 :2 a0 1c 7e 51 b4 2e 1b
b0 87 :2 a0 1c 7e 51 b4 2e
1b b0 87 :2 a0 1c 7e 51 b4
2e 1b b0 87 :2 a0 1c 7e 51
b4 2e 1b b0 87 :2 a0 1c 7e
51 b4 2e 1b b0 8b b0 2a
:3 a0 7e 51 b4 2e b4 5d a0
:2 aa 59 58 1d 17 b5
5f
2
0 3 7 11 3c 19 1d 20
21 29 2d 35 36 37 15 67
47 4b 4f 57 5a 5d 5e 63
46 8f 72 76 7a 43 82 85
86 8b 71 b7 9a 9e a2 6e
aa ad ae b3 99 df c2 c6
ca 96 d2 d5 d6 db c1 107
ea ee f2 be fa fd fe 103
e9 12f 112 116 11a e6 122 125
126 12b 111 136 10e 13d 140 144
148 14c 14f 152 153 158 159 15c
160 162 164 167 16a 16b 174
5f
2
0 1 9 1 6 27 31 30
27 :2 3f :3 1e :2 1 1f :2 28 33 34
:2 33 1f :2 1 20 :2 29 34 35 :2 34
20 :2 1 20 :2 29 34 35 :2 34 20
:2 1 20 :2 29 34 35 :2 34 20 :2 1
20 :2 29 34 35 :2 34 20 :2 1 20
:2 29 34 35 :2 34 20 :5 1 8 17
:4 33 :2 1 5 :7 1
5f
4
0 :2 1 :c 3 :a 6
:a 7 :a 8 :a 9 :a a
:a b :3 d :9 e 10
:7 1
176
4
:3 0 1 :3 0 2
:6 0 1 :2 0 3
:3 0 4 0 d
58 5 :3 0 6
:2 0 3 5 7
:6 0 7 :3 0 9
:7 0 a 5 c
8 :3 0 4 d
4 :4 0 b :2 0
:2 9 :3 0 a :3 0
11 :7 0 b :2 0
c :2 0 7 13
15 :3 0 18 12
16 58 8 :6 0
b :2 0 d 9
:3 0 a :3 0 1b
:7 0 e :2 0 b
1d 1f :3 0 22
1c 20 58 d
:6 0 b :2 0 11
9 :3 0 a :3 0
25 :7 0 10 :2 0
f 27 29 :3 0
2c 26 2a 58
f :6 0 b :2 0
15 9 :3 0 a
:3 0 2f :7 0 12
:2 0 13 31 33
:3 0 36 30 34
58 11 :6 0 b
:2 0 19 9 :3 0
a :3 0 39 :7 0
14 :2 0 17 3b
3d :3 0 40 3a
3e 58 13 :6 0
1f :2 0 1d 9
:3 0 a :3 0 43
:7 0 16 :2 0 1b
45 47 :3 0 4a
44 48 58 15
:6 0 17 :6 0 4c
0 58 18 :3 0
19 :3 0 17 4b
:2 0 b :2 0 1a
:2 0 21 51 53
:3 0 23 4f 55
58 2 :3 0 26
5a 0 5a 58
59 5b 2 5a
5d 0 5c 5b
5e :8 0
30
4
:3 0 1 6 1
b 1 14 1
f 1 1e 1
19 1 28 1
23 1 32 1
2d 1 3c 1
37 1 46 1
41 1 4b 1
52 2 50 54
9 e 17 21
2b 35 3f 49
4d 56
1
4
0
5d
0
1
14
1
9
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
41 1 0
4 1 0
f 1 0
4b 1 0
2d 1 0
37 1 0
2 0 1
19 1 0
23 1 0
0
/

prompt
prompt Creating package PKG_ANALYZE_AR
prompt ===============================
prompt
create or replace package dukepu.PKG_Analyze_AR is

  -- Author  : ADMIN
  -- Created : 2019-6-24 15:57:26
  -- Purpose : 分析考勤记录表

  -- Public type declarations
  type t_cur is ref cursor;
  --获取AR_Temp中拼音相同，但汉字不同的员工。
  function get_Same_PY_Of_Staffs return t_cur;

end PKG_Analyze_AR;
/

prompt
prompt Creating package PKG_ANALYZE_PRODUCTS_COST
prompt ==========================================
prompt
create or replace package dukepu.PKG_Analyze_Products_Cost is

  -- Author  : ADMINISTRATOR
  -- Created : 2019-07-23 14:38:53
  -- Purpose : 分析成衣成本数据

  --分析成衣成本数据.

  type t_cur is ref cursor;

 procedure analyze_P_C(v_product_name varchar2);



end PKG_Analyze_Products_Cost;
/

prompt
prompt Creating package PKG_AR
prompt =======================
prompt
create or replace package dukepu.pkg_ar is



       type cur_t is ref cursor;

procedure     get_ar_By_RandomStr(v_Random_Str varchar2,v_cur_ar out cur_t);

function     get_ar_By_Random_Str(v_Random_Str varchar2) return cur_t;

function     get_ARDetail_By_Random_Str(v_Random_Str varchar2) return cur_t;
end pkg_ar;
/

prompt
prompt Creating package PKG_ARTIME
prompt ===========================
prompt
create or replace package dukepu.PKG_ARTime is

  -- Author  : ADMIN
  -- Created : 2018-8-17 9:17:07
  -- Purpose : 获取每个员工每天的考勤记录

  -- Public type declarations
  type t_cur is ref cursor;

  procedure GET_JN_And_AR_Day(v_job_number varchar2,v_ar_day varchar2,v_cur_result out t_cur);
  function GET_A_R_Time(v_job_number varchar2,v_ar_day varchar2) return t_cur;
end PKG_ARTime;
/

prompt
prompt Creating package PKG_AR_DETAIL
prompt ==============================
prompt
create or replace package dukepu.PKG_AR_DETAIL is

  -- Author  : ADMIN
  -- Created : 2018-8-17 13:47:51
  -- Purpose :

  -- Public type declarations
  type cur_t is ref cursor;

  procedure get_ar_detail(v_date_str varchar2,v_prefix_job_number varchar2,v_cur_result out cur_t);
  procedure get_ar_detail(v_date_str varchar2,v_cur_result out cur_t);
  function GET_OverTime_Of_RestDay(v_ar_jn varchar2,v_year_and_month varchar2) return integer;

function get_ar_detail_by_JN(v_job_number varchar2,v_year_and_month_str varchar2)  return cur_t;
 ---获取 该月考勤中的 所有 工号，姓名，部门
  function get_Staffs_Base_Info(v_year_and_month_str varchar2) return cur_t;

  ---获取 该月考勤中的 所有 工号，姓名，部门
  function get_Staffs_BI_by_AMFlag_YMStr(v_attendance_machine_flag varchar2,v_year_and_month_str varchar2) return cur_t;
end PKG_AR_Detail;
/

prompt
prompt Creating package PKG_AR_SUMMARY
prompt ===============================
prompt
create or replace package dukepu.pkg_ar_summary is

  -- Author  : ADMIN
  -- Created : 2019-6-6 15:23:50
  -- Purpose : 目的 获取 某月 考勤  汇总 记录 。

  -- Public type declarations
  type  t_cur is ref cursor;



  -- Public function and procedure declarations
  function getARSummary(v_year_and_month_str varchar2) return t_cur;

end pkg_ar_summary;
/

prompt
prompt Creating package PKG_EMPS
prompt =========================
prompt
create or replace package dukepu.pkg_emps is



       type cursor_emps_t is ref cursor;

procedure      proc_GetAllEmps(cur_set out cursor_emps_t);

end pkg_emps;
/

prompt
prompt Creating package PKG_GET_AR
prompt ===========================
prompt
create or replace package dukepu.PKG_GET_AR is

  -- Author  : ADMIN
  -- Created : 2019-1-23 15:05:06
  -- Purpose : 此包用于考勤管理

  -- Public type declarations
  type t_cur is ref cursor;

  -- Public variable declarations

  -- Public function and procedure declarations
  function get_AR_By_Date_Range(v_year_and_month_str varchar2) return t_cur;

  function get_AR_By_Dept_And_DR(v_dept nvarchar2,v_year_and_month_str varchar2) return t_cur;

--依据 姓名首汉字以及 日期 查询 Attendance_Record
  function get_AR_By_LN_And_DR(v_lastName nvarchar2,v_year_and_month_str varchar2) return t_cur;

  --依据工号，日期更新 latest_off_duty,OVERTIME_WORKDAY_ONE_MONTH,OVERTIME_RESTDAY_ONE_MONTH
  procedure Update_Summary(v_ar_job_number nvarchar2,v_year_and_month_str varchar2);

end PKG_GET_AR;
/

prompt
prompt Creating package PKG_GET_SUMMARY_OF_AR
prompt ======================================
prompt
create or replace package dukepu.PKG_Get_Summary_Of_AR is

  -- Author  : ADMIN
  -- Created : 2018-8-16 15:20:19
  -- Purpose : 获得每个员工当月的考勤汇总

  -- Public type declarations
  type cur_t is ref cursor;

  function get_summary_of_ar(v_job_number varchar2,v_name nvarchar2,v_year_and_month varchar2) return cur_t;

end PKG_Get_Summary_Of_AR;
/

prompt
prompt Creating package PKG_IMPORT_AR
prompt ==============================
prompt
create or replace package dukepu.PKG_Import_AR is
  function import_AR(
                           v_start_date_str varchar2,
                           v_end_date_str varchar2,
                           v_tabulation_time_str varchar2,
                           v_fingerprint_date_str varchar2,
                           v_job_number varchar2,
                           v_name       nvarchar2,
                           v_dept       nvarchar2,
                           v_fpt_first_time_str       varchar2,
                           v_fpt_last_time_str        varchar2,
                           v_file_path                nvarchar2,
                           v_random_str               varchar2
                                   ) return int;
end PKG_Import_AR;
/

prompt
prompt Creating package PKG_REST_DAY
prompt =============================
prompt
create or replace package dukepu.PKG_Rest_Day is

  -- Author  : ADMIN
  -- Created : 2019-5-14 16:31:59
  -- Purpose : 生成带薪的加班日

  -- Public type declarations
  type t_cur is ref cursor;



  -- Public function and procedure declarations
  function generate_rest_day(v_name nvarchar2,v_year_and_month varchar2) return t_cur;

end PKG_Rest_Day;
/

prompt
prompt Creating package PKG_SALS_REPORT
prompt ================================
prompt
create or replace package dukepu.PKG_Sals_Report as

  -- Author  : ADMIN
  -- Created : 2019-3-20 15:56:23
  -- Purpose : 用于工资报表导出

  -- Public type declarations
  type t_cur is ref cursor;

  -- Public function and procedure declarations
  function getAR(v_dept nvarchar2,v_year_and_month_str varchar2)  return t_cur;

  function getEarningOfProducts(v_report_dept nvarchar2,v_pn nvarchar2,v_dept nvarchar2,v_name nvarchar2,v_report_specific_month varchar2) return number;

  function getEarningOfScatteredRecord(v_report_specific_month varchar2,v_dept nvarchar2,v_name nvarchar2) return number;


end PKG_Sals_Report;
/

prompt
prompt Creating package PKG_TO_EXPORT_AR_SUMMARY
prompt =========================================
prompt
create or replace package dukepu.PKG_TO_Export_AR_Summary is

  -- Author  : ADMIN
  -- Created : 2019-6-4 8:46:52
  -- Purpose : 导出 AR Summary

  -- Public type declarations
  type t_cur is ref cursor;

  ---保存 AR至  Attendance_Record_Summary,异机同名 汇总 。
  procedure Save_AR_To_Summary_Table(v_year_and_month_str varchar2) ;

end PKG_TO_Export_AR_Summary;
/

prompt
prompt Creating package PKG_TO_EXPORT_FROM_A_R_SUMMARY
prompt ===============================================
prompt
create or replace package dukepu.PKG_TO_Export_From_A_R_Summary is

  -- Author  : ADMIN
  -- Created : 2019-6-4 8:46:52
  -- Purpose : 导出 AR Summary

  -- Public type declarations
  type t_cur is ref cursor;

  ---保存 AR至  Attendance_Record_Summary,异机同名 汇总 。
  procedure Save_AR_To_Summary_Table(v_year_and_month_str varchar2) ;
 function get_summary_of_A_R_Summary(v_job_number varchar2,v_year_and_month varchar2) return t_cur;
 procedure GET_A_R_Time(v_job_number varchar2,v_ar_day varchar2, v_cur_result out t_cur) ;
end PKG_TO_Export_From_A_R_Summary;
/

prompt
prompt Creating package SHOW_PRODUCTS_COST
prompt ===================================
prompt
create or replace package dukepu.Show_Products_Cost is

  -- Author  : ADMIN
  -- Created : 2018-11-14 14:06:57
  -- Purpose : 显示 成衣 造价

  -- Public type declarations
  type cur_t is ref cursor;

  -- Public constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
  --<VariableName> <Datatype>;

  -- Public function and procedure declarations
  function getProductsCostDetail(v_PN nvarchar2) return cur_t;
  function getAllProductsCostSummary return cur_t;
  function get_P_C_Summary_To_Export(v_PN nvarchar2) return cur_t;
  --获取 Products_Cost中的 Products_Name,Summary_Process,Specific_Process
  function get_P_C_Info_To_Piecework(v_PN nvarchar2) return cur_t;
    --获取每部分的工价信息. 汇总字段中 包含数量.
  function get_P_C_Summary_By_Each_Part(v_PN nvarchar2)return cur_t;
end Show_Products_Cost;
/

prompt
prompt Creating package SHOW_SALARY_EMPS
prompt =================================
prompt
create or replace package dukepu.Show_Salary_Emps is

  -- Author  : ADMIN
  -- Created : 2018-11-13 9:28:22
  -- Purpose : 获取 计件制  报表  提交 的  员工  信息

  -- Public type declarations
  type cur_t is ref cursor;

  -- Public constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
  --<VariableName> <Datatype>;

  -- Public function and procedure declarations
  --从  计件 报表 中  获取  上个 月 所有 员工 信息。
  function getAllEmpsOfLastMonth return cur_t;


end Show_Salary_Emps;
/

prompt
prompt Creating function CALC_COME_NUM
prompt ===============================
prompt
create or replace function dukepu.Calc_Come_Num(v_Job_Number INTEGER,v_FP_D date) return nvarchar2 as
  Result nvarchar2(100):='';

    type t_cur is ref cursor;
    v_AR_Cur t_cur;


    v_SEQ Attendance_Record.Seq%TYPE;                                      ---序号
    v_DEPT Attendance_Record.Dept%TYPE;                                    --部门
    v_Fpt_F_T Attendance_Record.Fpt_First_Time%type;                          --第一次刷卡时间
    v_FPT_L_T Attendance_Record.Fpt_Last_Time%type;                           --最后一次刷卡时间


    v_Come_Num            Attendance_Record.Come_Num%TYPE;                    ---实际出勤天数。
    v_COUNT               INT;

    v_ON_Duty_TIME        DATE;                                               ----正常上班点
    v_OFF_DUTY_TIME       DATE;                                               ---正常下班点
begin
  ----此函数用于统计出勤天数。
  ----先判断今天是否休息日，休息日： 不计算考勤。     请全天假,不计考勤,提前回来,要销假.
   ---年月 字符串.

     OPEN v_AR_Cur
     FOR
     SELECT
            SEQ,
            job_number,
            DEPT,
            FPT_First_Time,
            FPT_Last_Time,
            FINGERPrint_Date
     FROM Attendance_Record AR
     WHERE JOB_NUMBER = v_JOB_NUMBER
           AND fingerprint_date= TO_DATE(v_FP_D,'YYYY-MM-DD')
     ORDER BY AR.fingerprint_date ASC,
           AR.DEPT ASC;

     LOOP
       FETCH v_AR_Cur INTO
                           v_SEQ,
                           v_Dept,
                           v_Fpt_F_T,
                           v_FPT_L_T;
       EXIT WHEN v_AR_Cur%NOTFOUND;
       ---今天未打卡
       IF (  v_Fpt_F_T IS NULL AND v_FPT_L_T IS NULL) THEN
          v_Come_Num:=0;
          return result;
       END IF;
        ---先判断是否休息日。
       SELECT COUNT(1) INTO v_Count
       FROM Work_Schedule WS
       WHERE WS.dept = v_Dept
       AND WS.work_and_rest_date = v_FP_D
       AND WS.Work_Or_Rest = 0;
       ---休息日
       IF(v_Count =1) THEN
          v_Come_Num:=0;
          return result;
       END IF;
       ---是否请假。
       ---获取正常班上班点。和下班点。
       --GET_DUTY_TIME(v_FP_D,v_ON_Duty_TIME,v_OFF_DUTY_TIME);
       ---如果请的是全天假.
       SELECT COUNT(1) INTO v_Count
       FROM ASK_FOR_LEAVE A_F_L
       WHERE A_F_L.JOB_NUMBER = v_JOB_NUMBER
       AND A_F_L.LEAVE_START_TIME <=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')||' 08:30:00','YYYY-MM-DD HH24:MI:SS')
       AND A_F_L.LEAVE_END_TIME >=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')|| ' 17:00:00','YYYY-MM-DD HH24:MI:SS');

       ---全天假
       IF(v_COUNT >0) THEN
          v_Come_NUM:=0;
          return result;
       END IF;

       ---请的是早上假.
       SELECT COUNT(1) INTO v_Count
       FROM ASK_FOR_LEAVE A_F_L
       WHERE A_F_L.JOB_NUMBER = v_JOB_NUMBER
       AND A_F_L.LEAVE_START_TIME <=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')||' 08:30:00','YYYY-MM-DD HH24:MI:SS')
       AND A_F_L.LEAVE_END_TIME >=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')|| ' 13:30:00','YYYY-MM-DD HH24:MI:SS');
       ---只要刷2次卡，就统计考勤半天
       IF(v_Count>0) THEN
           IF(v_Fpt_F_T IS NOT NULL AND v_FPT_L_T IS NOT NULL) THEN
               v_Come_NUM:=0.5;
               return result;
           END IF;
           --少刷一次不统计考勤。
           v_Come_NUM:=0;
           return result;
       END IF;
      ---请的是下午假
       SELECT COUNT(1) INTO v_Count
       FROM ASK_FOR_LEAVE A_F_L
       WHERE A_F_L.JOB_NUMBER = v_JOB_NUMBER
       AND A_F_L.LEAVE_START_TIME <=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')||' 13:30:00','YYYY-MM-DD HH24:MI:SS')
       AND A_F_L.LEAVE_END_TIME >=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')|| ' 17:00:00','YYYY-MM-DD HH24:MI:SS');
       IF(v_COUNT>0) THEN
          ---只要刷2次卡，就统计考勤半天
          IF(v_Fpt_F_T IS NOT NULL AND v_FPT_L_T IS NOT NULL) THEN
              v_Come_NUM:=0.5;
              return result;
          END IF;
          --少刷一次卡不统计考勤
           v_Come_NUM:=0;
           return result;
       END IF;
       ---未请假。
       --第一次，最后由一次刷卡记录都不为空，记录1天
       IF(v_Fpt_F_T IS NOT NULL AND v_FPT_L_T IS NOT NULL) THEN
            v_Come_NUM:=1;
            return result;
       END IF;
       --只要有一次卡，未刷上不统计考勤。
       v_Come_Num:=0;
       --更新考勤记录。
       UPDATE Attendance_Record AR
       SET AR.Come_NUM = v_Come_Num
       WHERE AR.JOB_NUMBER = v_Come_Num
       AND AR.fingerprint_date = v_FP_D ;
     END LOOP;
     CLOSE  v_AR_Cur;
  return(Result);
end Calc_Come_Num;
/

prompt
prompt Creating function CALC_DELAY_TIME
prompt =================================
prompt
create or replace function dukepu.Calc_DELAY_TIME(v_Job_Number INTEGER,v_FP_D date) return nvarchar2 as
       ----计算延时-----
  Result nvarchar2(100):='';

    type t_cur is ref cursor;
    v_AR_Cur t_cur;


    v_SEQ Attendance_Record.Seq%TYPE;                                      ---序号
    v_DEPT Attendance_Record.Dept%TYPE;                                    --部门
    v_Fpt_F_T Attendance_Record.Fpt_First_Time%type;                          --第一次刷卡时间
    v_FPT_L_T Attendance_Record.Fpt_Last_Time%type;                           --最后一次刷卡时间


    v_DELAY_TIME           Attendance_Record.Delay_Time%TYPE;                    ---实际出勤天数。
    v_COUNT               INT;
    v_Come_NUM            INT;
begin
  ----此函数用于统计出勤天数。
  ----先判断今天是否休息日，休息日： 不计算考勤。     请全天假,不计考勤,提前回来,要销假.
   ---年月 字符串.

     OPEN v_AR_Cur
     FOR
     SELECT
            SEQ,
            job_number,
            DEPT,
            FPT_First_Time,
            FPT_Last_Time,
            FINGERPrint_Date
     FROM Attendance_Record AR
     WHERE JOB_NUMBER = v_JOB_NUMBER
           AND fingerprint_date= TO_DATE(v_FP_D,'YYYY-MM-DD')
     ORDER BY AR.fingerprint_date ASC,
           AR.DEPT ASC;

     LOOP
       FETCH v_AR_Cur INTO
                           v_SEQ,
                           v_Dept,
                           v_Fpt_F_T,
                           v_FPT_L_T;
       EXIT WHEN v_AR_Cur%NOTFOUND;
       ---今天未打卡
       IF (v_Fpt_F_T IS NULL AND v_FPT_L_T IS NULL) THEN
          v_DELAY_TIME:=0;
          return result;
       END IF;
       ---先判断是否休息日。
       SELECT COUNT(1) INTO v_Count
       FROM Work_Schedule WS
       WHERE WS.dept = v_Dept
       AND WS.work_and_rest_date = v_FP_D
       AND WS.Work_Or_Rest = 0;
       ---休息日  ---不计算延时。
       IF(v_Count =1) THEN
          v_DELAY_TIME:=0;
          return result;
       END IF;
       ---是否请假。
       ---获取正常班上班点。和下班点。
       --GET_DUTY_TIME(v_FP_D,v_ON_Duty_TIME,v_OFF_DUTY_TIME);
       ---如果请的是全天假.
       SELECT COUNT(1) INTO v_Count
       FROM ASK_FOR_LEAVE A_F_L
       WHERE A_F_L.JOB_NUMBER = v_JOB_NUMBER
       AND A_F_L.LEAVE_START_TIME <=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')||' 08:30:00','YYYY-MM-DD HH24:MI:SS')
       AND A_F_L.LEAVE_END_TIME >=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')|| ' 17:00:00','YYYY-MM-DD HH24:MI:SS');

       ---全天假
       IF(v_COUNT >0) THEN
          v_Come_NUM:=0;
          return result;
       END IF;

       ---请的是早上假.
       SELECT COUNT(1) INTO v_Count
       FROM ASK_FOR_LEAVE A_F_L
       WHERE A_F_L.JOB_NUMBER = v_JOB_NUMBER
       AND A_F_L.LEAVE_START_TIME <=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')||' 08:30:00','YYYY-MM-DD HH24:MI:SS')
       AND A_F_L.LEAVE_END_TIME >=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')|| ' 13:30:00','YYYY-MM-DD HH24:MI:SS');
       ---只要刷2次卡，就统计考勤半天
       IF(v_Count>0) THEN
           IF(v_Fpt_F_T IS NOT NULL AND v_FPT_L_T IS NOT NULL) THEN
               v_Come_NUM:=0.5;
               return result;
           END IF;
           --少刷一次不统计考勤。
           v_Come_NUM:=0;
           return result;
       END IF;
      ---请的是下午假
       SELECT COUNT(1) INTO v_Count
       FROM ASK_FOR_LEAVE A_F_L
       WHERE A_F_L.JOB_NUMBER = v_JOB_NUMBER
       AND A_F_L.LEAVE_START_TIME <=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')||' 13:30:00','YYYY-MM-DD HH24:MI:SS')
       AND A_F_L.LEAVE_END_TIME >=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')|| ' 17:00:00','YYYY-MM-DD HH24:MI:SS');
       IF(v_COUNT>0) THEN
          ---只要刷2次卡，就统计考勤半天
          IF(v_Fpt_F_T IS NOT NULL AND v_FPT_L_T IS NOT NULL) THEN
              v_Come_NUM:=0.5;
              return result;
          END IF;
          --少刷一次卡不统计考勤
           v_Come_NUM:=0;
           return result;
       END IF;
       ---未请假。
       --第一次，最后由一次刷卡记录都不为空，记录1天
       IF(v_Fpt_F_T IS NOT NULL AND v_FPT_L_T IS NOT NULL) THEN
            v_Come_NUM:=1;
            return result;
       END IF;
       --只要有一次卡，未刷上不统计考勤。
       v_Come_Num:=0;
       --更新考勤记录。
       UPDATE Attendance_Record AR
       SET AR.Come_NUM = v_Come_Num
       WHERE AR.JOB_NUMBER = v_Come_Num
       AND AR.fingerprint_date = v_FP_D ;
     END LOOP;
     CLOSE  v_AR_Cur;
  return(Result);
end Calc_DELAY_TIME;
/

prompt
prompt Creating function F_GETPY
prompt =========================
prompt
create or replace function dukepu.f_GetPy(v_str   nvarchar2)---返回 nvarchar(4000)
return   nvarchar2
as
begin
---声明 字符串的长度， 返回拼音变量@re
declare   v_strlen   int,@re   nvarchar(4000)
--声明 表变量,其字段为
-- chr --字符变量 --存储汉字
-- letter--  拼音字幕 变量 --存储字母
declare   @t   table(chr   nchar(1)   collate   Chinese_PRC_CI_AS,letter   nchar(1))
--向 @t中存储 26条记录
-- 1. 存储'吖 ','A'
-- 2.  '吖 ',有可能是发'a'音的第一个汉字母
-- 3. 以此类推，存储后25行记录
insert   into   @t(chr,letter)
    select   '吖 ', 'A '   union   all   select   '八 ', 'B '   union   all
    select   '嚓 ', 'C '   union   all   select   '咑 ', 'D '   union   all
    select   '妸 ', 'E '   union   all   select   '发 ', 'F '   union   all
    select   '旮 ', 'G '   union   all   select   '铪 ', 'H '   union   all
    select   '丌 ', 'J '   union   all   select   '咔 ', 'K '   union   all
    select   '垃 ', 'L '   union   all   select   '嘸 ', 'M '   union   all
    select   '拏 ', 'N '   union   all   select   '噢 ', 'O '   union   all
    select   '妑 ', 'P '   union   all   select   '七 ', 'Q '   union   all
    select   '呥 ', 'R '   union   all   select   '仨 ', 'S '   union   all
    select   '他 ', 'T '   union   all   select   '屲 ', 'W '   union   all
    select   '夕 ', 'X '   union   all   select   '丫 ', 'Y '   union   all
    select   '帀 ', 'Z '
--@str: 为传入的字符
--len(@str): 为字符的长度
--获取传入字符的长度。  @strlen, 初始化返回的拼音字母变量@re
    select   @strlen=len(@str),@re= ' '
    --开始循环
    while   @strlen> 0
    begin
    ---  条件：  substring(@str,@strlen,1)：  传入的最后一位字符
        ---- 排序:     chr:  降序排列。 取最接近  substring(@str,@strlen,1)的汉字
        ---- 变量：   赋值: 长度减少1,
        select   top   1   @re=letter+@re,@strlen=@strlen-1
            from   @t   a   where   chr <=substring(@str,@strlen,1)
            order   by   chr   desc



        if   @@rowcount=0
            select   @re=substring(@str,@strlen,1)+@re,@strlen=@strlen-1
    end
    return(@re)
end
/

prompt
prompt Creating function GET_DUTY_TIME
prompt ===============================
prompt
create or replace function dukepu.GET_Duty_TIME(v_FP_D in date,v_ON_Duty_TIME OUT DATE,v_Off_Duty_Time OUT DATE) return int as
  Result int;
         ---公司总人数
         v_Total_Num      INT;
         ---7:30-8:00上班总人数
         v_Eight_Clock_on_Duty_Num   INT;
         ---8:00 --8:30  上班总人数.
         v_Eight_And_Half_an_hour_ON INT;
         --13:30         ---上班总人数.
         v_thirteen_And_Half_An_Hour_ON INT;
         ---12:00        ---下班人数
         v_twelve_Off_Duty_Num INT;
         --17:00               --- 17:00下班人数
         v_seventeen_Off_Duty_Num INT;


         v_TIMEPOINT temp_For_Duty_Num.Timepoint%TYPE;

begin

   ----获取公司总人数.
       SELeCT COUNT(1) INTO v_Total_Num
          FROM
          (
            SELECT DISTINCT(JOB_NUMBER) JOB_NUMBER
            FROM Attendance_Record
            WHERE TRUNC(FingerPrint_DATE,'MM') = TRUNC(v_FP_D,'MM')
            ORDER BY JOB_NUMBER ASC
          ) TEMP;

        DELETE FROM temp_for_duty_num;

        ---7:30 - 8:00上班人数.
        SELECT COUNT(1) INTO v_Eight_Clock_on_Duty_Num
        FROM Attendance_Record AR
        WHERE AR.FINGERPRINT_DATE = v_FP_D
        AND AR.FPT_FIRST_TIME BETWEEN TO_DATE(TO_CHAR(V_FP_D,'YYYY-MM-DD')|| ' 07:30:00','YYYY-MM-DD HH24:MI:SS')
        AND TO_DATE(TO_CHAR(V_FP_D,'YYYY-MM-DD')|| ' 08:00:00','YYYY-MM-DD HH24:MI:SS');



        INSERT INTO temp_for_duty_num(category,TIMEPOINT,NUM) VALUES(
               'ON_DUTY',
               'Eight',
               v_Eight_Clock_on_Duty_Num
        );

        COMMIT;

     ---8:00 - 8:30 上班人数.
        SELECT COUNT(1) INTO v_Eight_And_Half_an_hour_ON
        FROM Attendance_Record AR
        WHERE AR.FINGERPRINT_DATE = v_FP_D
        AND AR.FPT_FIRST_TIME BETWEEN TO_DATE(TO_CHAR(V_FP_D,'YYYY-MM-DD')|| ' 08:00:00','YYYY-MM-DD HH24:MI:SS')
        AND TO_DATE(TO_CHAR(V_FP_D,'YYYY-MM-DD')|| ' 08:30:00','YYYY-MM-DD HH24:MI:SS');

          INSERT INTO temp_for_duty_num(category,TIMEPOINT,NUM) VALUES(
               'ON_DUTY',
               'Eight_And_Half_an_hour',
               v_Eight_And_Half_an_hour_ON
        );
        ---  12:00--  13:30  上班人数.  目的: 按13:30算上班人数.
        SELECT COUNT(1) INTO v_thirteen_And_Half_An_Hour_ON
        FROM Attendance_Record AR
        WHERE AR.FINGERPRINT_DATE = v_FP_D
        AND AR.FPT_FIRST_TIME BETWEEN TO_DATE(TO_CHAR(V_FP_D,'YYYY-MM-DD')|| ' 12:00:00','YYYY-MM-DD HH24:MI:SS')
        AND TO_DATE(TO_CHAR(V_FP_D,'YYYY-MM-DD')|| ' 13:30:00','YYYY-MM-DD HH24:MI:SS');


        INSERT INTO temp_for_duty_num(category,TIMEPOINT,NUM) VALUES(
               'ON_DUTY',
               'thirteen_And_Half_An_Hour',
               v_thirteen_And_Half_An_Hour_ON
        );
             ---  12:00        ---下班人数  取12:00 -12:30  12:30-13:00  之间刷卡人数.
        SELECT COUNT(1) INTO v_twelve_Off_Duty_Num
        FROM Attendance_Record AR
        WHERE AR.FINGERPRINT_DATE = v_FP_D
        AND AR.FPT_LAST_TIME BETWEEN TO_DATE(TO_CHAR(V_FP_D,'YYYY-MM-DD')|| ' 12:00:00','YYYY-MM-DD HH24:MI:SS')
        AND TO_DATE(TO_CHAR(V_FP_D,'YYYY-MM-DD')|| ' 13:00:00','YYYY-MM-DD HH24:MI:SS');

        INSERT INTO temp_for_duty_num(category,TIMEPOINT,NUM) VALUES(
               'OFF_DUTY',
               'twelve',
               v_twelve_Off_Duty_Num
        );


        ---17:00  下班人数.
        SELECT COUNT(1) INTO v_seventeen_Off_Duty_Num
        FROM Attendance_Record AR
        WHERE AR.FINGERPRINT_DATE = v_FP_D
        AND AR.FPT_LAST_TIME >= TO_DATE(TO_CHAR(V_FP_D,'YYYY-MM-DD')|| ' 17:00:00','YYYY-MM-DD HH24:MI:SS');

         INSERT INTO temp_for_duty_num(category,TIMEPOINT,NUM) VALUES(
               'OFF_DUTY',
               'seventeen',
               v_seventeen_Off_Duty_Num
        );


        ---开始分析 .
        ---取出上班类型中,人数最大的时间
        SELECT TIMEPOINT INTO v_TIMEPOINT
        FROM temp_for_duty_num
        WHERE Category = 'ON_DUTY'
        AND NUM
        =(
          SELECT  MAX(NUM)
          FROM temp_for_duty_num
          WHERE Category = 'ON_DUTY'
        );
        ---获取其名称
        IF(v_TIMEPOINT = 'EIGHT') THEN
             v_ON_Duty_TIME:=TO_DATE(TO_CHAR(V_FP_D,'YYYY-MM-DD')|| ' 08:00:00','YYYY-MM-DD HH24:MI:SS');
             GOTO END_ON_DUTY;
        END IF;

        IF(v_TIMEPOINT = 'Eight_And_Half_an_hour') THEN
              v_ON_Duty_TIME:=TO_DATE(TO_CHAR(V_FP_D,'YYYY-MM-DD')|| ' 08:30:00','YYYY-MM-DD HH24:MI:SS');
              GOTO END_ON_DUTY;
        END IF;

        IF(v_TIMEPOINT = 'thirteen_And_Half_An_Hour') THEN
              v_ON_Duty_TIME:=TO_DATE(TO_CHAR(V_FP_D,'YYYY-MM-DD')|| ' 13:30:00','YYYY-MM-DD HH24:MI:SS');
              GOTO END_ON_DUTY;
        END IF;
        <<END_ON_DUTY>>
        NULL;
         ---下班分析 .
        ---取出上班类型中,人数最大的时间
        SELECT TIMEPOINT INTO v_TIMEPOINT
        FROM temp_for_duty_num
        WHERE Category = 'OFF_DUTY'
        AND NUM
        =(
          SELECT  MAX(NUM)
          FROM temp_for_duty_num
          WHERE Category = 'OFF_DUTY'
        );
          ---获取其名称
        IF(v_TIMEPOINT = 'twelve') THEN
             v_OFF_Duty_TIME:=TO_DATE(TO_CHAR(V_FP_D,'YYYY-MM-DD')|| ' 12:00:00','YYYY-MM-DD HH24:MI:SS');
             GOTO END_OFF_DUTY;
        END IF;
            ---获取其名称
        IF(v_TIMEPOINT = 'seventeen') THEN
             v_OFF_Duty_TIME:=TO_DATE(TO_CHAR(V_FP_D,'YYYY-MM-DD')|| ' 17:00:00','YYYY-MM-DD HH24:MI:SS');
             GOTO END_OFF_DUTY;
        END IF;
        <<END_OFF_DUTY>>


  return(Result);
end GET_Duty_TIME;
/

prompt
prompt Creating function GET_JOB_NUMBER_F
prompt ==================================
prompt
create or replace function dukepu.GET_JOB_NUMBER_F
return  VARCHAR2 AS
  Result VARCHAR2(10);
  v_Next_seq  INT;
  v_Count INT;
  str_Next_Seq VARCHAR2(10);
begin

  ---先从Employees_Temp中查看,有无工号记录.
  SELECT  COUNT(1) INTO v_Count
  FROM EMPLOYEES_TEMP E_T
  WHERE SUBSTR(JOB_NUMBER,1,6) = TO_CHAR(SYSDATE,'YYMMDD');

  IF(v_Count>0) THEN
     ---获取最大值
     SELECT MAX(SUBSTR(JOB_NUMBER,LENGTH(JOB_NUMBER)-2,3)) +1 INTO v_Next_seq
     FROM EMPLOYEES_TEMP
     WHERE JOB_NUMBER != 'admin'
     AND JOB_NUMBER != 'query'
     AND JOB_NUMBER != 'dyh'
     AND SUBSTR(JOB_NUMBER,1,6) = TO_CHAR(SYSDATE,'YYMMDD');
     str_Next_Seq:= CAST(v_Next_Seq AS VARCHAR2);
     SELECT TO_CHAR(SYSDATE,'YYMMDD') || LPAD(str_Next_Seq,3,'0') INTO Result
     FROM DUAL;
     RETURN RESULT;
  END IF;

-------从EMPLOYEES中获取最大值。

  SELECT Count(1) INTO v_Count
  FROM EMPLOYEES
  WHERE SUBSTR(JOB_NUMBER,1,6) = TO_CHAR(SYSDATE,'YYMMDD');

  IF(v_Count =0) THEN
             v_Next_Seq := 1;
  ELSE
      SELECT MAX(SUBSTR(JOB_NUMBER,LENGTH(JOB_NUMBER)-2,3)) +1 INTO v_Next_Seq
      FROM EMPLOYEES
      WHERE JOB_NUMBER != 'admin'
      AND JOB_NUMBER != 'query'
      AND JOB_NUMBER != 'dyh'
      AND SUBSTR(JOB_NUMBER,1,6) = TO_CHAR(SYSDATE,'YYMMDD');
  END IF;

  str_Next_Seq:= CAST(v_Next_Seq AS VARCHAR2);
  SELECT TO_CHAR(SYSDATE,'YYMMDD') || LPAD(str_Next_Seq,3,'0') INTO Result
  FROM DUAL;

  return(Result);
end GET_JOB_NUMBER_F;
/

prompt
prompt Creating function GET_OVERTIME_OF_RESTDAY
prompt =========================================
prompt
create or replace function dukepu.GET_OverTime_Of_RestDay(v_ar_jn varchar2,v_year_and_month varchar2) return integer is
  Result integer;
begin
     select FLOOR((fpt_last_time - (CASE  WHEN FPT_First_TIME <= TO_DATE(TO_CHAR(FPT_FIRST_TIME,'yyyy-MM-dd') || ' 08:00:00','yyyy-MM-dd HH24:MI:SS')
                                THEN TO_DATE(TO_CHAR(FPT_FIRST_TIME,'yyyy-MM-dd') || ' 08:00:00','yyyy-MM-dd HH24:MI:SS')
                                ELSE FPT_First_TIME
                                END))*24*60/30) * 0.5 -1 INTO Result
    from rest_day r_d inner join attendance_record ar
           on (r_d.rest_day = ar.fingerprint_date
               and not(ar.fpt_first_time is null and ar.fpt_last_time is  null))
    where ar.job_number = v_ar_jn
    and trunc(fingerprint_date,'MM') = to_date(v_year_and_month,'yyyy-MM');
  return(Result);
end GET_OverTime_Of_RestDay;
/

prompt
prompt Creating function GET_SUM_ASCII_STR
prompt ===================================
prompt
create or replace function dukepu.Get_Sum_Ascii_Str(Str in nvarchar2)
return number AS
  Result NUMBER :=0;
  LEN INT;    ----字符串的长度
  v_count INT :=0;

begin
     ---获取字符串的长度
     Len := LENGTH(str);

     LOOP
         v_count := v_count +1;

         RESULT := RESULT + ASCII(SUBSTR(Str,v_count,1));

         EXIT WHEN v_count = LEN;
     END LOOP;



  return(Result);


end Get_Sum_Ascii_Str;
/

prompt
prompt Creating function ISDATE
prompt ========================
prompt
create or replace function dukepu.isDate(dateStr varchar2,format varchar2)
return int AS
  p_date DATE;
  Result int;
begin

  SELECT TO_DATE(dateStr,format) INTO p_date
  FROM DUAL;

  Result:=1;

  RETURN Result;

  EXCEPTION
  WHEN OTHERS
  THEN

       RESULT:=0;
  return(Result);
end isDate;
/

prompt
prompt Creating function JUDGE_IF_RESTDAY
prompt ==================================
prompt
create or replace function dukepu.judge_If_RestDay(v_year_month_day varchar2) return int is
  ---大于99人，被认为是休息日。
  --返回1认为是休息日.
  ---返回0 认为是工作日。
  Result int;

begin
          SELECT COUNT(1) INTO Result
          FROM DUAL
          WHERE EXISTS(
                SELECT 1
                from Attendance_Record AR
                where (AR.Fpt_First_Time IS NOT NULL OR AR.Fpt_Last_Time IS NOT NULL)
                      AND trunc(AR.fingerprint_date,'DD') =to_date(v_year_Month_day,'yyyy-MM-dd')
                      having count(1) < 99
          );

  return(Result);
end judge_If_RestDay;
/

prompt
prompt Creating function ORA_ASPNET_APPS_CREATEAPP
prompt ===========================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Apps_CreateApp wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
14
2 :e:
1FUNCTION:
1ORA_ASPNET_APPS_CREATEAPP:
1APPLICATIONNAME_:
1NVARCHAR2:
1APPLICATIONID_:
1OUT:
1RAW:
1RETURN:
1INTEGER:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1NO_DATA_FOUND:
1IS NULL:
1SYS_GUID:
1APPLICATIONNAME:
1DUP_VAL_ON_INDEX:
10:
0

0
0
70
2
0 a0 8d 8f a0 b0 3d 96
:2 a0 b0 54 b4 :2 a0 2c 6a a0
ac :2 a0 b2 ee :2 a0 7e a0 a5
b b4 2e ac e5 d0 b2 e9
b7 a0 4f b7 a6 9 a4 b1
11 4f a0 7e b4 2e :2 a0 d
:8 a0 a5 b 5 d7 b2 5 e9
b7 :2 a0 ac :2 a0 b2 ee :2 a0 7e
a0 a5 b b4 2e ac e5 d0
b2 e9 b7 a6 9 a4 b1 11
4f b7 19 3c a0 51 65 b7
a4 a0 b1 11 68 4f 1d 17
b5
70
2
0 3 7 23 1f 1e 2b 3c
34 38 1b 43 33 48 4c 50
54 58 30 5c 60 64 65 6c
70 74 77 7b 7c 7e 7f 84
85 8b 8f 90 95 97 9b 9d
9f a0 a5 a9 ab b7 b9 bd
c0 c1 c6 ca ce d2 d6 da
de e2 e6 ea ee f2 f3 f5
f9 101 102 106 10b 10d 111 115
116 11a 11e 11f 126 12a 12e 131
135 136 138 139 13e 13f 145 149
14a 14f 151 152 157 15b 15d 169
16b 16d 171 174 178 17b 17f 181
185 189 18b 197 19b 19d 19e 1a7
70
2
0 1 a 1 18 :3 1 19 1f
:3 1 3 a :2 1 :2 c 1f a 5
a b 24 22 2a :2 24 :2 22 :5 5
3 a 7 18 :2 5 3 :3 1 :4 6
5 17 5 13 d 1c 2d 11
21 33 39 :2 33 10 :4 7 5 c
:2 10 23 e 9 e f 28 26
2e :2 28 :2 26 :5 9 1d :2 7 5 :4 1d
:3 3 a 3 :2 1 5 :7 1
70
4
0 :2 1 :4 3 :5 4
2 :2 5 :2 1 :3 a
:3 b :8 c b :4 a
9 e f :3 e
d :3 7 :4 13 :3 14
17 :3 18 :7 19 :4 17
16 1c :3 1d :3 1e
:8 1f 1e :4 1d :3 1c
1b :6 13 :3 23 :2 7
25 :7 1
1a9
4
:3 0 1 :3 0 2
:a 0 6b 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 a
:2 0 7 6 :3 0
7 :3 0 5 :6 0
a 9 :3 0 8
:3 0 9 :3 0 c
e 0 6b 2
f :2 0 a :3 0
5 :3 0 b :3 0
c 15 1e 0
1f :3 0 c :3 0
d :3 0 e :2 0
3 :3 0 e 18
1b 12 19 1d
:4 0 21 22 :5 0
12 16 0 15
0 20 :2 0 24
17 2c f :4 0
27 19 29 1b
28 27 :2 0 2a
1d :2 0 2c 0
2c 2b 24 2a
:6 0 66 1 :3 0
5 :3 0 10 :2 0
1f 2f 30 :3 0
5 :3 0 11 :3 0
32 33 0 60
b :3 0 a :3 0
12 :3 0 c :3 0
5 :3 0 3 :3 0
d :3 0 3 :3 0
21 3b 3d 23
:3 0 35 41 42
43 :4 0 27 2b
:4 0 40 :2 0 44
2d 5e 13 :3 0
a :3 0 2f 5
:3 0 b :3 0 31
4a 53 0 54
:3 0 c :3 0 d
:3 0 e :2 0 3
:3 0 33 4d 50
37 4e 52 :4 0
56 57 :5 0 47
4b 0 3a 0
55 :2 0 59 3c
5b 3e 5a 59
:2 0 5c 40 :2 0
5e 0 5e 5d
44 5c :6 0 60
1 :3 0 42 61
31 60 0 62
45 0 66 8
:3 0 14 :2 0 64
:2 0 66 47 6a
:3 0 6a 2 :4 0
6a 69 66 67
:6 0 6b :2 0 2
f 6a 6e :3 0
6d 6b 6f :8 0

4b
4
:3 0 1 3 1
7 2 6 b
1 11 1 14
1 1a 1 1c
2 17 1c 1
13 1 23 1
26 1 25 1
29 1 2e 1
3c 3 39 3a
3e 3 36 37
38 1 3f 1
43 1 46 1
49 1 4f 1
51 2 4c 51
1 48 1 58
1 45 1 5b
2 34 5e 1
61 3 2c 62
65
1
4
0
6e
0
1
14
3
3
0 1 1 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
2 0 1
7 1 0
3 1 0
0
/

prompt
prompt Creating function ORA_ASPNET_INDEXEXISTS
prompt ========================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_IndexExists wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
11
2 :e:
1FUNCTION:
1ORA_ASPNET_INDEXEXISTS:
1INDEXNAME_:
1NVARCHAR2:
1RETURN:
1INTEGER:
1CURSOR:
1TEMPCUR:
1USER_INDEXES:
1INDEX_NAME:
1=:
1TAB_REC:
1ROWTYPE:
1OPEN:
1NOTFOUND:
10:
11:
0

0
0
51
2
0 a0 8d 8f a0 b0 3d b4
:2 a0 2c 6a a0 f4 b4 bf c8
4d ac a0 b2 ee :2 a0 7e b4
2e ac d0 e5 e9 bd b7 11
a4 b1 a3 :2 a0 f 1c 81 b0
:2 a0 e9 dd b3 :2 a0 e9 d3 :2 a0
f 5a a0 51 65 b7 a0 51
65 b7 :2 19 3c b7 a4 b1 11
4f b7 a4 b1 11 68 4f 1d
17 b5
51
2
0 3 7 23 1f 1e 2b 1b
30 34 38 3c 40 44 55 56
59 5d 5e 5f 63 64 6b 6f
73 76 77 7c 7d 81 87 8c
91 93 9f a3 c3 a9 ad b1
b6 be a8 ca ce d2 d7 a5
db df e3 e8 ed f1 f5 fa
fd 101 104 108 10a 10e 111 115
117 11b 11f 122 124 128 12a 136
138 13a 13e 140 14c 150 152 153
15c
51
2
0 1 a 2 13 :2 2 :2 1 8
:2 1 7 e 0 :2 7 :2 20 2a 25
2a 3d 4a :3 48 25 :3 19 :5 7 2
a 12 :3 a 2 5 a :3 5 8
15 :2 2 9 13 9 8 9 10
9 1d 9 10 9 :4 5 :2 3 :c 1

51
4
0 :2 1 :4 3 2
:2 5 :2 1 :2 9 0
:15 9 :7 a :5 d :4 e
:4 10 :3 11 10 :3 13
12 :3 10 :2 c :5 7
:7 1
15e
4
:3 0 1 :3 0 2
:a 0 4c 1 :7 0
5 :2 0 3 4
:3 0 3 :7 0 5
4 :3 0 5 :3 0
6 :3 0 7 9
0 4c 2 a
:2 0 7 :3 0 8
:a 0 3 1f :5 0
d 10 0 e
:4 0 7 9 :3 0
9 14 1a 0
1b :3 0 a :3 0
3 :3 0 b :2 0
d 18 19 :5 0
12 15 0 1c
:6 0 1d :2 0 20
d 10 21 0
45 10 21 23
20 22 :6 0 1f
1 :6 0 21 :3 0
12 8 :3 0 d
:3 0 25 26 :3 0
27 :7 0 2a 28
0 45 0 c
:6 0 e :3 0 8
:4 0 2e :2 0 43
2c 2f :2 0 8
:3 0 c :4 0 33
:2 0 43 30 31
:3 0 8 :3 0 f
:3 0 34 35 :3 0
36 :2 0 5 :3 0
10 :2 0 39 :2 0
3b 14 40 5
:3 0 11 :2 0 3d
:2 0 3f 16 41
37 3b 0 42
0 3f 0 42
18 0 43 1b
46 :3 0 46 1f
46 45 43 44
:6 0 48 1 :3 0
22 4b :3 0 4b
0 4b 4a 48
49 :6 0 4c :2 0
2 a 4b 4f
:3 0 4e 4c 50
:8 0
24
4
:3 0 1 3 1
6 1 11 1
13 1 17 2
16 17 1 1e
1 24 1 3a
1 3e 2 40
41 3 2d 32
42 2 1f 29
1 46
1
4
0
4f
0
1
14
3
4
0 1 2 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
24 2 0
2 0 1
d 2 3
3 1 0
0
/

prompt
prompt Creating function ORA_ASPNET_MEM_CHANGEPWDQANDA
prompt ===============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Mem_ChangePwdQAndA wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
1e
2 :e:
1FUNCTION:
1ORA_ASPNET_MEM_CHANGEPWDQANDA:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAME_:
1NEWPASSWORDQUESTION:
1NEWPASSWORDANSWER:
1RETURN:
1INTEGER:
1M_USERID:
1RAW:
116:
1U:
1USERID:
1ORA_ASPNET_APPLICATIONS:
1A:
1ORA_ASPNET_USERS:
1ORA_ASPNET_MEMBERSHIP:
1M:
1LOWEREDUSERNAME:
1LOWER:
1=:
1LOWEREDAPPLICATIONNAME:
1APPLICATIONID:
1NO_DATA_FOUND:
1-:
11001:
1PASSWORDQUESTION:
1PASSWORDANSWER:
10:
0

0
0
8c
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d b4 :2 a0 2c 6a a3
a0 51 a5 1c 4d 81 b0 :2 a0
6b ac :3 a0 b9 :2 a0 b9 :2 a0 b9
b2 ee :2 a0 6b a0 7e a0 a5
b b4 2e :2 a0 6b a0 7e a0
6b b4 2e a 10 :2 a0 6b a0
7e a0 a5 b b4 2e a 10
:2 a0 6b a0 7e a0 6b b4 2e
a 10 ac e5 d0 b2 e9 b7
:2 a0 7e 51 b4 2e 65 b7 a6
9 a4 b1 11 4f :3 a0 e7 :2 a0
e7 :2 a0 7e b4 2e ef f9 e9
a0 51 65 b7 a4 a0 b1 11
68 4f 1d 17 b5
8c
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 5e
5a 30 66 59 6b 6f 73 77
92 7f 56 83 84 8c 8d 7e
99 9d 7b a1 a2 a6 aa ae
b0 b4 b8 ba be c2 c4 c5
cc d0 d4 d7 db de e2 e3
e5 e6 eb ef f3 f6 fa fd
101 104 105 1 10a 10f 113 117
11a 11e 121 125 126 128 129 1
12e 133 137 13b 13e 142 145 149
14c 14d 1 152 157 158 15e 162
163 168 16a 16e 172 175 178 179
17e 182 184 185 18a 18e 190 19c
19e 1a2 1a6 1aa 1ac 1b0 1b4 1b6
1ba 1be 1c1 1c2 1c7 1cd 1ce 1d3
1d7 1da 1de 1e0 1e4 1e8 1ea 1f6
1fa 1fc 1fd 206
8c
2
0 1 a 1 13 :3 1 d :3 1
19 :3 1 19 :3 1 3 a :3 1 b
f e b 16 b 1 c :2 e
c 1a b 23 b 26 37 26
3a 50 3a 5 :2 b :2 d 1f 1d
25 :2 1f :2 1d b :2 d 16 14 :2 18
:2 14 :3 b :2 d 26 24 2c :2 26 :2 24
:3 b :2 d 1d 1b :2 1f :2 1b :2 b :5 5
3 a 7 e f :2 e 7 18
:2 5 3 :3 1 :2 a 1d :2 a 1b :2 a
13 :3 11 :4 3 a 3 :2 1 5 :7 1

8c
4
0 :2 1 :4 3 :4 4
:4 5 :4 6 2 :2 7
:2 1 :8 9 :5 f :b 10
:a 11 :9 12 :2 11 :a 13
:2 11 :9 14 :2 11 10
:4 f e 16 :6 17
:3 16 15 :3 c 1b
:3 1c :3 1d :5 1e :3 1b
:3 20 :2 c 22 :7 1

208
4
:3 0 1 :3 0 2
:a 0 87 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
56 0 7 4
:3 0 5 :7 0 9
8 :3 0 4 :3 0
6 :7 0 d c
:3 0 c :2 0 b
4 :3 0 7 :7 0
11 10 :3 0 8
:3 0 9 :3 0 13
15 0 87 2
16 :2 0 20 21
0 12 b :3 0
10 19 1b :7 0
1f 1c 1d 85
0 a :6 0 d
:3 0 e :3 0 14
a :3 0 f :3 0
10 :3 0 25 26
11 :3 0 d :3 0
28 29 12 :3 0
13 :3 0 2b 2c
16 2e 5b 0
5c :3 0 d :3 0
14 :3 0 30 31
0 15 :3 0 16
:2 0 5 :3 0 1a
33 36 1e 34
38 :3 0 d :3 0
e :3 0 3a 3b
0 13 :3 0 16
:2 0 e :3 0 3d
3f 0 23 3e
41 :3 0 39 43
42 :2 0 10 :3 0
17 :3 0 45 46
0 15 :3 0 16
:2 0 3 :3 0 26
48 4b 2a 49
4d :3 0 44 4f
4e :2 0 10 :3 0
18 :3 0 51 52
0 d :3 0 16
:2 0 18 :3 0 54
56 0 2f 55
58 :3 0 50 5a
59 :3 0 5e 5f
:5 0 23 2f 0
32 0 5d :2 0
61 34 6e 19
:3 0 8 :3 0 1a
:2 0 1b :2 0 36
64 66 :3 0 67
:2 0 69 38 6b
3a 6a 69 :2 0
6c 3c :2 0 6e
0 6e 6d 61
6c :6 0 82 1
:3 0 12 :3 0 1c
:3 0 6 :3 0 71
72 1d :3 0 7
:3 0 74 75 e
:3 0 a :3 0 16
:2 0 40 79 7a
:3 0 70 7d 7b
0 7e 0 43
0 7c :2 0 82
8 :3 0 1e :2 0
80 :2 0 82 46
86 :3 0 86 2
:3 0 4a 86 85
82 83 :6 0 87
:2 0 2 16 86
8a :3 0 89 87
8b :8 0
4c
4
:3 0 1 3 1
7 1 b 1
f 4 6 a
e 12 1 1a
1 18 1 22
3 27 2a 2d
1 35 1 37
2 32 37 1
40 2 3c 40
1 4a 1 4c
2 47 4c 1
57 2 53 57
1 24 1 60
1 65 1 68
1 62 1 6b
1 78 2 77
78 2 73 76
3 6e 7e 81
1 1e
1
4
0
8a
0
1
14
2
6
0 1 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
7 1 0
b 1 0
2 0 1
f 1 0
18 1 0
3 1 0
0
/

prompt
prompt Creating function ORA_ASPNET_USERS_CREATEUSER
prompt =============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Users_CreateUser wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
1b
2 :e:
1FUNCTION:
1ORA_ASPNET_USERS_CREATEUSER:
1APPLICATIONID_:
1RAW:
1USERNAME_:
1NVARCHAR2:
1ISUSERANONYMOUS:
1INTEGER:
1LASTACTIVITYDATE_:
1DATE:
1USERID_:
1OUT:
1RETURN:
1IS NULL:
1SYS_GUID:
1ORA_ASPNET_USERS:
1APPLICATIONID:
1USERID:
1USERNAME:
1LOWEREDUSERNAME:
1ISANONYMOUS:
1LASTACTIVITYDATE:
1LOWER:
1DUP_VAL_ON_INDEX:
1-:
11010:
10:
0

0
0
58
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 90 :2 a0 b0 3f b4
:2 a0 2c 6a a0 7e b4 2e :2 a0
d b7 19 3c :c a0 a5 b :2 a0
5 d7 b2 5 e9 b7 :2 a0 7e
51 b4 2e 65 b7 a6 9 a4
b1 11 4f a0 51 65 b7 a4
a0 b1 11 68 4f 1d 17 b5
58
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 5e
5a 30 66 73 6b 6f 59 7a
56 7f 83 87 8b 8f 93 96
97 9c a0 a4 a8 aa ae b1
b5 b9 bd c1 c5 c9 cd d1
d5 d9 dd e1 e2 e4 e8 ec
f0 f8 f9 fd 102 104 108 10c
10f 112 113 118 11c 11e 11f 124
128 12a 136 138 13c 13f 143 145
149 14d 14f 15b 15f 161 162 16b
58
2
0 1 a 1 18 :3 1 1b :3 1
1a :3 1 1b :3 1 18 20 :3 1 3
a :2 1 :4 6 5 12 5 16 :2 3
11 :6 a d 1d 26 31 37 :2 31
f 20 c :4 5 3 a 7 e
f :2 e 7 1b :2 5 3 :3 1 3
a 3 :2 1 5 :7 1
58
4
0 :2 1 :4 3 :4 4
:4 5 :4 6 :5 7 2
:2 8 :2 1 :4 c :3 d
:3 c 11 12 13
14 15 16 17
:7 18 :2 19 18 :4 11
10 1b :6 1c :3 1b
1a :3 a :3 1f :2 a
21 :7 1
16d
4
:3 0 1 :3 0 2
:a 0 53 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
56 0 7 6
:3 0 5 :7 0 9
8 :3 0 8 :3 0
7 :7 0 d c
:3 0 d :2 0 b
a :3 0 9 :7 0
11 10 :3 0 c
:3 0 4 :3 0 b
:6 0 16 15 :3 0
d :3 0 8 :3 0
18 1a 0 53
2 1b :2 0 b
:3 0 e :2 0 13
1e 1f :3 0 b
:3 0 f :3 0 21
22 0 24 15
25 20 24 0
26 17 0 4e
10 :3 0 11 :3 0
12 :3 0 13 :3 0
14 :3 0 15 :3 0
16 :3 0 3 :3 0
b :3 0 5 :3 0
17 :3 0 5 :3 0
19 31 33 7
:3 0 9 :3 0 1b
:3 0 27 39 3a
3b :4 0 22 29
:4 0 38 :2 0 3c
2b 49 18 :3 0
d :3 0 19 :2 0
1a :2 0 2d 3f
41 :3 0 42 :2 0
44 2f 46 31
45 44 :2 0 47
33 :2 0 49 0
49 48 3c 47
:6 0 4e 1 :3 0
d :3 0 1b :2 0
4c :2 0 4e 35
52 :3 0 52 2
:4 0 52 51 4e
4f :6 0 53 :2 0
2 1b 52 56
:3 0 55 53 57
:8 0
39
4
:3 0 1 3 1
7 1 b 1
f 1 13 5
6 a e 12
17 1 1d 1
23 1 25 1
32 6 2e 2f
30 34 35 36
6 28 29 2a
2b 2c 2d 1
37 1 3b 1
40 1 43 1
3d 1 46 3
26 49 4d
1
4
0
56
0
1
14
2
6
0 1 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
7 1 0
b 1 0
2 0 1
f 1 0
13 1 0
3 1 0
0
/

prompt
prompt Creating function ORA_ASPNET_MEM_CREATEUSER
prompt ===========================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Mem_CreateUser wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
4d
2 :e:
1FUNCTION:
1ORA_ASPNET_MEM_CREATEUSER:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAME_:
1PASSWORD_:
1PASSWORDSALT_:
1EMAIL_:
1PASSWORDQUESTION_:
1PASSWORDANSWER_:
1ISAPPROVED_:
1INTEGER:
1CURRENTTIMEUTC:
1DATE:
1CREATEDATE_:
1UNIQUEEMAIL:
1PASSWORDFORMAT_:
1USERID_:
1OUT:
1RAW:
1RETURN:
1M_APPLICATIONID:
116:
1M_USERID:
1M_RETURNVALUE:
1M_COUNT:
1M_NEWUSERCREATED:
1M_DATE:
10:
1-:
11011:
1ORA_ASPNET_APPS_CREATEAPP:
1OTHERS:
1ROLLBACK:
1ROLLBACK_NR:
1!=:
1USERID:
1ORA_ASPNET_USERS:
1LOWEREDUSERNAME:
1LOWER:
1=:
1APPLICATIONID:
1NO_DATA_FOUND:
1IS NULL:
1ORA_ASPNET_USERS_CREATEUSER:
1IS NOT NULL:
11006:
12000:
11:
1COUNT:
1DUAL:
1ORA_ASPNET_MEMBERSHIP:
1LOWEREDEMAIL:
1EXISTS:
1>:
11007:
1LASTACTIVITYDATE:
1TO_DATE:
101-01-1754:
1DD-MM-RRRR:
1PASSWORD:
1PASSWORDSALT:
1EMAIL:
1PASSWORDQUESTION:
1PASSWORDANSWER:
1PASSWORDFORMAT:
1ISAPPROVED:
1ISLOCKEDOUT:
1CREATEDATE:
1LASTLOGINDATE:
1LASTPASSWORDCHANGEDDATE:
1LASTLOCKOUTDATE:
1FAILEDPWDATTEMPTCOUNT:
1FAILEDPWDATTEMPTWINSTART:
1FAILEDPWDANSWERATTEMPTCOUNT:
1FAILEDPWDANSWERATTEMPTWINSTART:
1DUP_VAL_ON_INDEX:
0

0
0
1e2
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 90 :2 a0 b0 3f b4
:2 a0 2c 6a a3 a0 51 a5 1c
4d 81 b0 a3 a0 51 a5 1c
4d 81 b0 a3 a0 1c 81 b0
a3 a0 1c 81 b0 a3 a0 1c
81 b0 a3 a0 1c 4d 81 b0
a0 51 d a0 51 d a0 7e
51 b4 2e d :4 a0 a5 b d
b7 a0 53 a0 57 a0 b4 e9
a0 7e 51 b4 2e 65 b7 a6
9 a4 b1 11 4f a0 7e 51
b4 2e a0 57 a0 b4 e9 a0
7e 51 b4 2e 65 b7 19 3c
a0 ac :2 a0 b2 ee :2 a0 7e a0
a5 b b4 2e :2 a0 7e b4 2e
a 10 ac e5 d0 b2 e9 b7
a0 4f b7 a6 9 a4 b1 11
4f a0 51 d a0 7e b4 2e
:2 a0 d :4 a0 51 :2 a0 a5 b d
b7 a0 53 a0 57 a0 b4 e9
a0 7e 51 b4 2e 65 b7 a6
9 a4 b1 11 4f b7 :2 a0 7e
b4 2e 5a a0 7e b4 2e 5a
a 10 a0 57 a0 b4 e9 a0
7e 51 b4 2e 65 b7 19 3c
b7 :2 19 3c a0 7e 51 b4 2e
a0 57 a0 b4 e9 a0 :2 7e 51
b4 2e b4 2e a0 7e 51 b4
2e 65 b7 :2 a0 65 b7 :2 19 3c
b7 a0 51 d b7 :2 19 3c :2 a0
d a0 7e 51 b4 2e a0 d2
9f ac :2 a0 b2 ee a0 ac a0
b2 ee :2 a0 7e b4 2e :2 a0 7e
a0 a5 b b4 2e a 10 ac
d0 eb 7e b4 2e ac e5 d0
b2 e9 a0 7e 51 b4 2e a0
57 a0 b4 e9 a0 7e 51 b4
2e 65 b7 19 3c b7 19 3c
a0 7e 51 b4 2e :3 a0 e7 :2 a0
7e b4 2e ef f9 e9 b7 19
3c :2 a0 :2 6e a5 b d :1b a0 a5
b :4 a0 51 :4 a0 51 a0 51 a0
5 d7 b2 5 e9 b7 :2 a0 57
a0 b4 e9 a0 7e 51 b4 2e
65 b7 a6 9 a4 b1 11 4f
a0 51 65 b7 a4 a0 b1 11
68 4f 1d 17 b5
1e2
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 5e
5a 30 66 6f 6b 59 77 84
80 56 8c 95 91 7f 9d aa
a6 7c b2 bb b7 a5 c3 d0
cc a2 d8 e1 dd cb e9 f6
f2 c8 fe 10b 103 107 f1 112
ee 117 11b 11f 123 141 12b 12f
132 133 13b 13c 12a 15f 14c 127
150 151 159 15a 14b 17b 16a 16e
176 148 193 182 186 18e 169 1af
19e 1a2 1aa 166 1c8 1b6 1ba 1c2
1c3 19d 1cf 19a 1d3 1d7 1db 1de
1e2 1e6 1e9 1ec 1ed 1f2 1f6 1fa
1fe 202 206 207 209 20d 20f 1
213 217 21c 220 221 226 22a 22d
230 231 236 23a 23c 23d 242 246
248 254 256 25a 25d 260 261 266
26a 26f 273 274 279 27d 280 283
284 289 28d 28f 293 296 29a 29b
29f 2a3 2a4 2ab 2af 2b3 2b6 2ba
2bb 2bd 2be 2c3 2c7 2cb 2ce 2cf
1 2d4 2d9 2da 2e0 2e4 2e5 2ea
2ec 2f0 2f2 2f4 2f5 2fa 2fe 300
30c 30e 312 315 319 31d 320 321
326 32a 32e 332 336 33a 33e 342
345 349 34d 34e 350 354 356 1
35a 35e 363 367 368 36d 371 374
377 378 37d 381 383 384 389 38d
38f 39b 39d 39f 3a3 3a7 3aa 3ab
3b0 3b3 3b7 3ba 3bb 3c0 1 3c3
3c8 3cc 3d1 3d5 3d6 3db 3df 3e2
3e5 3e6 3eb 3ef 3f1 3f5 3f8 3fa
3fe 402 405 409 40c 40f 410 415
419 41e 422 423 428 42c 42f 432
435 436 43b 43c 441 445 448 44b
44c 451 455 457 45b 45f 463 465
469 46d 470 472 476 479 47d 47f
483 487 48a 48e 492 496 49a 49d
4a0 4a1 4a6 4aa 4ae 4b1 4b2 4b6
4ba 4bb 4c2 4c6 4c7 4cb 4cc 4d3
4d7 4db 4de 4df 4e4 4e8 4ec 4ef
4f3 4f4 4f6 4f7 1 4fc 501 502
506 50a 50d 50e 513 514 51a 51e
51f 524 528 52b 52e 52f 534 538
53d 541 542 547 54b 54e 551 552
557 55b 55d 561 564 566 56a 56d
571 574 577 57
/

prompt
prompt Creating function ORA_ASPNET_MEM_DELETEUSER
prompt ===========================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Mem_DeleteUser wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
1d
2 :e:
1FUNCTION:
1ORA_ASPNET_MEM_DELETEUSER:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAME_:
1TABLESTODELETEFROM:
1INTEGER:
1NUMTABLESDELETEDFROM:
1OUT:
1RETURN:
1M_USERID:
1RAW:
116:
1U:
1USERID:
1ORA_ASPNET_APPLICATIONS:
1A:
1ORA_ASPNET_USERS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1APPLICATIONID:
1LOWEREDUSERNAME:
1NO_DATA_FOUND:
10:
1ORA_ASPNET_MEMBERSHIP:
1ROWCOUNT:
1>:
11:
0

0
0
81
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 90
:2 a0 b0 3f b4 :2 a0 2c 6a a3
a0 51 a5 1c 4d 81 b0 :2 a0
6b ac :3 a0 b9 :2 a0 b9 b2 ee
:2 a0 6b a0 7e a0 a5 b b4
2e :2 a0 6b a0 7e a0 6b b4
2e a 10 :2 a0 6b a0 7e a0
a5 b b4 2e a 10 ac e5
d0 b2 e9 b7 :2 a0 51 65 b7
a6 9 a4 b1 11 4f :3 a0 7e
b4 2e cd e9 a0 f 7e 51
b4 2e a0 51 d b7 19 3c
a0 51 65 b7 a4 a0 b1 11
68 4f 1d 17 b5
81
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 62
5a 5e 30 69 59 6e 72 76
7a 95 82 56 86 87 8f 90
81 9c a0 7e a4 a5 a9 ad
b1 b3 b7 bb bd be c5 c9
cd d0 d4 d7 db dc de df
e4 e8 ec ef f3 f6 fa fd
fe 1 103 108 10c 110 113 117
11a 11e 11f 121 122 1 127 12c
12d 133 137 138 13d 13f 143 147
14a 14e 150 151 156 15a 15c 168
16a 16e 172 176 179 17a 17f 184
189 18d 192 195 198 199 19e 1a2
1a5 1a9 1ab 1af 1b2 1b6 1b9 1bd
1bf 1c3 1c7 1c9 1d5 1d9 1db 1dc
1e5
81
2
0 1 a 1 15 :3 1 15 :3 1
16 :3 1 1b 20 :3 1 3 a :3 1
e 12 11 e 19 e 1 a
:2 c a 18 a 22 a 25 36
25 3 :2 a :2 c 25 23 2b :2 25
:2 23 a :2 c 1c 1a :2 1e :2 1a :3 a
:2 c 1e 1c 24 :2 1e :2 1c :2 a :6 3
a 7 e 7 18 :2 5 3 :3 1
f 2b 34 :3 32 :2 3 a 6 13
15 :2 13 5 1d 5 17 :3 3 a
3 :2 1 5 :7 1
81
4
0 :2 1 :4 3 :4 4
:4 5 :5 6 2 :2 7
:2 1 :8 9 :5 e :8 f
:a 10 :9 11 :2 10 :a 12
:2 10 f :4 e d
14 :3 15 :3 14 13
:3 b :8 18 :6 19 :3 1a
:3 19 :3 1d :2 b 1e
:7 1
1e7
4
:3 0 1 :3 0 2
:a 0 7c 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
56 0 7 4
:3 0 5 :7 0 9
8 :3 0 7 :3 0
6 :7 0 d c
:3 0 d :2 0 b
9 :3 0 7 :3 0
8 :6 0 12 11
:3 0 a :3 0 7
:3 0 14 16 0
7c 2 17 :2 0
21 22 0 12
c :3 0 10 1a
1c :7 0 20 1d
1e 7a 0 b
:6 0 e :3 0 f
:3 0 14 b :3 0
10 :3 0 11 :3 0
26 27 12 :3 0
e :3 0 29 2a
16 2c 4e 0
4f :3 0 11 :3 0
13 :3 0 2e 2f
0 14 :3 0 15
:2 0 3 :3 0 19
31 34 1d 32
36 :3 0 e :3 0
16 :3 0 38 39
0 11 :3 0 15
:2 0 16 :3 0 3b
3d 0 22 3c
3f :3 0 37 41
40 :2 0 e :3 0
17 :3 0 43 44
0 14 :3 0 15
:2 0 5 :3 0 25
46 49 29 47
4b :3 0 42 4d
4c :3 0 51 52
:5 0 24 2d 0
2c 0 50 :2 0
54 2e 5e 18
:3 0 a :3 0 19
:2 0 57 :2 0 59
30 5b 32 5a
59 :2 0 5c 34
:2 0 5e 0 5e
5d 54 5c :6 0
77 1 :3 0 1a
:3 0 f :3 0 b
:3 0 15 :2 0 38
63 64 :3 0 60
65 0 67 :2 0
66 :2 0 77 1b
:4 0 68 :3 0 1c
:2 0 19 :2 0 3d
6a 6c :3 0 8
:3 0 1d :2 0 6e
6f 0 71 40
72 6d 71 0
73 42 0 77
a :3 0 19 :2 0
75 :2 0 77 44
7b :3 0 7b 2
:3 0 49 7b 7a
77 78 :6 0 7c
:2 0 2 17 7b
7f :3 0 7e 7c
80 :8 0
4b
4
:3 0 1 3 1
7 1 b 1
f 4 6 a
e 13 1 1b
1 19 1 23
2 28 2b 1
33 1 35 2
30 35 1 3e
2 3a 3e 1
48 1 4a 2
45 4a 1 25
1 53 1 58
1 55 1 5b
1 62 2 61
62 1 6b 2
69 6b 1 70
1 72 4 5e
67 73 76 1
1f
1
4
0
7f
0
1
14
2
6
0 1 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
2 0 1
7 1 0
b 1 0
19 1 0
f 1 0
3 1 0
0
/

prompt
prompt Creating function ORA_ASPNET_MEM_FINDUSERSBYEML
prompt ===============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Mem_FindUsersByEml wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
45
2 :e:
1FUNCTION:
1ORA_ASPNET_MEM_FINDUSERSBYEML:
1APPLICATIONNAME_:
1NVARCHAR2:
1EMAILTOMATCH:
1PAGEINDEX:
1INTEGER:
1PAGESIZE:
1OUTREFCURSOR:
1OUT:
1SYS_REFCURSOR:
1USERNAME_:
1EMAIL_:
1PASSWORDQUESTION_:
1COMMENTS_:
1NCLOB:
1ISAPPROVED_:
1CREATEDATE_:
1DATE:
1LASTLOGINDATE_:
1LASTACTIVITYDATE_:
1LASTPASSWORDCHANGEDDATE_:
1ISLOCKEDOUT_:
1LASTLOCKOUTDATE_:
1USERID_:
1RAW:
1RETURN:
1M_APPLICATIONID:
116:
1M_TOTALRECORDS:
1M_PAGELOWERBOUND:
1M_PAGEUPPERBOUND:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1NO_DATA_FOUND:
10:
1IS NOT NULL:
1COUNT:
1ORA_ASPNET_MEMBERSHIP:
1M:
1ORA_ASPNET_USERS:
1U:
1LOWEREDEMAIL:
1LIKE:
1USERID:
11:
1USERNAME:
1EMAIL:
1PASSWORDQUESTION:
1COMMENTS:
1ISAPPROVED:
1CREATEDATE:
1LASTLOGINDATE:
1LASTACTIVITYDATE:
1LASTPASSWORDCHANGEDDATE:
1ISLOCKEDOUT:
1LASTLOCKOUTDATE:
1>:
1*:
1+:
1-:
1OPEN:
1ROWNUM:
1RN:
1<=:
1IS NULL:
0

0
0
31d
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 b4
:2 a0 2c 6a a3 a0 51 a5 1c
4d 81 b0 a3 a0 1c 81 b0
a3 a0 1c 81 b0 a3 a0 1c
81 b0 a0 ac :2 a0 b2 ee :2 a0
7e a0 a5 b b4 2e ac e5
d0 b2 e9 b7 :2 a0 51 65 b7
a6 9 a4 b1 11 4f a0 7e
b4 2e a0 d2 9f ac :3 a0 b9
:2 a0 b9 b2 ee :2 a0 6b 7e :2 a0
a5 b b4 2e :2 a0 6b a0 7e
b4 2e a 10 :2 a0 6b a0 7e
a0 6b b4 2e a 10 ac :2 a0
6b de ac e5 d0 b2 e9 b7
:2 a0 51 65 b7 a6 9 a4 b1
11 4f a0 7e 51 b4 2e a0
7e 51 b4 2e a 10 :2 a0 6b
:2 a0 6b :2 a0 6b :2 a0 6b :2 a0 6b
:2 a0 6b :2 a0 6b :2 a0 6b :2 a0 6b
:2 a0 6b :2 a0 6b :2 a0 6b ac :e a0
b9 :2 a0 b9 b2 ee :2 a0 6b 7e
:2 a0 a5 b b4 2e :2 a0 6b a0
7e b4 2e a 10 :2 a0 6b a0
7e a0 6b b4 2e a 10 ac
:2 a0 6b de ac e5 d0 b2 e9
b7 19 3c a0 7e 51 b4 2e
:2 a0 7e a0 b4 2e d :2 a0 7e
51 b4 2e d :2 a0 7e 51 b4
2e 5a 7e a0 b4 2e d :2 a0
ac :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 b9 ac :2 a0 b9 :2 a0 b9
b2 ee :2 a0 6b 7e :2 a0 a5 b
b4 2e :2 a0 6b a0 7e b4 2e
a 10 :2 a0 6b a0 7e a0 6b
b4 2e a 10 :2 a0 7e b4 2e
a 10 ac d0 :2 a0 6b de ac
eb b2 ee a0 3e :2 a0 48 63
ac e5 d0 b2 :2 e9 dd b7 19
3c b7 a0 d2 9f ac :3 a0 b9
:2 a0 b9 b2 ee :2 a0 6b a0 7e
b4 2e :2 a0 6b a0 7e a0 6b
b4 2e a 10 :2 a0 6b 7e b4
2e a 10 ac :2 a0 6b de ac
e5 d0 b2 e9 b7 :2 a0 51 65
b7 a6 9 a4 b1 11 4f a0
7e 51 b4 2e a0 7e 51 b4
2e a 10 :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b ac :e a0 b9 :2 a0 b9
b2 ee :2 a0 6b a0 7e b4 2e
:2 a0 6b a0 7e a0 6b b4 2e
a 10 :2 a0 6b 7e b4 2e a
10 ac :2 a0 6b de ac e5 d0
b2 e9 b7 19 3c a0 7e 51
b4 2e :2 a0 7e a0 b4 2e d
:2 a0 7e 51 b4 2e d :2 a0 7e
51 b4 2e 5a 7e a0 b4 2e
d :2 a0 ac :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 b9 ac :2 a0 b9
:2 a0 b9 b2 ee :2 a0 6b a0 7e
b4 2e :2 a0 6b a0 7e a0 6b
b4 2e a 10 :2 a0 6b 7e b4
2e a 10 :2 a0 7e b4 2e a
10 ac d0 :2 a0 6b de ac eb
b2 ee a0 3e :2 a0 48 63 ac
e5 d0 b2 :2 e9 dd b7 19 3c
b7 :2 19 3c :2 a0 65 b7 a4 a0
b1 11 68 4f 1d 17 b5
31d
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 5e
5a 30 66 73 6b 6f 59 7a
8b 83 87 56 92 9f 97 9b
82 a6 b7 af b3 7f be cb
c3 c7 ae d2 e3 db df ab
ea f7 ef f3 da fe 10f 107
10b d7 116 123 11b 11f 106 12a
13b 133 137 103 142 14f 147 14b
132 156 167 15f 163 12f 16e 17b
173 177 15e 182 15b 187 18b 18f
193 1b1 19b 19f 1a2 1a3 1ab 1ac
19a 1cd 1bc 1c0 1c8 197 1e5 1d4
1d8 1e0 1bb 201 1f0 1f4 1fc 1b8
1ec 208 209 20d 211 212 219 21d
221 224 228 229 22b 22c 231 232
238 23c 23d 242 244 248 24c 24f
253 255 256 25b 25f 261 26d 26f
273 276 277 27c 280 284 287 288
28c 290 294 296 29a 29e 2a0 2a1
2a8 2ac 2b0 2b3 2b6 2ba 2be 2bf
2c1 2c2 2c7 2cb 2cf 2d2 2d6 2d9
2da 1 2df 2e4 2e8
/

prompt
prompt Creating function ORA_ASPNET_MEM_FINDUSERSBYNAME
prompt ================================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Mem_FindUsersByName wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
43
2 :e:
1FUNCTION:
1ORA_ASPNET_MEM_FINDUSERSBYNAME:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAMETOMATCH:
1PAGEINDEX:
1INTEGER:
1PAGESIZE:
1OUTREFCURSOR:
1OUT:
1SYS_REFCURSOR:
1USERNAME_:
1EMAIL_:
1PASSWORDQUESTION_:
1COMMENTS_:
1NCLOB:
1ISAPPROVED_:
1CREATEDATE_:
1DATE:
1LASTLOGINDATE_:
1LASTACTIVITYDATE_:
1LASTPASSWORDCHANGEDDATE_:
1ISLOCKEDOUT_:
1LASTLOCKOUTDATE_:
1USERID_:
1RAW:
1RETURN:
1M_APPLICATIONID:
116:
1M_TOTALRECORDS:
1M_PAGELOWERBOUND:
1M_PAGEUPPERBOUND:
10:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1NO_DATA_FOUND:
1COUNT:
1ORA_ASPNET_USERS:
1U:
1ORA_ASPNET_MEMBERSHIP:
1M:
1LOWEREDUSERNAME:
1LIKE:
1USERID:
1USERNAME:
11:
1EMAIL:
1PASSWORDQUESTION:
1COMMENTS:
1ISAPPROVED:
1CREATEDATE:
1LASTLOGINDATE:
1LASTACTIVITYDATE:
1LASTPASSWORDCHANGEDDATE:
1ISLOCKEDOUT:
1LASTLOCKOUTDATE:
1>:
1*:
1+:
1-:
1OPEN:
1ROWNUM:
1RN:
1<=:
0

0
0
1e7
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 b4
:2 a0 2c 6a a3 a0 51 a5 1c
4d 81 b0 a3 a0 1c 81 b0
a3 a0 1c 81 b0 a3 a0 1c
81 b0 a0 51 d a0 51 d
a0 51 d a0 ac :2 a0 b2 ee
:2 a0 7e a0 a5 b b4 2e ac
e5 d0 b2 e9 b7 :2 a0 51 65
b7 a6 9 a4 b1 11 4f a0
d2 9f ac :3 a0 b9 :2 a0 b9 b2
ee :2 a0 6b 7e :2 a0 a5 b b4
2e :2 a0 6b a0 7e b4 2e a
10 :2 a0 6b a0 7e a0 6b b4
2e a 10 ac :2 a0 6b de ac
e5 d0 b2 e9 b7 :2 a0 51 65
b7 a6 9 a4 b1 11 4f a0
7e 51 b4 2e a0 7e 51 b4
2e a 10 :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b ac :e a0 b9 :2 a0 b9
b2 ee :2 a0 6b 7e :2 a0 a5 b
b4 2e :2 a0 6b a0 7e b4 2e
a 10 :2 a0 6b a0 7e a0 6b
b4 2e a 10 ac :2 a0 6b de
ac e5 d0 b2 e9 b7 19 3c
a0 7e 51 b4 2e :2 a0 7e a0
b4 2e d :2 a0 7e 51 b4 2e
d :2 a0 7e 51 b4 2e 5a 7e
a0 b4 2e d :2 a0 ac :2 a0 6b
:2 a0 6b :2 a0 6b :2 a0 6b :2 a0 6b
:2 a0 6b :2 a0 6b :2 a0 6b :2 a0 6b
:2 a0 6b :2 a0 6b :2 a0 6b :2 a0 b9
ac :2 a0 b9 :2 a0 b9 b2 ee :2 a0
6b 7e :2 a0 a5 b b4 2e :2 a0
6b a0 7e b4 2e a 10 :2 a0
6b a0 7e a0 6b b4 2e a
10 :2 a0 7e b4 2e a 10 ac
d0 :2 a0 6b de ac eb b2 ee
a0 3e :2 a0 48 63 ac e5 d0
b2 :2 e9 dd b7 19 3c :2 a0 65
b7 a4 a0 b1 11 68 4f 1d
17 b5
1e7
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 5e
5a 30 66 73 6b 6f 59 7a
8b 83 87 56 92 9f 97 9b
82 a6 b7 af b3 7f be cb
c3 c7 ae d2 e3 db df ab
ea f7 ef f3 da fe 10f 107
10b d7 116 123 11b 11f 106 12a
13b 133 137 103 142 14f 147 14b
132 156 167 15f 163 12f 16e 17b
173 177 15e 182 15b 187 18b 18f
193 1b1 19b 19f 1a2 1a3 1ab 1ac
19a 1cd 1bc 1c0 1c8 197 1e5 1d4
1d8 1e0 1bb 201 1f0 1f4 1fc 1b8
1ec 208 20b 20f 213 216 21a 21e
221 225 229 22a 22e 232 233 23a
23e 242 245 249 24a 24c 24d 252
253 259 25d 25e 263 265 269 26d
270 274 276 277 27c 280 282 28e
290 294 298 29b 29c 2a0 2a4 2a8
2aa 2ae 2b2 2b4 2b5 2bc 2c0 2c4
2c7 2ca 2ce 2d2 2d3 2d5 2d6 2db
2df 2e3 2e6 2ea 2ed 2ee 1 2f3
2f8 2fc 300 303 307 30a 30e 311
312 1 317 31c 31d 321 325 328
32a 32b 331 335 336 33b 33d 341
345 348 34c 34e 34f 354 358 35a
366 368 36c 36f 372 373 378 37c
37f 382 383 1 388 38d 391 395
398 39c 3a0 3a3 3a7 3ab 3ae 3b2
3b6 3b9 3bd 3c1 3c4 3c8 3cc 3cf
3d3 3d7 3da 3de 3e2 3e5 3e9 3ed
3f0 3f4 3f8 3fb 3ff 403 406 40a
40e 411 412 416 41a 41e 422 426
42a 42e 432 436 43a 43e 442 446
44a 44c 450 454 456 457 45e 462
466 469 46c 470 474 475 477 478
47d 481 485 488 48c 48f 490 1
495 49a 49e 4a2 4a5 4a9 4ac 4b0
4b3 4b4 1 4b9 4be 4bf 4c3 4c7
4ca 4cc 4cd 4d3 4d7 4d8 4dd 4df
4e3 4e6 4ea 4ed 4f0 4f1 4f6 4fa
4fe 501 505 506 50b 50f 513 517
51a 51d 51e 523 527 52b 52f 532
535 536 53b 53e 541 545 546 54b
54f 553 557 558 55c 560 563 567
56b 56e 572 576 579 57d 581 584
588 58c 58f 593 597 59a 59e 5a2
5a5 5a9 5ad 5b0 5b4 5b8 5bb 5bf
5c3 5c6 5ca 5ce 5d1 5d5 5d9 5dc
5e0 5e4 5e6 5e7 5eb 5ef 5f1 5f
/

prompt
prompt Creating function ORA_ASPNET_MEM_GETALLUSERS
prompt ============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Mem_GetAllUsers wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
33
2 :e:
1FUNCTION:
1ORA_ASPNET_MEM_GETALLUSERS:
1APPLICATIONNAME_:
1NVARCHAR2:
1PAGEINDEX:
1INTEGER:
1PAGESIZE:
1OUTREFCURSOR:
1OUT:
1SYS_REFCURSOR:
1RETURN:
1M_APPLICATIONID:
1RAW:
116:
1M_TOTALRECORDS:
1M_PAGELOWERBOUND:
1M_PAGEUPPERBOUND:
10:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1NO_DATA_FOUND:
1-:
11012:
1COUNT:
1ORA_ASPNET_MEMBERSHIP:
1M:
1ORA_ASPNET_USERS:
1U:
1USERID:
1USERNAME:
1>:
1*:
1+:
11:
1OPEN:
1EMAIL:
1PASSWORDQUESTION:
1COMMENTS:
1ISAPPROVED:
1CREATEDATE:
1LASTLOGINDATE:
1LASTACTIVITYDATE:
1LASTPASSWORDCHANGEDDATE:
1ISLOCKEDOUT:
1LASTLOCKOUTDATE:
1ROWNUM:
1RN:
1<=:
0

0
0
122
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 96
:2 a0 b0 54 b4 :2 a0 2c 6a a3
a0 51 a5 1c 4d 81 b0 a3
a0 1c 81 b0 a3 a0 1c 81
b0 a3 a0 1c 81 b0 a0 51
d a0 51 d a0 51 d a0
ac :2 a0 b2 ee :2 a0 7e a0 a5
b b4 2e ac e5 d0 b2 e9
b7 :2 a0 7e 51 b4 2e 65 b7
a6 9 a4 b1 11 4f a0 d2
9f ac :3 a0 b9 :2 a0 b9 b2 ee
:2 a0 6b a0 7e b4 2e :2 a0 6b
a0 7e a0 6b b4 2e a 10
ac :2 a0 6b de ac e5 d0 b2
e9 b7 :2 a0 51 65 b7 a6 9
a4 b1 11 4f a0 7e 51 b4
2e :2 a0 7e a0 b4 2e d :2 a0
7e 51 b4 2e d :2 a0 7e 51
b4 2e 5a 7e a0 b4 2e d
:2 a0 ac :2 a0 6b :2 a0 6b :2 a0 6b
:2 a0 6b :2 a0 6b :2 a0 6b :2 a0 6b
:2 a0 6b :2 a0 6b :2 a0 6b :2 a0 6b
:2 a0 6b :2 a0 b9 ac :2 a0 b9 :2 a0
b9 b2 ee :2 a0 6b a0 7e b4
2e :2 a0 6b a0 7e a0 6b b4
2e a 10 :2 a0 7e b4 2e a
10 ac d0 :2 a0 6b de ac eb
b2 ee a0 3e :2 a0 48 63 ac
e5 d0 b2 :2 e9 dd b7 19 3c
:2 a0 65 b7 a4 a0 b1 11 68
4f 1d 17 b5
122
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 62
5a 5e 30 69 59 6e 72 76
7a 95 82 56 86 87 8f 90
81 b1 a0 a4 ac 7e c9 b8
bc c4 9f e5 d4 d8 e0 9c
d0 ec ef f3 f7 fa fe 102
105 109 10d 10e 112 116 117 11e
122 126 129 12d 12e 130 131 136
137 13d 141 142 147 149 14d 151
154 157 158 15d 161 163 164 169
16d 16f 17b 17d 181 185 188 189
18d 191 195 197 19b 19f 1a1 1a2
1a9 1ad 1b1 1b4 1b8 1bb 1bc 1c1
1c5 1c9 1cc 1d0 1d3 1d7 1da 1db
1 1e0 1e5 1e6 1ea 1ee 1f1 1f3
1f4 1fa 1fe 1ff 204 206 20a 20e
211 215 217 218 21d 221 223 22f
231 235 238 23b 23c 241 245 249
24c 250 251 256 25a 25e 262 265
268 269 26e 272 276 27a 27d 280
281 286 289 28c 290 291 296 29a
29e 2a2 2a3 2a7 2ab 2ae 2b2 2b6
2b9 2bd 2c1 2c4 2c8 2cc 2cf 2d3
2d7 2da 2de 2e2 2e5 2e9 2ed 2f0
2f4 2f8 2fb 2ff 303 306 30a 30e
311 315 319 31c 320 324 327 32b
32f 331 332 336 33a 33c 340 344
346 347 34e 352 356 359 35d 360
361 366 36a 36e 371 375 378 37c
37f 380 1 385 38a 38e 392 395
396 1 39b 3a0 3a1 3a5 3a9 3ad
3b0 3b2 3b3 3b7 3b8 3bf 1 3c3
3c7 3cb 3ce 3d2 3d3 3d9 3dd 3de
3e3 3e8 3ec 3ee 3f2 3f5 3f9 3fd
401 403 407 40b 40d 419 41d 41f
420 429
122
2
0 1 a 1 1a :3 1 19 :3 1
19 :3 1 15 1d :3 1 3 a :3 1
15 19 18 15 20 15 :2 1 :3 15
:2 1 :3 15 :2 1 :3 15 1 3 1a :2 3
1a :2 3 1a 3 :2 c 1f a 5
a b 24 22 2a :2 24 :2 22 :5 5
3 a 7 e f :2 e 7 18
:2 5 3 :3 1 :4 e 1c e 24 e
27 38 27 5 :2 e :2 10 20 :3 1e
e :2 10 19 17 :2 1b :2 17 :2 e 5
17 :2 19 17 e :4 5 3 a 7
e 7 18 :2 5 3 :3 1 6 15
17 :2 15 5 19 22 24 :2 19 :2 5
19 2a 2c :2 19 :2 5 1a 23 25
:2 1a 19 28 2a :2 19 :2 5 a c
11 :2 13 1d :2 1f 26 :2 28 3a :2 3c
11 :2 13 1f :2 21 2d :2 2f 11 :2 13
25 :2 27 11 :2 13 1b :2 1d 2a :2 2c
3d 44 3d :2 11 27 11 2a 3b
2a 8 :2 11 :2 13 23 :3 21 11 :2 13
1c 1a :2 1e :2 1a :3 11 1b :3 18 :2 11
:2 8 1a :2 1c 1a 11 7 5 7
:2 b 16 2b :2 b :7 5 19 :3 3 a
3 :2 1 5 :7 1
122
4
0 :2 1 :4 3 :4 4
:4 5 :5 6 2 :2 7
:2 1 :8 9 :5 a :5 b
:5 c :3 11 :3 12 :3 13
:3 17 :3 18 :8 19 18
:4 17 16 1b :6 1c
:3 1b 1a :3 10 :5 21
:8 22 :7 23 :9 24 :2 23
22 :5 25 :4 21 20
27 :3 28 :3 27 26
:3 10 :5 2b :7 2d :7 33
:c 35 :2 38 39 :c 3b
:9 3c :6 3d :c 3e 3b
:8 3f :7 40 :9 41 :2 40
:5 42 :2 40 3f 3b
:5 43 3b 3a 3b
:6 44 3a :4 39 38
39 :3 2b :3 48 :2 10
4a :7 1
42b
4
:3 0 1 :3 0 2
:a 0 11d 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
56 0 7 6
:3 0 5 :7 0 9
8 :3 0 6 :3 0
7 :7 0 d c
:3 0 e :2 0 b
9 :3 0 a :3 0
8 :6 0 12 11
:3 0 b :3 0 6
:3 0 14 16
/

prompt
prompt Creating function ORA_ASPNET_MEM_GETNUMOFUSERSON
prompt ================================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Mem_GetNumOfUsersOn wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
1e
2 :e:
1FUNCTION:
1ORA_ASPNET_MEM_GETNUMOFUSERSON:
1APPLICATIONNAME_:
1NVARCHAR2:
1MINUTESSINCELASTINACTIVE:
1INTEGER:
1CURRENTTIMEUTC:
1DATE:
1RETURN:
1M_ACTIVEDATETIME:
1M_TOTALRECORDS:
1-:
1/:
11440:
1COUNT:
1ORA_ASPNET_APPLICATIONS:
1A:
1ORA_ASPNET_USERS:
1U:
1ORA_ASPNET_MEMBERSHIP:
1M:
1LASTACTIVITYDATE:
1>:
1USERID:
1=:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1APPLICATIONID:
1NO_DATA_FOUND:
10:
0

0
0
82
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d b4
:2 a0 2c 6a a3 a0 1c 4d 81
b0 a3 a0 1c 81 b0 :2 a0 7e
a0 7e 51 b4 2e 5a b4 2e
d a0 d2 9f ac :3 a0 b9 :2 a0
b9 :2 a0 b9 b2 ee :2 a0 6b a0
7e b4 2e :2 a0 6b a0 7e a0
6b b4 2e a 10 :2 a0 6b a0
7e a0 a5 b b4 2e a 10
:2 a0 6b a0 7e a0 6b b4 2e
a 10 ac e5 d0 b2 e9 b7
:2 a0 51 65 b7 a6 9 a4 b1
11 4f :2 a0 65 b7 a4 a0 b1
11 68 4f 1d 17 b5
82
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 30
56 5a 5e 62 7c 6a 6e 76
77 69 98 87 8b 93 66 83
9f a3 a6 aa ad b0 b1 b6
b9 ba bf c3 c7 cb ce cf
d3 d7 db dd e1 e5 e7 eb
ef f1 f2 f9 fd 101 104 108
10b 10c 111 115 119 11c 120 123
127 12a 12b 1 130 135 139 13d
140 144 147 14b 14c 14e 14f 1
154 159 15d 161 164 168 16b 16f
172 173 1 178 17d 17e 184 188
189 18e 190 194 198 19b 19f 1a1
1a2 1a7 1ab 1ad 1b9 1bb 1bf 1c3
1c7 1c9 1cd 1d1 1d3 1df 1e3 1e5
1e6 1ef
82
2
0 1 a 1 1e :3 1 1d :3 1
1c :3 1 3 a :3 1 :2 1a 22 1a
:2 1 :3 1a 1 3 17 26 29 42
44 :2 29 28 :2 17 3 :4 e 1c e
26 e 29 3a 29 3d 53 3d
5 :2 e :2 10 23 :3 21 e :2 10 19
17 :2 1b :2 17 :3 e :2 10 29 27 2f
:2 29 :2 27 :3 e :2 10 20 1e :2 22 :2 1e
:2 e :5 5 3 a 7 e 7 18
:2 5 3 :3 1 3 a 3 :2 1 5
:7 1
82
4
0 :2 1 :4 3 :4 4
:4 5 2 :2 6 :2 1
:6 8 :5 9 :c c :5 10
:b 11 :7 12 :9 13 :2 12
:a 14 :2 12 :9 15 :2 12
11 :4 10 f 17
:3 18 :3 17 16 :3 b
:3 1c :2 b 1e :7 1

1f1
4
:3 0 1 :3 0 2
:a 0 7d 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
:2 0 7 6 :3 0
5 :7 0 9 8
:3 0 8 :3 0 7
:7 0 d c :3 0
9 :3 0 6 :3 0
f 11 0 7d
2 12 :2 0 f
83 0 d 8
:3 0 15 :8 0 19
16 17 7b 0
a :6 0 a :3 0
6 :3 0 1b :7 0
1e 1c 0 7b
0 b :6 0 7
:3 0 c :2 0 5
:3 0 d :2 0 e
:2 0 11 23 25
:3 0 26 :2 0 14
21 28 :3 0 1f
29 0 78 f
:3 0 2d :3 0 f
:2 0 17 b :3 0
10 :3 0 11 :3 0
30 31 12 :3 0
13 :3 0 33 34
14 :3 0 15 :3 0
36 37 19 39
63 0 64 :3 0
13 :3 0 16 :3 0
3b 3c 0 a
:3 0 17 :2 0 1f
3f 40 :3 0 13
:3 0 18 :3 0 42
43 0 15 :3 0
19 :2 0 18 :3 0
45 47 0 24
46 49 :3 0 41
4b 4a :2 0 11
:3 0 1a :3 0 4d
4e 0 1b :3 0
19 :2 0 3 :3 0
27 50 53 2b
51 55 :3 0 4c
57 56 :2 0 11
:3 0 1c :3 0 59
5a 0 13 :3 0
19 :2 0 1c :3 0
5c 5e 0 30
5d 60 :3 0 58
62 61 :3 0 66
67 :5 0 2e 3a
0 33 0 65
:2 0 69 35 73
1d :3 0 9 :3 0
1e :2 0 6c :2 0
6e 37 70 39
6f 6e :2 0 71
3b :2 0 73 0
73 72 69 71
:6 0 78 1 :3 0
9 :3 0 b :3 0
76 :2 0 78 3d
7c :3 0 7c 2
:3 0 41 7c 7b
78 79 :6 0 7d
:2 0 2 12 7c
80 :3 0 7f 7d
81 :8 0
44
4
:3 0 1 3 1
7 1 b 3
6 a e 1
14 1 1a 2
22 24 2 20
27 1 2c 3
32 35 38 1
3e 2 3d 3e
1 48 2 44
48 1 52 1
54 2 4f 54
1 5f 2 5b
5f 1 2f 1
68 1 6d 1
6a 1 70 3
2a 73 77 2
18 1d
1
4
0
80
0
1
14
2
6
0 1 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
2 0 1
1a 1 0
7 1 0
b 1 0
14 1 0
3 1 0
0
/

prompt
prompt Creating function ORA_ASPNET_MEM_GETPASSWORD
prompt ============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Mem_GetPassword wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
45
2 :e:
1FUNCTION:
1ORA_ASPNET_MEM_GETPASSWORD:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAME_:
1MAXINVALIDPASSWORDATTEMPTS:
1INTEGER:
1PASSWORDATTEMPTWINDOW:
1CURRENTTIMEUTC:
1DATE:
1PASSWORDANSWER_:
1PASSWORD_:
1OUT:
1PASSWORDFORMAT_:
1NUMBER:
1RETURN:
1M_PASSWORDANSWER:
1256:
1M_USERID:
1RAW:
116:
1M_ISLOCKEDOUT:
1M_ISAPPROVED:
1M_FAILEDPWDATTEMPTCOUNT:
1M_RETURNCODE:
1M_FAILEDPWDANSWERATTEMPTCOUNT:
1M_LASTLOCKOUTDATE:
1M_FAILEDPWDATTEMPTWINSTART:
1M_FAILEDPWDANSWERATTEMPTWINSTA:
10:
1M:
1PASSWORD:
1PASSWORDFORMAT:
1U:
1USERID:
1ISLOCKEDOUT:
1ISAPPROVED:
1PASSWORDANSWER:
1FAILEDPWDATTEMPTCOUNT:
1LASTLOCKOUTDATE:
1FAILEDPWDATTEMPTWINSTART:
1FAILEDPWDANSWERATTEMPTCOUNT:
1FAILEDPWDANSWERATTEMPTWINSTART:
1ORA_ASPNET_APPLICATIONS:
1A:
1ORA_ASPNET_USERS:
1ORA_ASPNET_MEMBERSHIP:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1APPLICATIONID:
1LOWEREDUSERNAME:
1NO_DATA_FOUND:
1-:
11001:
11:
11099:
1IS NOT NULL:
1IS NULL:
1!=:
1>:
1+:
1/:
11440:
1>=:
11004:
1TO_DATE:
101-01-1754:
1DD-MM-RRRR:
0

0
0
18b
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 96 :2 a0 b0 54 96
:2 a0 b0 54 b4 :2 a0 2c 6a a3
a0 51 a5 1c 4d 81 b0 a3
a0 51 a5 1c 4d 81 b0 a3
a0 1c 81 b0 a3 a0 1c 81
b0 a3 a0 1c 81 b0 a3 a0
1c 81 b0 a3 a0 1c 81 b0
a3 a0 1c 4d 81 b0 a3 a0
1c 4d 81 b0 a3 a0 1c 4d
81 b0 a0 51 d a0 51 d
a0 51 d a0 51 d a0 51
d :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b ac
:d a0 b9 :2 a0 b9 :2 a0 b9 b2 ee
:2 a0 6b a0 7e a0 a5 b b4
2e :2 a0 6b a0 7e a0 6b b4
2e a 10 :2 a0 6b a0 7e a0
a5 b b4 2e a 10 :2 a0 6b
a0 7e a0 6b b4 2e a 10
ac e5 d0 b2 e9 b7 :2 a0 7e
51 b4 2e 65 b7 a6 9 a4
b1 11 4f a0 7e 51 b4 2e
a0 7e 51 b4 2e 65 b7 19
3c a0 7e b4 2e a0 7e b4
2e 5a :2 a0 a5 b a0 7e a0
a5 b b4 2e 5a 52 10 a0
7e a0 7e a0 7e 51 b4 2e
5a b4 2e 5a b4 2e :2 a0 d
a0 51 d b7 :2 a0 7e 51 b4
2e d :2 a0 d b7 :2 19 3c :2 a0
7e b4 2e a0 51 d :2 a0 d
b7 19 3c a0 7e 51 b4 2e
d b7 a0 7e 51 b4 2e a0
51 d :2 a0 :2 6e a5 b d b7
19 3c b7 :2 19 3c :3 a0 e7 :2 a0
e7 :2 a0 e7 :2 a0 e7 :2 a0 e7 :2 a0
e7 :2 a0 7e b4 2e ef f9 e9
b7 19 3c :2 a0 65 b7 a4 a0
b1 11 68 4f 1d 17 b5
18b
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 5e
5a 30 66 6f 6b 59 77 84
80 56 8c 99 91 95 7f a0
b1 a9 ad 7c b8 a8 bd c1
c5 c9 e4 d1 a5 d5 d6 de
df d0 102 ef cd f3 f4 fc
fd ee 11e 10d 111 119 eb 136
125 129 131 10c 152 141 145 14d
109 16a 159 15d 165 140 186 175
179 181 13d 19f 18d 191 199 19a
174 1bb 1aa 1ae 171 1b6 1a9 1d7
1c6 1ca 1a6 1d2 1c5 1de 1c2 1e2
1e6 1ea 1ed 1f1 1f5 1f8 1fc 200
203 207 20b 20e 212 216 21a 21d
221 225 228 22c 230 233 237 23b
23e 242 246 249 24d 251 254 258
25c 25f 263 267 26a 26e 272 275
279 27d 280 284 288 28b 28c 290
294 298 29c 2a0 2a4 2a8 2ac 2b0
2b4 2b8 2bc 2c0 2c2 2c6 2ca 2cc
2d0 2d4 2d6 2d7 2de 2e2 2e6 2e9
2ed 2f0 2f4 2f5 2f7 2f8 2fd 301
305 308 30c 30f 313 316 317 1
31c 321 325 329 32c 330 333 337
338 33a 33b 1 340 345 349 34d
350 354 357 35b 35e 35f 1 364
369 36a 370 374 375 37a 37c 380
384 387 38a 38b 390 394 396 397
39c 3a0 3a2 3ae 3b0 3b4 3b7 3ba
3bb 3c0 3c4 3c7 3ca 3cb 3d0 3d4
3d6 3da 3dd 3e1 3e4 3e5 3ea 3ee
3f1 3f2 3f7 3fa 3fe 402 403 405
409 40c 410 411 413 414 419 1
41c 421 425 428 42c 42f 433 436
439 43a 43f 442 443 448 44b 44c
451 455 459 45d 461 464 468 46a
46e 472 475 478 479 47e 482 486
48a 48e 490 494 498 49b 49f 4a3
4a6 4a7 4ac 4b0 4b3 4b7 4bb 4bf
4c3 4c5 4c9 4cc 4d0 4d3 4d6 4d7
4dc 4e0 4e2 4e6 4e9 4ec 4ed 4f2
4f6 4f9 4fd 501 505 50a 50f 510
512 516 518 51c 51f 521 525 529
52c 530 534 538 53a 53e 542 544
548 54c 54e 552 556 558 55c 560
562 566 56a 56c 570 574 577 578
57d 583 584 589 58b 58f 592 596
59a 59e 5a0 5a4 5a8 5aa 5b6 5ba
5bc 5bd 5c6
18b
2
0 1 a 1 1b :3 1 1b :3 1
20 :3 1 21 :3 1 21 :3 1 21 :3 1
12 1a :3 1 12 16 :3 1 3 a
:3 1 19 23 22 19 2b 19 :2 1
19 1d 1c 19 2b 19 :2 1 :3 19
:2 1 :3 19 :2 1 :3 19 :2 1 :3 19 :2 1 :3 1f
:2 1 :2 20 28 20 :2 1 :2 20 28
/

prompt
prompt Creating function ORA_ASPNET_MEM_GETPWDWITHFMT
prompt ==============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Mem_GetPwdWithFmt wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
34
2 :e:
1FUNCTION:
1ORA_ASPNET_MEM_GETPWDWITHFMT:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAME_:
1UPDATELASTLOGINACTIVITYDATE:
1INTEGER:
1CURRENTTIMEUTC:
1DATE:
1PASSWORD_:
1OUT:
1PASSWORDFORMAT_:
1NUMBER:
1PASSWORDSALT_:
1FAILEDPWDATTEMPTCOUNT_:
1FAILEDPWDANSWERATTEMPTCOUNT_:
1ISAPPROVED_:
1LASTLOGINDATE_:
1LASTACTIVITYDATE_:
1RETURN:
1M_USERID:
1RAW:
116:
1M_ISLOCKEDOUT:
1M_ISAPPROVED:
10:
1U:
1USERID:
1M:
1ISLOCKEDOUT:
1ISAPPROVED:
1PASSWORD:
1PASSWORDFORMAT:
1PASSWORDSALT:
1FAILEDPWDATTEMPTCOUNT:
1FAILEDPWDANSWERATTEMPTCOUNT:
1LASTLOGINDATE:
1LASTACTIVITYDATE:
1ORA_ASPNET_USERS:
1ORA_ASPNET_APPLICATIONS:
1A:
1ORA_ASPNET_MEMBERSHIP:
1LOWEREDUSERNAME:
1LOWER:
1=:
1APPLICATIONID:
1LOWEREDAPPLICATIONNAME:
1NO_DATA_FOUND:
1-:
11001:
11:
11099:
0

0
0
112
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 b4 :2 a0 2c 6a a3
a0 51 a5 1c 4d 81 b0 a3
a0 1c 81 b0 a3 a0 1c 81
b0 a0 51 d a0 51 d :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b ac :d a0 b9
:2 a0 b9 :2 a0 b9 b2 ee :2 a0 6b
a0 7e a0 a5 b b4 2e :2 a0
6b a0 7e a0 6b b4 2e a
10 :2 a0 6b a0 7e a0 a5 b
b4 2e a 10 :2 a0 6b a0 7e
a0 6b b4 2e a 10 ac e5
d0 b2 e9 b7 :2 a0 7e 51 b4
2e 65 b7 a6 9 a4 b1 11
4f a0 7e 51 b4 2e a0 7e
51 b4 2e 65 b7 19 3c a0
7e 51 b4 2e a0 7e 51 b4
2e a 10 :3 a0 e7 :2 a0 7e b4
2e ef f9 e9 :3 a0 e7 :2 a0 7e
b4 2e ef f9 e9 b7 19 3c
a0 51 65 b7 a4 a0 b1 11
68 4f 1d 17 b5
112
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 5e
5a 30 66 73 6b 6f 59 7a
8b 83 87 56 92 9f 97 9b
82 a6 b7 af b3 7f be cb
c3 c7 ae d2 e3 db df ab
ea f7 ef f3 da fe 10f 107
10b d7 116 106 11b 11f 123 127
142 12f 103 133 134 13c 13d 12e
15e 14d 151 159 12b 176 165 169
171 14c 17d 149 181 185 189 18c
190 194 198 19b 19f 1a3 1a6 1aa
1ae 1b1 1b5 1b9 1bc 1c0 1c4 1c7
1cb 1cf 1d2 1d6 1da 1dd 1e1 1e5
1e8 1ec 1f0 1f3 1f7 1fb 1fe 202
206 209 20a 20e 212 216 21a 21e
222 226 22a 22e 232 236 23a 23e
240 244 248 24a 24e 252 254 255
25c 260 264 267 26b 26e 272 273
275 276 27b 27f 283 286 28a 28d
291 294 295 1 29a 29f 2a3 2a7
2aa 2ae 2b1 2b5 2b6 2b8 2b9 1
2be 2c3 2c7 2cb 2ce 2d2 2d5 2d9
2dc 2dd 1 2e2 2e7 2e8 2ee 2f2
2f3 2f8 2fa 2fe 302 305 308 309
30e 312 314 315 31a 31e 320 32c
32e 332 335 338 339 33e 342 345
348 349 34e 352 354 358 35b 35f
362 365 366 36b 36f 372 375 376
1 37b 380 384 388 38c 38e 392
396 399 39a 39f 3a5 3a6 3ab 3af
3b3 3b7 3b9 3bd 3c1 3c4 3c5 3ca
3d0 3d1 3d6 3d8 3dc 3df 3e3 3e6
3ea 3ec 3f0 3f4 3f6 402 406 408
409 412
112
2
0 1 a 1 26 :3 1 26 :3 1
26 :3 1 26 :3 1 1e 26 :3 1 1e
26 :3 1 1e 26 :3 1 1e 26 :3 1
1e 26 :3 1 1e 26 :3 1 1e 26
:3 1 1e 26 :4 1 8 :3 1 19 1d
1c 19 24 19 :2 1 :3 19 :2 1 :3 19
1 3 14 :2 3 14 3 c :2 e
16 :2 18 25 :2 27 c :2 e c :2 e
c :2 e c :2 e c :2 e c :2 e
c :2 e c :2 e c b 15 24
:8 b c 1d c 20 38 20 3b
51 3b 5 :2 c :2 e 20 1e 26
:2 20 :2 1e c :2 e 1e 1c :2 20 :2 1c
:2 c 5 :2 7 20 1e 26 :2 20 :2 1e
:3 c :2 e 17 15 :2 19 :2 15 :2 c :5 5
3 c 9 10 11 :2 10 9 1a
:2 7 5 :3 1 6 14 16 :2 14 5
c d :2 c 5 18 :2 3 6 22
24 :2 22 2a 37 39 :2 37 :2 6 :2 c
1c :2 c 15 :3 13 :3 5 c 9 1c
9 b 14 :3 12 :3 5 3b :3 3 a
3 :2 1 5 :7 1
112
4
0 :2 1 :4 3 :4 4
:4 5 :4 6 :5 7 :5 8
:5 9 :5 a :5 b :5 c
:5 d :5 e 2 :2 10
:2 1 :8 12 :5 13 :5 14
:3 1b :3 1c :9 1f :3 20
:3 21 :3 22 :3 23 :3 24
:3 25 :3 26 :3 27 1f
:3 28 29 2a 2b
2c 2d 2e 2f
30 :b 31 :a 32 :9 33
:2 32 :a 34 :2 32 :9 35
:2 32 31 :4 1f 1e
38 :6 39 :3 38 37
:3 19 :5 3c :6 3d :3 3c
:c 40 42 :3 43 :5 44
:3 42 47 :3 48 :5 49
:3 47 :3 40 :3 4c :2 19
4e :7 1
414
4
:3 0 1 :3 0 2
:a 0 10d 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
56 0 7 4
:3 0 5 :7 0 9
8 :3 0 7 :3 0
6 :7 0 d c
:3 0 d 7f 0
b 9 :3 0 8
:7 0 11 10 :3 0
b :3 0 4 :3 0
a :6 0 16 15
:3 0 11 ab 0
f b :3 0 d
:3 0 c :6 0 1b
1a :3 0 b :3 0
4 :3 0 e :6 0
20 1f :3 0 15
d7 0 13 b
:3 0
/

prompt
prompt Creating function ORA_ASPNET_MEM_GETUSERBYEML
prompt =============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Mem_GetUserByEml wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
1e
2 :e:
1FUNCTION:
1ORA_ASPNET_MEM_GETUSERBYEML:
1APPLICATIONNAME_:
1NVARCHAR2:
1EMAIL_:
1USERNAME_:
1OUT:
1MULTIROWS_:
1INTEGER:
1RETURN:
10:
1IS NULL:
1U:
1USERNAME:
1ORA_ASPNET_APPLICATIONS:
1A:
1ORA_ASPNET_USERS:
1ORA_ASPNET_MEMBERSHIP:
1M:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1APPLICATIONID:
1USERID:
1LOWEREDEMAIL:
1NO_DATA_FOUND:
1-:
11012:
1TOO_MANY_ROWS:
11:
0

0
0
dd
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 96 :2 a0 b0 54 96
:2 a0 b0 54 b4 :2 a0 2c 6a a0
51 d a0 7e b4 2e :2 a0 6b
ac :3 a0 b9 :2 a0 b9 :2 a0 b9 b2
ee :2 a0 6b a0 7e a0 a5 b
b4 2e :2 a0 6b a0 7e a0 6b
b4 2e a 10 :2 a0 6b a0 7e
a0 6b b4 2e a 10 :2 a0 6b
7e b4 2e a 10 ac e5 d0
b2 e9 b7 :2 a0 7e 51 b4 2e
65 b7 a6 9 :2 a0 51 d b7
a6 9 a4 b1 11 4f b7 :2 a0
6b ac :3 a0 b9 :2 a0 b9 :2 a0 b9
b2 ee :2 a0 6b a0 7e a0 a5
b b4 2e :2 a0 6b a0 7e a0
6b b4 2e a 10 :2 a0 6b a0
7e a0 6b b4 2e a 10 :2 a0
6b a0 7e a0 a5 b b4 2e
a 10 ac e5 d0 b2 e9 b7
:2 a0 7e 51 b4 2e 65 b7 a6
9 :2 a0 51 d b7 a6 9 a4
b1 11 4f b7 :2 19 3c a0 51
65 b7 a4 a0 b1 11 68 4f
1d 17 b5
dd
2
0 3 7 23 1f 1e 2b 38
34 1b 40 4d 45 49 33 54
65 5d 61 30 6c 5c 71 75
79 7d 81 59 85 89 8d 90
91 96 9a 9e a1 a2 a6 aa
ae b0 b4 b8 ba be c2 c4
c5 cc d0 d4 d7 db de e2
e3 e5 e6 eb ef f3 f6 fa
fd 101 104 105 1 10a 10f 113
117 11a 11e 121 125 128 129 1
12e 133 137 13b 13e 141 142 1
147 14c 14d 153 157 158 15d 15f
163 167 16a 16d 16e 173 177 179
17a 17f 183 187 18a 18e 190 191
196 19a 19c 1a8 1aa 1ac 1b0 1b4
1b7 1b8 1bc 1c0 1c4 1c6 1ca 1ce
1d0 1d4 1d8 1da 1db 1e2 1e6 1ea
1ed 1f1 1f4 1f8 1f9 1fb 1fc 201
205 209 20c 210 213 217 21a 21b
1 220 225 229 22d 230 234 237
23b 23e 23f 1 244 249 24d 251
254 258 25b 25f 260 262 263 1
268 26d 26e 274 278 279 27e 280
284 288 28b 28e 28f 294 298 29a
29b 2a0 2a4 2a8 2ab 2af 2b1 2b2
2b7 2bb 2bd 2c9 2cb 2cd 2d1 2d5
2d8 2dc 2df 2e3 2e5 2e9 2ed 2ef
2fb 2ff 301 302 30b
dd
2
0 1 a 1 17 :3 1 17 :3 1
11 17 :3 1 11 17 :3 1 3 a
:2 1 3 11 3 :4 6 f :2 11 :3 f
27 f 2a 3b 2a 3e 54 3e
7 :2 f :2 11 2a 28 30 :2 2a :2 28
8 :2 a 1a 18 :2 1c :2 18 :2 f 8
:2 a 13 11 :2 15 :2 11 :2 f 8 :2 a
:3 8 :2 f :5 7 5 c 9 10 11
:2 10 9 1a :2 7 c 9 17 9
1a :2 7 5 :4 15 f :2 11 :3 f 27
f 2a 3b 2a 3e 54 3e 7
:2 f :2 11 2a 28 30 :2 2a :2 28 8
:2 a 1a 18 :2 1c :2 18 :2 f 8 :2 a
13 11 :2 15 :2 11 :2 f 8 :2 a 19
17 1f :2 19 :2 17 :2 f :5 7 5 c
9 10 11 :2 10 9 1a :2 7 c
9 17 9 1a :2 7 5 :8 3 a
3 :2 1 5 :7 1
dd
4
0 :2 1 :4 3 :4 4
:5 5 :5 6 2 :2 7
:2 1 :3 d :4 f :4 11
12 :b 13 :a 14 :9 15
:2 14 :9 16 :2 14 :6 17
:2 14 13 :4 11 10
19 :6 1a :3 19 1b
:3 1c :3 1b 18 :4 f
:4 20 21 :b 22 :a 23
:9 24 :2 23 :9 25 :2 23
:a 26 :2 23 22 :4 20
1f 28 :6 29 :3 28
2a :3 2b :3 2a 27
:4 1e :3 f :3 2f :2 b
31 :7 1
30d
4
:3 0 1 :3 0 2
:a 0 d8 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
59 0 7 4
:3 0 5 :7 0 9
8 :3 0 7 :3 0
4 :3 0 6 :6 0
e d :3 0 b
:2 0 b 7 :3 0
9 :3 0 8 :6 0
13 12 :3 0 a
:3 0 9 :3 0 15
17 0 d8 2
18 :2 0 8 :3 0
1a 1b 0 d3
5 :3 0 c :2 0
10 1e 1f :3 0
d :3 0 e :3 0
21 22 0 12
6 :3 0 f :3 0
10 :3 0 26 27
11 :3 0 d :3 0
29 2a 12 :3 0
13 :3 0 2c 2d
14 2f 58 0
59 :3 0 10 :3 0
14 :3 0 31 32
0 15 :3 0 16
:2 0 3 :3 0 18
34 37 1c 35
39 :3 0 d :3 0
17 :3 0 3b 3c
0 10 :3 0 16
:2 0 17 :3 0 3e
40 0 21 3f
42 :3 0 3a 44
43 :2 0 d :3 0
18 :3 0 46 47
0 13 :3 0 16
:2 0 18 :3 0 49
4b 0 26 4a
4d :3 0 45 4f
4e :2 0 13 :3 0
19 :3 0 51 52
0 c :2 0 29
54 55 :3 0 50
57 56 :3 0 5b
5c :5 0 24 30
0 2b 0 5a
:2 0 5e 2d 72
1a :3 0 a :3 0
1b :2 0 1c :2 0
2f 61 63 :3 0
64 :2 0 66 31
68 33 67 66
:2 0 70 1d :3 0
8 :3 0 1e :2 0
6a 6b 0 6d
35 6f 37 6e
6d :2 0 70 39
:2 0 72 0 72
71 5e 70 :6 0
74 1 :3 0 3c
cd d :3 0 e
:3 0 75 76 0
3e 6 :3 0 f
:3 0 10 :3 0 7a
7b 11 :3 0 d
:3 0 7d 7e 12
:3 0 13 :3 0 80
81 40 83 b0
0 b1 :3 0 10
:3 0 14 :3 0 85
86 0 15 :3 0
16 :2 0 3 :3 0
44 88 8b 48
89 8d :3 0 10
:3 0 17 :3 0 8f
90 0 d :3 0
16 :2 0 17 :3 0
92 94 0 4d
93 96 :3 0 8e
98 97 :2 0 d
:3 0 18 :3 0 9a
9b 0 13 :3 0
16 :2 0 18 :3 0
9d 9f 0 52
9e a1 :3 0 99
/

prompt
prompt Creating function ORA_ASPNET_MEM_GETUSERBYNAME
prompt ==============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Mem_GetUserByName wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
34
2 :e:
1FUNCTION:
1ORA_ASPNET_MEM_GETUSERBYNAME:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAME_:
1CURRENTTIMEUTC:
1DATE:
1UPDATELASTACTIVITY:
1INTEGER:
1EMAIL_:
1OUT:
1PASSWORDQUESTION_:
1COMMENTS_:
1NCLOB:
1ISAPPROVED_:
1CREATEDATE_:
1LASTLOGINDATE_:
1LASTACTIVITYDATE_:
1LASTPASSWORDCHANGEDDATE_:
1USERID_:
1RAW:
1ISLOCKEDOUT_:
1LASTLOCKOUTDATE_:
1RETURN:
1M:
1EMAIL:
1PASSWORDQUESTION:
1COMMENTS:
1ISAPPROVED:
1CREATEDATE:
1LASTLOGINDATE:
1U:
1LASTACTIVITYDATE:
1LASTPASSWORDCHANGEDDATE:
1USERID:
1ISLOCKEDOUT:
1LASTLOCKOUTDATE:
1ORA_ASPNET_APPLICATIONS:
1A:
1ORA_ASPNET_USERS:
1ORA_ASPNET_MEMBERSHIP:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1APPLICATIONID:
1LOWEREDUSERNAME:
1ROWNUM:
11:
1NO_DATA_FOUND:
1-:
11012:
10:
0

0
0
ef
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 b4
:2 a0 2c 6a :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b ac :d a0 b9 :2 a0 b9 :2 a0 b9
b2 ee :2 a0 6b a0 7e a0 a5
b b4 2e :2 a0 6b a0 7e a0
6b b4 2e a 10 :2 a0 6b a0
7e a0 a5 b b4 2e a 10
:2 a0 6b a0 7e a0 6b b4 2e
a 10 a0 7e 51 b4 2e a
10 ac e5 d0 b2 e9 b7 :2 a0
7e 51 b4 2e 65 b7 a6 9
a4 b1 11 4f a0 7e 51 b4
2e :3 a0 e7 :2 a0 7e b4 2e ef
f9 e9 b7 19 3c a0 51 65
b7 a4 a0 b1 11 68 4f 1d
17 b5
ef
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 5e
5a 30 66 73 6b 6f 59 7a
8b 83 87 56 92 9f 97 9b
82 a6 b7 af b3 7f be cb
c3 c7 ae d2 e3 db df ab
ea f7 ef f3 da fe 10f 107
10b d7 116 123 11b 11f 106 12a
13b 133 137 103 142 14f 147 14b
132 156 12f 15b 15f 163 167 16b
16f 173 176 17a 17e 181 185 189
18c 190 194 197 19b 19f 1a2 1a6
1aa 1ad 1b1 1b5 1b8 1bc 1c0 1c3
1c7 1cb 1ce 1d2 1d6 1d9 1dd 1e1
1e4 1e5 1e9 1ed 1f1 1f5 1f9 1fd
201 205 209 20d 211 215 219 21b
21f 223 225 229 22d 22f 230 237
23b 23f 242 246 249 24d 24e 250
251 256 25a 25e 261 265 268 26c
26f 270 1 275 27a 27e 282 285
289 28c 290 291 293 294 1 299
29e 2a2 2a6 2a9 2ad 2b0 2b4 2b7
2b8 1 2bd 2c2 2c6 2c9 2cc 2cd
1 2d2 2d7 2d8 2de 2e2 2e3 2e8
2ea 2ee 2f2 2f5 2f8 2f9 2fe 302
304 305 30a 30e 310 31c 31e 322
325 328 329 32e 332 336 33a 33c
340 344 347 348 34d 353 354 359
35b 35f 362 366 369 36d 36f 373
377 379 385 389 38b 38c 395
ef
2
0 1 a 1 22 :3 1 19 :3 1
19 :3 1 19 :3 1 14 1c :3 1 1a
22 :3 1 1a 22 :3 1 1a 22 :3 1
1a 22 :3 1 1a 22 :3 1 1a 22
:3 1 1a 22 :3 1 1a 22 :3 1 1a
22 :3 1 1a 22 :3 1 3 a :2 1
d :2 f 16 :2 18 2a :2 2c 36 :2 38
d :2 f 1b :2 1d 2c :2 2e d :2 f
28 :2 2a 32 :2 34 d :2 f :2 d 15
28 33 d 1a 2a d 27 30
:2 d 25 d 28 39 28 3c 52
3c 5 :2 d :2 f 28 26 2e :2 28
:2 26 6 :2 8 18 16 :2 1a :2 16 :3 d
:2 f 21 1f 27 :2 21 :2 1f :3 d :2 f
18 16 :2 1a :2 16 :3 d 14 16 :2 14
:2 d :5 5 3 a 7 e f :2 e
7 18 :2 5 3 :3 1 6 19 1b
:2 19 :2 e 21 :2 e 17 :3 15 :3 5 1d
:3 3 a 3 :2 1 5 :7 1
ef
4
0 :2 1 :4 3 :4 4
:4 5 :4 6 :5 7 :5 8
:5 9 :5 a :5 b :5 c
:5 d :5 e :5 f :5 10
:5 11 2 :2 12 :2 1
:c 19 :9 1a :9 1b :3 1c
19 :4 1d :3 1e :3 1f
20 :b 21 :a 22 :9 23
:2 22 :a 24 :2 22 :9 25
:2 22 :5 26 :2 22 21
:4 19 18 28 :6 29
:3 28 27 :3 16 :5 2c
2d :3 2e :5 2f :3 2d
:3 2c :3 32 :2 16 34
:7 1
397
4
:3 0 1 :3 0 2
:a 0 ea 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
56 0 7 4
:3 0 5 :7 0 9
8 :3 0 7 :3 0
6 :7 0 d c
:3 0 d 7f 0
b 9 :3 0 8
:7 0 11 10 :3 0
b :3 0 4 :3 0
a :6 0 16 15
:3 0 11 ab 0
f b :3 0 4
:3 0 c :6 0 1b
1a :3 0 b :3 0
e :3 0 d :6 0
20 1f :3 0 15
d7 0 13 b
:3 0 9 :3 0 f
:6 0 25 24 :3 0
b :3 0 7 :3 0
10 :6 0 2a 29
:3 0 19 103 0
17 b :3 0 7
:3 0 11 :6 0 2f
2e :3 0 b :3 0
7 :3 0 12 :6 0
34 33 :3 0 1d
12f 0 1b b
:3 0 7 :3 0 13
:6 0 39 38 :3 0
b :3 0 15 :3 0
14 :6 0 3e 3d
:3 0 21 :2 0 1f
b :3 0 9 :3 0
16 :6 0 43 42
:3 0 b :3 0 7
:3 0 17 :6 0 48
47 :3 0 18 :3 0
9 :3 0 4a 4c
0 ea 2 4d
:2 0 19 :3 0 1a
:3 0 4f 50 0
19 :3 0 1b :3 0
52 53 0 19
:3 0 1c :3 0 55
56 0 19 :3 0
1d :3 0 58
/

prompt
prompt Creating function ORA_ASPNET_MEM_GETUSERBYUID
prompt =============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Mem_GetUserByUid wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
2e
2 :e:
1FUNCTION:
1ORA_ASPNET_MEM_GETUSERBYUID:
1USERID_:
1RAW:
1CURRENTTIMEUTC:
1DATE:
1UPDATELASTACTIVITY:
1INTEGER:
1EMAIL_:
1OUT:
1NVARCHAR2:
1PASSWORDQUESTION_:
1COMMENTS_:
1NCLOB:
1ISAPPROVED_:
1CREATEDATE_:
1LASTLOGINDATE_:
1LASTACTIVITYDATE_:
1LASTPASSWORDCHANGEDDATE_:
1USERNAME_:
1ISLOCKEDOUT_:
1LASTLOCKOUTDATE_:
1RETURN:
1=:
11:
1ORA_ASPNET_USERS:
1LASTACTIVITYDATE:
1USERID:
1ROWCOUNT:
10:
1-:
11012:
1M:
1EMAIL:
1PASSWORDQUESTION:
1COMMENTS:
1ISAPPROVED:
1CREATEDATE:
1LASTLOGINDATE:
1U:
1LASTPASSWORDCHANGEDDATE:
1USERNAME:
1ISLOCKEDOUT:
1LASTLOCKOUTDATE:
1ORA_ASPNET_MEMBERSHIP:
1NO_DATA_FOUND:
0

0
0
d6
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 b4 :2 a0 2c 6a a0
7e 51 b4 2e :3 a0 e7 :2 a0 7e
b4 2e ef f9 e9 a0 f 7e
51 b4 2e a0 7e 51 b4 2e
65 b7 19 3c b7 19 3c :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b ac :d a0 b9
:2 a0 b9 b2 ee :2 a0 6b a0 7e
b4 2e :2 a0 6b a0 7e a0 6b
b4 2e a 10 ac e5 d0 b2
e9 b7 :2 a0 7e 51 b4 2e 65
b7 a6 9 a4 b1 11 4f a0
51 65 b7 a4 a0 b1 11 68
4f 1d 17 b5
d6
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 62
5a 5e 30 69 76 6e 72 59
7d 8e 86 8a 56 95 a2 9a
9e 85 a9 ba b2 b6 82 c1
ce c6 ca b1 d5 e6 de e2
ae ed fa f2 f6 dd 101 112
10a 10e da 119 126 11e 122 109
12d 13e 136 13a 106 145 135 14a
14e 152 156 15a 132 15e 161 162
167 16b 16f 173 175 179 17d 180
181 186 18c 18d 192 196 19b 19e
1a1 1a2 1a7 1ab 1ae 1b1 1b2 1b7
1bb 1bd 1c1 1c4 1c6 1ca 1cd 1d1
1d5 1d8 1dc 1e0 1e3 1e7 1eb 1ee
1f2 1f6 1f9 1fd 201 204 208 20c
20f 213 217 21a 21e 222 225 229
22d 230 234 238 23b 23f 243 246
247 24b 24f 253 257 25b 25f 263
267 26b 26f 273 277 27b 27d 281
285 287 288 28f 293 297 29a 29e
2a1 2a2 2a7 2ab 2af 2b2 2b6 2b9
2bd 2c0 2c1 1 2c6 2cb 2cc 2d2
2d6 2d7 2dc 2de 2e2 2e6 2e9 2ec
2ed 2f2 2f6 2f8 2f9 2fe 302 304
310 312 316 319 31d 31f 323 327
329 335 339 33b 33c 345
d6
2
0 1 a 1 21 :3 1 19 :3 1
19 :3 1 14 1c :3 1 1a 22 :3 1
1a 22 :3 1 1a 22 :3 1 1a 22
:3 1 1a 22 :3 1 1a 22 :3 1 1a
22 :3 1 1a 22 :3 1 1a 22 :3 1
1a 22 :3 1 3 a :2 1 6 19
1b :2 19 :2 e 21 :2 e 17 :3 15 :3 5
c 8 15 17 :2 15 7 e f
:2 e 7 19 :2 5 1d :2 3 d :2 f
16 :2 18 2a :2 2c 36 :2 38 6 :2 8
14 :2 16 25 :2 27 6 :2 8 21 :2 23
2d :2 2f 6 :2 8 :2 d 15 28 33
6 13 23 6 20 2b 6 d
1e d 21 37 21 5 :2 d :2 f
18 :3 16 24 :2 26 2f 2d :2 31 :2 2d
:2 d :5 5 3 a 7 e f :2 e
7 18 :2 5 3 :3 1 3 a 3
:2 1 5 :7 1
d6
4
0 :2 1 :4 3 :4 4
:4 5 :5 6 :5 7 :5 8
:5 9 :5 a :5 b :5 c
:5 d :5 e :5 f :5 10
2 :2 11 :2 1 :5 17
18 :3 19 :5 1a :3 18
:6 1b :6 1c :3 1b :3 17
:c 21 :9 22 :9 23 :3 24
21 :4 25 :3 26 :3 27
28 :8 29 :12 2a 29
:4 21 20 2c :6 2d
:3 2c 2b :3 15 :3 30
:2 15 32 :7 1
347
4
:3 0 1 :3 0 2
:a 0 d1 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
56 0 7 6
:3 0 5 :7 0 9
8 :3 0 8 :3 0
7 :7 0 d c
:3 0 d 82 0
b a :3 0 b
:3 0 9 :6 0 12
11 :3 0 a :3 0
b :3 0 c :6 0
17 16 :3 0 11
ae 0 f a
:3 0 e :3 0 d
:6 0 1c 1b :3 0
a :3 0 8 :3 0
f :6 0 21 20
:3 0 15 da 0
13 a :3 0 6
:3 0 10 :6 0 26
25 :3 0 a :3 0
6 :3 0 11 :6 0
2b 2a :3 0 19
106 0 17 a
:3 0 6 :3 0 12
:6 0 30 2f :3 0
a :3 0 6 :3 0
13 :6 0 35 34
:3 0 1d 132 0
1b a :3 0 b
:3 0 14 :6 0 3a
39 :3 0 a :3 0
8 :3 0 15 :6 0
3f 3e :3 0 18
:2 0 1f a :3 0
6 :3 0 16 :6 0
44 43 :3 0 17
:3 0 8 :3 0 46
48 0 d1 2
49 :2 0 7 :3 0
19 :2 0 30 4c
4e :3 0 1a :3 0
1b :3 0 5 :3 0
51 52 1c :3 0
3 :3 0 18 :2 0
35 56 57 :3 0
50 5a 58 0
5b 0 38 0
59 :2 0 6b 1d
:4 0 5c :3 0 18
:2 0 1e :2 0 3c
5e 60 :3 0 17
:3 0 1f :2 0 20
:2 0 3f 63 65
:3 0 66 :2 0 68
41 69 61 68
0 6a 43 0
6b 45 6c 4f
6b 0 6d 48
0 cc 21 :3 0
22 :3 0 6e 6f
0 21 :3 0 23
:3 0 71 72 0
21 :3 0 24 :3 0
74 75 0 21
:3 0 25 :3 0 77
78 0 21 :3 0
26 :3 0 7a 7b
0 21 :3 0 27
:3 0 7d 7e 0
28 :3 0 1b :3 0
80 81 0 21
:3 0 29 :3 0 83
84 0 28 :3 0
2a :3 0 86 87
/

prompt
prompt Creating function ORA_ASPNET_MEM_RESETPASSWORD
prompt ==============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Mem_ResetPassword wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
41
2 :e:
1FUNCTION:
1ORA_ASPNET_MEM_RESETPASSWORD:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAME_:
1NEWPASSWORD:
1MAXINVALIDPASSWORDATTEMPTS:
1INTEGER:
1PASSWORDATTEMPTWINDOW:
1PASSWORDSALT_:
1CURRENTTIMEUTC:
1DATE:
1PASSWORDFORMAT_:
1PASSWORDANSWER_:
1RETURN:
1M_USERID:
1RAW:
116:
1M_ISLOCKEDOUT:
1M_FAILEDPWDATTEMPTCOUNT:
1M_FAILEDPWDANSWERATTEMPTCOUNT:
1M_LASTLOCKOUTDATE:
1M_FAILEDPWDATTEMPTWINSTART:
1M_FAILEDPWDANSWERATTEMPTWINSTA:
10:
1U:
1USERID:
1M:
1ISLOCKEDOUT:
1FAILEDPWDATTEMPTCOUNT:
1LASTLOCKOUTDATE:
1FAILEDPWDATTEMPTWINSTART:
1FAILEDPWDANSWERATTEMPTCOUNT:
1FAILEDPWDANSWERATTEMPTWINSTART:
1ORA_ASPNET_APPLICATIONS:
1A:
1ORA_ASPNET_USERS:
1ORA_ASPNET_MEMBERSHIP:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1APPLICATIONID:
1LOWEREDUSERNAME:
1NO_DATA_FOUND:
1-:
11001:
11:
11099:
1PASSWORD:
1LASTPASSWORDCHANGEDDATE:
1PASSWORDFORMAT:
1PASSWORDSALT:
1IS NULL:
1PASSWORDANSWER:
1ROWCOUNT:
1>:
1+:
1/:
11440:
1>=:
11004:
1TO_DATE:
101-01-1754:
1DD-MM-RRRR:
1IS NOT NULL:
0

0
0
183
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d b4
:2 a0 2c 6a a3 a0 51 a5 1c
4d 81 b0 a3 a0 1c 81 b0
a3 a0 1c 81 b0 a3 a0 1c
81 b0 a3 a0 1c 4d 81 b0
a3 a0 1c 4d 81 b0 a3 a0
1c 4d 81 b0 a0 51 d a0
51 d a0 51 d :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b ac :9 a0 b9 :2 a0 b9
:2 a0 b9 b2 ee :2 a0 6b a0 7e
a0 a5 b b4 2e :2 a0 6b a0
7e a0 6b b4 2e a 10 :2 a0
6b a0 7e a0 a5 b b4 2e
a 10 :2 a0 6b a0 7e a0 6b
b4 2e a 10 ac e5 d0 b2
e9 b7 :2 a0 7e 51 b4 2e 65
b7 a6 9 a4 b1 11 4f a0
7e 51 b4 2e a0 7e 51 b4
2e 65 b7 19 3c :3 a0 e7 :2 a0
e7 :2 a0 e7 :2 a0 e7 :2 a0 7e b4
2e a0 7e b4 2e 5a :2 a0 a5
b a0 7e a0 a5 b b4 2e
5a 52 10 5a a 10 ef f9
e9 a0 f 7e 51 b4 2e a0
7e a0 7e a0 7e 51 b4 2e
5a b4 2e 5a b4 2e :2 a0 d
a0 51 d b7 :2 a0 7e 51 b4
2e d :2 a0 d b7 :2 19 3c :2 a0
7e b4 2e a0 51 d :2 a0 d
b7 19 3c a0 7e 51 b4 2e
65 b7 a0 7e 51 b4 2e a0
51 d :2 a0 :2 6e a5 b d b7
19 3c b7 :2 19 3c a0 7e b4
2e :3 a0 e7 :2 a0 e7 :2 a0 e7 :2 a0
e7 :2 a0 e7 :2 a0 e7 :2 a0 7e b4
2e ef f9 e9 b7 19 3c a0
51 65 b7 a4 a0 b1 11 68
4f 1d 17 b5
183
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 5e
5a 30 66 6f 6b 59 77 84
80 56 8c 95 91 7f 9d aa
a6 7c b2 bb b7 a5 c3 a2
c8 cc d0 d4 f2 dc e0 e3
e4 ec ed db 10e fd 101 109
d8 126 115 119 121 fc 142 131
135 13d f9 15b 149 14d 155 156
130 177 166 16a 12d 172 165 193
182 186 162 18e 181 19a 17e 19e
1a2 1a6 1a9 1ad 1b1 1b4 1b8 1bc
1c0 1c3 1c7 1cb 1ce 1d2 1d6 1d9
1dd 1e1 1e4 1e8 1ec 1ef 1f3 1f7
1fa 1fe 202 205 206 20a 20e 212
216 21a 21e 222 226 22a 22c 230
234 236 23a 23e 240 241 248 24c
250 253 257 25a 25e 25f 261 262
267 26b 26f 272 276 279 27d 280
281 1 286 28b 28f 293 296 29a
29d 2a1 2a2 2a4 2a5 1 2aa 2af
2b3 2b7 2ba 2be 2c1 2c5 2c8 2c9
1 2ce 2d3 2d4 2da 2de 2df 2e4
2e6 2ea 2ee 2f1 2f4 2f5 2fa 2fe
300 301 306 30a 30c 318 31a 31e
321 324 325 32a 32e 331 334 335
33a 33e 340 344 347 34b 34f 353
355 359 35d 35f 363 367 369 36d
371 373 377 37b 37e 37f 384 388
38b 38c 391 394 398 39c 39d 39f
3a3 3a6 3aa 3ab 3ad 3ae 3b3 1
3b6 3bb 1 3be 3c3 3c9 3ca 3cf
3d3 3d8 3db 3de 3df 3e4 3e8 3eb
3ef 3f2 3f6 3f9 3fc 3fd 402 405
406 40b 40e 40f 414 418 41c 420
424 427 42b 42d 431 435 438 43b
43c 441 445 449 44d 451 453 457
45b 45e 462 466 469 46a 46f 473
476 47a 47e 482 486 488 48c 48f
493 496 499 49a 49f 4a3 4a5 4a9
4ac 4af 4b0 4b5 4b9 4bc 4c0 4c4
4c8 4cd 4d2 4d3 4d5 4d9 4db 4df
4e2 4e4 4e8 4ec 4ef 4f3 4f6 4f7
4fc 500 504 508 50a 50e 512 514
518 51c 51e 522 526 528 52c 530
532 536 53a 53c 540 544 547 548
54d 553 554 559 55b 55f 562 566
569 56d 56f 573 577 579 585 589
58b 58c 595
183
2
0 1 a 1 1d :3 1 1f :3 1
1e :3 1 1c :3 1 1e :3 1 1f :3 1
1d :3 1 1e :3 1 1d :3 1 3 a
:3 1 1f 23 22 1f 2a 1f :2 1
:3 1f :2 1 :3 1f :2 1 :3 1f :2 1 :2 20 2a
20 :2 1 :2 20 2a 20 :2 1 :2 20 2a
20 1 3 20 :2 3 20 :2 3 24
3 c :2 e 16 :2 18 c :2 e 25
:2 27 c :2 e 28 :2 2a c :2 e :2
/

prompt
prompt Creating function ORA_ASPNET_MEM_SETPASSWORD
prompt ============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Mem_SetPassword wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
27
2 :e:
1FUNCTION:
1ORA_ASPNET_MEM_SETPASSWORD:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAME_:
1NEWPASSWORD:
1PASSWORDSALT_:
1CURRENTTIMEUTC:
1DATE:
1PASSWORDFORMAT_:
1INTEGER:
1RETURN:
1M_USERID:
1RAW:
116:
1M_ISLOCKEDOUT:
10:
1U:
1USERID:
1M:
1ISLOCKEDOUT:
1ORA_ASPNET_USERS:
1ORA_ASPNET_APPLICATIONS:
1A:
1ORA_ASPNET_MEMBERSHIP:
1LOWEREDUSERNAME:
1LOWER:
1=:
1APPLICATIONID:
1LOWEREDAPPLICATIONNAME:
1NO_DATA_FOUND:
1-:
11001:
11:
11099:
1PASSWORD:
1PASSWORDFORMAT:
1PASSWORDSALT:
1LASTPASSWORDCHANGEDDATE:
0

0
0
b4
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d b4 :2 a0 2c 6a a3
a0 51 a5 1c 4d 81 b0 a3
a0 1c 81 b0 a0 51 d :2 a0
6b :2 a0 6b ac :4 a0 b9 :2 a0 b9
:2 a0 b9 b2 ee :2 a0 6b a0 7e
a0 a5 b b4 2e :2 a0 6b a0
7e a0 6b b4 2e a 10 :2 a0
6b a0 7e a0 a5 b b4 2e
a 10 :2 a0 6b a0 7e a0 6b
b4 2e a 10 ac e5 d0 b2
e9 b7 :2 a0 7e 51 b4 2e 65
b7 a6 9 a4 b1 11 4f a0
7e 51 b4 2e a0 7e 51 b4
2e 65 b7 19 3c :3 a0 e7 :2 a0
e7 :2 a0 e7 :2 a0 e7 :2 a0 7e b4
2e ef f9 e9 a0 51 65 b7
a4 a0 b1 11 68 4f 1d 17
b5
b4
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 5e
5a 30 66 6f 6b 59 77 84
80 56 8c 7f 91 95 99 9d
b8 a5 7c a9 aa b2 b3 a4
d4 c3 c7 cf a1 bf db de
e2 e6 ea ed f1 f5 f8 f9
fd 101 105 109 10b 10f 113 115
119 11d 11f 120 127 12b 12f 132
136 139 13d 13e 140 141 146 14a
14e 151 155 158 15c 15f 160 1
165 16a 16e 172 175 179 17c 180
181 183 184 1 189 18e 192 196
199 19d 1a0 1a4 1a7 1a8 1 1ad
1b2 1b3 1b9 1bd 1be 1c3 1c5 1c9
1cd 1d0 1d3 1d4 1d9 1dd 1df 1e0
1e5 1e9 1eb 1f7 1f9 1fd 200 203
204 209 20d 210 213 214 219 21d
21f 223 226 22a 22e 232 234 238
23c 23e 242 246 248 24c 250 252
256 25a 25d 25e 263 269 26a 26f
273 276 27a 27c 280 284 286 292
296 298 299 2a2
b4
2
0 1 a 1 15 :3 1 15 :3 1
14 :3 1 15 :3 1 14 :3 1 15 :3 1
3 a :3 1 19 1d 1c 19 24
19 :2 1 :3 19 1 3 15 3 c
:2 e 16 :2 18 c a 14 b 1c
b 1f 37 1f 3a 50 3a 5
:2 b :2 d 1f 1d 25 :2 1f :2 1d b
:2 d 1d 1b :2 1f :2 1b :3 b :2 d 26
24 2c :2 26 :2 24 :3 b :2 d 16 14
:2 18 :2 14 :2 b :5 5 3 a 7 e
f :2 e 7 18 :2 5 3 :3 1 6
14 16 :2 14 5 c d :2 c 5
18 :2 3 a 7 12 :2 7 18 :2 7
16 :2 7 21 7 9 12 :3 10 :4 3
a 3 :2 1 5 :7 1
b4
4
0 :2 1 :4 3 :4 4
:4 5 :4 6 :4 7 :4 8
2 :2 9 :2 1 :8 b
:5 c :3 12 :7 15 :2 16
:b 17 :a 18 :9 19 :2 18
:a 1a :2 18 :9 1b :2 18
17 :4 15 14 1d
:6 1e :3 1d 1c :3 11
:5 21 :6 22 :3 21 25
:3 26 :3 27 :3 28 :3 29
:5 2a :3 25 :3 2c :2 11
2e :7 1
2a4
4
:3 0 1 :3 0 2
:a 0 af 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
56 0 7 4
:3 0 5 :7 0 9
8 :3 0 4 :3 0
6 :7 0 d c
:3 0 d 7c 0
b 4 :3 0 7
:7 0 11 10 :3 0
9 :3 0 8 :7 0
15 14 :3 0 f
:2 0 f b :3 0
a :7 0 19 18
:3 0 c :3 0 b
:3 0 1b 1d 0
af 2 1e :2 0
1a bf 0 18
e :3 0 16 21
23 :7 0 27 24
25 ad 0 d
:6 0 10 :3 0 b
:3 0 29 :7 0 2c
2a 0 ad 0
10 :6 0 11 :2 0
2d 2e 0 aa
12 :3 0 13 :3 0
30 31 0 14
:3 0 15 :3 0 33
34 0 1c d
:3 0 10 :3 0 16
:3 0 12 :3 0 39
3a 17 :3 0 18
:3 0 3c 3d 19
:3 0 14 :3 0 3f
40 1f 42 6f
0 70 :3 0 12
:3 0 1a :3 0 44
45 0 1b :3 0
1c :2 0 5 :3 0
23 47 4a 27
48 4c :3 0 18
:3 0 1d :3 0 4e
4f 0 12 :3 0
1c :2 0 1d :3 0
51 53 0 2c
52 55 :3 0 4d
57 56 :2 0 18
:3 0 1e :3 0 59
5a 0 1b :3 0
1c :2 0 3 :3 0
2f 5c 5f 33
5d 61 :3 0 58
63 62 :2 0 12
:3 0 13 :3 0 65
66 0 14 :3 0
1c :2 0 13 :3 0
68 6a 0 38
69 6c :3 0 64
6e 6d :3 0 72
73 :5 0 36 43
0 3b 0 71
:2 0 75 3e 82
1f :3 0 c :3 0
20 :2 0 21 :2 0
40 78 7a :3 0
7b :2 0 7d 42
7f 44 7e 7d
:2 0 80 46 :2 0
82 0 82 81
75 80 :6 0 aa
1 :3 0 10 :3 0
1c :2 0 22 :2 0
4a 85 87 :3 0
c :3 0 20 :2 0
23 :2 0 4d 8a
8c :3 0 8d :2 0
8f 4f 90 88
8f 0 91 51
0 aa 19 :3 0
24 :3 0 6 :3 0
93 94 25 :3 0
a :3 0 96 97
26 :3 0 7 :3 0
99 9a 27 :3 0
8 :3 0 9c 9d
13 :3 0 d :3 0
1c :2 0 55 a1
a2 :3 0 92 a5
a3 0 a6 0
58 0 a4 :2 0
aa c :3 0 11
:2 0 a8 :2 0 aa
5d ae :3 0 ae
2 :3 0 63 ae
ad aa ab :6 0
af :2 0 2 1e
ae b2 :3 0 b1
af b3 :8 0
66
4
:3 0 1 3 1
7 1 b 1
f 1 13 1
17 :2 6 a e
12 16 1a 1
22 1 20 1
28 2 32 35
3 3b 3e 41
1 49 1 4b
2 46 4b 1
54 2 50 54
1 5e 1
/

prompt
prompt Creating function ORA_ASPNET_MEM_UNLOCKUSER
prompt ===========================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Mem_UnlockUser wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
2b
2 :e:
1FUNCTION:
1ORA_ASPNET_MEM_UNLOCKUSER:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAME_:
1RETURN:
1INTEGER:
1M_USERID:
1RAW:
116:
1M_ISLOCKEDOUT:
1M_FAILEDPWDATTEMPTCOUNT:
1M_FAILEDPWDANSWERATTEMPTCOUNT:
1M_LASTLOCKOUTDATE:
1DATE:
1M_FAILEDPWDATTEMPTWINSTART:
1M_FAILEDPWDANSWERATTEMPTWINSTA:
1M_DATE:
10:
1U:
1USERID:
1ORA_ASPNET_APPLICATIONS:
1A:
1ORA_ASPNET_USERS:
1ORA_ASPNET_MEMBERSHIP:
1M:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1APPLICATIONID:
1LOWEREDUSERNAME:
1NO_DATA_FOUND:
1-:
11001:
1TO_DATE:
101-01-1754:
1DD-MM-RRRR:
1ISLOCKEDOUT:
1FAILEDPWDATTEMPTCOUNT:
1FAILEDPWDATTEMPTWINSTART:
1FAILEDPWDANSWERATTEMPTCOUNT:
1FAILEDPWDANSWERATTEMPTWINSTART:
1LASTLOCKOUTDATE:
0

0
0
c7
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d b4 :2 a0 2c 6a a3
a0 51 a5 1c 4d 81 b0 a3
a0 1c 81 b0 a3 a0 1c 81
b0 a3 a0 1c 81 b0 a3 a0
1c 4d 81 b0 a3 a0 1c 4d
81 b0 a3 a0 1c 4d 81 b0
a3 a0 1c 4d 81 b0 a0 51
d a0 51 d a0 51 d :2 a0
6b ac :3 a0 b9 :2 a0 b9 :2 a0 b9
b2 ee :2 a0 6b a0 7e a0 a5
b b4 2e :2 a0 6b a0 7e a0
6b b4 2e a 10 :2 a0 6b a0
7e a0 a5 b b4 2e a 10
:2 a0 6b a0 7e a0 6b b4 2e
a 10 ac e5 d0 b2 e9 b7
:2 a0 7e 51 b4 2e 65 b7 a6
9 a4 b1 11 4f :2 a0 :2 6e a5
b d :2 a0 51 e7 a0 51 e7
:2 a0 e7 a0 51 e7 :2 a0 e7 :2 a0
e7 :2 a0 7e b4 2e ef f9 e9
a0 51 65 b7 a4 a0 b1 11
68 4f 1d 17 b5
c7
2
0 3 7 23 1f 1e 2b 38
34 1b 40 33 45 49 4d 51
6c 59 30 5d 5e 66 67 58
88 77 7b 83 55 a0 8f 93
9b 76 bc ab af b7 73 d5
c3 c7 cf d0 aa f1 e0 e4
a7 ec df 10d fc 100 dc 108
fb 129 118 11c f8 124 117 130
114 134 138 13c 13f 143 147 14a
14e 152 156 159 15a 15e 162 166
168 16c 170 172 176 17a 17c 17d
184 188 18c 18f 193 196 19a 19b
19d 19e 1a3 1a7 1ab 1ae 1b2 1b5
1b9 1bc 1bd 1 1c2 1c7 1cb 1cf
1d2 1d6 1d9 1dd 1de 1e0 1e1 1
1e6 1eb 1ef 1f3 1f6 1fa 1fd 201
204 205 1 20a 20f 210 216 21a
21b 220 222 226 22a 22d 230 231
236 23a 23c 23d 242 246 248 254
256 25a 25e 263 268 269 26b 26f
273 277 27a 27c 280 283 285 289
28d 28f 293 296 298 29c 2a0 2a2
2a6 2aa 2ac 2b0 2b4 2b7 2b8 2bd
2c3 2c4 2c9 2cd 2d0 2d4 2d6 2da
2de 2e0 2ec 2f0 2f2 2f3 2fc
c7
2
0 1 a 1 22 :3 1 22 :3 1
3 a :3 1 19 1d 1c 19 2b
19 :2 1 :3 19 :2 1 :3 19 :2 1 :3 1f :2 1
:2 20 2b 20 :2 1 :2 20 2b 20 :2 1
:2 20 2b 20 :2 1 :2 20 2b 20 1
3 1e :2 3 1e :2 3 24 3 c
:2 e c 1a b 23 b 26 37
26 3a 50 3a 5 :2 b :2 d 26
24 2c :2 26 :2 24 b :2 d 1d 1b
:2 1f :2 1b :2 b 4 :2 6 18 16 1e
:2 18 :2 16 :3 b :2 d 16 14 :2 18 :2 14
:2 b :5 5 3 a 7 e f :2 e
7 18 :2 5 3 :3 1 3 d 15
23 :2 d 3 :2 a 18 :2 a 22 :2 a
25 :2 a 28 :2 a 2b :2 a 1c :2 a
13 :3 11 :4 3 a 3 :2 1 5 :7 1

c7
4
0 :2 1 :4 3 :4 4
2 :2 5 :2 1 :8 7
:5 8 :5 9 :5 a :6 b
:6 c :6 d :6 e :3 13
:3 14 :3 15 :5 18 :b 19
:a 1a :9 1b :2 1a :a 1c
:2 1a :9 1d :2 1a 19
:4 18 17 1f :6 20
:3 1f 1e :3 12 :7 24
25 :3 26 :3 27 :3 28
:3 29 :3 2a :3 2b :5 2c
:3 25 :3 2e :2 12 30
:7 1
2fe
4
:3 0 1 :3 0 2
:a 0 c2 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 a
:2 0 7 4 :3 0
5 :7 0 9 8
:3 0 6 :3 0 7
:3 0 b d 0
c2 2 e :2 0
e 73 0 c
9 :3 0 a 11
13 :7 0 17 14
15 c0 0 8
:6 0 12 a7 0
10 7 :3 0 19
:7 0 1c 1a 0
c0 0 b :6 0
7 :3 0 1e :7 0
21 1f 0 c0
0 c :9 0 14
7 :3 0 23 :7 0
26 24 0 c0
0 d :6 0 f
:3 0 28 :8 0 2c
29 2a c0 0
e :9 0 16 f
:3 0 2e :7 0 32
2f 30 c0 0
10 :9 0 18 f
:3 0 34 :7 0 38
35 36 c0 0
11 :6 0 13 :2 0
1a f :3 0 3a
:7 0 3e 3b 3c
c0 0 12 :6 0
b :3 0 3f 40
0 bd c :3 0
13 :2 0 42 43
0 bd d :3 0
13 :2 0 45 46
0 bd 14 :3 0
15 :3 0 48 49
0 1c 8 :3 0
16 :3 0 17 :3 0
4d 4e 18 :3 0
14 :3 0 50 51
19 :3 0 1a :3 0
53 54 1e 56
83 0 84 :3 0
17 :3 0 1b :3 0
58 59 0 1c
:3 0 1d :2 0 3
:3 0 22 5b 5e
26 5c 60 :3 0
17 :3 0 1e :3 0
62 63 0 14
:3 0 1d :2 0 1e
:3 0 65 67 0
2b 66 69 :3 0
61 6b 6a :2 0
14 :3 0 1f :3 0
6d 6e 0 1c
:3 0 1d :2 0 5
:3 0 2e 70 73
32 71 75 :3 0
6c 77 76 :2 0
14 :3 0 15 :3 0
79 7a 0 1a
:3 0 1d :2 0 15
:3 0 7c 7e 0
37 7d 80 :3 0
78 82 81 :3 0
86 87 :5 0 4b
57 0 3a 0
85 :2 0 89 3c
96 20 :3 0 6
:3 0 21 :2 0 22
:2 0 3e 8c 8e
:3 0 8f :2 0 91
40 93 42 92
91 :2 0 94 44
:2 0 96 0 96
95
/

prompt
prompt Creating function ORA_ASPNET_MEM_UPDATEUSER
prompt ===========================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Mem_UpdateUser wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
33
2 :e:
1FUNCTION:
1ORA_ASPNET_MEM_UPDATEUSER:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAME_:
1EMAIL_:
1COMMENTS_:
1NCLOB:
1ISAPPROVED_:
1INTEGER:
1LASTLOGINDATE_:
1DATE:
1LASTACTIVITYDATE_:
1UNIQUEEMAIL:
1CURRENTTIMEUTC_:
1RETURN:
1M_APPLICATIONID:
1RAW:
116:
1M_USERID:
1M_ISLOCKEDOUT:
1M_COUNT:
10:
1U:
1USERID:
1A:
1APPLICATIONID:
1ORA_ASPNET_USERS:
1ORA_ASPNET_APPLICATIONS:
1ORA_ASPNET_MEMBERSHIP:
1M:
1LOWEREDUSERNAME:
1LOWER:
1=:
1LOWEREDAPPLICATIONNAME:
1NO_DATA_FOUND:
1-:
11001:
11:
1COUNT:
1DUAL:
1!=:
1LOWEREDEMAIL:
1EXISTS:
1>:
11007:
1LASTACTIVITYDATE:
1EMAIL:
1COMMENTS:
1ISAPPROVED:
1LASTLOGINDATE:
0

0
0
115
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d b4
:2 a0 2c 6a a3 a0 51 a5 1c
4d 81 b0 a3 a0 51 a5 1c
4d 81 b0 a3 a0 1c 81 b0
a3 a0 1c 81 b0 a0 51 d
:2 a0 6b :2 a0 6b ac :4 a0 b9 :2 a0
b9 :2 a0 b9 b2 ee :2 a0 6b a0
7e a0 a5 b b4 2e :2 a0 6b
a0 7e a0 6b b4 2e a 10
:2 a0 6b a0 7e a0 a5 b b4
2e a 10 :2 a0 6b a0 7e a0
6b b4 2e a 10 ac e5 d0
b2 e9 b7 :2 a0 7e 51 b4 2e
65 b7 a6 9 a4 b1 11 4f
a0 7e 51 b4 2e a0 d2 9f
ac :2 a0 b2 ee a0 ac a0 b2
ee :2 a0 7e b4 2e :2 a0 7e b4
2e a 10 :2 a0 7e a0 a5 b
b4 2e a 10 ac d0 eb 7e
b4 2e ac e5 d0 b2 e9 a0
7e 51 b4 2e a0 7e 51 b4
2e 65 b7 19 3c b7 19 3c
:3 a0 e7 :2 a0 7e b4 2e ef f9
e9 :3 a0 e7 :3 a0 a5 b e7 :2 a0
e7 :2 a0 e7 :2 a0 e7 :2 a0 7e b4
2e ef f9 e9 a0 51 65 b7
a4 a0 b1 11 68 4f 1d 17
b5
115
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 5e
5a 30 66 6f 6b 59 77 84
80 56 8c 95 91 7f 9d aa
a6 7c b2 bb b7 a5 c3 a2
c8 cc d0 d4 f2 dc e0 e3
e4 ec ed db 110 fd d8 101
102 10a 10b fc 12c 11b 11f 127
f9 144 133 137 13f 11a 14b 117
14f 153 157 15b 15e 162 166 169
16a 16e 172 176 17a 17c 180 184
186 18a 18e 190 191 198 19c 1a0
1a3 1a7 1aa 1ae 1af 1b1 1b2 1b7
1bb 1bf 1c2 1c6 1c9 1cd 1d0 1d1
1 1d6 1db 1df 1e3 1e6 1ea 1ed
1f1 1f2 1f4 1f5 1 1fa 1ff 203
207 20a 20e 211 215 218 219 1
21e 223 224 22a 22e 22f 234 236
23a 23e 241 244 245 24a 24e 250
251 256 25a 25c 268 26a 26e 271
274 275 27a 27e 282 285 286 28a
28e 28f 296 29a 29b 29f 2a0 2a7
2ab 2af 2b2 2b3 2b8 2bc 2c0 2c3
2c4 1 2c9 2ce 2d2 2d6 2d9 2dd
2de 2e0 2e1 1 2e6 2eb 2ec 2f0
2f4 2f7 2f8 2fd 2fe 304 308 309
30e 312 315 318 319 31e 322 325
328 329 32e 332 334 338 33b 33d
341 344 348 34c 350 352 356 35a
35d 35e 363 369 36a 36f 373 377
37b 37d 381 385 389 38a 38c 38e
392 396 398 39c 3a0 3a2 3a6 3aa
3ac 3b0 3b4 3b7 3b8 3bd 3c3 3c4
3c9 3cd 3d0 3d4 3d6 3da 3de 3e0
3ec 3f0 3f2 3f3 3fc
115
2
0 1 a 1 19 :3 1 19 :3 1
19 :3 1 1a :3 1 19 :3 1 19 :3 1
19 :3 1 18 :3 1 19 :3 1 3 a
:3 1 1b 1f 1e 1b 26 1b :2 1
1b 1f 1e 1b 26 1b :2 1 :3 1b
:2 1 :3 1b 1 3 20 3 c :2 e
16 :2 18 :2 c 16 c 1d c 20
38 20 3b 51 3b 5 :2 c :2 e
20 1e 26 :2 20 :2 1e c :2 e 1e
1c :2 20 :2 1c :2 c 5 :2 7 20 1e
26 :2 20 :2 1e :3 c :2 e 17 15 :2 19
:2 15 :2 c :5 5 3 a 7 e f
:2 e 7 18 :2 5 3 :3 1 6 12
14 :2 12 :4 c 1a a 5 a :2 19
18 12 :2 18 28 :3 26 18 22 :3 1f
:3 18 27 25 2d :2 27 :2 25 :2 18 :2 12
11 :3 b :5 5 8 10 12 :2 10 7
e f :2 e 7 14 :2 5 16 :2 3
:2 a 1d :2 a 13 :3 11 :3 3 :2 a 12
:2 a 19 1f :2 19 :2 a 15 :2 a 17
:2 a 1a :2 a 13 :3 11 :4 3 a 3
:2 1 5 :7 1
115
4
0 :2 1 :4 3 :4 4
:4 5 :4 6 :4 7 :4 8
:4 9 :4 a :4 b 2
:2 c :2 1 :8 e :8 f
:5 10 :5 11 :3 18 :7 1b
:2 1c :b 1d :a 1e :9 1f
:2 1e :a 20 :2 1e :9 21
:2 1e 1d :4 1b 1a
23 :6 24 :3 23 22
:3 17 :5 28 :5 29 :3 2a
:2 2b :3 2c :5 2d :5 2e
:2 2d :8 2f :2 2d 2c
:5 2b 2a :4 29 :5 31
:6 32 :3 31 :3 28 36
:3 37 :5 38 :3 36 3a
:3 3b :6 3c :3 3d :3 3e
:3 3f :5 40 :3 3a :3 42
:2 17 44 :7 1
3fe
4
:3 0 1 :3 0 2
:a 0 110 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
56 0 7 4
:3 0 5 :7 0 9
8 :3 0 4 :3 0
6 :7 0 d c
:3 0 d 7c 0
b 8 :3 0 7
:7 0 11 10 :3 0
a :3 0 9 :7 0
15 14 :3 0 11
a2 0 f c
:3 0 b :7 0 19
18 :3 0 c :3 0
d :7 0 1d 1c
:3 0 15 :2 0 13
a :3 0 e :7 0
21 20 :3 0 c
:3 0 f :7 0 25
24 :3 0 10 :3 0
a :3 0 27 29
0 110 2 2a
:2 0 13 :2 0 21
12 :
/

prompt
prompt Creating function ORA_ASPNET_MEM_UPDATEUSERINFO
prompt ===============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Mem_UpdateUserInfo wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
3b
2 :e:
1FUNCTION:
1ORA_ASPNET_MEM_UPDATEUSERINFO:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAME_:
1ISPASSWORDCORRECT:
1INTEGER:
1UPDATELASTLOGINACTIVITYDATE:
1MAXINVALIDPASSWORDATTEMPTS:
1PASSWORDATTEMPTWINDOW:
1CURRENTTIMEUTC:
1DATE:
1LASTLOGINDATE_:
1LASTACTIVITYDATE_:
1RETURN:
1M_USERID:
1RAW:
116:
1M_ISLOCKEDOUT:
1M_FAILEDPWDATTEMPTCOUNT:
1M_FAILEDPWDANSWERATTEMPTCOUNT:
1M_LASTLOCKOUTDATE:
1M_FAILEDPWDATTEMPTWINSTART:
1M_FAILEDPWDANSWERATTEMPTWINSTA:
1M_DATE:
10:
1U:
1USERID:
1M:
1ISLOCKEDOUT:
1FAILEDPWDATTEMPTCOUNT:
1LASTLOCKOUTDATE:
1FAILEDPWDATTEMPTWINSTART:
1FAILEDPWDANSWERATTEMPTCOUNT:
1FAILEDPWDANSWERATTEMPTWINSTART:
1ORA_ASPNET_APPLICATIONS:
1A:
1ORA_ASPNET_USERS:
1ORA_ASPNET_MEMBERSHIP:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1APPLICATIONID:
1LOWEREDUSERNAME:
1NO_DATA_FOUND:
1-:
11001:
11:
11099:
1>:
1+:
1/:
11440:
1>=:
1TO_DATE:
101-01-1754:
1DD-MM-RRRR:
1LASTACTIVITYDATE:
1LASTLOGINDATE:
0

0
0
199
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d b4
:2 a0 2c 6a a3 a0 51 a5 1c
4d 81 b0 a3 a0 1c 81 b0
a3 a0 1c 81 b0 a3 a0 1c
81 b0 a3 a0 1c 4d 81 b0
a3 a0 1c 4d 81 b0 a3 a0
1c 4d 81 b0 a3 a0 1c 4d
81 b0 a0 51 d a0 51 d
a0 51 d :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b ac :9 a0 b9 :2 a0 b9 :2 a0 b9
b2 ee :2 a0 6b a0 7e a0 a5
b b4 2e :2 a0 6b a0 7e a0
6b b4 2e a 10 :2 a0 6b a0
7e a0 6b b4 2e a 10 :2 a0
6b a0 7e a0 a5 b b4 2e
a 10 ac e5 d0 b2 e9 b7
:2 a0 7e 51 b4 2e 65 b7 a6
9 a4 b1 11 4f a0 7e 51
b4 2e a0 7e 51 b4 2e 65
b7 19 3c a0 7e 51 b4 2e
a0 7e a0 7e a0 7e 51 b4
2e 5a b4 2e 5a b4 2e :2 a0
d a0 51 d b7 :2 a0 7e 51
b4 2e d :2 a0 d b7 :2 19 3c
:2 a0 7e b4 2e a0 51 d :2 a0
d b7 19 3c b7 a0 7e 51
b4 2e 5a a0 7e 51 b4 2e
5a 52 10 :2 a0 :2 6e a5 b d
a0 51 d :2 a0 d a0 51 d
:2 a0 d :2 a0 d b7 19 3c b7
:2 19 3c a0 7e 51 b4 2e :3 a0
e7 :2 a0 7e b4 2e ef f9 e9
:3 a0 e7 :2 a0 e7 :2 a0 e7 :2 a0 e7
:2 a0 e7 :2 a0 e7 :2 a0 e7 :2 a0 7e
b4 2e ef f9 e9 b7 :3 a0 e7
:2 a0 e7 :2 a0 e7 :2 a0 e7 :2 a0 e7
:2 a0 e7 :2 a0 7e b4 2e ef f9
e9 b7 :2 19 3c a0 51 65 b7
a4 a0 b1 11 68 4f 1d 17
b5
199
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 5e
5a 30 66 6f 6b 59 77 84
80 56 8c 95 91 7f 9d aa
a6 7c b2 bb b7 a5 c3 a2
c8 cc d0 d4 f2 dc e0 e3
e4 ec ed db 10e fd 101 109
d8 126 115 119 121 fc 142 131
135 13d f9 15b 149 14d 155 156
130 177 166 16a 12d 172 165 193
182 186 162 18e 181 1af 19e 1a2
17e 1aa 19d 1b6 19a 1ba 1be 1c2
1c5 1c9 1cd 1d0 1d4 1d8 1dc 1df
1e3 1e7 1ea 1ee 1f2 1f5 1f9 1fd
200 204 208 20b 20f 213 216 21a
21e 221 222 226 22a 22e 232 236
23a 23e 242 246 248 24c 250 252
256 25a 25c 25d 264 268 26c 26f
273 276 27a 27b 27d 27e 283 287
28b 28e 292 295 299 29c 29d 1
2a2 2a7 2ab 2af 2b2 2b6 2b9 2bd
2c0 2c1 1 2c6 2cb 2cf 2d3 2d6
2da 2dd 2e1 2e2 2e4 2e5 1 2ea
2ef 2f0 2f6 2fa 2fb 300 302 306
30a 30d 310 311 316 31a 31c 31d
322 326 328 334 336 33a 33d 340
341 346 34a 34d 350 351 356 35a
35c 360 363 367 36a 36d 36e 373
377 37a 37e 381 385 388 38b 38c
391 394 395 39a 39d 39e 3a3 3a7
3ab 3af 3b3 3b6 3ba 3bc 3c0 3c4
3c7 3ca 3cb 3d0 3d4 3d8 3dc 3e0
3e2 3e6 3ea 3ed 3f1 3f5 3f8 3f9
3fe 402 405 409 40d 411 415 417
41b 41e 420 424 427 42a 42b 430
433 437 43a 43d 43e 443 1 446
44b 44f 453 458 45d 45e 460 464
468 46b 46f 473 477 47b 47f 482
486 48a 48e 492 496 49a 49e 4a0
4a4 4a7 4a9 4ad 4b1 4b4 4b8 4bb
4be 4bf 4c4 4c8 4cc 4d0 4d2 4d6
4da 4dd 4de 4e3 4e9 4ea 4ef 4f3
4f7 4fb 4fd 501 505 507 50b 50f
511 515 519 51b 51f 523 525 529
52d 52f 533 537 539 53d 541 544
545 54a 550 551 556 558 55c 560
564 566 56a 56e 570 574 578 57a
57e 582 584 588 58c 58e 592 596
598 59c 5a0 5a3 5a4 5a9 5af 5b0
5b5 5b7 5bb 5bf 5c2 5c6 5c9 5cd
5cf 5d3 5d7 5d9 5e5 5e9 5eb 5ec
5f5
199
2
0 1 a 1 21 :3 1 21 :3 1
21 :3 1 21 :3 1 20 :3 1 21 :3 1
21 :3 1 21 :3 1 21 :3 1 3 a
:3 1 20 24 23 20 32 20 :2 1
:3 20 :2 1 :3 20 :2 1 :3 20 :2 1 :2 20 2d
20 :2 1 :2 20 2d 20 :2 1 :2
/

prompt
prompt Creating function ORA_ASPNET_PROF_DELETEINACTPF
prompt ===============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Prof_DeleteInactPf wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
1d
2 :e:
1FUNCTION:
1ORA_ASPNET_PROF_DELETEINACTPF:
1APPLICATIONNAME_:
1NVARCHAR2:
1PROFILEAUTHOPTIONS:
1INTEGER:
1INACTIVESINCEDATE:
1DATE:
1RETURN:
1M_APPLICATIONID:
1RAW:
116:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1NO_DATA_FOUND:
10:
1ORA_ASPNET_PROFILE:
1USERID:
1ORA_ASPNET_USERS:
1U:
1LASTACTIVITYDATE:
1<=:
12:
1ISANONYMOUS:
11:
1ROWCOUNT:
0

0
0
94
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d b4
:2 a0 2c 6a a3 a0 51 a5 1c
4d 81 b0 a0 ac :2 a0 b2 ee
:2 a0 7e a0 a5 b b4 2e ac
e5 d0 b2 e9 b7 :2 a0 51 65
b7 a6 9 a4 b1 11 4f :2 a0
3e a0 ac :2 a0 b9 b2 ee :2 a0
6b a0 7e b4 2e :2 a0 6b a0
7e b4 2e a 10 a0 7e 51
b4 2e 5a a0 7e 51 b4 2e
:2 a0 6b 7e 51 b4 2e a 10
5a 52 10 a0 7e 51 b4 2e
:2 a0 6b 7e 51 b4 2e a 10
5a 52 10 5a a 10 ac d0
eb 48 cd e9 :2 a0 f 65 b7
a4 a0 b1 11 68 4f 1d 17
b5
94
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 30
56 5a 5e 62 80 6a 6e 71
72 7a 7b 69 87 66 8b 8f
93 94 9b 9f a3 a6 aa ab
ad ae b3 b4 ba be bf c4
c6 ca ce d1 d5 d7 d8 dd
e1 e3 ef f1 f5 1 f9 fd
fe 102 106 108 109 110 114 118
11b 11f 122 123 128 12c 130 133
137 13a 13b 1 140 145 149 14c
14f 150 155 158 15c 15f 162 163
168 16c 170 173 176 179 17a 1
17f 184 1 187 18c 190 193 196
197 19c 1a0 1a4 1a7 1aa 1ad 1ae
1 1b3 1b8 1 1bb 1c0 1 1c3
1c8 1c9 1cd 1d1 1d4 1d9 1de 1e2
1e6 1eb 1ef 1f1 1f5 1f9 1fb 207
20b 20d 20e 217
94
2
0 1 a 1 18 :3 1 18 :3 1
18 :3 1 3 a :3 1 18 1c 1b
18 24 18 1 :2 c 1f a 5
a b 24 22 2a :2 24 :2 22 :5 5
3 a 7 e 7 18 :2 5 3
:3 1 f :2 a :3 13 24 13 b :2 13
:2 15 25 :3 23 13 :2 15 29 :3 26 :2 13
15 28 2a :2 28 14 15 28 2a
:2 28 30 :2 32 3e 40 :2 3e :2 15 :3 14
15 28 2a :2 28 30 :2 32 3e 40
:2 3e :2 15 :3 14 :3 13 :2 b :2 a :3 3 e
a 3 :2 1 5 :7 1
94
4
0 :2 1 :4 3 :4 4
:4 5 2 :2 6 :2 1
:8 8 :3 10 :3 11 :8 12
11 :4 10 f 14
:3 15 :3 14 13 :3 d
18 :2 19 :2 1a :5 1b
:7 1c :7 1d :2 1c :6 1f
:f 20 :2 1f :f 21 :2 1f
1e :2 1c 1b :2 1a
19 :2 18 :4 25 :2 d
27 :7 1
219
4
:3 0 1 :3 0 2
:a 0 8f 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
:2 0 7 6 :3 0
5 :7 0 9 8
:3 0 8 :3 0 7
:7 0 d c :3 0
9 :3 0 6 :3 0
f 11 0 8f
2 12 :2 0 11
:2 0 f b :3 0
c :2 0 d 15
17 :7 0 1b 18
19 8d 0 a
:6 0 d :3 0 a
:3 0 e :3 0 13
20 29 0 2a
:3 0 f :3 0 10
:3 0 11 :2 0 3
:3 0 15 23 26
19 24 28 :4 0
2c 2d :5 0 1d
21 0 1c 0
2b :2 0 2f 1e
39 12 :3 0 9
:3 0 13 :2 0 32
:2 0 34 20 36
22 35 34 :2 0
37 24 :2 0 39
0 39 38 2f
37 :6 0 8a 1
:3 0 14 :3 0 15
:3 0 15 :3 0 26
16 :3 0 17 :3 0
40 41 28 43
7f 0 80 :3 0
17 :3 0 d :3 0
45 46 0 a
:3 0 11 :2 0 2c
49 4a :3 0 17
:3 0 18 :3 0 4c
4d 0 7 :3 0
19 :2 0 31 50
51 :3 0 4b 53
52 :2 0 5 :3 0
11 :2 0 1a :2 0
36 56 58 :3 0
59 :2 0 5 :3 0
11 :2 0 13 :2 0
3b 5c 5e :3 0
17 :3 0 1b :3 0
60 61 0 11
:2 0 1c :2 0 40
63 65 :3 0 5f
67 66 :2 0 68
:2 0 5a 6a 69
:2 0 5 :3 0 11
:2 0 1c :2 0 45
6d 6f :3 0 17
:3 0 1b :3 0 71
72 0 11 :2 0
13 :2 0 4a 74
76 :3 0 70 78
77 :2 0 79 :2 0
6b 7b 7a :2 0
7c :2 0 54 7e
7d :4 0 3f 44
0 81 :3 0 3c
3d 82 3b 83
0 85 :2 0 84
:2 0 8a 9 :3 0
1d :4 0 87 :3 0
88 :2 0 8a 4d
8e :3 0 8e 2
:3 0 51 8e 8d
8a 8b :6 0 8f
:2 0 2 12 8e
92 :3 0 91 8f
93 :8 0
53
4
:3 0 1 3 1
7 1 b 3
6 a e 1
16 1 14 1
1c 1 1f 1
25 1 27 2
22 27 1 1e
1 2e 1 33
1 30 1 36
1 3e 1 42
1 48 2 47
48 1 4f 2
4e 4f 1 57
2 55 57 1
5d 2 5b 5d
1 64 2 62
64 1 6e 2
6c 6e 1 75
2 73 75 3
39 85 89 1
1a
1
4
0
92
1
1
14
2
5
0 1 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
14 1 0
2 0 1
7 1 0
b 1 0
3 1 0
0
/

prompt
prompt Creating function ORA_ASPNET_PROF_DELETEPROFILES
prompt ================================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Prof_DeleteProfiles wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
25
2 :e:
1FUNCTION:
1ORA_ASPNET_PROF_DELETEPROFILES:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAMESARRAY:
1ORA_ASPNET_PROF_PKG:
1ASSOCARRAYNVARCHAR2_T:
1RETURN:
1INTEGER:
1M_COUNT:
1M_USERID:
1RAW:
116:
10:
1I:
11:
1COUNT:
1LOOP:
1U:
1USERID:
1ORA_ASPNET_APPLICATIONS:
1A:
1ORA_ASPNET_USERS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1APPLICATIONID:
1LOWEREDUSERNAME:
1NO_DATA_FOUND:
1IS NOT NULL:
1ORA_ASPNET_PROFILE:
1+:
1ROWCOUNT:
1OTHERS:
1ROLLBACK:
1ROLLBACK_NR:
1EXIT:
0

0
0
ba
2
0 a0 8d 8f a0 b0 3d 8f
:2 a0 6b b0 3d b4 :2 a0 2c 6a
a3 a0 1c 81 b0 a3 a0 51
a5 1c 4d 81 b0 a0 51 d
91 51 :2 a0 6b a0 63 37 :2 a0
6b ac :3 a0 b9 :2 a0 b9 b2 ee
:2 a0 6b a0 7e a0 a5 b b4
2e :2 a0 6b a0 7e a0 6b b4
2e a 10 :2 a0 6b a0 7e :2 a0
a5 b a5 b b4 2e a 10
ac e5 d0 b2 e9 b7 a0 4f
b7 a6 9 a4 b1 11 4f a0
7e b4 2e :3 a0 7e b4 2e cd
e9 :2 a0 7e a0 f b4 2e d
a0 4d d b7 19 3c b7 a0
53 a0 57 a0 b4 e9 a0 51
d a0 2b b7 a6 9 a4 b1
11 4f b7 a0 47 b7 a0 53
a0 57 a0 b4 e9 a0 51 d
b7 a6 9 a4 b1 11 4f :2 a0
65 b7 a4 a0 b1 11 68 4f
1d 17 b5
ba
2
0 3 7 23 1f 1e 2b 3c
34 38 1b 33 44 30 49 4d
51 55 6e 5d 61 69 5c 8c
79 59 7d 7e 86 87 78 93
75 97 9b 9f a2 a6 aa ad
b1 b5 b7 bb bf c2 c3 c7
cb cf d1 d5 d9 db dc e3
e7 eb ee f2 f5 f9 fa fc
fd 102 106 10a 10d 111 114 118
11b 11c 1 121 126 12a 12e 131
135 138 13c 140 141 143 144 146
147 1 14c 151 152 158 15c 15d
162 164 168 16a 16c 16d 172 176
178 184 186 18a 18d 18e 193 197
19b 19f 1a2 1a3 1a8 1ad 1b2 1b6
1ba 1bd 1c1 1c6 1c7 1cc 1d0 1d4
1d5 1d9 1db 1df 1e2 1e4 1 1e8
1ec 1f1 1f5 1f6 1fb 1ff 202 206
20a 210 212 213 218 21c 21e 22a
22c 22e 232 239 23b 1 23f 243
248 24c 24d 252 256 259 25d 25f
260 265 269 26b 277 279 27d 281
285 287 28b 28f 291 29d 2a1 2a3
2a4 2ad
ba
2
0 1 a 1 18 :3 1 18 2c
18 :3 1 3 a :3 1 :3 12 :2 1 12
16 15 12 1d 12 1 3 e
3 9 e 11 :2 20 26 e 5
10 :2 12 10 1e 10 28 10 2b
3c 2b 9 :2 10 :2 12 2b 29 31
:2 2b :2 29 10 :2 12 22 20 :2 24 :2 20
:3 10 :2 12 24 22 2a 39 :2 2a :2 24
:2 22 :2 10 :5 9 7 e b 1c :2 9
7 :3 26 :4 c 17 30 39 :3 37 :3 b
16 1e 24 20 :2 16 b 4 10
4 21 :2 9 7 :2 e :6 b 16 :3 b
15 :2 9 7 :4 26 9 5 3 :2 a
:6 7 12 7 11 :2 5 3 :3 1 3
a 3 :2 1 5 :7 1
ba
4
0 :2 1 :4 3 :6 4
2 :2 5 :2 1 :5 7
:8 8 :3 b :8 e :5 10
:8 11 :a 12 :9 13 :2 12
:d 14 :2 12 11 :4 10
f 16 17 :3 16
15 :3 e :4 1b :8 1c
:8 1d :3 1e :3 1b 1a
:2 21 :5 22 :3 23 :2 24
:3 21 20 :4 e 26
e d :2 29 :5 2a
:3 2b :3 29 28 :3 a
:3 2e :2 a 2f :7 1

2af
4
:3 0 1 :3 0 2
:a 0 b5 1 :7 0
8 9 0 3
4 :3 0 3 :7 0
5 4 :3 0 7
:2 0 5 6 :3 0
7 :2 0 4 5
:7 0 b a :3 0
8 :3 0 9 :3 0
d f 0 b5
2 10 :2 0 d
:2 0 a 9 :3 0
13 :7 0 16 14
0 b3 0 a
:6 0 e :2 0 e
c :3 0 c 18
1a :7 0 1e 1b
1c b3 0 b
:6 0 a :3 0 1f
20 0 b0 f
:3 0 10 :2 0 5
:3 0 11 :3 0 24
25 0 12 :3 0
23 26 :2 0 22
28 13 :3 0 14
:3 0 2a 2b 0
10 b :3 0 15
:3 0 16 :3 0 2f
30 17 :3 0 13
:3 0 32 33 12
35 5a 0 5b
:3 0 16 :3 0 18
:3 0 37 38 0
19 :3 0 1a :2 0
3 :3 0 15 3a
3d 19 3b 3f
:3 0 13 :3 0 1b
:3 0 41 42 0
16 :3 0 1a :2 0
1b :3 0 44 46
0 1e 45 48
:3 0 40 4a 49
:2 0 13 :3 0 1c
:3 0 4c 4d 0
19 :3 0 1a :2 0
5 :3 0 f :3 0
21 51 53 23
4f 55 27 50
57 :3 0 4b 59
58 :3 0 5d 5e
:5 0 2d 36 0
2a 0 5c :2 0
60 2c 68 1d
:4 0 63 2e 65
30 64 63 :2 0
66 32 :2 0 68
0 68 67 60
66 :6 0 98 3
:3 0 b :3 0 1e
:2 0 34 6b 6c
:3 0 1f :3 0 14
:3 0 b :3 0 1a
:2 0 38 71 72
:3 0 6e 73 0
75 :2 0 74 :2 0
81 a :3 0 a
:3 0 20 :2 0 21
:4 0 79 :3 0 3b
78 7b :3 0 76
7c 0 81 b
:4 0 7e 7f 0
81 3e 82 6d
81 0 83 42
0 84 44 96
22 :3 0 23 :3 0
89 8a :2 0 8b
24 :2 0 80 :2 0
88 :2 0 91 a
:3 0 e :2 0 8c
8d 0 91 25
:8 0 91 46 93
4a 92 91 :2 0
94 4c :2 0 96
0 96 95 84
94 :6 0 98 3
:3 0 4e 9a 12
:3 0 29 98 :4 0
9b 51 ab 22
:3 0 23 :3 0 a0
a1 :2 0 a2 24
:2 0 80 :2 0 9f
:2 0 a6 a :3 0
e :2 0 a3 a4
0 a6 53 a8
56 a7 a6 :2 0
a9 58 :2 0 ab
0 ab aa 9b
a9 :6 0 b0 1
:3 0 8 :3 0 a
:3 0 ae :2 0 b0
5a b4 :3 0 b4
2 :3 0 5e b4
b3 b0 b1 :6 0
b5 :2 0 2 10
b4 b8 :3 0 b7
b5 b9 :8 0
61
4
:3 0 1 3 1
7 2 6 c
1 12 1 19
1 17 1 2c
2 31 34 1
3c 1
/

prompt
prompt Creating function ORA_ASPNET_PROF_GETNOFINACTPF
prompt ===============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Prof_GetNOfInactPf wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
21
2 :e:
1FUNCTION:
1ORA_ASPNET_PROF_GETNOFINACTPF:
1APPLICATIONNAME_:
1NVARCHAR2:
1PROFILEAUTHOPTIONS:
1INTEGER:
1INACTIVESINCEDATE:
1DATE:
1RETURN:
1M_APPLICATIONID:
1RAW:
116:
1M_TOTALRECORDS:
10:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1NO_DATA_FOUND:
1-:
12019:
1COUNT:
1U:
1USERID:
1ORA_ASPNET_USERS:
1ORA_ASPNET_PROFILE:
1P:
12:
1ISANONYMOUS:
11:
1LASTACTIVITYDATE:
1<=:
0

0
0
be
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d b4
:2 a0 2c 6a a3 a0 51 a5 1c
4d 81 b0 a3 a0 1c 81 b0
a0 51 d a0 ac :2 a0 b2 ee
:2 a0 7e a0 a5 b b4 2e ac
e5 d0 b2 e9 b7 :2 a0 7e 51
b4 2e 65 b7 a6 9 a4 b1
11 4f :3 a0 6b d2 9f ac :3 a0
b9 :2 a0 b9 b2 ee :2 a0 6b a0
7e b4 2e :2 a0 6b a0 7e a0
6b b4 2e a 10 a0 7e 51
b4 2e 5a a0 7e 51 b4 2e
:2 a0 6b 7e 51 b4 2e a 10
5a 52 10 a0 7e 51 b4 2e
:2 a0 6b 7e 51 b4 2e a 10
5a 52 10 5a a 10 :2 a0 6b
a0 7e b4 2e 5a a 10 ac
e5 d0 b2 e9 b7 :2 a0 7e 51
b4 2e 65 b7 a6 9 a4 b1
11 4f :2 a0 65 b7 a4 a0 b1
11 68 4f 1d 17 b5
be
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 30
56 5a 5e 62 80 6a 6e 71
72 7a 7b 69 9c 8b 8f 97
66 87 a3 a6 aa ae af b3
b7 b8 bf c3 c7 ca ce cf
d1 d2 d7 d8 de e2 e3 e8
ea ee f2 f5 f8 f9 fe 102
104 105 10a 10e 110 11c 11e 122
126 12a 12d 131 134 135 139 13d
141 143 147 14b 14d 14e 155 159
15d 160 164 167 168 16d 171 175
178 17c 17f 183 186 187 1 18c
191 195 198 19b 19c 1a1 1a4 1a8
1ab 1ae 1af 1b4 1b8 1bc 1bf 1c2
1c5 1c6 1 1cb 1d0 1 1d3 1d8
1dc 1df 1e2 1e3 1e8 1ec 1f0 1f3
1f6 1f9 1fa 1 1ff 204 1 207
20c 1 20f 214 218 21c 21f 223
226 227 22c 1 22f 234 235 23b
23f 240 245 247 24b 24f 252 255
256 25b 25f 261 262 267 26b 26d
279 27b 27f 283 287 289 28d 291
293 29f 2a3 2a5 2a6 2af
be
2
0 1 a 1 18 :3 1 18 :3 1
18 :3 1 4 b :3 1 29 2d 2c
29 34 29 :2 1 :3 29 1 3 15
3 :2 c 1f a 5 a b 24
22 2a :2 24 :2 22 :5 5 3 a 7
e f :2 e 7 18 :2 5 3 :3 1
c 12 :2 14 :3 c 21 a 1b a
1e 32 1e 5 a b :2 d 1d
:3 1b b :2 d 16 14 :2 18 :2 14 :2 b
e 21 23 :2 21 d e 21 23
:2 21 29 :2 2b 37 39 :2 37 :2 e :3 d
e 21 23 :2 21 29 :2 2b 37 39
:2 37 :2 e :3 d :3 b c :2 e 22 :3 1f
:3 b :5 5 3 a 7 e f :2 e
7 18 :2 5 3 :3 1 3 a 3
:2 1 5 :7 1
be
4
0 :2 1 :4 3 :4 4
:4 5 2 :2 6 :2 1
:8 8 :5 9 :3 11 :3 14
:3 15 :8 16 15 :4 14
13 18 :6 19 :3 18
17 :3 10 :8 1e :8 1f
:7 20 :9 21 :2 20 :6 23
:f 24 :2 23 :f 25 :2 23
22 :2 20 :8 27 :2 20
1f :4 1e 1c 29
:6 2a :3 29 28 :3 10
:3 2e :2 10 30 :7 1

2b1
4
:3 0 1 :3 0 2
:a 0 b9 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
:2 0 7 6 :3 0
5 :7 0 9 8
:3 0 8 :3 0 7
:7 0 d c :3 0
9 :3 0 6 :3 0
f 11 0 b9
2 12 :2 0 11
87 0 f b
:3 0 c :2 0 d
15 17 :7 0 1b
18 19 b7 0
a :6 0 d :3 0
6 :3 0 1d :7 0
20 1e 0 b7
0 d :6 0 e
:2 0 21 22 0
b4 f :3 0 13
a :3 0 10 :3 0
15 28 31 0
32 :3 0 11 :3 0
12 :3 0 13 :2 0
3 :3 0 17 2b
2e 1b 2c 30
:4 0 34 35 :5 0
25 29 0 1e
0 33 :2 0 37
20 44 14 :3 0
9 :3 0 15 :2 0
16 :2 0 22 3a
3c :3 0 3d :2 0
3f 24 41 26
40 3f :2 0 42
28 :2 0 44 0
44 43 37 42
:6 0 b4 1 :3 0
17 :3 0 18 :3 0
19 :3 0 47 48
0 4b 0 49
0 17 :2 0 2a
d :3 0 1a :3 0
18 :3 0 4e 4f
1b :3 0 1c :3 0
51 52 2c 54
9c 0 9d :3 0
18 :3 0 f :3 0
56 57 0 a
:3 0 13 :2 0 31
5a 5b :3 0 18
:3 0 19 :3 0 5d
5e 0 1c :3 0
13 :2 0 19 :3 0
60 62 0 36
61 64 :3 0 5c
66 65 :2 0 5
:3 0 13 :2 0 1d
:2 0 3b 69 6b
:3 0 6c :2 0 5
:3 0 13 :2 0 e
:2 0 40 6f 71
:3 0 18 :3 0 1e
:3 0 73 74 0
13 :2 0 1f :2 0
45 76 78 :3 0
72 7a 79 :2 0
7b :2 0 6d 7d
7c :2 0 5 :3 0
13 :2 0 1f :2 0
4a 80 82 :3 0
18 :3 0 1e :3 0
84 85 0 13
:2 0 e :2 0 4f
87 89 :3 0 83
8b 8a :2 0 8c
:2 0 7e 8e 8d
:2 0 8f :2 0 67
91 90 :2 0 18
:3 0 20 :3 0 93
94 0 7 :3 0
21 :2 0 54 97
98 :3 0 99 :2 0
92 9b 9a :3 0
9f a0 :5 0 4c
55 0 57 0
9e :2 0 a2 59
af 14 :3 0 9
:3 0 15 :2 0 16
:2 0 5b a5 a7
:3 0 a8 :2 0 aa
5d ac 5f ab
aa :2 0 ad 61
:2 0 af 0 af
ae a2 ad :6 0
b4 1 :3 0 9
:3 0 d :3 0 b2
:2 0 b4 63 b8
:3 0 b8 2 :3 0
68 b8 b7 b4
b5 :6 0 b9 :2 0
2 12 b8 bc
:3 0 bb b9 bd
:8 0
6b
4
:3 0 1 3 1
7 1 b 3
6 a e 1
16 1 14 1
1c 1 24 1
27 1 2d 1
2f
/

prompt
prompt Creating function ORA_ASPNET_PROF_GETPROFILES
prompt =============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Prof_GetProfiles wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
3f
2 :e:
1FUNCTION:
1ORA_ASPNET_PROF_GETPROFILES:
1APPLICATIONNAME_:
1NVARCHAR2:
1PROFILEAUTHOPTIONS:
1INTEGER:
1PAGEINDEX:
1PAGESIZE:
1USERNAMETOMATCH:
1INACTIVESINCEDATE:
1DATE:
1OUTREFCURSOR:
1OUT:
1SYS_REFCURSOR:
1USERNAME_:
1ISANONYMOUS_:
1LASTACTIVITYDATE_:
1LASTUPDATEDDATE_:
1SIZE_:
1RETURN:
1M_APPLICATIONID:
1RAW:
116:
1M_TOTALRECORDS:
10:
1M_PAGELOWERBOUND:
1M_PAGEUPPERBOUND:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1NO_DATA_FOUND:
1-:
12019:
1COUNT:
1U:
1USERID:
1ORA_ASPNET_USERS:
1ORA_ASPNET_PROFILE:
1P:
12:
1ISANONYMOUS:
11:
1IS NULL:
1LASTACTIVITYDATE:
1<=:
1LOWEREDUSERNAME:
1LIKE:
1USERNAME:
1LASTUPDATEDDATE:
1DBMS_LOB:
1GETLENGTH:
1PROPERTYNAMES:
1+:
1PROPERTYVALUESSTRING:
1PROPERTYVALUESBINARY:
1THESIZE:
1>:
1*:
1OPEN:
1ROWNUM:
1RN:
0

0
0
2a9
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 b4 :2 a0 2c 6a a3
a0 51 a5 1c 4d 81 b0 a3
a0 1c 51 81 b0 a3 a0 1c
51 81 b0 a3 a0 1c 51 81
b0 a0 ac :2 a0 b2 ee :2 a0 7e
a0 a5 b b4 2e ac e5 d0
b2 e9 b7 :2 a0 7e 51 b4 2e
65 b7 a6 9 a4 b1 11 4f
:3 a0 6b d2 9f ac :3 a0 b9 :2 a0
b9 b2 ee :2 a0 6b a0 7e b4
2e :2 a0 6b a0 7e a0 6b b4
2e a 10 a0 7e 51 b4 2e
5a a0 7e 51 b4 2e :2 a0 6b
7e 51 b4 2e a 10 5a 52
10 a0 7e 51 b4 2e :2 a0 6b
7e 51 b4 2e a 10 5a 52
10 5a a 10 a0 7e b4 2e
5a :2 a0 6b a0 7e b4 2e 5a
52 10 5a a 10 a0 7e b4
2e 5a :2 a0 6b 7e :2 a0 a5 b
b4 2e 5a 52 10 5a a 10
ac :2 a0 6b de ac e5 d0 b2
e9 b7 :2 a0 7e 51 b4 2e 65
b7 a6 9 a4 b1 11 4f a0
7e 51 b4 2e a0 7e 51 b4
2e a 10 :2 a0 6b :2 a0 6b :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b a5
b 7e :2 a0 6b :2 a0 6b a5 b
b4 2e 7e :2 a0 6b :2 a0 6b a5
b b4 2e a0 5a b9 ac :7 a0
b9 :2 a0 b9 b2 ee :2 a0 6b a0
7e b4 2e :2 a0 6b a0 7e a0
6b b4 2e a 10 a0 7e 51
b4 2e 5a a0 7e 51 b4 2e
:2 a0 6b 7e 51 b4 2e a 10
5a 52 10 a0 7e 51 b4 2e
:2 a0 6b 7e 51 b4 2e a 10
5a 52 10 5a a 10 a0 7e
b4 2e 5a :2 a0 6b a0 7e b4
2e 5a 52 10 5a a 10 a0
7e b4 2e 5a :2 a0 6b 7e :2 a0
a5 b b4 2e 5a 52 10 5a
a 10 ac :2 a0 6b de ac e5
d0 b2 e9 b7 19 3c a0 7e
51 b4 2e :2 a0 7e a0 b4 2e
d :2 a0 7e 51 b4 2e d :2 a0
7e 51 b4 2e 5a 7e a0 b4
2e d :2 a0 ac :2 a0 6b :2 a0 6b
:2 a0 6b :2 a0 6b :2 a0 6b :2 a0 6b
a5 b 7e :2 a0 6b :2 a0 6b a5
b b4 2e 7e :2 a0 6b :2 a0 6b
a5 b b4 2e :2 a0 b9 ac :2 a0
b9 :2 a0 b9 b2 ee :2 a0 6b a0
7e b4 2e :2 a0 6b a0 7e a0
6b b4 2e a 10 a0 7e 51
b4 2e 5a a0 7e 51 b4 2e
:2 a0 6b 7e 51 b4 2e a 10
5a 52 10 a0 7e 51 b4 2e
:2 a0 6b 7e 51 b4 2e a 10
5a 52 10 5a a 10 a0 7e
b4 2e 5a :2 a0 6b a0 7e b4
2e 5a 52 10 5a a 10 a0
7e b4 2e 5a :2 a0 6b 7e :2 a0
a5 b b4 2e 5a 52 10 5a
a 10 :2 a0 7e b4 2e a 10
ac d0 :2 a0 6b de ac eb b2
ee a0 3e :2 a0 48 63 ac e5
d0 b2 :2 e9 dd b7 19 3c :2 a0
65 b7 a4 a0 b1 11 68 4f
1d 17 b5
2a9
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 5e
5a 30 66 6f 6b 59 77 84
80 56 8c 99 91 95 7f a0
b1 a9 ad 7c b8 c5 bd c1
a8 cc dd d5 d9 a5 e4 f1
e9 ed d4 f8 109 101 105 d1
110 100 115 119 11d 121 13c 129
fd 12d 12e 136 137 128 158 147
14b 125 153 146 174 163 167 143
16f 162 190 17f 183 15f 18b 17e
197 17b 19b 19f 1a3 1a4 1ab 1af
1b3 1b6 1ba 1bb 1bd 1be 1c3 1c4
1ca 1ce 1cf 1d4 1d6 1da 1de 1e1
1e4 1e5 1ea 1ee 1f0 1f1 1f6 1fa
1fc 208 20a 20e 212 216 219 21d
220 221 225 229 22d 22f 233 237
239 23a 241 245 249 24c 250 253
254 259 25d 261 264 268 26b 26f
272 273 1 278 27d 281 284 287
288 28d 290 294 297 29a 29b 2a0
2a4 2a8 2ab 2ae 2b1 2b2 1 2b7
2bc 1 2bf 2c4 2c8 2cb 2ce 2cf
2d4 2d8 2dc 2df 2e2 2e5 2e6 1
2eb 2f0 1 2f3 2f8 1 2fb 300
304 307 308 30d 310 314 318 31b
31f 322 323 328 1 32b 330 1
333 338 33c 33f 340 345 348 34c
350 353 356 35a 35e 35f 361 362
367 1 36a 36f 1 372 377 378
37c 380 383 385 386 38c 390 391
396 398 39c 3a0 3a3 3a6 3a7 3ac
3b0 3b2 3b3 3b8 3bc 3be 3ca 3cc
3d0 3d3 3d6 3d7 3dc 3e0 3e3 3e6
3e7 1 3ec 3f1 3f5 3f9 3fc 400
404 407 40b 40f 4
/

prompt
prompt Creating function ORA_ASPNET_PROF_GETPROPERTIES
prompt ===============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Prof_GetProperties wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
2a
2 :e:
1FUNCTION:
1ORA_ASPNET_PROF_GETPROPERTIES:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAME_:
1CURRENTTIMEUTC:
1DATE:
1NAMES_:
1OUT:
1NCLOB:
1VALUES_:
1BUF_:
1BLOB:
1RETURN:
1INTEGER:
1M_APPLICATIONID:
1RAW:
116:
1M_USERID:
1M_COUNT:
10:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1NO_DATA_FOUND:
1-:
12019:
1USERID:
1ORA_ASPNET_USERS:
1LOWEREDUSERNAME:
11:
1DUAL:
1ORA_ASPNET_PROFILE:
1EXISTS:
1>:
1PROPERTYNAMES:
1PROPERTYVALUESSTRING:
1PROPERTYVALUESBINARY:
1ROWNUM:
1LASTACTIVITYDATE:
0

0
0
ec
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 b4 :2 a0 2c 6a a3
a0 51 a5 1c 4d 81 b0 a3
a0 51 a5 1c 4d 81 b0 a3
a0 1c 81 b0 a0 51 d a0
ac :2 a0 b2 ee :2 a0 7e a0 a5
b b4 2e ac e5 d0 b2 e9
b7 :2 a0 7e 51 b4 2e 65 b7
a6 9 a4 b1 11 4f a0 ac
:2 a0 b2 ee :2 a0 7e b4 2e :2 a0
7e a0 a5 b b4 2e a 10
ac e5 d0 b2 e9 b7 :2 a0 7e
51 b4 2e 65 b7 a6 9 a4
b1 11 4f 51 ac :2 a0 b2 ee
a0 ac a0 b2 ee :2 a0 7e b4
2e ac d0 eb 7e b4 2e ac
e5 d0 b2 e9 b7 :2 a0 7e 51
b4 2e 65 b7 a6 9 a4 b1
11 4f a0 7e 51 b4 2e :3 a0
ac :4 a0 b2 ee :2 a0 7e b4 2e
a0 7e 51 b4 2e a 10 ac
e5 d0 b2 e9 b7 19 3c :3 a0
e7 :2 a0 7e b4 2e ef f9 e9
a0 51 65 b7 a4 a0 b1 11
68 4f 1d 17 b5
ec
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 62
5a 5e 30 69 76 6e 72 59
7d 8e 86 8a 56 95 85 9a
9e a2 a6 c1 ae 82 b2 b3
bb bc ad df cc aa d0 d1
d9 da cb fb ea ee f6 c8
e6 102 105 109 10d 10e 112 116
117 11e 122 126 129 12d 12e 130
131 136 137 13d 141 142 147 149
14d 151 154 157 158 15d 161 163
164 169 16d 16f 17b 17d 181 182
186 18a 18b 192 196 19a 19d 19e
1a3 1a7 1ab 1ae 1b2 1b3 1b5 1b6
1 1bb 1c0 1c1 1c7 1cb 1cc 1d1
1d3 1d7 1db 1de 1e1 1e2 1e7 1eb
1ed 1ee 1f3 1f7 1f9 205 207 20a
20b 20f 213 214 21b 21f 220 224
225 22c 230 234 237 238 23d 23e
242 246 249 24a 24f 250 256 25a
25b 260 262 266 26a 26d 270 271
276 27a 27c 27d 282 286 288 294
296 29a 29d 2a0 2a1 2a6 2aa 2ae
2b2 2b3 2b7 2bb 2bf 2c3 2c4 2cb
2cf 2d3 2d6 2d7 2dc 2e0 2e3 2e6
2e7 1 2ec 2f1 2f2 2f8 2fc 2fd
302 304 308 30b 30f 313 317 319
31d 321 324 325 32a 330 331 336
33a 33d 341 343 347 34b 34d 359
35d 35f 360 369
ec
2
0 1 a 1 18 :3 1 18 :3 1
18 :3 1 14 18 :3 1 14 18 :3 1
14 18 :3 1 3 a :3 1 13 17
16 13 1e 13 :2 1 13 17 16
13 1e 13 :2 1 :3 13 1 3 18
3 :2 c 1f a 5 a b 24
22 2a :2 24 :2 22 :5 5 3 a 7
e f :2 e 7 18 :2 5 3 :3 1
:2 c 18 a 5 a b 1b :3 19
b 1d 1b 23 :2 1d :2 1b :2 b :5 5
3 a 7 e f :2 e 7 18
:2 5 3 :3 1 :2 c 13 a 5 a
:2 19 18 12 :2 18 21 :3 1f :2 12 11
:3 b :5 5 3 a 7 e f :2 e
7 18 :2 5 3 :3 1 6 e 10
:2 e c 1b 31 :2 c 14 1d c
5 :2 c 15 :3 13 c 13 15 :2 13
:2 c :5 5 12 :2 3 :2 a 1d :2 a 13
:3 11 :4 3 a 3 :2 1 5 :7 1
ec
4
0 :2 1 :4 3 :4 4
:4 5 :5 6 :5 7 :5 8
2 :2 a :2 1 :8 c
:8 d :5 e :3 13 :3 17
:3 18 :8 19 18 :4 17
16 1b :6 1c :3 1b
1a :3 12 :3 21 :3 22
:5 23 :8 24 :2 23 22
:4 21 20 26 :6 27
:3 26 25 :3 12 :3 2b
:3 2c :2 2d :3 2e :5 2f
2e :5 2d 2c :4 2b
2a 31 :6 32 :3 31
30 :3 12 :5 35 :4 36
:3 37 :3 38 :5 39 :5 3a
:2 39 38 :4 36 :3 35
3d :3 3e :5 3f :3 3d
:3 41 :2 12 43 :7 1

36b
4
:3 0 1 :3 0 2
:a 0 e7 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
56 0 7 4
:3 0 5 :7 0 9
8 :3 0 7 :3 0
6 :7 0 d c
:3 0 d 82 0
b 9 :3 0 a
:3 0 8 :6 0 12
11 :3 0 9 :3 0
a :3 0 b :6 0
17 16 :3 0 12
:2 0 f 9 :3 0
d :3 0 c :6 0
1c 1b :3 0 e
:3 0 f :3 0 1e
20 0 e7 2
21 :2 0 12 :2 0
18 11 :3 0 16
24 26 :7 0 2a
27 28 e5 0
10 :6 0 1e e6
0 1c 11 :3 0
1a 2c 2e :7 0
32 2f 30 e5
0 13 :6 0 14
:3 0 f :3 0 34
:7 0 37 35 0
e5 0 14 :6 0
15 :2 0 38 39
0 e2 16 :3 0
20 10 :3 0 17
:3 0 22 3f 48
0 49 :3 0 18
:3 0 19 :3 0 1a
:2 0 3 :3 0 24
42 45 28 43
47 :4 0 4b 4c
:5 0 3c 40 0
2b 0 4a :2 0
4e 2d 5b 1b
:3 0 e :3 0 1c
:2 0 1d :2 0 2f
51 53 :3 0 54
:2 0 56 31 58
33 57 56 :2 0
59 35 :2 0 5b
0 5b 5a 4e
59 :6 0 e2 1
:3 0 1e :3 0 37
13 :3 0 1f :3 0
39 61 71 0
72 :3 0 16 :3 0
10 :3 0 1a :2 0
3d 65 66 :3 0
20 :3 0 19 :3 0
1a :2 0 5 :3 0
40 69 6c 44
6a 6e :3 0 67
70 6f :3 0 74
/

prompt
prompt Creating function ORA_ASPNET_PROF_SETPROPERTIES
prompt ===============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Prof_SetProperties wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
29
2 :e:
1FUNCTION:
1ORA_ASPNET_PROF_SETPROPERTIES:
1APPLICATIONNAME_:
1NVARCHAR2:
1PROPERTYNAMES_:
1NCLOB:
1PROPERTYVALUESSTRING_:
1PROPERTYVALUESBINARY_:
1BLOB:
1USERNAME_:
1ISUSERANONYMOUS:
1INTEGER:
1CURRENTTIMEUTC:
1DATE:
1RETURN:
1M_APPLICATIONID:
1RAW:
116:
1M_USERID:
1M_RETURNVALUE:
1M_COUNT:
10:
1ORA_ASPNET_APPS_CREATEAPP:
1USERID:
1ORA_ASPNET_USERS:
1APPLICATIONID:
1=:
1LOWEREDUSERNAME:
1LOWER:
1NO_DATA_FOUND:
1IS NULL:
1ORA_ASPNET_USERS_CREATEUSER:
1LASTACTIVITYDATE:
11:
1DUAL:
1ORA_ASPNET_PROFILE:
1EXISTS:
1PROPERTYNAMES:
1PROPERTYVALUESSTRING:
1PROPERTYVALUESBINARY:
1LASTUPDATEDDATE:
0

0
0
ed
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d b4
:2 a0 2c 6a a3 a0 51 a5 1c
4d 81 b0 a3 a0 51 a5 1c
4d 81 b0 a3 a0 1c 81 b0
a3 a0 1c 81 b0 a0 51 d
a0 51 d :4 a0 a5 b d a0
ac :2 a0 b2 ee :2 a0 7e b4 2e
:2 a0 7e a0 a5 b b4 2e a
10 ac e5 d0 b2 e9 b7 a0
4f b7 a6 9 a4 b1 11 4f
a0 7e b4 2e :7 a0 a5 b d
b7 19 3c :3 a0 e7 :2 a0 7e b4
2e ef f9 e9 51 ac :2 a0 b2
ee a0 ac a0 b2 ee :2 a0 7e
b4 2e ac d0 eb 7e b4 2e
ac e5 d0 b2 e9 b7 a0 4f
b7 a6 9 a4 b1 11 4f a0
7e 51 b4 2e :b a0 5 d7 b2
5 e9 b7 :3 a0 e7 :2 a0 e7 :2 a0
e7 :2 a0 e7 :2 a0 7e b4 2e ef
f9 e9 b7 :2 19 3c a0 51 65
b7 a4 a0 b1 11 68 4f 1d
17 b5
ed
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 5e
5a 30 66 6f 6b 59 77 84
80 56 8c 95 91 7f 9d 7c
a2 a6 aa ae cc b6 ba bd
be c6 c7 b5 ea d7 b2 db
dc e4 e5 d6 106 f5 f9 101
d3 11e 10d 111 119 f4 125 f1
129 12d 131 134 138 13c 140 144
148 149 14b 14f 153 154 158 15c
15d 164 168 16c 16f 170 175 179
17d 180 184 185 187 188 1 18d
192 193 199 19d 19e 1a3 1a5 1a9
1ab 1ad 1ae 1b3 1b7 1b9 1c5 1c7
1cb 1ce 1cf 1d4 1d8 1dc 1e0 1e4
1e8 1ec 1f0 1f1 1f3 1f7 1f9 1fd
200 204 208 20c 20e 212 216 219
21a 21f 225 226 22b 22e 22f 233
237 238 23f 243 244 248 249 250
254 258 25b 25c 261 262 266 26a
26d 26e 273 274 27a 27e 27f 284
286 28a 28c 28e 28f 294 298 29a
2a6 2a8 2ac 2af 2b2 2b3 2b8 2bc
2c0 2c4 2c8 2cc 2d0 2d4 2d8 2dc
2e0 2e4 2e8 2f0 2f1 2f5 2fa 2fc
300 304 308 30a 30e 312 314 318
31c 31e 322 326 328 32c 330 333
334 339 33f 340 345 347 34b 34f
352 356 359 35d 35f 363 367 369
375 379 37b 37c 385
ed
2
0 1 a 1 19 :3 1 19 :3 1
19 :3 1 19 :3 1 19 :3 1 19 :3 1
19 :3 1 3 a :3 1 16 1a 19
16 21 16 :2 1 16 1a 19 16
21 16 :2 1 :3 16 :2 1 :3 16 1 3
1b :2 3 1b :2 3 7 21 33 :2 7
3 :2 c 18 c 5 :2 c 1c :3 1a
c 1e 1c 24 :2 1e :2 1c :2 c :5 5
3 a 7 18 :2 5 3 :3 1 :4 6
5 7 23 34 3f 23 33 :2 7
5 17 :2 3 :2 a 1d :2 a 13 :3 11
:3 3 :2 c 13 a 5 a :2 19 18
12 :2 18 21 :3 1f :2 12 11 :3 b :5 5
3 a 7 18 :2 5 3 :3 1 6
e 10 :2 e 11 :a 12 10 :4 5 12
:2 e 1e :2 e 25 :2 e 25 :2 e 20
e c 15 :3 13 :3 5 :5 3 a 3
:2 1 5 :7 1
ed
4
0 :2 1 :4 3 :4 4
:4 5 :4 6 :4 7 :4 8
:4 9 2 :2 a :2 1
:8 c :8 d :5 e :5 f
:3 12 :3 13 16 :5 17
16 :3 1c :3 1d :5 1e
:8 1f :2 1e 1d :4 1c
1b 21 23 :3 21
20 :3 11 :4 27 28
:4 29 :2 2a :2 29 28
:3 27 2f :3 30 :5 31
:3 2f :3 36 :3 37 :2 38
:3 39 :5 3a 39 :5 38
37 :4 36 35 3c
3e :3 3c 3b :3 11
:5 41 42 44 45
46 47 48 4b
4c 4d 4e 4f
4a :4 42 41 52
:3 53 :3 54 :3 55 :3 56
:5 57 :3 52 51 :3 41
:3 5a :2 11 5c :7 1

387
4
:3 0 1 :3 0 2
:a 0 e8 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
56 0 7 6
:3 0 5 :7 0 9
8 :3 0 6 :3 0
7 :7 0 d c
:3 0 d 7c 0
b 9 :3 0 8
:7 0 11 10 :3 0
4 :3 0 a :7 0
15 14 :3 0 11
:2 0 f c :3 0
b :7 0 19 18
:3 0 e :3 0 d
:7 0 1d 1c :3 0
f :3 0 c :3 0
1f 21 0 e8
2 22 :2 0 12
:2 0 1b 11 :3 0
12 :2 0 19 25
27 :7 0 2b 28
29 e6 0 10
:6 0 21 f1 0
1f 11 :3 0 1d
2d 2f :7 0 33
30 31 e6 0
13 :6 0 16 :2 0
23 c :3 0 35
:7 0 38 36 0
e6 0 14 :6 0
c :3 0 3a :7 0
3d 3b 0 e6
0 15 :6 0 14
:3 0 3e 3f 0
e3 15 :3 0 16
:2 0 41 42 0
e3 14 :3 0 17
:3 0 3 :3 0 10
:3 0 25 45 48
44 49 0 e3
18 :3 0 28 13
:3 0 19 :3 0 2a
4f 5f 0 60
:3 0 1a :3 0 10
:3 0 1b :2 0 2e
53 54 :3 0 1c
:3 0 1d :3 0 1b
:2 0 a :3 0 31
57 5a 35 58
5c :3 0 55 5e
5d :3 0 62 63
:5 0 4c 50 0
38 0 61 :2 0
65 3a 6d 1e
:4 0 68 3c 6a
3e
/

prompt
prompt Creating function ORA_ASPNET_ROLES_CREATEROLE
prompt =============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Roles_CreateRole wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
16
2 :e:
1FUNCTION:
1ORA_ASPNET_ROLES_CREATEROLE:
1APPLICATIONNAME_:
1NVARCHAR2:
1ROLENAME_:
1RETURN:
1INTEGER:
1OUTRESULT:
1OUTVAL:
1M_APPID:
1RAW:
116:
1ORA_ASPNET_APPS_CREATEAPP:
1ORA_ASPNET_ROLES:
1APPLICATIONID:
1ROLENAME:
1LOWEREDROLENAME:
1LOWER:
1ORA_ASPNET_ROLES_PKG:
1UNIQUE_CONSTRAINT_VIOLATED:
1ROLE_ALREADY_EXISTS:
10:
0

0
0
54
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d b4 :2 a0 2c 6a a3
a0 1c 81 b0 a3 a0 1c 81
b0 a3 a0 51 a5 1c 4d 81
b0 :4 a0 a5 b d :8 a0 a5 b
5 d7 b2 5 e9 b7 :2 a0 6b
:3 a0 6b 65 b7 a6 9 a4 b1
11 4f a0 51 65 b7 a4 b1
11 68 4f 1d 17 b5
54
2
0 3 7 23 1f 1e 2b 38
34 1b 40 33 45 49 4d 51
6a 59 5d 65 30 82 71 75
7d 58 a0 8d 55 91 92 9a
9b 8c a7 ab af b3 89 b7
b9 bd c1 c5 c9 cd d1 d5
d9 dd de e0 e4 ec ed f1
f6 f8 fc 100 103 107 10b 10f
112 116 118 119 11e 122 124 130
132 136 139 13d 13f 143 145 151
155 157 158 161
54
2
0 1 a 3 1c :3 3 16 :2 3
2 1 8 :2 1 3 :3 d :2 3 :3 a
:2 3 b f e b 16 b 3
1 b 25 37 :2 b 1 e 1f
2e 38 11 1a 25 2b :2 25 10
:4 2 1 c 21 c 9 10 :2 25
9 3c :2 7 2 :3 1 3 a 3
:9 1
54
4
0 :2 1 :4 3 :4 4
2 :2 6 :2 1 :5 7
:5 8 :8 9 :7 d :4 11
:7 12 :4 11 10 :3 16
:5 17 :3 16 15 :3 a
:3 1d :2 a :7 1
163
4
:3 0 1 :3 0 2
:a 0 4f 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 a
55 0 7 4
:3 0 5 :7 0 9
8 :3 0 6 :3 0
7 :3 0 b d
0 4f 2 e
:2 0 c :2 0 c
7 :3 0 11 :7 0
14 12 0 4d
0 8 :6 0 7
:3 0 16 :7 0 19
17 0 4d 0
9 :6 0 12 :2 0
10 b :3 0 e
1b 1d :7 0 21
1e 1f 4d 0
a :6 0 9 :3 0
d :3 0 3 :3 0
a :3 0 23 26
22 27 0 4b
e :3 0 f :3 0
10 :3 0 11 :3 0
a :3 0 5 :3 0
12 :3 0 5 :3 0
15 2f 31 17
:3 0 29 35 36
37 :4 0 1b 1f
:4 0 34 :2 0 38
21 46 13 :3 0
14 :2 0 4 39
3a 0 6 :3 0
13 :3 0 15 :3 0
3d 3e 0 3f
:2 0 41 23 43
25 42 41 :2 0
44 27 :2 0 46
0 46 45 38
44 :6 0 4b 1
:3 0 6 :3 0 16
:2 0 49 :2 0 4b
29 4e :3 0 4e
2d 4e 4d 4b
4c :6 0 4f :2 0
2 e 4e 52
:3 0 51 4f 53
:8 0
31
4
:3 0 1 3 1
7 2 6 a
1 10 1 15
1 1c 1 1a
2 24 25 1
30 3 2d 2e
32 3 2a 2b
2c 1 33 1
37 1 40 1
3b 1 43 3
28 46 4a 3
13 18 20
1
4
0
52
0
1
14
2
6
0 1 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
15 1 0
10 1 0
2 0 1
1a 1 0
7 1 0
3 1 0
0
/

prompt
prompt Creating function ORA_ASPNET_ROLES_DELETEROLE
prompt =============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Roles_DeleteRole wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
21
2 :e:
1FUNCTION:
1ORA_ASPNET_ROLES_DELETEROLE:
1APPLICATIONNAME_:
1NVARCHAR2:
1ROLENAME_:
1DELETEONLYIFROLEISEMPTY:
1INTEGER:
1RETURN:
1OUTRESULT:
1M_APPID:
1RAW:
116:
1M_ROLEID:
1M_USERID:
1M_ROLEIDCNT:
10:
1M_ROWSCHG:
1M_ROWCNT:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWER:
1LOWEREDAPPLICATIONNAME:
1=:
1NO_DATA_FOUND:
11:
1ROLEID:
1ORA_ASPNET_ROLES:
1LOWEREDROLENAME:
1!=:
1COUNT:
1ORA_ASPNET_USERSINROLES:
1ORA_ASPNET_ROLES_PKG:
1ROLE_IS_NOT_EMPTY:
0

0
0
de
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d b4
:2 a0 2c 6a a3 a0 1c 81 b0
a3 a0 51 a5 1c 4d 81 b0
a3 a0 51 a5 1c 4d 81 b0
a3 a0 51 a5 1c 4d 81 b0
a3 a0 1c 51 81 b0 a3 a0
1c 51 81 b0 a3 a0 1c 51
81 b0 a0 ac :2 a0 b2 ee :2 a0
a5 b a0 7e b4 2e ac e5
d0 b2 e9 b7 :2 a0 51 65 b7
a6 9 a4 b1 11 4f a0 ac
:2 a0 b2 ee :2 a0 7e a0 a5 b
b4 2e :2 a0 7e b4 2e a 10
ac e5 d0 b2 e9 b7 :2 a0 51
65 b7 a6 9 a4 b1 11 4f
a0 7e 51 b4 2e 5a a0 d2
9f ac :2 a0 b2 ee :2 a0 7e b4
2e ac e5 d0 b2 e9 b7 a0
4f b7 a6 9 a4 b1 11 4f
a0 7e 51 b4 2e 5a :3 a0 6b
65 b7 19 3c b7 19 3c :3 a0
7e b4 2e cd e9 :3 a0 7e b4
2e :2 a0 7e b4 2e a 10 cd
e9 a0 51 65 b7 a4 b1 11
68 4f 1d 17 b5
de
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 30
56 5a 5e 62 7b 6a 6e 76
69 99 86 66 8a 8b 93 94
85 b7 a4 82 a8 a9 b1 b2
a3 d5 c2 a0 c6 c7 cf d0
c1 f1 e0 e4 be ec df 10d
fc 100 dc 108 fb 129 118 11c
f8 124 117 130 114 134 138 13c
13d 144 148 14c 14d 14f 153 156
157 15c 15d 163 167 168 16d 16f
173 177 17a 17e 180 181 186 18a
18c 198 19a 19e 19f 1a3 1a7 1a8
1af 1b3 1b7 1ba 1be 1bf 1c1 1c2
1c7 1cb 1cf 1d2 1d3 1 1d8 1dd
1de 1e4 1e8 1e9 1ee 1f0 1f4 1f8
1fb 1ff 201 202 207 20b 20d 219
21b 21f 222 225 226 22b 22e 232
236 239 23a 23e 242 243 24a 24e
252 255 256 25b 25c 262 266 267
26c 26e 272 274 276 277 27c 280
282 28e 290 294 297 29a 29b 2a0
2a3 2a7 2ab 2af 2b2 2b6 2b8 2bc
2bf 2c1 2c5 2c8 2cc 2d0 2d4 2d7
2d8 2dd 2e2 2e7 2eb 2ef 2f3 2f6
2f7 2fc 300 304 307 308 1 30d
312 317 31c 320 323 327 329 32d
32f 33b 33f 341 342 34b
de
2
0 1 a 3 1a :3 3 19 :3 3
1e :2 3 2 1 8 :2 1 3 :3 d
:2 3 b f e b 16 b :2 3
c 10 f c 17 c :2 3 c
10 f c 17 c :2 3 :2 f 1a
f :2 3 :2 d 18 d :2 3 :2 c 17
c 3 :2 9 1c 29 24 29 b
11 :2 b 25 :3 23 24 :4 2 1 8
4 b 4 16 :2 3 2 :3 1 :2 9
15 a 4 a c 1e 1c 24
:2 1e :2 1c 33 43 :3 41 :2 c 4 :4 2
1 8 4 b 4 16 :2 3 2
:3 1 6 1e 21 :2 1e 5 :4 f 1d
f a f 12 1b :3 19 a :4 8
5 e a 1c :2 9 8 :3 24 9
12 15 :2 12 8 b 12 :2 27 b
18 :2 5 24 :2 2 e 2c 35 :3 33
:2 2 e 25 2e :3 2c 3b 4b :3 49
:2 25 :2 2 3 a 3 :9 1
de
4
0 :2 1 :4 3 :4 4
:4 5 2 :2 7 :2 1
:5 8 :8 9 :8 a :8 b
:6 c :6 d :6 e :6 13
:8 14 :5 13 12 17
:3 18 :3 17 16 :3 f
:3 1f :3 20 :f 21 20
:4 1f 1e 24 :3 25
:3 24 23 :3 f :6 29
:5 2c :3 2d :5 2e 2d
:4 2c 2a 31 32
:3 31 30 :3 29 :6 35
:5 36 :3 35 :3 29 :8 3c
:f 3d :3 41 :2 f :7 1

34d
4
:3 0 1 :3 0 2
:a 0 d9 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
:2 0 7 4 :3 0
5 :7 0 9 8
:3 0 7 :3 0 6
:7 0 d c :3 0
8 :3 0 7 :3 0
f 11 0 d9
2 12 :2 0 c
:2 0 d 7 :3 0
15 :7 0 18 16
0 d7 0 9
:6 0 c :2 0 11
b :3 0 f 1a
1c :7 0 20 1d
1e d7 0 a
:6 0 c :2 0 15
b :3 0 13 22
24 :7 0 28 25
26 d7 0 d
:6 0 10 :2 0 19
b :3 0 17 2a
2c :7 0 30 2d
2e d7 0 e
:6 0 10 :2 0 1b
7 :3 0 32 :7 0
36 33 34 d7
0 f :6 0 10
:2 0 1d 7 :3 0
38 :7 0 3c 39
3a d7 0 11
:6 0 21 :2 0 1f
7 :3 0 3e :7 0
42 3f 40 d7
0 12 :6 0 13
:3 0 a :3 0 14
:3 0 23 47 50
0 51 :3 0 15
:3 0 3 :3 0 25
49 4b 16 :3 0
17 :2 0 29 4e
4f :4 0 53 54
:5 0 44 48 0
2c 0 52 :2 0
56 2e 60 18
:3 0 8 :3 0 19
:2 0 59 :2 0 5b
30 5d 32 5c
5b :2 0 5e 34
:2 0 60 0 60
5f 56 5e :6 0
d5 1 :3 0 1a
:3 0 36 d :3 0
1b :3 0 38 66
76 0 77 :3 0
1c :3 0 15 :3 0
17 :2 0 5 :3 0
3a 69 6c 3e
6a 6e :3 0 13
:3 0 a :3 0 17
:2 0 43 72 73
:3 0 6f 75 74
:3 0 79 7a :5 0
63 67 0 46
0 78 :2 0 7c
48 86 18 :3 0
8 :3 0 19 :2 0
7f :2 0 81 4a
83 4c 82 81
:2 0 84 4e :2 0
86 0 86 85
7c 84 :6 0 d5
1 :3 0 6 :3 0
1d :2 0 10 :2 0
52 89 8b :3 0
8c :2 0 1e :3 0
90 :3 0 1e :2 0
55 12 :3 0 1f
:3 0 57 94 9a
0 9b :3 0 1a
:3
/

prompt
prompt Creating function ORA_ASPNET_ROLES_GETALLROLES
prompt ==============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Roles_GetAllRoles wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
17
2 :e:
1FUNCTION:
1ORA_ASPNET_ROLES_GETALLROLES:
1APPLICATIONNAME_:
1NVARCHAR2:
1ROLECURSOR:
1OUT:
1SYS_REFCURSOR:
1RETURN:
1INTEGER:
1OUTRESULT:
1M_APPID:
1RAW:
116:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWER:
1LOWEREDAPPLICATIONNAME:
1=:
1NO_DATA_FOUND:
10:
1OPEN:
1ROLENAME:
1ORA_ASPNET_ROLES:
0

0
0
5f
2
0 a0 8d 8f a0 b0 3d 96
:2 a0 b0 54 b4 :2 a0 2c 6a a3
a0 1c 81 b0 a3 a0 51 a5
1c 4d 81 b0 a0 ac :2 a0 b2
ee :2 a0 a5 b a0 7e b4 2e
ac e5 d0 b2 e9 b7 :2 a0 51
65 b7 a6 9 a4 b1 11 4f
:3 a0 ac a0 b2 ee :2 a0 7e b4
2e ac a0 de ac e5 d0 b2
:2 e9 dd a0 51 65 b7 a4 b1
11 68 4f 1d 17 b5
5f
2
0 3 7 23 1f 1e 2b 3c
34 38 1b 43 33 48 4c 50
54 6d 5c 60 68 30 8a 74
78 7b 7c 84 85 5b 91 58
95 99 9d 9e a5 a9 ad ae
b0 b4 b7 b8 bd be c4 c8
c9 ce d0 d4 d8 db df e1
e2 e7 eb ed f9 fb ff 103
107 108 10c 10d 114 118 11c 11f
120 125 126 12a 12c 12d 133 137
138 13d 142 146 14a 14d 151 153
157 159 165 169 16b 16c 175
5f
2
0 1 a 3 1c :3 3 f 13
:2 3 2 1 8 :2 1 3 :3 d :2 3
b f e b 16 b 3 :2 9
1c 29 24 29 b 11 :2 b 25
:3 23 24 :4 2 1 8 4 b 4
16 :2 3 2 :3 1 2 7 :2 a b
5 b 22 32 :3 30 5 :2 f 6
:4 3 2 :2 3 a 3 :9 1
5f
4
0 :2 1 :4 3 :5 4
2 :2 6 :2 1 :5 7
:8 8 :6 c :8 d :5 c
b 10 :3 11 :3 10
f :3 9 :2 14 :2 15
:9 16 :3 17 :4 15 14
15 :3 1a :2 9 :7 1

177
4
:3 0 1 :3 0 2
:a 0 5a 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 a
58 0 7 6
:3 0 7 :3 0 5
:6 0 a 9 :3 0
8 :3 0 9 :3 0
c e 0 5a
2 f :2 0 10
:2 0 e 9 :3 0
12 :7 0 15 13
0 58 0 a
:6 0 c :3 0 d
:2 0 c 17 19
:7 0 1d 1a 1b
58 0 b :6 0
e :3 0 b :3 0
f :3 0 12 22
2b 0 2c :3 0
10 :3 0 3 :3 0
14 24 26 11
:3 0 12 :2 0 18
29 2a :4 0 2e
2f :5 0 1f 23
0 1b 0 2d
:2 0 31 1d 3b
13 :3 0 8 :3 0
14 :2 0 34 :2 0
36 1f 38 21
37 36 :2 0 39
23 :2 0 3b 0
3b 3a 31 39
:6 0 56 1 :3 0
15 :3 0 5 :3 0
16 :3 0 25 17
:3 0 27 42 48
0 49 :3 0 e
:3 0 b :3 0 12
:2 0 2b 46 47
:4 0 16 :3 0 1
4a 2e 4e 4f
4c :4 0 40 43
:3 0 4d :4 0 52
:2 0 56 3e 50
:2 0 8 :3 0 14
:2 0 54 :2 0 56
30 59 :3 0 59
34 59 58 56
57 :6 0 5a :2 0
2 f 59 5d
:3 0 5c 5a 5e
:8 0
37
4
:3 0 1 3 1
7 2 6 b
1 11 1 18
1 16 1 1e
1 21 1 25
1 28 2 27
28 1 20 1
30 1 35 1
32 1 38 1
3f 1 41 1
45 2 44 45
1 4b 3 3b
51 55 2 14
1c
1
4
0
5d
0
1
14
2
5
0 1 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
2 0 1
11 1 0
16 1 0
7 1 0
3 1 0
0
/

prompt
prompt Creating function ORA_ASPNET_ROLES_ROLEEXISTS
prompt =============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Roles_RoleExists wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
1b
2 :e:
1FUNCTION:
1ORA_ASPNET_ROLES_ROLEEXISTS:
1APPLICATIONNAME_:
1NVARCHAR2:
1ROLENAME_:
1RETURN:
1INTEGER:
1OUTRESULT:
1M_APPID:
1RAW:
116:
1M_ROWCNT:
10:
1M_ROLEID:
1TESTING:
1NUMBER:
1M_CNTTEST:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWER:
1LOWEREDAPPLICATIONNAME:
1=:
1NO_DATA_FOUND:
11:
1ROLEID:
1ORA_ASPNET_ROLES:
1LOWEREDROLENAME:
0

0
0
87
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d b4 :2 a0 2c 6a a3
a0 1c 81 b0 a3 a0 51 a5
1c 4d 81 b0 a3 a0 1c 51
81 b0 a3 a0 51 a5 1c 4d
81 b0 a3 a0 1c 81 b0 a3
a0 1c 51 81 b0 a0 ac :2 a0
b2 ee :2 a0 a5 b a0 7e b4
2e ac e5 d0 b2 e9 b7 :2 a0
51 65 b7 a6 9 a4 b1 11
4f a0 ac :2 a0 b2 ee :2 a0 a5
b a0 7e b4 2e :2 a0 7e b4
2e a 10 ac e5 d0 b2 e9
b7 :2 a0 51 65 b7 a6 9 a4
b1 11 4f a0 51 65 b7 a4
b1 11 68 4f 1d 17 b5
87
2
0 3 7 23 1f 1e 2b 38
34 1b 40 33 45 49 4d 51
6a 59 5d 65 30 87 71 75
78 79 81 82 58 a3 92 96
55 9e 91 c1 ae 8e b2 b3
bb bc ad dd cc d0 d8 aa
f8 e4 e8 f0 f3 cb ff c8
103 107 10b 10c 113 117 11b 11c
11e 122 125 126 12b 12c 132 136
137 13c 13e 142 146 149 14d 14f
150 155 159 15b 167 169 16d 16e
172 176 177 17e 182 186 187 189
18d 190 191 196 19a 19e 1a1 1a2
1 1a7 1ac 1ad 1b3 1b7 1b8 1bd
1bf 1c3 1c7 1ca 1ce 1d0 1d1 1d6
1da 1dc 1e8 1ea 1ee 1f1 1f5 1f7
1fb 1fd 209 20d 20f 210 219
87
2
0 1 a 3 1d :3 3 1c :2 3
2 1 8 :2 1 3 :3 d :2 3 b
f e b 16 b :2 3 :2 c 17
c :2 3 c 10 f c 17 c
:2 3 :3 11 :2 3 :2 d 18 d 3 :2 9
1c 29 24 29 b 11 :2 b 25
:3 23 24 :4 2 1 8 4 b 4
16 :2 3 2 :3 1 :2 d 19 d 8
d 10 16 :2 10 23 :3 21 37 47
:3 45 :2 10 8 :4 6 1 9 d 14
d 17 :2 4 2 :3 1 3 a 3
:9 1
87
4
0 :2 1 :4 3 :4 4
2 :2 6 :2 1 :5 7
:8 8 :6 9 :8 b :5 c
:6 d :6 12 :8 13 :5 12
11 16 :3 17 :3 16
15 :3 e :3 1b :3 1c
:f 1d 1c :4 1b 1a
20 :3 21 :3 20 1f
:3 e :3 25 :2 e :7 1

21b
4
:3 0 1 :3 0 2
:a 0 82 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 a
55 0 7 4
:3 0 5 :7 0 9
8 :3 0 6 :3 0
7 :3 0 b d
0 82 2 e
:2 0 d :2 0 e
7 :3 0 11 :7 0
14 12 0 80
0 8 :6 0 a
:3 0 b :2 0 c
16 18 :7 0 1c
19 1a 80 0
9 :6 0 b :2 0
10 7 :3 0 1e
:7 0 22 1f 20
80 0 c :6 0
16 c8 0 14
a :3 0 12 24
26 :7 0 2a 27
28 80 0 e
:6 0 1a :2 0 18
10 :3 0 2c :7 0
2f 2d 0 80
0 f :6 0 7
:3 0 31 :7 0 d
:2 0 35 32 33
80 0 11 :6 0
12 :3 0 9 :3 0
13 :3 0 1c 3a
43 0 44 :3 0
14 :3 0 3 :3 0
1e 3c 3e 15
:3 0 16 :2 0 22
41 42 :4 0 46
47 :5 0 37 3b
0 25 0 45
:2 0 49 27 53
17 :3 0 6 :3 0
18 :2 0 4c :2 0
4e 29 50 2b
4f 4e :2 0 51
2d :2 0 53 0
53 52 49 51
:6 0 7e 1 :3 0
19 :3 0 2f e
:3 0 1a :3 0 31
59 69 0 6a
:3 0 14 :3 0 5
:3 0 33 5b 5d
1b :3 0 16 :2 0
37 60 61 :3 0
12 :3 0 9 :3 0
16 :2 0 3c 65
66 :3 0 62 68
67 :3 0 6c 6d
:5 0 56 5a 0
3f 0 6b :2 0
6f 41 79 17
:3 0 6 :3 0 18
:2 0 72 :2 0 74
43 76 45 75
74 :2 0 77 47
:2 0 79 0 79
78 6f 77 :6 0
7e 1 :3 0 6
:3 0 d :2 0 7c
:2 0 7e 49 81
:3 0 81 4d 81
80 7e 7f :6 0
82 :2 0 2 e
81 85 :3 0 84
82 86 :8 0
54
4
:3 0 1 3 1
7 2 6 a
1 10 1 17
1 15 1 1d
1 25 1 23
1 2b 1 30
1 36 1 39
1 3d 1 40
2 3f 40 1
38 1 48 1
4d 1 4a 1
50 1 55 1
58 1 5c 1
5f 2 5e 5f
1 64 2 63
64 1 57 1
6e 1 73 1
70 1 76 3
53 79 7d 6
13 1b 21 29
2e 34
1
4
0
85
0
1
14
3
9
0 1 1 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
2b 1 0
23 1 0
1d 1 0
2 0 1
10 1 0
15 1 0
7 1 0
3 1 0
30 1 0
0
/

prompt
prompt Creating function ORA_ASPNET_SESSNAPP_GETAPPID
prompt ==============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_SessnApp_GetAppID wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
17
2 :e:
1FUNCTION:
1ORA_ASPNET_SESSNAPP_GETAPPID:
1APPNAME_:
1NVARCHAR2:
1APPID_:
1OUT:
1RAW:
1RETURN:
1INTEGER:
1OUTRESULT:
1UNIQUE_CONSTRAINT_VIOLATED:
1PRAGMA:
1EXCEPTION_INIT:
1-:
11:
1APPID:
1ORA_ASPNET_SESSIONAPPLICATIONS:
1APPNAME:
1=:
1NO_DATA_FOUND:
1IS NULL:
1SYS_GUID:
10:
0

0
0
73
2
0 a0 8d 8f a0 b0 3d 96
:2 a0 b0 54 b4 :2 a0 2c 6a a3
a0 1c 81 b0 8b b0 2a :3 a0
7e 51 b4 2e b4 5d a0 ac
:2 a0 b2 ee :2 a0 7e b4 2e ac
e5 d0 b2 e9 b7 a0 4f b7
a6 9 a4 b1 11 4f a0 7e
b4 2e :2 a0 d :3 a0 5 d7 b2
5 e9 b7 :2 a0 ac :2 a0 b2 ee
:2 a0 7e b4 2e ac e5 d0 b2
e9 b7 a6 9 a4 b1 11 4f
b7 19 3c a0 51 65 b7 a4
b1 11 68 4f 1d 17 b5
73
2
0 3 7 23 1f 1e 2b 3c
34 38 1b 43 33 48 4c 50
54 6d 5c 60 68 30 74 5b
58 7b 7f 83 87 8a 8d 8e
93 94 97 9b 9c a0 a4 a5
ac b0 b4 b7 b8 bd be c4
c8 c9 ce d0 d4 d6 d8 d9
de e2 e4 f0 f2 f6 f9 fa
ff 103 107 10b 10f 113 117 11b
123 124 128 12d 12f 133 137 138
13c 140 141 148 14c 150 153 154
159 15a 160 164 165 16a 16c 16d
172 176 178 184 186 188 18c 18f
193 196 19a 19c 1a0 1a2 1ae 1b2
1b4 1b5 1be
73
2
0 1 a 2 e :3 2 a e
:2 2 :2 1 8 :2 1 3 :3 d :5 3 a
19 :4 35 :2 3 :2 c 17 b 6 b
d 17 :3 15 6 :4 5 3 b 7
19 :2 6 5 :3 1 :4 6 5 f 5
13 3a 42 39 :4 7 5 d :2 11
1c 10 b 10 12 1c :3 1a b
:4 a 28 :2 8 7 :4 15 :3 3 a 3
:9 1
73
4
0 :2 1 :4 3 :5 4
2 :2 6 :2 1 :5 7
:3 8 :9 9 :3 d :3 e
:5 f e :4 d c
12 14 :3 12 11
:3 a :4 18 :3 19 :8 1c
1b 1f :3 20 :3 21
:5 22 21 :4 20 :3 1f
1e :6 18 :3 28 :2 a
:7 1
1c0
4
:3 0 1 :3 0 2
:a 0 6e 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 a
58 0 7 6
:3 0 7 :3 0 5
:6 0 a 9 :3 0
8 :3 0 9 :3 0
c e 0 6e
2 f :2 0 17
0 6c c 9
:3 0 12 :7 0 15
13 0 6c 0
a :6 0 b :6 0
c :3 0 d :3 0
b 16 :2 0 e
:2 0 f :2 0 e
1c 1e :3 0 10
1a 20 6c 10
:3 0 13 5 :3 0
11 :3 0 15 26
2c 0 2d :3 0
12 :3 0 3 :3 0
13 :2 0 19 2a
2b :4 0 2f 30
:5 0 23 27 0
1c 0 2e :2 0
32 1e 3a 14
:4 0 35 20 37
22 36 35 :2 0
38 24 :2 0 3a
0 3a 39 32
38 :6 0 6a 1
:3 0 5 :3 0 15
:2 0 26 3d 3e
:3 0 5 :3 0 16
:3 0 40 41 0
64 11 :3 0 5
:3 0 3 :3 0 28
:3 0 43 48 49
4a :5 0 2b :4 0
47 :2 0 4b 2d
62 b :3 0 10
:3 0 2f 5 :3 0
11 :3 0 31 51
57 0 58 :3 0
12 :3 0 3 :3 0
13 :2 0 35 55
56 :4 0 5a 5b
:5 0 4e 52 0
38 0 59 :2 0
5d 3a 5f 3c
5e 5d :2 0 60
3e :2 0 62 0
62 61 4b 60
:6 0 64 1 :3 0
40 65 3f 64
0 66 43 0
6a 8 :3 0 17
:2 0 68 :2 0 6a
45 6d :3 0 6d
49 6d 6c 6a
6b :6 0 6e :2 0
2 f 6d 71
:3 0 70 6e 72
:8 0
4d
4
:3 0 1 3 1
7 2 6 b
1 11 1 16
1 1d 2 1b
1f 1 22 1
25 1 29 2
28 29 1 24
1 31 1 34
1 33 1 37
1 3c 2 44
45 1 46 1
4a 1 4d 1
50 1 54 2
53 54 1 4f
1 5c 1 4c
1 5f 2 42
62 1 65 3
3a 66 69 3
14 18 21
1
4
0
71
0
1
14
3
5
0 1 1 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
3 1 0
2 0 1
16 1 0
7 1 0
11 1 0
0
/

prompt
prompt Creating function ORA_ASPNET_SESSN_GETSTATEITEM
prompt ===============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Sessn_GetStateItem wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
2f
2 :e:
1FUNCTION:
1ORA_ASPNET_SESSN_GETSTATEITEM:
1ID:
1NVARCHAR2:
1ITEMSHORT:
1OUT:
1RAW:
1SESSIONLOCKED:
1INTEGER:
1LOCKAGE:
1SESSIONLOCKCOOKIE:
1ACTIONFLAGS:
1ITEMLONG:
1BLOB:
1RETURN:
1OUTRESULT:
1M_UTCTIME:
1TIMESTAMP:
1FLAGS:
1ORA_ASPNET_SESSIONS:
1SESSIONID:
1=:
1NO_DATA_FOUND:
1SYS_EXTRACT_UTC:
1SYSTIMESTAMP:
1EXPIRES:
1+:
1TIMEOUT:
1/:
11440:
10:
1RETURNING:
1LOCKED:
1EXTRACT:
1DAY:
1-:
1LOCKDATE:
1 SYS$EXTRACT_FROM:
1*:
124:
160:
1HOUR:
1MINUTE:
1SECOND:
1LOCKCOOKIE:
1SESSIONITEMSHORT:
1SESSIONITEMLONG:
0

0
0
e5
2
0 a0 8d 8f a0 b0 3d 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 b4
:2 a0 2c 6a a3 a0 1c 81 b0
a3 a0 1c 81 b0 a0 ac :2 a0
b2 ee :2 a0 7e b4 2e ac e5
d0 b2 e9 b7 a0 4f b7 a6
9 a4 b1 11 4f :3 a0 a5 b
d :3 a0 7e a0 7e 51 b4 2e
5a b4 2e 5a e7 a0 51 e7
:2 a0 7e a0 b4 2e :3 a0 6e a0
7e a0 b4 2e 5a a0 b4 2e
7e 51 b4 2e 7e 51 b4 2e
7e 51 b4 2e 7e :2 a0 6e a0
7e a0 b4 2e 5a a0 b4 2e
7e 51 b4 2e 7e 51 b4 2e
b4 2e 7e :2 a0 6e a0 7e a0
b4 2e 5a a0 b4 2e 7e 51
b4 2e b4 2e 7e :2 a0 6e a0
7e a0 b4 2e 5a a0 b4 2e
b4 2e :2 a0 51 a0 a6 122 4d
122 124 a0 51 a0 a6 122 4d
122 124 ac :5 a0 110 b2 ef f9
e9 a0 51 65 b7 a4 b1 11
68 4f 1d 17 b5
e5
2
0 3 7 23 1f 1e 2b 3c
34 38 1b 43 50 48 4c 33
57 68 60 64 30 6f 7c 74
78 5f 83 94 8c 90 5c 9b
a8 a0 a4 8b af 88 b4 b8
bc c0 d9 c8 cc d4 c7 f5
e4 e8 f0 c4 e0 fc fd 101
105 106 10d 111 115 118 119 11e
11f 125 129 12a 12f 131 135 137
139 13a 13f 143 145 151 153 157
15b 15f 160 162 166 16a 16e 172
175 179 17c 17f 180 185 188 189
18e 191 193 197 19a 19c 1a0 1a4
1a7 1ab 1ac 1b1 1b5 1b9 1bd 1c2
1c6 1c9 1cd 1ce 1d3 1d6 1da 1db
1e0 1e3 1e6 1e7 1ec 1ef 1f2 1f3
1f8 1fb 1fe 1ff 204 207 20b 20f
214 218 21b 21f 220 225 228 22c
22d 232 235 238 239 23e 241 244
245 24a 24b 250 253 257 25b 260
264 267 26b 26c 271 274 278 279
27e 281 284 285 28a 28b 290 293
297 29b 2a0 2a4 2a7 2ab 2ac 2b1
2b4 2b8 2b9 2be 2bf 2c4 2c8 2cc
2cf 2d3 2d4 2d6 2d7 2d9 2dd 2e1
2e4 2e8 2e9 2eb 2ec 2ee 2f2 2f3
2f7 2fb 2ff 303 307 30a 30b 311
312 317 31b 31e 322 324 328 32a
336 33a 33c 33d 346
e5
2
0 1 a 3 b :3 3 e 12
:3 3 12 16 :3 3 c 10 :3 3 15
19 :3 3 10 14 :3 3 d 11 :2 3
:2 1 8 :2 1 3 :3 d :2 3 :3 11 3
:2 9 14 25 20 25 3f 4b :3 49
20 :4 2 1 9 5 17 :2 4 3
:4 1 e 1e :2 e 1 8 11 1c
25 27 2e 2f :2 27 26 :2 1c 1b
11 d 15 d 8 14 12 d
:2 12 :2 f :2 18 25 2f 31 :2 25 24
:3 f 3c 3d :2 f 3f 40 :2 f 42
43 :2 f 45 f :2 18 25 2f 31
:2 25 24 :3 f 3c 3d :2 f 3f 40
:4 f 42 f :2 18 25 2f 31 :2 25
24 :3 f 3c 3d :4 f 3f f :2 18
25 2f 31 :2 25 24 :6 f 14 20
27 :2 1b 18 :2 f 14 20 27 :2 1b
18 :8 f :2 d :3 1 3 a 3 :9 1

e5
4
0 :2 1 :4 3 :5 4
:5 5 :5 6 :5 7 :5 8
:5 9 2 :2 b :2 1
:5 c :5 d :10 12 11
14 15 :3 14 13
:3 e :6 18 1a :d 1b
:3 1c :3 1d 1e :2 1d
1f :19 20 :14 21 :2 20
21 :10 22 :2 20 22
:c 23 :2 20 24 :5 25
26 :2 25 :5 27 28
:2 27 1f 2a 2b
2c 2d 2e :2 1e
:3 1a :3 31 :2 e :7 1

348
4
:3 0 1 :3 0 2
:a 0 e0 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
5c 0 7 6
:3 0 7 :3 0 5
:6 0 a 9 :3 0
6 :3 0 9 :3 0
8 :6 0 f e
:3 0 d 88 0
b 6 :3 0 9
:3 0 a :6 0 14
13 :3 0 6 :3 0
9 :3 0 b :6 0
19 18 :3 0 11
:2 0 f 6 :3 0
9 :3 0 c :6 0
1e 1d :3 0 6
:3 0 e :3 0 d
:6 0 23 22 :3 0
f :3 0 9 :3 0
25 27 0 e0
2 28 :2 0 1b
e0 0 19 9
:3 0 2b :7 0 2e
2c 0 de 0
10 :6 0 13 :3 0
12 :3 0 30 :7 0
33 31 0 de
0 11 :6 0 1d
c :3 0 14 :3 0
1f 38 3e 0
3f :3 0 15 :3 0
3 :3 0 16 :2 0
23 3c 3d :4 0
41 42 :5 0 35
39 0 26 0
40 :2 0 44 28
4c 17 :4 0 47
2a 49 2c 48
47 :2 0 4a 2e
:2 0 4c 0 4c
4b 44 4a :6 0
dc 1 :3 0 11
:3 0 18 :3 0 19
:3 0 30 4f 51
4e 52 0 dc
14 :3 0 1a :3 0
11 :3 0 1b :2 0
1c :3 0 1d :2 0
1e :2 0 32 59
5b :3 0 5c :2 0
35 57 5e :3 0
5f :2 0 55 60
13 :3 0 1f :2 0
62 63 15 :3 0
3 :3 0 16 :2 0
20 :3 0 3a 67
69 :3 0 21 :3 0
22 :3 0 23 :3 0
23 :4 0 11 :3 0
24 :2 0 25 :3 0
3d 70 72 :3 0
73 :2 0 26 :3 0
40 75 76 :3 0
27 :2 0 28 :2 0
43 78 7a :3 0
27 :2 0 29 :2 0
46 7c 7e :3 0
27 :2 0 29 :2 0
49 80 82 :
/

prompt
prompt Creating function ORA_ASPNET_SESSN_GETSTATEITMEX
prompt ================================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Sessn_GetStateItmEx wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
34
2 :e:
1FUNCTION:
1ORA_ASPNET_SESSN_GETSTATEITMEX:
1ID:
1NVARCHAR2:
1ITEMSHORT:
1OUT:
1RAW:
1SESSIONLOCKED:
1INTEGER:
1LOCKAGE:
1SESSIONLOCKCOOKIE:
1ACTIONFLAGS:
1ITEMLONG:
1BLOB:
1RETURN:
1OUTRESULT:
1M_LOCKCOOKIE:
10:
1M_UTCTIME:
1TIMESTAMP:
1LOCKED:
1FLAGS:
1LOCKCOOKIE:
1ORA_ASPNET_SESSIONS:
1SESSIONID:
1=:
1NO_DATA_FOUND:
12147483647:
11:
1SYS_EXTRACT_UTC:
1SYSTIMESTAMP:
1EXPIRES:
1+:
1TIMEOUT:
1/:
11440:
1LOCKDATE:
1LOCKDATELOCAL:
1SYSDATE:
1RETURNING:
1EXTRACT:
1DAY:
1-:
1 SYS$EXTRACT_FROM:
1*:
124:
160:
1HOUR:
1MINUTE:
1SECOND:
1SESSIONITEMSHORT:
1SESSIONITEMLONG:
0

0
0
129
2
0 a0 8d 8f a0 b0 3d 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 96
:2 a0 b0 54 96 :2 a0 b0 54 b4
:2 a0 2c 6a a3 a0 1c 81 b0
a3 a0 1c 51 81 b0 a3 a0
1c 81 b0 :3 a0 ac :4 a0 b2 ee
:2 a0 7e b4 2e ac :3 a0 b2 e5
d0 b2 e9 b7 a0 4f b7 a6
9 a4 b1 11 4f a0 7e 51
b4 2e 5a a0 51 d b7 19
3c :3 a0 a5 b d :3 a0 7e a0
7e 51 b4 2e 5a b4 2e 5a
e7 :2 a0 51 a0 a6 122 a0 122
124 e7 :2 a0 51 a0 a6 122 a0
122 124 e7 :2 a0 51 a0 7e 51
b4 2e a6 122 a0 122 124 e7
a0 51 e7 a0 51 e7 :2 a0 7e
a0 b4 2e a0 :2 51 a6 122 :2 a0
6e a0 7e a0 b4 2e 5a a0
b4 2e 7e 51 b4 2e 7e 51
b4 2e 7e 51 b4 2e 7e :2 a0
6e a0 7e a0 b4 2e 5a a0
b4 2e 7e 51 b4 2e 7e 51
b4 2e b4 2e 7e :2 a0 6e a0
7e a0 b4 2e 5a a0 b4 2e
7e 51 b4 2e b4 2e 7e :2 a0
6e a0 7e a0 b4 2e 5a a0
b4 2e b4 2e 122 124 :2 a0 51
a0 a6 122 4d 122 124 a0 51
a0 a6 122 4d 122 124 ac :4 a0
110 b2 ef f9 e9 a0 51 65
b7 a4 b1 11 68 4f 1d 17
b5
129
2
0 3 7 23 1f 1e 2b 3c
34 38 1b 43 50 48 4c 33
57 68 60 64 30 6f 7c 74
78 5f 83 94 8c 90 5c 9b
a8 a0 a4 8b af 88 b4 b8
bc c0 d9 c8 cc d4 c7 f5
e4 e8 c4 f0 e3 111 100 104
10c e0 fc 118 11c 120 121 125
129 12d 131 132 139 13d 141 144
145 14a 14b 14f 153 157 158 15e
162 163 168 16a 16e 170 172 173
178 17c 17e 18a 18c 190 193 196
197 19c 19f 1a3 1a6 1aa 1ac 1b0
1b3 1b7 1bb 1bf 1c0 1c2 1c6 1ca
1ce 1d2 1d5 1d9 1dc 1df 1e0 1e5
1e8 1e9 1ee 1f1 1f3 1f7 1fb 1fe
202 203 205 209 20b 20f 211 215
219 21c 220 221 223 227 229 22d
22f 233 237 23a 23e 241 244 245
24a 24b 24d 251 253 257 259 25d
260 262 266 269 26b 26f 273 276
27a 27b 280 284 287 28a 28b 28d
291 295 29a 29e 2a1 2a5 2a6 2ab
2ae 2b2 2b3 2b8 2bb 2be 2bf 2c4
2c7 2ca 2cb 2d0 2d3 2d6 2d7 2dc
2df 2e3 2e7 2ec 2f0 2f3 2f7 2f8
2fd 300 304 305 30a 30d 310 311
316 319 31c 31d 322 323 328 32b
32f 333 338 33c 33f 343 344 349
34c 350 351 356 359 35c 35d 362
363 368 36b 36f 373 378 37c 37f
383 384 389 38c 390 391 396 397
39c 39e 3a2 3a6 3aa 3ad 3b1 3b2
3b4 3b5 3b7 3bb 3bf 3c2 3c6 3c7
3c9 3ca 3cc 3d0 3d1 3d5 3d9 3dd
3e1 3e4 3e5 3eb 3ec 3f1 3f5 3f8
3fc 3fe 402 404 410 414 416 417
420
129
2
0 1 a 3 b :3 3 e 12
:3 3 12 16 :3 3 c 10 :3 3 15
19 :3 3 10 14 :3 3 d 11 :2 3
:2 1 8 :2 1 3 :3 d :2 3 :2 10 1b
10 :2 3 :3 11 3 9 11 18 9
8 17 24 a 5 :2 a 16 :3 14
5 14 1c 23 14 :4 2 1 8
4 16 :2 3 2 :3 1 6 13 15
:2 13 5 4 14 4 21 :3 2 f
1f :2 f 2 9 11 1c 25 27
2e 2f :2 27 26 :2 1c 1b :2 11 21
1a 21 :2 15 1a :2 1c :2 11 26 1a
21 :2 15 1a :2 21 :2 11 23 1a 21
2e 30 :2 21 :2 15 1a :2 1e :2 11 1a
:2 11 19 11 8 14 12 d :2 12
14 1a 21 :2 15 1a :2 23 30 3a
3c :2 30 2f :3 1a 47 48 :2 1a 4a
4b :2 1a 4d 4e :2 1a 50 1a :2 23
30 3a 3c :2 30 2f :3 1a 47 48
:2 1a 4a 4b :4 1a 4d 1a :2 23 30
3a 3c :2 30 2f :3 1a 47 48 :4 1a
4a 1a :2 23 30 3a 3c :2 30 2f
:5 1a :3 f 14 27 2e :2 22 18 :2 f
14 27 2e :2 22 18 :7 f :2 d :3 2
3 a 3 :9 1
129
4
0 :2 1 :4 3 :5 4
:5 5 :5 6 :5 7 :5 8
:5 9 2 :2 b :2 1
:5 c :6 d :5 e :4 12
:3 13 :3 14 :5 15 14
:4 16 :4 12 11 18
19 :3 18 17 :3 f
:6 1e :3 1f :3 1e :6 22
24 :d 25 :2 26 :4 27
28 :3 26 :2 2a :4 2b
2c :3 2a :2 2e :8 2f
30 :3 2e :3 32 :3 33
:3 34 35 :2 34 36
:4 37 :19 38 :14 39 :2 38
39 :10 3a :2 38 3a
:c 3b :2 38 :2 36 3d
:5 3e 3f :2 3e :5 40
41 :2 40 36 43
44 45 46 :2 35
:3 24 :3 49 :2 f :7 1

422
4
:3 0 1 :3 0 2
:a 0 124 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
5c 0 7 6
:3 0 7 :3 0 5
:6 0 a 9 :3 0
6 :3 0 9
/

prompt
prompt Creating function ORA_ASPNET_SESSN_INSSTATEITEM
prompt ===============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Sessn_InsStateItem wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
20
2 :e:
1FUNCTION:
1ORA_ASPNET_SESSN_INSSTATEITEM:
1ID:
1NVARCHAR2:
1ITEMSHORT:
1RAW:
1ITEMLONG:
1BLOB:
1SESSIONTIMEOUT:
1INTEGER:
1RETURN:
1OUTRESULT:
1M_UTCTIME:
1TIMESTAMP:
1SYS_EXTRACT_UTC:
1SYSTIMESTAMP:
1ORA_ASPNET_SESSIONS:
1SESSIONID:
1SESSIONITEMSHORT:
1SESSIONITEMLONG:
1TIMEOUT:
1EXPIRES:
1LOCKED:
1LOCKDATE:
1LOCKDATELOCAL:
1LOCKCOOKIE:
1+:
1/:
11440:
10:
1SYSDATE:
11:
0

0
0
55
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d b4 :2 a0 2c 6a a3
a0 1c 81 b0 a3 a0 1c 81
b0 :3 a0 a5 b d :f a0 7e a0
7e 51 b4 2e 5a b4 2e 51
:2 a0 51 5 d7 b2 5 e9 a0
51 65 b7 a4 b1 11 68 4f
1d 17 b5
55
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 5e
5a 30 66 59 6b 6f 73 77
90 7f 83 8b 56 a8 97 9b
a3 7e af b3 b7 7b bb bd
c1 c5 c9 cd d1 d5 d9 dd
e1 e5 e9 ed f1 f5 f9 fd
100 104 107 10a 10b 110 113 114
119 11c 120 124 127 12b 133 134
138 13d 141 144 148 14a 14e 150
15c 160 162 163 16c
55
2
0 1 a 3 b :3 3 11 :3 3
10 :3 3 15 :2 3 2 1 8 :2 1
3 :3 d :2 3 :3 11 3 2 f 1f
:2 f 2 e :e 12 1b 1d 2b 2c
:2 1d 1c :6 12 11 :4 2 3 a 3
:9 1
55
4
0 :2 1 :4 3 :4 4
:4 5 :4 6 2 :2 8
:2 1 :5 9 :5 a :6 d
f 10 11 12
13 14 15 16
17 18 1a 1b
1c 1d :a 1e 1f
20 21 22 1a
:4 f :3 25 :2 b :7 1

16e
4
:3 0 1 :3 0 2
:a 0 50 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
56 0 7 6
:3 0 5 :7 0 9
8 :3 0 8 :3 0
7 :7 0 d c
:3 0 10 7b 0
b a :3 0 9
:7 0 11 10 :3 0
b :3 0 a :3 0
13 15 0 50
2 16 :2 0 14
:2 0 12 a :3 0
19 :7 0 1c 1a
0 4e 0 c
:6 0 e :3 0 1e
:7 0 21 1f 0
4e 0 d :6 0
d :3 0 f :3 0
10 :3 0 23 25
22 26 0 4c
11 :3 0 12 :3 0
13 :3 0 14 :3 0
15 :3 0 16 :3 0
17 :3 0 18 :3 0
19 :3 0 1a :3 0
3 :3 0 5 :3 0
7 :3 0 9 :3 0
d :3 0 1b :2 0
9 :3 0 1c :2 0
1d :2 0 16 39
3b :3 0 3c :2 0
19 37 3e :3 0
1e :2 0 d :3 0
1f :3 0 20 :2 0
1c :3 0 28 46
47 48 :4 0 26
30 :4 0 45 :2 0
4c b :3 0 1e
:2 0 4a :2 0 4c
32 4f :3 0 4f
36 4f 4e 4c
4d :6 0 50 :2 0
2 16 4f 53
:3 0 52 50 54
:8 0
39
4
:3 0 1 3 1
7 1 b 1
f 4 6 a
e 12 1 18
1 1d 1 24
2 38 3a 2
36 3d 9 32
33 34 35 3f
40 41 42 43
9 29 2a 2b
2c 2d 2e 2f
30 31 1 44
3 27 48 4b
2 1b 20
1
4
0
53
0
1
14
1
7
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
b 1 0
3 1 0
2 0 1
18 1 0
1d 1 0
f 1 0
7 1 0
0
/

prompt
prompt Creating function ORA_ASPNET_SESSN_INSUNINITITEM
prompt ================================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Sessn_InsUninitItem wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
1e
2 :e:
1FUNCTION:
1ORA_ASPNET_SESSN_INSUNINITITEM:
1ID:
1NVARCHAR2:
1ITEMSHORT:
1RAW:
1SESSIONTIMEOUT:
1INTEGER:
1RETURN:
1OUTRESULT:
1M_UTCTIME:
1TIMESTAMP:
1SYS_EXTRACT_UTC:
1SYSTIMESTAMP:
1ORA_ASPNET_SESSIONS:
1SESSIONID:
1SESSIONITEMSHORT:
1TIMEOUT:
1EXPIRES:
1LOCKED:
1LOCKDATE:
1LOCKDATELOCAL:
1LOCKCOOKIE:
1FLAGS:
1+:
1/:
11440:
10:
1SYSDATE:
11:
0

0
0
51
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d b4
:2 a0 2c 6a a3 a0 1c 81 b0
a3 a0 1c 81 b0 :3 a0 a5 b
d :e a0 7e a0 7e 51 b4 2e
5a b4 2e 51 :2 a0 :2 51 5 d7
b2 5 e9 a0 51 65 b7 a4
b1 11 68 4f 1d 17 b5
51
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 30
56 5a 5e 62 7b 6a 6e 76
69 97 86 8a 92 66 82 9e
a2 a6 a7 a9 ad b1 b5 b9
bd c1 c5 c9 cd d1 d5 d9
dd e1 e5 e8 ec ef f2 f3
f8 fb fc 101 104 108 10c 10f
112 116 11e 11f 123 128 12c 12f
133 135 139 13b 147 14b 14d 14e
157
51
2
0 1 a 2 9 :3 2 f :3 2
14 :2 2 :2 1 8 :2 1 3 :3 d :2 3
:3 11 3 2 f 1f :2 f 2 e
:d 12 1b 1d 2b 2c :2 1d 1c :7 12
11 :4 2 3 a 3 :9 1
51
4
0 :2 1 :4 3 :4 4
:4 5 2 :2 7 :2 1
:5 8 :5 9 :6 c e
f 10 11 12
13 14 15 16
17 19 1a 1b
:a 1c 1d 1e 1f
20 21 19 :4 e
:3 24 :2 a :7 1
159
4
:3 0 1 :3 0 2
:a 0 4c 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
:2 0 7 6 :3 0
5 :7 0 9 8
:3 0 8 :3 0 7
:7 0 d c :3 0
9 :3 0 8 :3 0
f 11 0 4c
2 12 :2 0 f
82 0 d 8
:3 0 15 :7 0 18
16 0 4a 0
a :6 0 b :3 0
c :3 0 1a :7 0
1d 1b 0 4a
0 b :6 0 d
:3 0 e :3 0 11
1f 21 1e 22
0 48 f :3 0
10 :3 0 11 :3 0
12 :3 0 13 :3 0
14 :3 0 15 :3 0
16 :3 0 17 :3 0
18 :3 0 3 :3 0
5 :3 0 7 :3 0
b :3 0 19 :2 0
7 :3 0 1a :2 0
1b :2 0 13 34
36 :3 0 37 :2 0
16 32 39 :3 0
1c :2 0 b :3 0
1d :3 0 1e :2 0
1e :2 0 19 :3 0
24 42 43 44
:4 0 23 2d :4 0
41 :2 0 48 9
:3 0 1c :2 0 46
:2 0 48 2f 4b
:3 0 4b 33 4b
4a 48 49 :6 0
4c :2 0 2 12
4b 4f :3 0 4e
4c 50 :8 0
36
4
:3 0 1 3 1
7 1 b 3
6 a e 1
14 1 19 1
20 2 33 35
2 31 38 9
2e 2f 30 3a
3b 3c 3d 3e
3f 9 25 26
27 28 29 2a
2b 2c 2d 1
40 3 23 44
47 2 17 1c

1
4
0
4f
0
1
14
1
6
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
3 1 0
14 1 0
19 1 0
2 0 1
b 1 0
7 1 0
0
/

prompt
prompt Creating function ORA_ASPNET_SESSN_RELSTATEITMEX
prompt ================================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Sessn_RelStateItmEx wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
15
2 :e:
1FUNCTION:
1ORA_ASPNET_SESSN_RELSTATEITMEX:
1ID:
1NVARCHAR2:
1SESSIONLOCKCOOKIE:
1INTEGER:
1RETURN:
1OUTRESULT:
1ORA_ASPNET_SESSIONS:
1EXPIRES:
1SYS_EXTRACT_UTC:
1SYSTIMESTAMP:
1+:
1TIMEOUT:
1/:
11440:
1LOCKED:
10:
1SESSIONID:
1=:
1LOCKCOOKIE:
0

0
0
44
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d b4 :2 a0 2c 6a a3
a0 1c 81 b0 :4 a0 a5 b 7e
a0 7e 51 b4 2e 5a b4 2e
5a e7 a0 51 e7 :2 a0 7e b4
2e :2 a0 7e b4 2e a 10 ef
f9 e9 a0 51 65 b7 a4 b1
11 68 4f 1d 17 b5
44
2
0 3 7 23 1f 1e 2b 38
34 1b 40 33 45 49 4d 51
6a 59 5d 65 30 55 71 75
79 7d 7e 80 83 87 8a 8d
8e 93 96 97 9c 9f a1 a5
a8 aa ae b2 b5 b6 bb bf
c3 c6 c7 1 cc d1 d7 d8
dd e1 e4 e8 ea ee f0 fc
100 102 103 10c
44
2
0 1 a 2 a :3 2 17 :2 2
:2 1 8 :2 1 3 :3 d 3 9 11
1c 2c :2 1c 39 3b 42 43 :2 3b
3a :2 1c 1b :2 11 1a 11 13 1f
:3 1d 26 33 :3 31 :2 13 :3 2 3 a
3 :9 1
44
4
0 :2 1 :4 3 :4 4
2 :2 6 :2 1 :5 7
a :10 b :3 c :c d
:3 a :3 10 :2 8 :7 1

10e
4
:3 0 1 :3 0 2
:a 0 3f 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 a
55 0 7 6
:3 0 5 :7 0 9
8 :3 0 7 :3 0
6 :3 0 b d
0 3f 2 e
:2 0 9 :3 0 6
:3 0 11 :7 0 14
12 0 3d 0
8 :6 0 a :3 0
b :3 0 c :3 0
c 17 19 d
:2 0 e :3 0 f
:2 0 10 :2 0 e
1d 1f :3 0 20
:2 0 11 1b 22
:3 0 23 :2 0 16
24 11 :3 0 12
:2 0 26 27 13
:3 0 3 :3 0 14
:2 0 16 2b 2c
:3 0 15 :3 0 5
:3 0 14 :2 0 1b
30 31 :3 0 2d
33 32 :2 0 15
36 34 0 37
0 1e 0 35
:2 0 3b 7 :3 0
12 :2 0 39 :2 0
3b 21 3e :3 0
3e 24 3e 3d
3b 3c :6 0 3f
:2 0 2 e 3e
42 :3 0 41 3f
43 :8 0
26
4
:3 0 1 3 1
7 2 6 a
1 10 1 18
2 1c 1e 2
1a 21 1 2a
2 29 2a 1
2f 2 2e 2f
2 25 28 2
37 3a 1 13

1
4
0
42
0
1
14
1
4
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
3 1 0
7 1 0
10 1 0
2 0 1
0
/

prompt
prompt Creating function ORA_ASPNET_SESSN_RESETTIMEOUT
prompt ===============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Sessn_ResetTimeout wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
12
2 :e:
1FUNCTION:
1ORA_ASPNET_SESSN_RESETTIMEOUT:
1ID:
1NVARCHAR2:
1RETURN:
1INTEGER:
1OUTRESULT:
1ORA_ASPNET_SESSIONS:
1EXPIRES:
1SYS_EXTRACT_UTC:
1SYSTIMESTAMP:
1+:
1TIMEOUT:
1/:
11440:
1SESSIONID:
1=:
10:
0

0
0
36
2
0 a0 8d 8f a0 b0 3d b4
:2 a0 2c 6a a3 a0 1c 81 b0
:4 a0 a5 b 7e a0 7e 51 b4
2e 5a b4 2e 5a e7 :2 a0 7e
b4 2e ef f9 e9 a0 51 65
b7 a4 b1 11 68 4f 1d 17
b5
36
2
0 3 7 23 1f 1e 2b 1b
30 34 38 3c 55 44 48 50
43 5c 60 64 68 40 6c 6e
71 75 78 7b 7c 81 84 85
8a 8d 8f 93 97 9a 9b a0
a6 a7 ac b0 b3 b7 b9 bd
bf cb cf d1 d2 db
36
2
0 1 a 2 9 :2 2 :2 1 8
:2 1 3 :3 d 3 9 11 1c 2c
:2 1c 39 3b 42 43 :2 3b 3a :2 1c
1b 11 13 1f :3 1d :3 2 3 a
3 :9 1
36
4
0 :2 1 :4 3 2
:2 5 :2 1 :5 6 9
:10 a :5 b :3 9 :3 e
:2 7 :7 1
dd
4
:3 0 1 :3 0 2
:a 0 31 1 :7 0
5 :2 0 3 4
:3 0 3 :7 0 5
4 :3 0 5 :3 0
6 :3 0 7 9
0 31 2 a
:2 0 9 :2 0 7
6 :3 0 d :7 0
10 e 0 2f
0 7 :6 0 8
:3 0 9 :3 0 a
:3 0 b :3 0 13
15 c :2 0 d
:3 0 e :2 0 f
:2 0 b 19 1b
:3 0 1c :2 0 e
17 1e :3 0 1f
:2 0 12 20 10
:3 0 3 :3 0 11
:2 0 13 24 25
:3 0 11 28 26
0 29 0 16
0 27 :2 0 2d
5 :3 0 12 :2 0
2b :2 0 2d 18
30 :3 0 30 1b
30 2f 2d 2e
:6 0 31 :2 0 2
a 30 34 :3 0
33 31 35 :8 0

1d
4
:3 0 1 3 1
6 1 c 1
14 2 18 1a
2 16 1d 1
23 2 22 23
1 21 2 29
2c 1 f
1
4
0
34
0
1
14
1
3
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
3 1 0
c 1 0
2 0 1
0
/

prompt
prompt Creating function ORA_ASPNET_SESSN_RMSTATEITEM
prompt ==============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Sessn_RmStateItem wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
d
2 :e:
1FUNCTION:
1ORA_ASPNET_SESSN_RMSTATEITEM:
1ID:
1NVARCHAR2:
1SESSIONLOCKCOOKIE:
1INTEGER:
1RETURN:
1OUTRESULT:
1ORA_ASPNET_SESSIONS:
1SESSIONID:
1=:
1LOCKCOOKIE:
10:
0

0
0
30
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d b4 :2 a0 2c 6a a3
a0 1c 81 b0 :3 a0 7e b4 2e
:2 a0 7e b4 2e a 10 cd e9
a0 51 65 b7 a4 b1 11 68
4f 1d 17 b5
30
2
0 3 7 23 1f 1e 2b 38
34 1b 40 33 45 49 4d 51
6a 59 5d 65 30 55 71 75
79 7c 7d 82 86 8a 8d 8e
1 93 98 9d a2 a6 a9 ad
af b3 b5 c1 c5 c7 c8 d1
30
2
0 1 a 2 a :3 2 17 :2 2
:2 1 8 :2 1 3 :3 d 3 9 f
1b :3 19 22 2f :3 2d :2 f :2 2 3
a 3 :9 1
30
4
0 :2 1 :4 3 :4 4
2 :2 6 :2 1 :5 7
a :c b :2 a :3 e
:2 8 :7 1
d3
4
:3 0 1 :3 0 2
:a 0 2b 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 a
55 0 7 6
:3 0 5 :7 0 9
8 :3 0 7 :3 0
6 :3 0 b d
0 2b 2 e
:2 0 9 :3 0 6
:3 0 11 :7 0 14
12 0 29 0
8 :6 0 a :3 0
3 :3 0 b :2 0
e 18 19 :3 0
c :3 0 5 :3 0
b :2 0 13 1d
1e :3 0 1a 20
1f :2 0 15 21
0 23 :2 0 22
:2 0 27 7 :3 0
d :2 0 25 :2 0
27 16 2a :3 0
2a 19 2a 29
27 28 :6 0 2b
:2 0 2 e 2a
2e :3 0 2d 2b
2f :8 0
1b
4
:3 0 1 3 1
7 2 6 a
1 10 1 17
2 16 17 1
1c 2 1b 1c
2 23 26 1
13
1
4
0
2e
0
1
14
1
4
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
3 1 0
2 0 1
7 1 0
10 1 0
0
/

prompt
prompt Creating function ORA_ASPNET_SESSN_UPDSTATEITEM
prompt ===============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Sessn_UpdStateItem wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
1c
2 :e:
1FUNCTION:
1ORA_ASPNET_SESSN_UPDSTATEITEM:
1ID:
1NVARCHAR2:
1ITEMSHORT:
1RAW:
1ITEMLONG:
1BLOB:
1SESSIONTIMEOUT:
1INTEGER:
1SESSIONLOCKCOOKIE:
1RETURN:
1OUTRESULT:
1ORA_ASPNET_SESSIONS:
1EXPIRES:
1SYS_EXTRACT_UTC:
1SYSTIMESTAMP:
1+:
1/:
11440:
1SESSIONITEMSHORT:
1SESSIONITEMLONG:
1TIMEOUT:
1LOCKED:
10:
1SESSIONID:
1=:
1LOCKCOOKIE:
0

0
0
59
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d b4
:2 a0 2c 6a a3 a0 1c 81 b0
:4 a0 a5 b 7e a0 7e 51 b4
2e 5a b4 2e 5a e7 :2 a0 e7
:2 a0 e7 :2 a0 e7 a0 51 e7 :2 a0
7e b4 2e :2 a0 7e b4 2e a
10 ef f9 e9 a0 51 65 b7
a4 b1 11 68 4f 1d 17 b5
59
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 5e
5a 30 66 6f 6b 59 77 56
7c 80 84 88 a1 90 94 9c
8f a8 ac b0 b4 8c b8 ba
bd c1 c4 c7 c8 cd d0 d1
d6 d9 db df e3 e5 e9 ed
ef f3 f7 f9 fd 100 102 106
10a 10d 10e 113 117 11b 11e 11f
1 124 129 12f 130 135 139 13c
140 142 146 148 154 158 15a 15b
164
59
2
0 1 a 3 b :3 3 11 :3 3
10 :3 3 15 :3 3 18 :2 3 2 1
8 :2 1 3 :3 d 3 8 11 1c
2c :2 1c 39 3b 49 4a :2 3b 3a
:2 1c 1b :2 11 24 :2 11 23 :2 11 1b
:2 11 1a 11 13 1f :3 1d 26 33
:3 31 :2 13 :3 1 3 a 3 :9 1
59
4
0 :2 1 :4 3 :4 4
:4 5 :4 6 :4 7 2
:2 a :2 1 :5 b f
:10 10 :3 11 :3 12 :3 13
:3 14 :c 15 :3 f :3 19
:2 c :7 1
166
4
:3 0 1 :3 0 2
:a 0 54 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
56 0 7 6
:3 0 5 :7 0 9
8 :3 0 8 :3 0
7 :7 0 d c
:3 0 d :2 0 b
a :3 0 9 :7 0
11 10 :3 0 a
:3 0 b :7 0 15
14 :3 0 c :3 0
a :3 0 17 19
0 54 2 1a
:2 0 15 :2 0 13
a :3 0 1d :7 0
20 1e 0 52
0 d :6 0 e
:3 0 f :3 0 10
:3 0 11 :3 0 23
25 12 :2 0 9
:3 0 13 :2 0 14
:2 0 17 29 2b
:3 0 2c :2 0 1a
27 2e :3 0 2f
:2 0 22 30 15
:3 0 5 :3 0 32
33 16 :3 0 7
:3 0 35 36 17
:3 0 9 :3 0 38
39 18 :3 0 19
:2 0 3b 3c 1a
:3 0 3 :3 0 1b
:2 0 1f 40 41
:3 0 1c :3 0 b
:3 0 1b :2 0 24
45 46 :3 0 42
48 47 :2 0 21
4b 49 0 4c
0 27 0 4a
:2 0 50 c :3 0
19 :2 0 4e :2 0
50 2d 53 :3 0
53 30 53 52
50 51 :6 0 54
:2 0 2 1a 53
57 :3 0 56 54
58 :8 0
32
4
:3 0 1 3 1
7 1 b 1
f 1 13 5
6 a e 12
16 1 1c 1
24 2 28 2a
2 26 2d 1
3f 2 3e 3f
1 44 2 43
44 5 31 34
37 3a 3d 2
4c 4f 1 1f

1
4
0
57
0
1
14
1
7
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
b 1 0
3 1 0
13 1 0
1c 1 0
f 1 0
7 1 0
2 0 1
0
/

prompt
prompt Creating function ORA_ASPNET_TABLEEXISTS
prompt ========================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_TableExists wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
11
2 :e:
1FUNCTION:
1ORA_ASPNET_TABLEEXISTS:
1TABLENAME_:
1NVARCHAR2:
1RETURN:
1INTEGER:
1CURSOR:
1TEMPCUR:
1TAB:
1TNAME:
1=:
1TAB_REC:
1ROWTYPE:
1OPEN:
1NOTFOUND:
10:
11:
0

0
0
51
2
0 a0 8d 8f a0 b0 3d b4
:2 a0 2c 6a a0 f4 b4 bf c8
4d ac a0 b2 ee :2 a0 7e b4
2e ac d0 e5 e9 bd b7 11
a4 b1 a3 :2 a0 f 1c 81 b0
:2 a0 e9 dd b3 :2 a0 e9 d3 :2 a0
f 5a a0 51 65 b7 a0 51
65 b7 :2 19 3c b7 a4 b1 11
4f b7 a4 b1 11 68 4f 1d
17 b5
51
2
0 3 7 23 1f 1e 2b 1b
30 34 38 3c 40 44 55 56
59 5d 5e 5f 63 64 6b 6f
73 76 77 7c 7d 81 87 8c
91 93 9f a3 c3 a9 ad b1
b6 be a8 ca ce d2 d7 a5
db df e3 e8 ed f1 f5 fa
fd 101 104 108 10a 10e 111 115
117 11b 11f 122 124 128 12a 136
138 13a 13e 140 14c 150 152 153
15c
51
2
0 1 a 2 13 :2 2 :2 1 8
:2 1 7 e 0 :2 7 :2 20 2a 25
2a 34 3c :3 3a 25 :3 19 :5 7 2
a 12 :3 a 2 5 a :3 5 8
15 :2 2 9 13 9 8 9 10
9 1d 9 10 9 :4 5 :2 3 :c 1

51
4
0 :2 1 :4 3 2
:2 5 :2 1 :2 9 0
:15 9 :7 a :5 d :4 e
:4 10 :3 11 10 :3 13
12 :3 10 :2 c :5 7
:7 1
15e
4
:3 0 1 :3 0 2
:a 0 4c 1 :7 0
5 :2 0 3 4
:3 0 3 :7 0 5
4 :3 0 5 :3 0
6 :3 0 7 9
0 4c 2 a
:2 0 7 :3 0 8
:a 0 3 1f :5 0
d 10 0 e
:4 0 7 9 :3 0
9 14 1a 0
1b :3 0 a :3 0
3 :3 0 b :2 0
d 18 19 :5 0
12 15 0 1c
:6 0 1d :2 0 20
d 10 21 0
45 10 21 23
20 22 :6 0 1f
1 :6 0 21 :3 0
12 8 :3 0 d
:3 0 25 26 :3 0
27 :7 0 2a 28
0 45 0 c
:6 0 e :3 0 8
:4 0 2e :2 0 43
2c 2f :2 0 8
:3 0 c :4 0 33
:2 0 43 30 31
:3 0 8 :3 0 f
:3 0 34 35 :3 0
36 :2 0 5 :3 0
10 :2 0 39 :2 0
3b 14 40 5
:3 0 11 :2 0 3d
:2 0 3f 16 41
37 3b 0 42
0 3f 0 42
18 0 43 1b
46 :3 0 46 1f
46 45 43 44
:6 0 48 1 :3 0
22 4b :3 0 4b
0 4b 4a 48
49 :6 0 4c :2 0
2 a 4b 4f
:3 0 4e 4c 50
:8 0
24
4
:3 0 1 3 1
6 1 11 1
13 1 17 2
16 17 1 1e
1 24 1 3a
1 3e 2 40
41 3 2d 32
42 2 1f 29
1 46
1
4
0
4f
0
1
14
3
4
0 1 2 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
24 2 0
d 2 3
3 1 0
2 0 1
0
/

prompt
prompt Creating function ORA_ASPNET_UIR_ADDUSERSTOROLES
prompt ================================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_UIR_AddUsersToRoles wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
32
2 :e:
1FUNCTION:
1ORA_ASPNET_UIR_ADDUSERSTOROLES:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAMES_:
1ORA_ASPNET_ROLES_PKG:
1ASSOCARRAYVARCHAR2_T:
1USERNAMES_ARR_SIZE:
1INTEGER:
1ROLENAMES_:
1ROLENAMES_ARR_SIZE:
1USERNAME:
1OUT:
1ROLENAME:
1RETURN:
1OUTRESULT:
1M_APPID:
1RAW:
116:
1M_USERID:
1M_ROLEID:
1M_ROWSCHG:
10:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWER:
1LOWEREDAPPLICATIONNAME:
1=:
1NO_DATA_FOUND:
1ROLE_NOT_FOUND:
1I:
11:
1LOOP:
1ROLEID:
1ORA_ASPNET_ROLES:
1LOWEREDROLENAME:
1USERID:
1ORA_ASPNET_USERS:
1LOWEREDUSERNAME:
1ISANONYMOUS:
1LASTACTIVITYDATE:
1SYS_EXTRACT_UTC:
1SYSTIMESTAMP:
1J:
1K:
1ORA_ASPNET_USERSINROLES:
1UNIQUE_CONSTRAINT_VIOLATED:
1ROLLBACK:
1ROLLBACK_NR:
1THIS_USER_ALREADY_IN_ROLE:
0

0
0
181
2
0 a0 8d 8f a0 b0 3d 8f
:2 a0 6b b0 3d 8f a0 b0 3d
8f :2 a0 6b b0 3d 8f a0 b0
3d 96 :2 a0 b0 54 96 :2 a0 b0
54 b4 :2 a0 2c 6a a3 a0 1c
81 b0 a3 a0 51 a5 1c 4d
81 b0 a3 a0 51 a5 1c 4d
81 b0 a3 a0 51 a5 1c 4d
81 b0 a3 a0 1c 51 81 b0
a0 ac :2 a0 b2 ee :2 a0 a5 b
a0 7e b4 2e ac e5 d0 b2
e9 b7 :4 a0 6b 65 b7 a6 9
a4 b1 11 4f 91 51 :2 a0 63
37 a0 ac :2 a0 b2 ee :3 a0 a5
b a5 b a0 7e b4 2e :2 a0
7e b4 2e a 10 ac e5 d0
b2 e9 b7 :4 a0 a5 b d :3 a0
6b 65 b7 a6 9 a4 b1 11
4f b7 a0 47 91 51 :2 a0 63
37 a0 ac :2 a0 b2 ee :2 a0 7e
:2 a0 a5 b a5 b b4 2e :2 a0
7e b4 2e a 10 ac e5 d0
b2 e9 b7 :a a0 a5 b :3 a0 a5
b a5 b 51 :2 a0 a5 b 5
d7 b2 5 e9 b7 a6 9 a4
b1 11 4f b7 a0 47 b7 a4
b1 11 4f a0 4d d a0 4d
d 91 51 :2 a0 63 37 a0 ac
:2 a0 b2 ee :2 a0 7e :2 a0 a5 b
a5 b b4 2e :2 a0 7e b4 2e
a 10 ac e5 d0 b2 e9 91
51 :2 a0 63 37 a0 ac :2 a0 b2
ee :3 a0 a5 b a5 b a0 7e
b4 2e :2 a0 7e b4 2e a 10
ac e5 d0 b2 e9 :5 a0 5 d7
b2 5 e9 b7 :2 a0 6b a0 57
a0 b4 e9 :3 a0 a5 b d :3 a0
a5 b d :3 a0 6b 65 b7 a6
9 a4 b1 11 4f b7 a0 47
b7 a0 47 a0 51 65 b7 a4
b1 11 68 4f 1d 17 b5
181
2
0 3 7 23 1f 1e 2b 3c
34 38 1b 33 44 51 4d 30
59 69 5e 62 66 4c 71 7e
7a 49 86 93 8b 8f 79 9a
ab a3 a7 76 b2 a2 b7 bb
bf c3 dc cb cf d7 9f f9
e3 e7 ea eb f3 f4 ca 117
104 c7 108 109 111 112 103 135
122 100 126 127 12f 130 121 151
140 144 11e 14c 13f 158 13c 15c
160 164 165 16c 170 174 175 177
17b 17e 17f 184 185 18b 18f 190
195 197 19b 19f 1a3 1a7 1aa 1ae
1b0 1b1 1b6 1ba 1bc 1c8 1ca 1ce
1d1 1d5 1d9 1dd 1df 1e3 1e4 1e8
1ec 1ed 1f4 1f8 1fc 200 201 203
204 206 20a 20d 20e 213 217 21b
21e 21f 1 224 229 22a 230 234
235 23a 23c 240 244 248 24c 24d
24f 253 257 25b 25f 262 266 268
269 26e 272 274 280 282 284 288
28f 293 296 29a 29e 2a2 2a4 2a8
2a9 2ad 2b1 2b2 2b9 2bd 2c1 2c4
2c8 2cc 2cd 2cf 2d0 2d2 2d3 2d8
2dc 2e0 2e3 2e4 1 2e9 2ee 2ef
2f5 2f9 2fa 2ff 301 305 309 30d
311 315 319 31d 321 325 329 32a
32c 330 334 338 339 33b 33c 33e
341 345 349 34a 34c 350 358 359
35d 362 364 365 36a 36e 370 37c
37e 380 384 38b 38d 391 393 39f
3a1 3a5 3a6 3aa 3ae 3af 3b3 3b7
3ba 3be 3c2 3c6 3c8 3cc 3cd 3d1
3d5 3d6 3dd 3e1 3e5 3e8 3ec 3f0
3f1 3f3 3f4 3f6 3f7 3fc 400 404
407 408 1 40d 412 413 419 41d
41e 423 427 42a 42e 432 436 438
43c 43d 441 445 446 44d 451 455
459 45a 45c 45d 45f 463 466 467
46c 470 474 477 478 1 47d 482
483 489 48d 48e 493 497 49b 49f
4a3 4a7 4ab 4b3 4b4 4b8 4bd 4bf
4c3 4c7 4ca 4ce 4d3 4d7 4d8 4dd
4e1 4e5 4e9 4ea 4ec 4f0 4f4 4f8
4fc 4fd 4ff 503 507 50b 50f 512
516 518 519 51e 522 524 530 532
534 538 53f 541 545 54c 550 553
557 559 55d 55f 56b 56f 571 572
57b
181
2
0 1 a 3 1d :3 3 17 2c
17 :3 3 20 :3 3 12 27 12 :3 3
20 :3 3 d 11 :3 3 d 11 :2 3
:2 1 8 :2 1 3 :3 e :2 3 c 10
f c 17 c :2 3 d 11 10
d 18 d :2 3 d 11 10 d
18 d :2 3 :2 e 19 e 3 :2 9
1c 29 24 29 b 11 :2 b 25
:3 23 24 :4 2 1 8 4 b :2 20
4 16 :2 3 2 :3 1 6 b e
21 b 2 :2 b 17 25 20 25
c 12 1d :2 12 :2 c 23 :3 21 37
47 :3 45 :2 c 20 :4 4 3 b 8
14 1f :2 14 :2 8 f :2 24 8 19
:2 6 4 :4 21 6 2 6 b e
21 b 2 :2 b 17 b 6 b
e 20 1e 26 31 :2 26 :2 20 :2 1e
39 49 :3 47 :2 e 6 :4 4 3 a
14 26 35 3f 50 5d c 15
20 :2 15 24 2a 35 :2 2a :2 24 3a
3d 4d :2 3d b :4 8 18 :2 5 4
:4 21 6 2 :6 1 d :2 1 d 1
5 a
/

prompt
prompt Creating function ORA_ASPNET_UIR_FINDUSERSINROLE
prompt ================================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_UIR_FindUsersInRole wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
25
2 :e:
1FUNCTION:
1ORA_ASPNET_UIR_FINDUSERSINROLE:
1APPLICATIONNAME_:
1NVARCHAR2:
1ROLENAME_:
1USERNAMETOMATCH:
1USERCURSOR:
1OUT:
1SYS_REFCURSOR:
1RETURN:
1INTEGER:
1OUTRESULT:
1M_APPID:
1RAW:
116:
1M_ROLEID:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWER:
1LOWEREDAPPLICATIONNAME:
1=:
1NO_DATA_FOUND:
1ORA_ASPNET_ROLES_PKG:
1ROLE_NOT_FOUND:
1ROLEID:
1ORA_ASPNET_ROLES:
1LOWEREDROLENAME:
1OPEN:
1U:
1USERNAME:
1ORA_ASPNET_USERS:
1ORA_ASPNET_USERSINROLES:
1UR:
1USERID:
1LOWEREDUSERNAME:
1LIKE:
10:
0

0
0
c2
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 96
:2 a0 b0 54 b4 :2 a0 2c 6a a3
a0 1c 81 b0 a3 a0 51 a5
1c 4d 81 b0 a3 a0 51 a5
1c 4d 81 b0 a0 ac :2 a0 b2
ee :2 a0 a5 b a0 7e b4 2e
ac e5 d0 b2 e9 b7 :4 a0 6b
65 b7 a6 9 a4 b1 11 4f
a0 ac :2 a0 b2 ee :2 a0 7e a0
a5 b b4 2e :2 a0 7e b4 2e
a 10 ac e5 d0 b2 e9 b7
:4 a0 6b 65 b7 a6 9 a4 b1
11 4f :4 a0 6b ac :2 a0 b9 :2 a0
b9 b2 ee :2 a0 6b a0 7e a0
6b b4 2e :2 a0 7e a0 6b b4
2e a 10 :2 a0 6b a0 7e b4
2e a 10 a0 7e :2 a0 a5 b
b4 2e a 10 ac :2 a0 6b de
ac e5 d0 b2 :2 e9 dd a0 51
65 b7 a4 b1 11 68 4f 1d
17 b5
c2
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 62
5a 5e 30 69 59 6e 72 76
7a 93 82 86 8e 56 b0 9a
9e a1 a2 aa ab 81 ce bb
7e bf c0 c8 c9 ba d5 b7
d9 dd e1 e2 e9 ed f1 f2
f4 f8 fb fc 101 102 108 10c
10d 112 114 118 11c 120 124 127
12b 12d 12e 133 137 139 145 147
14b 14c 150 154 155 15c 160 164
167 16b 16c 16e 16f 174 178 17c
17f 180 1 185 18a 18b 191 195
196 19b 19d 1a1 1a5 1a9 1ad 1b0
1b4 1b6 1b7 1bc 1c0 1c2 1ce 1d0
1d4 1d8 1dc 1e0 1e3 1e4 1e8 1ec
1ee 1f2 1f6 1f8 1f9 200 204 208
20b 20f 212 216 219 21a 21f 223
227 22a 22e 231 232 1 237 23c
240 244 247 24b 24e 24f 1 254
259 25d 260 264 268 269 26b 26c
1 271 276 277 27b 27f 282 284
285 28b 28f 290 295 29a 29e 2a2
2a5 2a9 2ab 2af 2b1 2bd 2c1 2c3
2c4 2cd
c2
2
0 1 a 3 1c :3 3 11 :3 3
16 :3 3 f 13 :2 3 2 1 8
:2 1 3 :3 d :2 3 b f e b
16 b :2 3 c 10 f c 17
c 3 :2 9 1c 29 24 29 b
11 :2 b 25 :3 23 24 :4 2 1 8
4 b :2 20 4 16 :2 3 2 :3 1
:2 9 15 a 4 a c 1e 1c
24 :2 1e :2 1c 33 43 :3 41 :2 c 4
:4 2 1 8 4 b :2 20 4 16
:2 3 2 :3 1 2 7 a :2 c :2 a
1b a 1e 36 1e 5 a c
:2 e 17 15 :2 1a :2 15 25 30 2e
:2 33 :2 2e :3 c :2 e 1e :3 1c :2 c :2 2a
3f 45 :2 3f :2 2a :2 c 5 12 :2 14
12 9 :4 3 2 :2 3 a 3 :9 1

c2
4
0 :2 1 :4 3 :4 4
:4 5 :5 6 2 :2 8
:2 1 :5 9 :8 a :8 b
:6 10 :8 11 :5 10 f
14 :5 15 :3 14 13
:3 c :3 1b :3 1c :f 1d
1c :4 1b 1a 20
:5 21 :3 20 1f :3 c
:2 25 :4 26 :8 27 :12 28
:7 29 :2 28 :8 29 :2 28
27 :5 2a :4 26 25
26 :3 2e :2 c :7 1

2cf
4
:3 0 1 :3 0 2
:a 0 bd 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
56 0 7 4
:3 0 5 :7 0 9
8 :3 0 4 :3 0
6 :7 0 d c
:3 0 10 7e 0
b 8 :3 0 9
:3 0 7 :6 0 12
11 :3 0 a :3 0
b :3 0 14 16
0 bd 2 17
:2 0 f :2 0 14
b :3 0 1a :7 0
1d 1b 0 bb
0 c :6 0 e
:3 0 f :2 0 12
1f 21 :7 0 25
22 23 bb 0
d :6 0 1a :2 0
18 e :3 0 16
27 29 :7 0 2d
2a 2b bb 0
10 :6 0 11 :3 0
d :3 0 12 :3 0
1c 32 3b 0
3c :3 0 13 :3 0
3 :3 0 1e 34
36 14 :3 0 15
:2 0 22 39 3a
:4 0 3e 3f :5 0
2f 33 0 25
0 3d :2 0 41
27 4d 16 :3 0
a :3 0 17 :3 0
18 :3 0 44 45
0 46 :2 0 48
29 4a 2b 49
48 :2 0 4b 2d
:2 0 4d 0 4d
4c 41 4b :6 0
b9 1 :3 0 19
:3 0 2f 10 :3 0
1a :3 0 31 53
63 0 64 :3 0
1b :3 0 13 :3 0
15 :2 0 5 :3 0
33 56 59 37
57 5b :3 0 11
:3 0 d :3 0 15
:2 0 3c 5f 60
:3 0 5c 62 61
:3 0 66 67 :5 0
50 54 0 3f
0 65 :2 0 69
41 75 16 :3 0
a :3 0 17 :3 0
18 :3 0 6c 6d
0 6e :2 0 70
43 72 45 71
70 :2 0 73 47
:2 0 75 0 75
74 69 73 :6 0
b9 1 :3 0 1c
:3 0 7 :3 0 1d
:3 0 1e :3 0 79
7a 0 49 1f
:3 0 1d :3 0 7d
7e 20 :3 0 21
:3 0 80 81 4b
83 a9 0 aa
:3 0 1d :3 0 22
:3 0 85 86 0
21 :3 0 15 :2 0
22 :3 0 88 8a
0 50 89 8c
:3 0 10 :3 0 21
:3 0 15 :2 0 19
:3 0 8f 91 0
55 90 93 :3 0
8d 95 94 :2 0
1d :3 0 11 :3 0
97 98 0 d
:3 0 15 :2 0 5a
9b 9c :3 0 96
9e 9d :2 0 23
:3 0 24 :2 0 13
:3 0 6 :3 0 5d
a2 a4 5f a1
a6 :3 0 9f a8
a7 :3 0 1d :3 0
1e :3 0 ab ac
0 1 ad 62
b1 b2 af :4 0
7c 84 :3 0 b0
:4 0 b5 :2 0 b9
78 b3 :2 0 a
:3 0 25 :2 0 b7
:2 0 b9 6
/

prompt
prompt Creating function ORA_ASPNET_UIR_GETROLESFORUSER
prompt ================================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_UIR_GetRolesForUser wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
20
2 :e:
1FUNCTION:
1ORA_ASPNET_UIR_GETROLESFORUSER:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAME_:
1ROLECURSOR:
1OUT:
1SYS_REFCURSOR:
1RETURN:
1INTEGER:
1OUTRESULT:
1M_APPID:
1RAW:
116:
1M_USERID:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWER:
1LOWEREDAPPLICATIONNAME:
1=:
1NO_DATA_FOUND:
10:
1USERID:
1ORA_ASPNET_USERS:
1LOWEREDUSERNAME:
1OPEN:
1R:
1ROLENAME:
1ORA_ASPNET_ROLES:
1ORA_ASPNET_USERSINROLES:
1UR:
1ROLEID:
0

0
0
b0
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 96 :2 a0 b0 54 b4
:2 a0 2c 6a a3 a0 1c 81 b0
a3 a0 51 a5 1c 4d 81 b0
a3 a0 51 a5 1c 4d 81 b0
a0 ac :2 a0 b2 ee :2 a0 a5 b
a0 7e b4 2e ac e5 d0 b2
e9 b7 :2 a0 51 65 b7 a6 9
a4 b1 11 4f a0 ac :2 a0 b2
ee :2 a0 7e a0 a5 b b4 2e
:2 a0 7e b4 2e a 10 ac e5
d0 b2 e9 b7 :2 a0 51 65 b7
a6 9 a4 b1 11 4f :4 a0 6b
ac :2 a0 b9 :2 a0 b9 b2 ee :2 a0
6b a0 7e a0 6b b4 2e :2 a0
6b a0 7e b4 2e a 10 :2 a0
6b a0 7e b4 2e a 10 ac
:2 a0 6b de ac e5 d0 b2 :2 e9
dd a0 51 65 b7 a4 b1 11
68 4f 1d 17 b5
b0
2
0 3 7 23 1f 1e 2b 38
34 1b 40 4d 45 49 33 54
30 59 5d 61 65 7e 6d 71
79 6c 9c 89 69 8d 8e 96
97 88 ba a7 85 ab ac b4
b5 a6 c1 a3 c5 c9 cd ce
d5 d9 dd de e0 e4 e7 e8
ed ee f4 f8 f9 fe 100 104
108 10b 10f 111 112 117 11b 11d
129 12b 12f 130 134 138 139 140
144 148 14b 14f 150 152 153 158
15c 160 163 164 1 169 16e 16f
175 179 17a 17f 181 185 189 18c
190 192 193 198 19c 19e 1aa 1ac
1b0 1b4 1b8 1bc 1bf 1c0 1c4 1c8
1ca 1ce 1d2 1d4 1d5 1dc 1e0 1e4
1e7 1eb 1ee 1f2 1f5 1f6 1fb 1ff
203 206 20a 20d 20e 1 213 218
21c 220 223 227 22a 22b 1 230
235 236 23a 23e 241 243 244 24a
24e 24f 254 259 25d 261 264 268
26a 26e 270 27c 280 282 283 28c
b0
2
0 1 a 3 1c :3 3 1c :3 3
f 13 :2 3 2 1 8 :2 1 3
:3 d :2 3 b f e b 16 b
:2 3 c 10 f c 17 c 3
:2 9 1c 29 24 29 b 11 :2 b
25 :3 23 24 :4 2 1 8 4 b
4 16 :2 3 2 :3 1 :2 9 15 9
4 9 c 1e 1c 24 :2 1e :2 1c
33 43 :3 41 :2 c 4 :4 2 1 8
4 b 4 16 :2 3 2 :3 1 2
7 a :2 c a 9 1a 9 1d
35 1d 4 9 b :2 d 16 14
:2 19 :2 14 24 :2 26 36 :3 34 :2 b 42
:2 45 4e :3 4c :2 b 4 f :2 11 f
6 :4 3 2 :2 3 a 3 :9 1
b0
4
0 :2 1 :4 3 :4 4
:5 5 2 :2 7 :2 1
:5 8 :8 9 :8 a :6 e
:8 f :5 e d 12
:3 13 :3 12 11 :3 b
:3 19 :3 1a :f 1b 1a
:4 19 18 1e :3 1f
:3 1e 1d :3 b :2 23
:4 24 :8 25 :1b 26 25
:5 27 :4 24 23 24
:3 2b :2 b :7 1
28e
4
:3 0 1 :3 0 2
:a 0 ab 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
:2 0 7 4 :3 0
5 :7 0 9 8
:3 0 7 :3 0 8
:3 0 6 :6 0 e
d :3 0 9 :3 0
a :3 0 10 12
0 ab 2 13
:2 0 e :2 0 d
a :3 0 16 :7 0
19 17 0 a9
0 b :6 0 e
:2 0 11 d :3 0
f 1b 1d :7 0
21 1e 1f a9
0 c :6 0 17
:2 0 15 d :3 0
13 23 25 :7 0
29 26 27 a9
0 f :6 0 10
:3 0 c :3 0 11
:3 0 19 2e 37
0 38 :3 0 12
:3 0 3 :3 0 1b
30 32 13 :3 0
14 :2 0 1f 35
36 :4 0 3a 3b
:5 0 2b 2f 0
22 0 39 :2 0
3d 24 47 15
:3 0 9 :3 0 16
:2 0 40 :2 0 42
26 44 28 43
42 :2 0 45 2a
:2 0 47 0 47
46 3d 45 :6 0
a7 1 :3 0 17
:3 0 2c f :3 0
18 :3 0 2e 4d
5d 0 5e :3 0
19 :3 0 12 :3 0
14 :2 0 5 :3 0
30 50 53 34
51 55 :3 0 10
:3 0 c :3 0 14
:2 0 39 59 5a
:3 0 56 5c 5b
:3 0 60 61 :5 0
4a 4e 0 3c
0 5f :2 0 63
3e 6d 15 :3 0
9 :3 0 16 :2 0
66 :2 0 68 40
6a 42 69 68
:2 0 6b 44 :2 0
6d 0 6d 6c
63 6b :6 0 a7
1 :3 0 1a :3 0
6 :3 0 1b :3 0
1c :3 0 71 72
0 46 1d :3 0
1b :3 0 75 76
1e :3 0 1f :3 0
78 79 48 7b
97 0 98 :3 0
1b :3 0 20 :3 0
7d 7e 0 1f
:3 0 14 :2 0 20
:3 0 80 82 0
4d 81 84 :3 0
1b :3 0 10 :3 0
86 87 0 c
:3 0 14 :2 0 52
8a 8b :3 0 85
8d 8c :2 0 1f
:3 0 17 :3 0 8f
90 0 f :3 0
14 :2 0 57 93
94 :3 0 8e 96
95 :3 0 1b :3 0
1c :3 0 99 9a
0 1 9b 5a
9f a0 9d :4 0
74 7c :3 0 9e
:4 0 a3 :2 0 a7
70 a1 :2 0 9
:3 0 16 :2 0 a5
:2 0 a7 5c aa
:3 0 aa 61 aa
a9 a7 a8 :6 0
ab :2 0 2 13
aa ae :3 0 ad
ab af :8 0
65
4
:3 0 1 3 1
7 1 b 3
6 a f 1
15 1 1c 1
1a 1 24 1
22 1 2a 1
2d 1 31 1
34 2 33 34
1 2c 1 3c
1 41 1 3e
1 44 1 49
1 4c 1 52
1 54 2 4f
54 1 58 2
57 58 1 4b
1 62 1 67
1 64 1 6a
1 73 2 77
7a 1 83 2
7f 83 1 89
2 88 89 1
92 2 91 92
1 9c 4 47
6d a2 a6 3
18 20 28
1
4
0
ae
0
1
14
3
7
0 1 1 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
2 0 1
7 1 0
15 1 0
22 1 0
1a 1
/

prompt
prompt Creating function ORA_ASPNET_UIR_GETUSERSINROLES
prompt ================================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_UIR_GetUsersInRoles wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
22
2 :e:
1FUNCTION:
1ORA_ASPNET_UIR_GETUSERSINROLES:
1APPLICATIONNAME_:
1NVARCHAR2:
1ROLENAME_:
1USERCURSOR:
1OUT:
1SYS_REFCURSOR:
1RETURN:
1INTEGER:
1OUTRESULT:
1M_APPID:
1RAW:
116:
1M_ROLEID:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWER:
1LOWEREDAPPLICATIONNAME:
1=:
1NO_DATA_FOUND:
1ORA_ASPNET_ROLES_PKG:
1ROLE_NOT_FOUND:
1ROLEID:
1ORA_ASPNET_ROLES:
1LOWEREDROLENAME:
1OPEN:
1U:
1USERNAME:
1ORA_ASPNET_USERS:
1ORA_ASPNET_USERSINROLES:
1UR:
1USERID:
10:
0

0
0
b4
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 96 :2 a0 b0 54 b4
:2 a0 2c 6a a3 a0 1c 81 b0
a3 a0 51 a5 1c 4d 81 b0
a3 a0 51 a5 1c 4d 81 b0
a0 ac :2 a0 b2 ee :2 a0 a5 b
a0 7e b4 2e ac e5 d0 b2
e9 b7 :4 a0 6b 65 b7 a6 9
a4 b1 11 4f a0 ac :2 a0 b2
ee :2 a0 7e a0 a5 b b4 2e
:2 a0 7e b4 2e a 10 ac e5
d0 b2 e9 b7 :4 a0 6b 65 b7
a6 9 a4 b1 11 4f :4 a0 6b
ac :2 a0 b9 :2 a0 b9 b2 ee :2 a0
6b a0 7e a0 6b b4 2e :2 a0
7e a0 6b b4 2e a 10 :2 a0
6b a0 7e b4 2e a 10 ac
:2 a0 6b de ac e5 d0 b2 :2 e9
dd a0 51 65 b7 a4 b1 11
68 4f 1d 17 b5
b4
2
0 3 7 23 1f 1e 2b 38
34 1b 40 4d 45 49 33 54
30 59 5d 61 65 7e 6d 71
79 6c 9c 89 69 8d 8e 96
97 88 ba a7 85 ab ac b4
b5 a6 c1 a3 c5 c9 cd ce
d5 d9 dd de e0 e4 e7 e8
ed ee f4 f8 f9 fe 100 104
108 10c 110 113 117 119 11a 11f
123 125 131 133 137 138 13c 140
141 148 14c 150 153 157 158 15a
15b 160 164 168 16b 16c 1 171
176 177 17d 181 182 187 189 18d
191 195 199 19c 1a0 1a2 1a3 1a8
1ac 1ae 1ba 1bc 1c0 1c4 1c8 1cc
1cf 1d0 1d4 1d8 1da 1de 1e2 1e4
1e5 1ec 1f0 1f4 1f7 1fb 1fe 202
205 206 20b 20f 213 216 21a 21d
21e 1 223 228 22c 230 233 237
23a 23b 1 240 245 246 24a 24e
251 253 254 25a 25e 25f 264 269
26d 271 274 278 27a 27e 280 28c
290 292 293 29c
b4
2
0 1 a 3 1c :3 3 11 :3 3
f 13 :2 3 2 1 8 :2 1 3
:3 d :2 3 b f e b 16 b
:2 3 c 10 f c 17 c 3
:2 9 1c 29 24 29 b 11 :2 b
25 :3 23 24 :4 2 1 8 4 b
:2 20 4 16 :2 3 2 :3 1 :2 9 15
a 4 a c 1e 1c 24 :2 1e
:2 1c 33 43 :3 41 :2 c 4 :4 2 1
8 4 b :2 20 4 16 :2 3 2
:3 1 2 7 a :2 c a b 1c
b 1f 37 1f 4 b c :2 e
17 15 :2 1a :2 15 25 30 2e :2 33
:2 2e :2 c 3e :2 40 50 :3 4e :2 c 4
f :2 11 f 6 :4 3 2 :2 3 a
3 :9 1
b4
4
0 :2 1 :4 3 :4 4
:5 5 2 :2 7 :2 1
:5 8 :8 9 :8 a :6 e
:8 f :5 e d 12
:5 13 :3 12 11 :3 b
:3 19 :3 1a :f 1b 1a
:4 19 18 1e :5 1f
:3 1e 1d :3 b :2 23
:4 24 :8 25 :1b 26 25
:5 27 :4 24 23 24
:3 2b :2 b :7 1
29e
4
:3 0 1 :3 0 2
:a 0 af 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
:2 0 7 4 :3 0
5 :7 0 9 8
:3 0 7 :3 0 8
:3 0 6 :6 0 e
d :3 0 9 :3 0
a :3 0 10 12
0 af 2 13
:2 0 e :2 0 d
a :3 0 16 :7 0
19 17 0 ad
0 b :6 0 e
:2 0 11 d :3 0
f 1b 1d :7 0
21 1e 1f ad
0 c :6 0 17
:2 0 15 d :3 0
13 23 25 :7 0
29 26 27 ad
0 f :6 0 10
:3 0 c :3 0 11
:3 0 19 2e 37
0 38 :3 0 12
:3 0 3 :3 0 1b
30 32 13 :3 0
14 :2 0 1f 35
36 :4 0 3a 3b
:5 0 2b 2f 0
22 0 39 :2 0
3d 24 49 15
:3 0 9 :3 0 16
:3 0 17 :3 0 40
41 0 42 :2 0
44 26 46 28
45 44 :2 0 47
2a :2 0 49 0
49 48 3d 47
:6 0 ab 1 :3 0
18 :3 0 2c f
:3 0 19 :3 0 2e
4f 5f 0 60
:3 0 1a :3 0 12
:3 0 14 :2 0 5
:3 0 30 52 55
34 53 57 :3 0
10 :3 0 c :3 0
14 :2 0 39 5b
5c :3 0 58 5e
5d :3 0 62 63
:5 0 4c 50 0
3c 0 61 :2 0
65 3e 71 15
:3 0 9 :3 0 16
:3 0 17 :3 0 68
69 0 6a :2 0
6c 40 6e 42
6d 6c :2 0 6f
44 :2 0 71 0
71 70 65 6f
:6 0 ab 1 :3 0
1b :3 0 6 :3 0
1c :3 0 1d :3 0
75 76 0 46
1e :3 0 1c :3 0
79 7a 1f :3 0
20 :3 0 7c 7d
48 7f 9b 0
9c :3 0 1c :3 0
21 :3 0 81 82
0 20 :3 0 14
:2 0 21 :3 0 84
86 0 4d 85
88 :3 0 f :3 0
20 :3 0 14 :2 0
18 :3 0 8b 8d
0 52 8c 8f
:3 0 89 91 90
:2 0 1c :3 0 10
:3 0 93 94 0
c :3 0 14 :2 0
57 97 98 :3 0
92 9a 99 :3 0
1c :3 0 1d :3 0
9d 9e 0 1
9f 5a a3 a4
a1 :4 0 78 80
:3 0 a2 :4 0 a7
:2 0 ab 74 a5
:2 0 9 :3 0 22
:2 0 a9 :2 0 ab
5c ae :3 0 ae
61 ae ad ab
ac :6 0 af :2 0
2 13 ae b2
:3 0 b1 af b3
:8 0
65
4
:3 0 1 3 1
7 1 b 3
6 a f 1
15 1 1c 1
1a 1 24 1
22 1 2a 1
2d 1 31 1
34 2 33 34
1 2c 1 3c
1 43 1 3e
1 46 1 4b
1 4e 1 54
1 56 2 51
56 1 5a 2
59 5a 1 4d
1 64 1 6b
1 66 1 6e
1 77 2 7b
7e 1 87 2
83 87 1 8e
2 8a 8e 1
96 2 95 96
1 a0 4 49
71 a6 a
/

prompt
prompt Creating function ORA_ASPNET_UIR_ISUSERINROLE
prompt =============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_UIR_IsUserInRole wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
21
2 :e:
1FUNCTION:
1ORA_ASPNET_UIR_ISUSERINROLE:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAME_:
1ROLENAME_:
1RETURN:
1INTEGER:
1OUTRESULT:
1M_APPID:
1RAW:
116:
1M_USERID:
1M_USERIDTMP:
1M_ROLEID:
1M_ROWCNT:
10:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWER:
1LOWEREDAPPLICATIONNAME:
1=:
1NO_DATA_FOUND:
12:
1USERID:
1ORA_ASPNET_USERS:
1LOWEREDUSERNAME:
1ROLEID:
1ORA_ASPNET_ROLES:
1LOWEREDROLENAME:
13:
1ORA_ASPNET_USERSINROLES:
11:
0

0
0
d9
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d b4
:2 a0 2c 6a a3 a0 1c 81 b0
a3 a0 51 a5 1c 4d 81 b0
a3 a0 51 a5 1c 4d 81 b0
a3 a0 51 a5 1c 4d 81 b0
a3 a0 51 a5 1c 4d 81 b0
a3 a0 1c 51 81 b0 a0 ac
:2 a0 b2 ee :2 a0 a5 b a0 7e
b4 2e ac e5 d0 b2 e9 b7
:2 a0 51 65 b7 a6 9 a4 b1
11 4f a0 ac :2 a0 b2 ee :2 a0
7e a0 a5 b b4 2e :2 a0 7e
b4 2e a 10 ac e5 d0 b2
e9 b7 :2 a0 51 65 b7 a6 9
a4 b1 11 4f a0 ac :2 a0 b2
ee :2 a0 7e a0 a5 b b4 2e
:2 a0 7e b4 2e a 10 ac e5
d0 b2 e9 b7 :2 a0 51 65 b7
a6 9 a4 b1 11 4f a0 ac
:2 a0 b2 ee :2 a0 7e b4 2e :2 a0
7e b4 2e a 10 ac e5 d0
b2 e9 b7 :2 a0 51 65 b7 a6
9 a4 b1 11 4f a0 51 65
b7 a4 b1 11 68 4f 1d 17
b5
d9
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 30
56 5a 5e 62 7b 6a 6e 76
69 99 86 66 8a 8b 93 94
85 b7 a4 82 a8 a9 b1 b2
a3 d5 c2 a0 c6 c7 cf d0
c1 f3 e0 be e4 e5 ed ee
df 10f fe 102 dc 10a fd 116
fa 11a 11e 122 123 12a 12e 132
133 135 139 13c 13d 142 143 149
14d 14e 153 155 159 15d 160 164
166 167 16c 170 172 17e 180 184
185 189 18d 18e 195 199 19d 1a0
1a4 1a5 1a7 1a8 1ad 1b1 1b5 1b8
1b9 1 1be 1c3 1c4 1ca 1ce 1cf
1d4 1d6 1da 1de 1e1 1e5 1e7 1e8
1ed 1f1 1f3 1ff 201 205 206 20a
20e 20f 216 21a 21e 221 225 226
228 229 22e 232 236 239 23a 1
23f 244 245 24b 24f 250 255 257
25b 25f 262 266 268 269 26e 272
274 280 282 286 287 28b 28f 290
297 29b 29f 2a2 2a3 2a8 2ac 2b0
2b3 2b4 1 2b9 2be 2bf 2c5 2c9
2ca 2cf 2d1 2d5 2d9 2dc 2e0 2e2
2e3 2e8 2ec 2ee 2fa 2fc 300 303
307 309 30d 30f 31b 31f 321 322
32b
d9
2
0 1 a 3 1c :3 3 16 :3 3
16 :2 3 2 1 8 :2 1 3 :3 d
:2 3 b f e b 16 b :2 3
c 10 f c 17 c :2 3 f
13 12 f 1a f :2 3 c 10
f c 17 c :2 3 :2 c 17 c
3 :2 9 1c 29 24 29 b 11
:2 b 25 :3 23 24 :4 2 1 8 4
b 4 16 :2 3 2 :3 1 :2 9 15
9 4 9 c 1e 1c 24 :2 1e
:2 1c 33 43 :3 41 :2 c 4 :4 2 1
8 4 b 4 16 :2 3 2 :3 1
:2 9 15 a 4 a c 1e 1c
24 :2 1e :2 1c 33 43 :3 41 :2 c 4
:4 2 1 8 4 b 4 16 :2 3
2 :3 1 :2 9 15 26 21 26 44
4d :3 4b 5a 63 :3 61 :2 44 21 :4 2
1 7 4 b 4 15 :3 2 :3 1
3 a 3 :9 1
d9
4
0 :2 1 :4 3 :4 4
:4 5 2 :2 7 :2 1
:5 8 :8 9 :8 a :8 b
:8 c :6 d :6 11 :8 12
:5 11 10 15 :3 16
:3 15 14 :3 e :3 1b
:3 1c :f 1d 1c :4 1b
1a 20 :3 21 :3 20
1f :3 e :3 26 :3 27
:f 28 27 :4 26 25
2b :3 2c :3 2b 2a
:3 e :17 32 31 35
:3 36 :3 35 34 :3 e
:3 3a :2 e :7 1
32d
4
:3 0 1 :3 0 2
:a 0 d4 1 :7 0
5 30 0 3
4 :3 0 3 :7 0
5 4 :3 0 9
:2 0 7 4 :3 0
5 :7 0 9 8
:3 0 4 :3 0 6
:7 0 d c :3 0
7 :3 0 8 :3 0
f 11 0 d4
2 12 :2 0 c
:2 0 d 8 :3 0
15 :7 0 18 16
0 d2 0 9
:6 0 c :2 0 11
b :3 0 f 1a
1c :7 0 20 1d
1e d2 0 a
:6 0 c :2 0 15
b :3 0 13 22
24 :7 0 28 25
26 d2 0 d
:6 0 c :2 0 19
b :3 0 17 2a
2c :7 0 30 2d
2e d2 0 e
:6 0 11 :2 0 1d
b :3 0 1b 32
34 :7 0 38 35
36 d2 0 f
:6 0 21 :2 0 1f
8 :3 0 3a :7 0
3e 3b 3c d2
0 10 :6 0 12
:3 0 a :3 0 13
:3 0 23 43 4c
0 4d :3 0 14
:3 0 3 :3 0 25
45 47 15 :3 0
16 :2 0 29 4a
4b :4 0 4f 50
:5 0 40 44 0
2c 0 4e :2 0
52 2e 5c 17
:3 0 7 :3 0 18
:2 0 55 :2 0 57
30 59 32 58
57 :2 0 5a 34
:2 0 5c 0 5c
5b 52 5a :6 0
d0 1 :3 0 19
:3 0 36 d :3 0
1a :3 0 38 62
72 0 73 :3 0
1b :3 0 14 :3 0
16 :2 0 5 :3 0
3a 65 68 3e
66 6a :3 0 12
:3 0 a :3 0 16
:2 0 43 6e 6f
:3 0 6b 71 70
:3 0 75 76 :5 0
5f 63 0 46
0 74 :2 0 78
48 82 17 :3 0
7 :3 0 18 :2 0
7b :2 0 7d 4a
7f 4c 7e 7d
:2 0 80 4e :2 0
82 0 82 81
78 80 :6 0 d0
1 :3 0 1c :3 0
50 f :3 0 1d
:3 0 52 88 98
0 99 :3 0 1e
:3 0 14 :3 0 16
:2 0 6 :3 0 54
8b 8e 58 8c
90 :3 0 12 :3 0
a :3 0 16 :2 0
5d 94 95 :3 0
91 97 96 :3 0
9b 9c :5 0 85
89 0 60 0
9a :2 0 9e 62
a8 17 :3 0 7
:3 0 1f :2 0 a1
:2 0 a3 64 a5
66 a4 a3 :2 0
a6
/

prompt
prompt Creating function ORA_ASPNET_UIR_REMUSERSFMROLES
prompt ================================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_UIR_RemUsersFmRoles wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
2e
2 :e:
1FUNCTION:
1ORA_ASPNET_UIR_REMUSERSFMROLES:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAMES_:
1ORA_ASPNET_ROLES_PKG:
1ASSOCARRAYVARCHAR2_T:
1USERNAMES_ARR_SIZE:
1INTEGER:
1ROLENAMES_:
1ROLENAMES_ARR_SIZE:
1USERNAME:
1OUT:
1ROLENAME:
1RETURN:
1OUTRESULT:
1M_APPID:
1RAW:
116:
1M_ROWCNT:
10:
1M_USERID:
1M_ROLEID:
1M_ROWSCHG:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWER:
1LOWEREDAPPLICATIONNAME:
1=:
1NO_DATA_FOUND:
1ROLE_NOT_FOUND:
1I:
11:
1LOOP:
1ROLEID:
1ORA_ASPNET_ROLES:
1LOWEREDROLENAME:
1USERID:
1ORA_ASPNET_USERS:
1LOWEREDUSERNAME:
1THIS_USER_NOT_FOUND:
1J:
1K:
1COUNT:
1ORA_ASPNET_USERSINROLES:
1THIS_USER_ALREADY_NOT_IN_ROLE:
0

0
0
1ed
2
0 a0 8d 8f a0 b0 3d 8f
:2 a0 6b b0 3d 8f a0 b0 3d
8f :2 a0 6b b0 3d 8f a0 b0
3d 96 :2 a0 b0 54 96 :2 a0 b0
54 b4 :2 a0 2c 6a a3 a0 1c
81 b0 a3 a0 51 a5 1c 4d
81 b0 a3 a0 1c 51 81 b0
a3 a0 51 a5 1c 4d 81 b0
a3 a0 51 a5 1c 4d 81 b0
a3 a0 1c 51 81 b0 a0 ac
:2 a0 b2 ee :2 a0 a5 b a0 7e
b4 2e ac e5 d0 b2 e9 b7
:4 a0 6b 65 b7 a6 9 a4 b1
11 4f 91 51 :2 a0 63 37 a0
51 d a0 ac :2 a0 b2 ee :3 a0
a5 b a5 b a0 7e b4 2e
:2 a0 7e b4 2e a 10 ac e5
d0 b2 e9 b7 :4 a0 a5 b d
:3 a0 6b 65 b7 a6 9 a4 b1
11 4f b7 a0 47 91 51 :2 a0
63 37 a0 ac :2 a0 b2 ee :2 a0
7e :2 a0 a5 b a5 b b4 2e
:2 a0 7e b4 2e a 10 ac e5
d0 b2 e9 b7 :4 a0 a5 b d
:3 a0 6b 65 b7 a6 9 a4 b1
11 4f b7 a0 47 a0 51 d
a0 4d d a0 4d d 91 51
:2 a0 63 37 a0 ac :2 a0 b2 ee
:2 a0 7e :2 a0 a5 b a5 b b4
2e :2 a0 7e b4 2e a 10 ac
e5 d0 b2 e9 91 51 :2 a0 63
37 a0 ac :2 a0 b2 ee :3 a0 a5
b a5 b a0 7e b4 2e :2 a0
7e b4 2e a 10 ac e5 d0
b2 e9 a0 d2 9f ac :2 a0 b2
ee :2 a0 7e b4 2e :2 a0 7e b4
2e a 10 ac e5 d0 b2 e9
b7 a0 4f b7 a6 9 a4 b1
11 4f a0 7e 51 b4 2e 5a
:3 a0 a5 b d :3 a0 a5 b d
:3 a0 6b 65 b7 19 3c b7 a0
47 b7 a0 47 a0 4d d a0
4d d a0 51 d 91 51 :2 a0
63 37 a0 ac :2 a0 b2 ee :2 a0
7e :2 a0 a5 b a5 b b4 2e
:2 a0 7e b4 2e a 10 ac e5
d0 b2 e9 91 51 :2 a0 63 37
a0 ac :2 a0 b2 ee :3 a0 a5 b
a5 b a0 7e b4 2e :2 a0 7e
b4 2e a 10 ac e5 d0 b2
e9 :3 a0 7e b4 2e :2 a0 7e b4
2e a 10 cd e9 b7 a0 47
b7 a0 47 a0 51 65 b7 a4
b1 11 68 4f 1d 17 b5
1ed
2
0 3 7 23 1f 1e 2b 3c
34 38 1b 33 44 51 4d 30
59 69 5e 62 66 4c 71 7e
7a 49 86 93 8b 8f 79 9a
ab a3 a7 76 b2 a2 b7 bb
bf c3 dc cb cf d7 9f f9
e3 e7 ea eb f3 f4 ca 115
104 108 c7 110 103 133 120 100
124 125 12d 12e 11f 151 13e 11c
142 143 14b 14c 13d 16d 15c 160
13a 168 15b 174 158 178 17c 180
181 188 18c 190 191 193 197 19a
19b 1a0 1a1 1a7 1ab 1ac 1b1 1b3
1b7 1bb 1bf 1c3 1c6 1ca 1cc 1cd
1d2 1d6 1d8 1e4 1e6 1ea 1ed 1f1
1f5 1f9 1fb 1ff 202 206 20a 20b
20f 213 214 21b 21f 223 227 228
22a 22b 22d 231 234 235 23a 23e
242 245 246 1 24b 250 251 257
25b 25c 261 263 267 26b 26f 273
274 276 27a 27e 282 286 289 28d
28f 290 295 299 29b 2a7 2a9 2ab
2af 2b6 2ba 2bd 2c1 2c5 2c9 2cb
2cf 2d0 2d4 2d8 2d9 2e0 2e4 2e8
2eb 2ef 2f3 2f4 2f6 2f7 2f9 2fa
2ff 303 307 30a 30b 1 310 315
316 31c 320 321 326 328 32c 330
334 338 339 33b 33f 343 347 34b
34e 352 354 355 35a 35e 360 36c
36e 370 374 37b 37f 382 386 38a
38b 38f 393 394 398 39c 39f 3a3
3a7 3ab 3ad 3b1 3b2 3b6 3ba 3bb
3c2 3c6 3ca 3cd 3d1 3d5 3d6 3d8
3d9 3db 3dc 3e1 3e5 3e9 3ec 3ed
1 3f2 3f7 3f8 3fe 402 403 408
40c 40f 413 417 41b 41d 421 422
426 42a 42b 432 436 43a 43e 43f
441 442 444 448 44b 44c 451 455
459 45c 45d 1 462 467 468 46e
472 473 478 47c 480 483 484 488
48c 48d 494 498 49c 49f 4a0 4a5
4a9 4ad 4b0 4b1 1 4b6 4bb 4bc
4c2 4c6 4c7 4cc 4ce 4d2 4d4 4d6
4d7 4dc 4e0 4e2 4ee 4f0 4f4 4f7
4fa 4fb 500 503 507 50b 50f 510
512 516 51a 51e 522 523 525 529
52d 531 535 538 53c 53e 542 545
547 54b 552 554 558 55f 563 564
568 56c 56d 571 575 578 57c 580
583 587 58b 58f 591 595 596 59a
59e 59f 5a6 5aa 5ae 5b1 5b5 5b9
5ba 5bc 5bd 5bf 5c0 5c5 5c9 5cd
5d0 5d1 1 5d6 5db 5dc 5e2 5e6
5e7 5ec 5f0 5f3 5f7 5fb 5ff 601
605 606 60a 60e 60f 616 61a 61e
622 623 625 626 628 62c 62f 630
635 639 63d 640 641 1 646 64b
64c 652 656 657 65c 660 664 668
66b 66c 671 675 679
/

prompt
prompt Creating function ORA_ASPNET_USERS_DELETEUSER
prompt =============================================
prompt
CREATE OR REPLACE FUNCTION DUKEPU.ora_aspnet_Users_DeleteUser wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
8
9200000
1
4
0
3b
2 :e:
1FUNCTION:
1ORA_ASPNET_USERS_DELETEUSER:
1APPLICATIONNAME_:
1NVARCHAR2:
1USERNAME_:
1TABLESTODELETEFROM:
1INTEGER:
1NUMTABLESDELETEDFROM:
1OUT:
1RETURN:
1TABLE_DOES_NOT_EXIST:
1PRAGMA:
1EXCEPTION_INIT:
1-:
10942:
1M_USERID:
1RAW:
116:
1M_NUMTABLESDELETEDFROM:
10:
1M_CURSOR:
1NUMBER:
1M_DELETESTRING:
1256:
1M_ROWSDELETED:
1U:
1USERID:
1ORA_ASPNET_APPLICATIONS:
1A:
1ORA_ASPNET_USERS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1APPLICATIONID:
1LOWEREDUSERNAME:
1NO_DATA_FOUND:
1DBMS_SQL:
1OPEN_CURSOR:
1BITAND:
11:
1!=:
1DELETE FROM ora_aspnet_Membership WHERE UserId = ::x:
1PARSE:
1NATIVE:
1BIND_VARIABLE:
1::x:
1EXECUTE:
1>:
1+:
12:
1DELETE FROM ora_aspnet_UsersInRoles WHERE UserId = ::x:
14:
1DELETE FROM ora_aspnet_Profile WHERE UserId = ::x:
18:
1DELETE FROM ora_aspnet_PersonaliznPerUser WHERE UserId = ::x:
1DELETE FROM ora_aspnet_Users WHERE UserId = ::x:
1CLOSE_CURSOR:
1OTHERS:
1RAISE:
0

0
0
219
2
0 a0 8d 8f a0 b0 3d 8f
a0 b0 3d 8f a0 b0 3d 90
:2 a0 b0 3f b4 :2 a0 2c 6a 8b
b0 2a :3 a0 7e 51 b4 2e b4
5d a3 a0 51 a5 1c 4d 81
b0 a3 a0 1c 51 81 b0 a3
a0 1c 51 81 b0 a3 a0 51
a5 1c 4d 81 b0 a3 a0 1c
51 81 b0 :2 a0 6b ac :3 a0 b9
:2 a0 b9 b2 ee :2 a0 6b a0 7e
a0 a5 b b4 2e :2 a0 6b a0
7e a0 6b b4 2e a 10 :2 a0
6b a0 7e a0 a5 b b4 2e
a 10 ac e5 d0 b2 e9 b7
:2 a0 51 65 b7 a6 9 a4 b1
11 4f :3 a0 6b d :2 a0 51 a5
b 7e 51 b4 2e a0 6e d
:2 a0 6b :4 a0 6b a5 57 :2 a0 6b
a0 6e a0 a5 57 :3 a0 6b a0
a5 b d b7 a0 4f b7 a6
9 a4 b1 11 4f a0 7e 51
b4 2e :2 a0 7e 51 b4 2e d
b7 19 3c b7 19 3c :2 a0 51
a5 b 7e 51 b4 2e a0 6e
d :2 a0 6b :4 a0 6b a5 57 :2 a0
6b a0 6e a0 a5 57 :3 a0 6b
a0 a5 b d b7 a0 4f b7
a6 9 a4 b1 11 4f a0 7e
51 b4 2e :2 a0 7e 51 b4 2e
d b7 19 3c b7 19 3c :2 a0
51 a5 b 7e 51 b4 2e a0
6e d :2 a0 6b :4 a0 6b a5 57
:2 a0 6b a0 6e a0 a5 57 :3 a0
6b a0 a5 b d b7 a0 4f
b7 a6 9 a4 b1 11 4f a0
7e 51 b4 2e :2 a0 7e 51 b4
2e d b7 19 3c b7 19 3c
:2 a0 51 a5 b 7e 51 b4 2e
a0 6e d :2 a0 6b :4 a0 6b a5
57 :2 a0 6b a0 6e a0 a5 57
:3 a0 6b a0 a5 b d b7 a0
4f b7 a6 9 a4 b1 11 4f
a0 7e 51 b4 2e :2 a0 7e 51
b4 2e d b7 19 3c b7 19
3c :2 a0 51 a5 b 7e 51 b4
2e :2 a0 51 a5 b 7e 51 b4
2e a 10 :2 a0 51 a5 b 7e
51 b4 2e a 10 :2 a0 51 a5
b 7e 51 b4 2e a 10 a0
6e d :2 a0 6b :4 a0 6b a5 57
:2 a0 6b a0 6e a0 a5 57 :3 a0
6b a0 a5 b d b7 a0 4f
b7 a6 9 a4 b1 11 4f a0
7e 51 b4 2e :2 a0 7e 51 b4
2e d b7 19 3c b7 19 3c
:2 a0 d :2 a0 6b a0 a5 57 a0
51 65 b7 a0 53 :2 a0 6b a0
a5 57 a0 62 b7 a6 9 a4
a0 b1 11 68 4f 1d 17 b5
219
2
0 3 7 23 1f 1e 2b 38
34 1b 40 49 45 33 51 62
5a 5e 30 69 59 6e 72 76
7a 7e 56 85 88 8c 90 94
97 9a 9b a0 a1 be a8 ac
af b0 b8 b9 a7 da c9 cd
a4 d5 c8 f6 e5 e9 c5 f1
e4 114 101 e1 105 106 10e 10f
100 130 11f 123 fd 12b 11e 137
13b 11b 13f 140 144 148 14c 14e
152 156 158 159 160 164 168 16b
16f 172 176 177 179 17a 17f 183
187 18a 18e 191 195 198 199 1
19e 1a3 1a7 1ab 1ae 1b2 1b5 1b9
1ba 1bc 1bd 1 1c2 1c7 1c8 1ce
1d2 1d3 1d8 1da 1de 1e2 1e5 1e9
1eb 1ec 1f1 1f5 1f7 203 205 209
20d 211 214 218 21c 220 223 224
226 229 22c 22d 232 236 23b 23f
243 247 24a 24e 252 256 25a 25d
25e 263 267 26b 26e 272 277 27b
27c 281 285 289 28d 290 294 295
297 29b 29d 2a1 2a3 2a5 2a6 2ab
2af 2b1 2bd 2bf 2c3 2c6 2c9 2ca
2cf 2d3 2d7 2da 2dd 2de 2e3 2e7
2e9 2ed 2f0 2f2 2f6 2f9 2fd 301
304 305 307 30a 30d 30e 313 317
31c 320 324 328 32b 32f 333 337
33b 33e 33f 344 348 34c 34f 353
358 35c 35d 362 366 36a 36e 371
375 376 378 37c 37e 382 384 386
387 38c 390 392 39e 3a0 3a4 3a7
3aa 3ab 3b0 3b4 3b8 3bb 3be 3bf
3c4 3c8 3ca 3ce 3d1 3d3 3d7 3da
3de 3e2 3e5 3e6 3e8 3eb 3ee 3ef
3f4 3f8 3fd 401 405 409 40c 410
414 418 41c 41f 420 425 429 42d
430 434 439 43d 43e 443 447 44b
44f 452 456 457 459 45d 45f 463
465 467 468 46d 471 473 47f 481
485 488 48b 48c 491 495 499 49c
49f 4a0 4a5 4a9 4ab 4af 4b2 4b4
4b8 4bb 4bf 4c3 4c6 4c7 4c9 4cc
4cf 4d0 4d5 4d9 4de 4e2 4e6 4ea
4ed 4f1 4f5 4f9 4fd 500 501 506
50a 50e 511 515 51a 51e 51f 524
528 52c 530 533 537 5
/

prompt
prompt Creating function SAVE_AR
prompt =========================
prompt
create or replace function dukepu.SAVE_AR(
                                     v_job_number       varchar2,
                                     v_name             nvarchar2,
                                     v_dept             nvarchar2,
                                     v_start_date varchar2,
                                     v_end_date   varchar2,
                                     v_tabulation_time varchar2,
                                     v_fingerPrint_date varchar2,
                                     v_fpt_first_time   varchar2,
                                     v_fpt_end_time     varchar2,
                                     v_sheet_name       nvarchar2,
                                     v_random_str       varchar2
                                    ) return int is
           v_Count INT:=0;
begin

                SELECT COUNT(1) INTO v_Count
                FROM Attendance_Record
                WHERE  JOB_NUMBER = v_job_number
                AND FingerPrint_Date = TO_DATE(v_fingerPrint_date,'yyyy-MM-dd');

                IF(v_Count = 0)
                THEN
                  INSERT /*+ append */ INTO Attendance_Record(
                         SEQ,
                         Start_Date,
                         End_Date,
                         Tabulation_Time,
                         FingerPrint_Date,
                         Job_Number,
                         Name,
                         Dept,
                         Sheet_Name,
                         FPT_First_Time,
                         FPT_Last_Time,
                        Random_Str
                  )
                  VALUES(
                        s_attendancerecord.Nextval,
                        TO_DATE(v_start_date,'yyyy-MM-dd'),
                        TO_DATE(v_end_date ,'yyyy-MM-dd'),
                        TO_DATE(v_tabulation_time,'yyyy-MM-dd'),
                         TO_DATE(v_fingerPrint_date,'yyyy-MM-dd'),
                         v_job_number,
                         v_name,
                         v_dept,
                         v_sheet_name,
                         TO_DATE(v_fpt_first_time,'yyyy-MM-dd HH24:MI'),
                         TO_DATE(v_fpt_end_time,'yyyy-MM-dd HH24:MI'),
                         v_random_str
                  );

                    RETURN v_count;
                END IF;


                UPDATE Attendance_Record
                    SET Start_Date =TO_DATE(v_start_date,'yyyy-MM-dd'),
                        END_DATE = TO_DATE(v_end_date,'yyyy-MM-dd'),
                        TABULATION_TIME =  TO_DATE(v_tabulation_time,'yyyy-MM-dd'),
                        DEPT =v_dept,
                        FPT_First_TIME = TO_DATE(v_fpt_first_time,'yyyy-MM-dd HH24:MI'),
                        FPT_LAST_TIME = TO_DATE(v_fpt_end_time,'yyyy-MM-dd HH24:MI'),
                        COME_LATE_NUM = 0,
                        LEAVE_EARLY_NUM = 0,
                         Sheet_Name = v_sheet_name,
                          Random_Str = v_random_str
                      WHERE JOB_NUMBER = v_job_number
                      AND NAME = v_name
                      AND FingerPrint_Date = TO_DATE(v_fingerPrint_date,'yyyy-MM-dd');

                      return v_count;

end SAVE_aR;
/

prompt
prompt Creating function SAVE_AR_FUNC
prompt ==============================
prompt
create or replace function dukepu.SAVE_AR_Func(
                                     v_job_number       varchar2,
                                     v_name             nvarchar2,
                                     v_dept             nvarchar2,
                                     v_start_date varchar2,
                                     v_end_date   varchar2,
                                     v_tabulation_time varchar2,
                                     v_fingerPrint_date varchar2,
                                     v_fpt_first_time   varchar2,
                                     v_fpt_end_time     varchar2,
                                     v_file_path        nvarchar2,
                                     v_sheet_name       nvarchar2,
                                     v_random_str       varchar2
                                    ) return int as
          -- v_Count INT:=0;
begin

                 ---在 导入时  以及 删除了 该 考勤机 对应的该月记录。
                /*
                SELECT COUNT(1) INTO v_Count
                FROM Attendance_Record
                WHERE  JOB_NUMBER = v_job_number
                AND FingerPrint_Date = TO_DATE(v_fingerPrint_date,'yyyy-MM-dd');

                IF(v_Count = 0)
                THEN
                  INSERT /*+ append */ /*INTO Attendance_Record(
                         SEQ,
                         Start_Date,
                         End_Date,
                         Tabulation_Time,
                         FingerPrint_Date,
                         Job_Number,
                         Name,
                         Dept,
                         Sheet_Name,
                         FPT_First_Time,
                         FPT_Last_Time,
                        Random_Str
                  )
                  VALUES(
                        s_attendancerecord.Nextval,
                        TO_DATE(v_start_date,'yyyy-MM-dd'),
                        TO_DATE(v_end_date ,'yyyy-MM-dd'),
                        TO_DATE(v_tabulation_time,'yyyy-MM-dd'),
                         TO_DATE(v_fingerPrint_date,'yyyy-MM-dd'),
                         v_job_number,
                         v_name,
                         v_dept,
                         v_sheet_name,
                         TO_DATE(v_fpt_first_time,'yyyy-MM-dd HH24:MI'),
                         TO_DATE(v_fpt_end_time,'yyyy-MM-dd HH24:MI'),
                         v_random_str
                  );

                    RETURN 1;
                END IF;


                UPDATE Attendance_Record
                    SET Start_Date =TO_DATE(v_start_date,'yyyy-MM-dd'),
                        END_DATE = TO_DATE(v_end_date,'yyyy-MM-dd'),
                        TABULATION_TIME =  TO_DATE(v_tabulation_time,'yyyy-MM-dd'),
                        DEPT =v_dept,
                        FPT_First_TIME = TO_DATE(v_fpt_first_time,'yyyy-MM-dd HH24:MI'),
                        FPT_LAST_TIME = TO_DATE(v_fpt_end_time,'yyyy-MM-dd HH24:MI'),
                        COME_LATE_NUM = 0,
                        LEAVE_EARLY_NUM = 0,
                         Sheet_Name = v_sheet_name,
                          Random_Str = v_random_str
                      WHERE JOB_NUMBER = v_job_number
                      AND NAME = v_name
                      AND FingerPrint_Date = TO_DATE(v_fingerPrint_date,'yyyy-MM-dd');
                      RETURN 1;
                      */

                       INSERT  INTO Attendance_Record(
                         SEQ,
                         Start_Date,
                         End_Date,
                         Tabulation_Time,
                         FingerPrint_Date,
                         Job_Number,
                         Name,
                         Dept,
                         file_path,
                         Sheet_Name,
                         FPT_First_Time,
                         FPT_Last_Time,
                        Random_Str
                  )
                  VALUES(
                        s_attendancerecord.Nextval,
                        TO_DATE(v_start_date,'yyyy-MM-dd'),
                        TO_DATE(v_end_date ,'yyyy-MM-dd'),
                        TO_DATE(v_tabulation_time,'yyyy-MM-dd'),
                         TO_DATE(v_fingerPrint_date,'yyyy-MM-dd'),
                         v_job_number,
                         v_name,
                         v_dept,
                         v_file_path,
                         v_sheet_name,
                         TO_DATE(v_fpt_first_time,'yyyy-MM-dd HH24:MI'),
                         TO_DATE(v_fpt_end_time,'yyyy-MM-dd HH24:MI'),
                         v_random_str
                  );

                  return 1;
EXCEPTION
         WHEN DUP_VAL_ON_INDEX THEN
              RETURN 0;
end SAVE_aR_Func;
/

prompt
prompt Creating procedure ANALYZE_AR
prompt =============================
prompt
create or replace procedure dukepu.Analyze_AR(v_Year_And_Month_Str VARCHAR2,v_Random_Str VARCHAR2,v_Flag out INTEGER) AS
       ---迟到,早退暂时改为统计为

     v_Count INT:=0;

     type t_Cursor is ref cursor;
     v_AR_Cur t_Cursor;

     v_SEQ    Attendance_Record.Seq%type;                 --序号.
     v_Job_Number Attendance_Record.Job_Number%type;                           --工号.
     v_Fpt_F_T Attendance_Record.Fpt_First_Time%type;                          --第一次刷卡时间
     v_FPT_L_T Attendance_Record.Fpt_Last_Time%type;                           --最后一次刷卡时间
     v_FP_D    Attendance_Record.Fingerprint_Date%type;                        ---刷卡日期.

     v_Dept    Work_Schedule.Dept%TYPE;             ---部门;



     v_PeaceTime_AM_ON_Duty_Time  DATE;   ---暂存早上时间 8:00;
     v_PeaceTime_AM_OFF_Duty_Time  DATE;  ---暂存早上下班时间 12:20
     v_PeaceTime_PM_ON_Duty_Time  DATE;   ---暂存下午上班时间 13:30;
     v_PeaceTime_PM_OFF_Duty_Time  DATE;     ---用于暂存下班时间 17:00。
     v_PeaceTime_AM_Back__D_T DATE;      ---用于暂存 请造假，12:40归来，计算饭补。


     v_Come_num       INTEGER;          ---出勤统计.
     v_Delay_Time     NUMBER;   ---暂存延时数值： 2.5小时。
     v_Come_Late_Num      NUMBER;   --暂存迟到数值：
     v_LEAVE_Early_Num     NUMBER;   --暂存早退数值; :0.5小时。
     v_meal_subsidy Attendance_Record.Meal_Subsidy%TYPE;      ---暂存餐补



     v_LEAVE_START_TIME  AsK_FOR_Leave.Leave_Start_Time%TYPE;                  ---请假起始时间
     v_LEAVE_END_TIME ASK_FOR_LEAVE.Leave_End_Time%TYPE;                       ---请假终止时间。
     V_ASK_FOR_LEAVE_TYPE Attendance_Record.Ask_For_Leave_Type%type;        ---请假类型:  早假,下午假,全天假.
     V_ASK_FOR_LEAVE_Days    Attendance_Record.Ask_For_Leave_Days%type;        ---请假天数： 1，0.5

     v_Subject varchar2(20):='Analyze_AR';


begin

     ----统计未刷卡.无论休息日还是上班日.
     UPDATE Attendance_Record AR
     SET AR.Not_Finger_Print = (
                                    CASE
                                      WHEN (AR.FPT_FIRST_TIME IS NULL AND AR.FPT_LAST_TIME IS NOT NULL) THEN
                                           1
                                      WHEN (AR.FPT_FIRST_TIME IS NOT NULL AND AR.FPT_LAST_TIME IS  NULL) THEN
                                           1
                                       ELSE
                                           NULL
                                 END
                              )
     WHERE TRUNC(AR.FingerPrint_Date,'MM') = TO_DATE(v_Year_And_Month_Str,'YYYY-MM');

     ---年月 字符串.
     OPEN v_AR_Cur
     FOR
     SELECT
            SEQ,
            job_number,
            DEPT,
            FPT_First_Time,
            FPT_Last_Time,
            FINGERPrint_Date
     FROM Attendance_Record AR
     WHERE TRUNC(fingerprint_date,'MM') = TO_DATE(v_Year_And_Month_Str,'YYYY-MM')
     ORDER BY AR.fingerprint_date ASC,
           AR.DEPT ASC;

     LOOP
         FETCH v_AR_Cur INTO
                             v_SEQ,
                             v_job_Number,
                             v_Dept,
                             v_Fpt_F_T,
                             v_FPT_L_T,
                             v_FP_D;
         EXIT WHEN v_AR_Cur%NOTFOUND;

         ----先判断有没有对应部门的 ----工作计划生成.
                  ---先判断是否休息日。
         SELECT COUNT(1) INTO v_Count
         FROM Work_Schedule WS
         WHERE NVL(WS.dept,'NULL') = v_Dept
         AND WS.work_and_rest_date = v_FP_D;
         IF(v_Count=0) THEN  ---休息。
            v_Flag:=0;
              ---保存信息到MESSAGE中.
              ---保存错误信息.
            INSERT INTO MSG(
                   PROMPT,
                   FLAG,
                   OPERATE_TIME,
                   SUBJECT,
                   RANDOM_STR
            )
            VALUES(
                   v_FP_D || '  '||v_Dept||'  :未生成工作计划!',
                   '0',
                   SYSDATE,
                   v_Subject,
                   v_Random_Str
            );
            return;
         END IF;


         v_PeaceTime_AM_ON_Duty_Time :=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')||' 08:00:00','YYYY-MM-DD HH24:MI:SS');
         v_PeaceTime_AM_OFF_Duty_Time:=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')||' 12:00:00','YYYY-MM-DD HH24:MI:SS');  ---下班时间计算为12:00
         v_PeaceTime_AM_Back__D_T :=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')||' 12:40:00','YYYY-MM-DD HH24:MI:SS');
         v_PeaceTime_PM_ON_Duty_Time:=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')||' 13:30:00','YYYY-MM-DD HH24:MI:SS');
         v_PeaceTime_PM_OFF_Duty_Time:= TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')||' 17:00:00','YYYY-MM-DD HH24:MI:SS');

         ----------------计算出勤数--------  休息日不统计出勤,请假日不统计考勤------------
         ---请的全天假,当天不计考勤.
         SELECT COUNT(1) INTO v_Count
         FROM ASK_For_LEAVE A_F_L
         WHERE A_F_L.Job_Number = v_job_Number
         AND ( v_PeaceTime_PM_OFF_Duty_Time >= A_F_L.Leave_Start_Time
               AND v_PeaceTime_PM_OFF_Duty_Time <=A_F_L.Leave_End_Time
              );
         IF(v_Count=1) THEN
               v_Come_Num:=0;
               GOTO END_COME_NUM;
         END IF;
         ---请的上午假.


         ---先判断是否休息日。
         SELECT COUNT(1) INTO v_Count
         FROM Work_Schedule WS
         WHERE WS.dept = v_Dept
         AND WS.work_and_rest_date = v_FP_D
         AND WS.Work_Or_Rest = 1;
         IF(v_Count=1) THEN  ---工作
              IF(v_Fpt_F_T IS NULL AND v_FPT_L_T IS NULL) THEN
                 v_Come_Num:=0;
                 GOTO END_COME_NUM;
              END IF;
              v_Come_num:=1;
              GOTO END_COME_NUM;
         END IF;
         IF(v_Count=0) THEN  ---休息
              v_Come_Num:=0;
              GOTO END_COME_NUM;
         END IF;
         -----------------计算出勤数结束.------------------
         <<END_COME_NUM>>
         NULL;
         -------------------------------------延时--- 统计---------------------------------------
         ---未打下班卡，不计延时。
         IF v_FPT_L_T IS NULL THEN
            v_Delay_Time:=NULL;
            GOTO END_Delay_Time;
         END IF;
         ---判断是否请假中。
         SELECT COUNT(1) INTO v_Count
         FROM ASK_For_LEAVE A_F_L
         WHERE A_F_L.Job_Number = v_job_Number
         AND ( v_FPT_L_T >= A_F_L.Leave_Start_Time
               AND v_FPT_L_T <=A_F_L.Leave_End_Time
              );
         ---请假中.
         IF(v_Count=1) THEN
             v_Delay_Time:=NULL;
             GOTO END_Delay_Time;
         END IF;
         ---工作日，或自行加班日---
         IF(v_FPT_L_T<=v_PeaceTime_PM_OFF_Duty_Time) THEN   ---下班时间比17:00早。
            v_Delay_Time:=NULL;                     ---不计算延时。
         ELSE                                     -- 超出17:00计为延时
            ---延时
            v_Delay_Time:=TRUNC((v_FPT_L_T - v_PeaceTime_PM_OFF_Duty_Time)*24/0.5)*0.5;
         END IF;
         ----------------------------------------延时结束----------------------------------------------
         <<END_Delay_Time>>
         NULL;
         --- --------------------------------------计算迟到   --休假计算迟到-----------------------------------
         IF(v_Fpt_F_T IS NULL) THEN                           ---未打上班卡。
            v_Come_Late_Num:=NULL;
            GOTO END_COME_LATE;
         END IF;

         ---工作日。
         --判断当天有没有请假。
         SELECT COUNT(1) INTO v_Count
         FROM ASK_For_LEAVE A_F_L
         WHERE A_F_L.Job_Number = v_job_Number
         AND  v_FP_D BETWEEN TRUNC(A_F_L.Leave_Start_Time) AND TRUNC(A_F_L.Leave_End_Time);
         IF(v_Count =0) THEN   ---正常班: 8:00之前签到。
            IF(v_Fpt_F_T <=v_PeaceTime_AM_ON_Duty_Time) THEN
                v_Come_Late_Num:=NULL;
                GOTO END_COME_LATE;
            END IF;
             ---迟到。
            IF(v_Fpt_F_T >v_PeaceTime_AM_ON_Duty_Time) THEN
                --v_Come_Late_Num:=ROUND((v_Fpt_F_T -v_PeaceTime_AM_ON_Duty_Time)*24*60);
                v_Come_Late_Num:=1;
                GOTO END_COME_LATE;
            END IF;
         END IF;
         ---已请假。
         SELECT
                  A_F_L.LEAVE_START_TIME,
                  A_F_L.Leave_End_Time
                INTO v_LEAVE_START_TIME,
                     v_LEAVE_END_TIME
                 FROM ASK_For_LEAVE A_F_L
                 WHERE A_F_L.Job_Number = v_job_Number
                 AND v_FP_D BETWEEN TRUNC(A_F_L.Leave_Start_Time) AND TRUNC(A_F_L.Leave_End_Time);

          IF(v_LEAVE_START_TIME <= v_PeaceTime_AM_ON_Duty_Time AND v_LEAVE_END_TIME <=v_PeaceTime_PM_ON_Duty_TIME) THEN  ---请了早上假。
             ---------假期中。第一次刷卡时间<=13:30-------------
             IF(v_Fpt_F_T <= v_PeaceTime_PM_ON_Duty_TIME) THEN
                  v_Come_Late_Num:=NULL;
                  GOTO END_COME_LATE;
             END IF;
             ---假期满后。第一次刷卡时间>13:30
             --v_Come_Late_Num:= ROUND((v_Fpt_F_T - v_PeaceTime_PM_ON_Duty_TIME) * 24 * 60);
             v_Come_Late_Num:=1;
             GOTO END_COME_LATE;
          END IF;
          ---请的是下午假期。
          IF(v_LEAVE_START_TIME >= v_PeaceTime_AM_OFF_Duty_Time) THEN      ---请的是下午假。
               IF(v_Fpt_F_T <= v_PeaceTime_AM_ON_Duty_TIME) THEN   ---正常出勤。
                  v_Come_Late_Num:=NULL;
                  GOTO END_COME_LATE;
               END IF;
             ----迟到. 第一次刷卡时间>08:00:00
             --v_Come_Late_Num:= ROUND((v_Fpt_F_T - v_PeaceTime_AM_ON_Duty_TIME) * 24 * 60);
             v_Come_Late_Num:=1;
          END IF;
        --------------------------------------------计算迟到完毕 ---------------------------------------
        <<END_COME_LATE>>
        NULL;
        --------------------------------------------计算早退-----  休假日不计早退-------------------------
        IF(v_Fpt_L_T IS NULL) THEN
            v_LEAVE_Early_Num:=NULL;                          ---未打下班卡。
            GOTO END_LEAVE_EARLY;
         END IF;
         ---先判断是否休息日。
         SELECT COUNT(1) INTO v_Count
         FROM Work_Schedule WS
         WHERE WS.dept = v_Dept
         AND WS.work_and_rest_date = v_FP_D
         AND WS.Work_Or_Rest = 1;
         ----休息日----------------
         IF(v_Count=0) THEN
            v_LEAVE_Early_Num:=NULL;
            GOTO END_LEAVE_EARLY;
         END IF;
         ---工作日-----------------------
         --判断当天有没有请假。
         SELECT COUNT(1) INTO v_Count
         FROM ASK_For_LEAVE A_F_L
         WHERE A_F_L.Job_Number = v_job_Number
         AND v_FP_D BETWEEN TRUNC(A_F_L.Leave_Start_Time) AND TRUNC(A_F_L.Leave_End_Time);
         ---正常班: 17:00之后下班。-------------
         IF(v_Count =0) THEN
            ---正常下班。
            IF(v_Fpt_L_T >=v_PeaceTime_PM_OFF_Duty_Time) THEN
                v_LEAVE_Early_Num:=NULL;
                GOTO END_LEAVE_EARLY;
            END IF;
             ---早退
            IF(v_Fpt_L_T <v_PeaceTime_PM_OFF_Duty_Time) THEN
                --v_LEAVE_Early_Num:=ROUND((v_PeaceTime_PM_OFF_Duty_Time -v_Fpt_L_T)*24*60);
                v_LEAVE_Early_Num:=1;
                GOTO END_LEAVE_EARLY;
            END IF;
         END IF;
         ---已请假。-------------
         SELECT
                  A_F_L.LEAVE_START_TIME,
                  A_F_L.Leave_End_Time
                INTO v_LEAVE_START_TIME,
                     v_LEAVE_END_TIME
                 FROM ASK_For_LEAVE A_F_L
                 WHERE A_F_L.Job_Number = v_job_Number
                 AND v_FP_D BETWEEN TRUNC(A_F_L.Leave_Start_Time) AND TRUNC(A_F_L.Leave_End_Time);
          -----上午假-----------  起始时间<8:00  终止时间< 13:30
         IF(v_LEAVE_START_TIME <= v_PeaceTime_AM_ON_Duty_Time AND v_LEAVE_END_TIME <=v_PeaceTime_PM_ON_Duty_TIME) THEN  ---请了早上假。
             ---下午下班
             IF(v_Fpt_L_T > v_PeaceTime_PM_OFF_Duty_TIME) THEN    ---下午正常班。
                  v_LEAVE_Early_Num:=NULL;
                  GOTO END_LEAVE_EARLY;
             END IF;
             ---早退-------
             --v_LEAVE_Early_Num:= ROUND((v_PeaceTime_PM_OFF_Duty_TIME - v_Fpt_L_T ) * 24 * 60);
             v_LEAVE_Early_Num:= 1;
             GOTO END_LEAVE_EARLY;
         END IF;
          ---下午假-----起始时间>=12:20 --------
         IF(v_LEAVE_START_TIME >= v_PeaceTime_AM_OFF_Duty_Time) THEN      ---请的是下午假。
               IF(v_Fpt_L_T >= v_PeaceTime_AM_OFF_Duty_TIME) THEN   --- 最后一次刷卡时间>=12:20
                  v_LEAVE_Early_Num:=NULL;
                  GOTO END_LEAVE_EARLY;
               END IF;
         END IF;
         ---最后一次刷卡时间<12:20  ---早退----
         --v_LEAVE_Early_Num:= ROUND((v_PeaceTime_AM_OFF_Duty_TIME - v_Fpt_L_T ) * 24 * 60);
         v_LEAVE_Early_Num:= 1;
        ------------------------------------计算早退完毕----------------------------------------
        <<END_LEAVE_EARLY>>
        NULL;
        ----------------------------计算餐补--休假日计算餐补-----------------------------------------------
        IF(v_Fpt_F_T IS NULL OR v_FPT_L_T IS NULL) THEN
            v_meal_subsidy:=0;
            GOTO END_dinner_subsidy;
        END IF;
       ---没有请假
          ---判断是否请假中。
       SELECT COUNT(1) INTO v_Count
       FROM ASK_For_LEAVE A_F_L
       WHERE A_F_L.Job_Number = v_job_Number
       AND v_FP_D BETWEEN TRUNC(A_F_L.Leave_Start_Time) AND TRUNC(A_F_L.Leave_End_Time);
      ---正常班，或自行加班。
      IF(v_Count =0) THEN
          ---12:20前刷上班卡,解决午饭餐补。
          ---4小时半，就有餐补
          IF (v_Fpt_F_T <v_PeaceTime_AM_OFF_Duty_Time AND ROUND((v_FPT_L_T-v_Fpt_F_T)*24*60) > 270)  THEN
             v_meal_subsidy:=1;
          END IF;
          GOTO END_dinner_subsidy;
      END IF;
      ---如果是早上假。
     SELECT
                A_F_L.LEAVE_START_TIME,
                A_F_L.Leave_End_Time
              INTO v_LEAVE_START_TIME,
                   v_LEAVE_END_TIME
               FROM ASK_For_LEAVE A_F_L
               WHERE A_F_L.Job_Number = v_job_Number
               AND v_FP_D BETWEEN TRUNC(A_F_L.Leave_Start_Time) AND TRUNC(A_F_L.Leave_End_Time);
        -----上午假-----------  起始时间<8:00  终止时间< 13:30
       IF(v_LEAVE_START_TIME <= v_PeaceTime_AM_ON_Duty_Time AND v_LEAVE_END_TIME <=v_PeaceTime_PM_ON_Duty_TIME) THEN  ---请了早上假。
          ---12:40 之前归来，
          IF (v_FPT_F_T<=v_PeaceTime_AM_Back__D_T) AND ROUND((v_Fpt_L_T - v_FPT_F_T)*24*60) > 270  THEN
             v_meal_subsidy := 1;
              GOTO END_dinner_subsidy;
          END IF;
       END IF;
       ----下午假，不计算餐补。
        ----------------------------计算餐补-------------------------------------------------
     <<END_dinner_subsidy >>
     NULL;
     ---开始更新
     UPDATE Attendance_Record AR
     SET
         AR.Come_Num = v_Come_Num,
         AR.come_Late_num = v_Come_Late_Num,
         AR.LEAVE_EARLY_NUM = v_LEAVE_Early_Num,
         AR.delay_time = v_Delay_Time,
         AR.meal_subsidy = v_meal_subsidy
     WHERE AR.JOB_NUMBER = v_JOB_NUMBER
     AND AR.fingerprint_date = v_FP_D;

     END LOOP;
     CLOSE v_AR_Cur;
     v_Flag:=1;
     return;
end Analyze_AR;
/

prompt
prompt Creating procedure ANALYZE_AR_BAK
prompt =================================
prompt
create or replace procedure dukepu.Analyze_AR_Bak(v_Year_And_Month_Str VARCHAR2,v_Random_Str VARCHAR2,v_Flag out INTEGER) AS
       ---迟到,早退暂时改为统计为

     v_Count INT:=0;

     type t_Cursor is ref cursor;
     v_AR_Cur t_Cursor;

     v_SEQ    Attendance_Record.Seq%type;                 --序号.
     v_Job_Number Attendance_Record.Job_Number%type;                           --工号.
     v_Fpt_F_T Attendance_Record.Fpt_First_Time%type;                          --第一次刷卡时间
     v_FPT_L_T Attendance_Record.Fpt_Last_Time%type;                           --最后一次刷卡时间
     v_FP_D    Attendance_Record.Fingerprint_Date%type;                        ---刷卡日期.

     v_Dept    Work_Schedule.Dept%TYPE;             ---部门;



     v_PeaceTime_AM_ON_Duty_Time  DATE;   ---暂存早上时间 8:00;
     v_PeaceTime_AM_OFF_Duty_Time  DATE;  ---暂存早上下班时间 12:20
     v_PeaceTime_PM_ON_Duty_Time  DATE;   ---暂存下午上班时间 13:30;
     v_PeaceTime_PM_OFF_Duty_Time  DATE;     ---用于暂存下班时间 17:00。


     v_Delay_Time     NUMBER;   ---暂存延时数值： 2.5小时。
     v_Come_Late_Num      NUMBER;   --暂存迟到数值：
     v_LEAVE_Early_Num     NUMBER;   --暂存早退数值; :0.5小时。
     v_dinner_subsidy integer;      ---暂存餐补



     v_LEAVE_START_TIME  AsK_FOR_Leave.Leave_Start_Time%TYPE;                  ---请假起始时间
     v_LEAVE_END_TIME ASK_FOR_LEAVE.Leave_End_Time%TYPE;                       ---请假终止时间。

     v_Subject varchar2(20):='Analyze_AR';


begin

     ---先统计出勤日.
     UPDATE Attendance_Record AR
     SET AR.Come_Num = (
                     CASE
                          WHEN (AR.FPT_FIRST_TIME IS NULL AND AR.FPT_LAST_TIME IS NULL) THEN
                               0
                           ELSE
                                1
                     END
                     ),         --只要刷一次卡，就统计为1。
     AR.Not_Finger_Print = (
                                    CASE
                                      WHEN (AR.FPT_FIRST_TIME IS NULL AND AR.FPT_LAST_TIME IS NOT NULL) THEN
                                           1
                                      WHEN (AR.FPT_FIRST_TIME IS NOT NULL AND AR.FPT_LAST_TIME IS  NULL) THEN
                                           1
                                       ELSE
                                           NULL
                                 END
                              )
     WHERE TRUNC(AR.FingerPrint_Date,'MM') = TO_DATE(v_Year_And_Month_Str,'YYYY-MM');

     ---年月 字符串.
     OPEN v_AR_Cur
     FOR
     SELECT
            SEQ,
            job_number,
            DEPT,
            FPT_First_Time,
            FPT_Last_Time,
            FINGERPrint_Date
     FROM Attendance_Record AR
     WHERE TRUNC(fingerprint_date,'MM') = TO_DATE(v_Year_And_Month_Str,'YYYY-MM')
     ORDER BY AR.fingerprint_date ASC,
           AR.DEPT ASC;

     LOOP
         FETCH v_AR_Cur INTO
                             v_SEQ,
                             v_job_Number,
                             v_Dept,
                             v_Fpt_F_T,
                             v_FPT_L_T,
                             v_FP_D;
         EXIT WHEN v_AR_Cur%NOTFOUND;

         ----先判断有没有对应部门的 ----工作计划生成.
                  ---先判断是否休息日。
         SELECT COUNT(1) INTO v_Count
         FROM Work_Schedule WS
         WHERE NVL(WS.dept,'NULL') = v_Dept
         AND WS.work_and_rest_date = v_FP_D;
         IF(v_Count=0) THEN  ---休息。
            v_Flag:=0;
              ---保存信息到MESSAGE中.
              ---保存错误信息.
            INSERT INTO FINISH_MESSAGE(
                   PROMPT,
                   FLAG,
                   UPDATE_TIME,
                   NAME_OF_THE_HANDLER,
                   RANDOM_STR
            )
            VALUES(
                   v_FP_D || '  '||v_Dept||'  :未生成工作计划!',
                   '0',
                   SYSDATE,
                   v_Subject,
                   v_Random_Str
            );
            return;
         END IF;


         v_PeaceTime_AM_ON_Duty_Time :=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')||' 08:00:00','YYYY-MM-DD HH24:MI:SS');
         v_PeaceTime_AM_OFF_Duty_Time:=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')||' 12:20:00','YYYY-MM-DD HH24:MI:SS');
         v_PeaceTime_PM_ON_Duty_Time:=TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')||' 13:30:00','YYYY-MM-DD HH24:MI:SS');
         v_PeaceTime_PM_OFF_Duty_Time:= TO_DATE(TO_CHAR(v_FP_D,'YYYY-MM-DD')||' 17:00:00','YYYY-MM-DD HH24:MI:SS');

         ---未打下班卡，不计延时。
         IF v_FPT_L_T IS NULL THEN
            v_Delay_Time:=NULL;
            GOTO END_Delay_Time;
         END IF;
         ---判断是否请假中。
         SELECT COUNT(1) INTO v_Count
         FROM ASK_For_LEAVE A_F_L
         WHERE A_F_L.Job_Number = v_job_Number
         AND ( v_FPT_L_T >= A_F_L.Leave_Start_Time
               AND v_FPT_L_T <=A_F_L.Leave_End_Time
              );
         ---请假中.
         IF(v_Count=1) THEN
             v_Delay_Time:=NULL;
             GOTO END_Delay_Time;
         END IF;
         ---工作日，或自行加班日---
         IF(v_FPT_L_T<=v_PeaceTime_PM_OFF_Duty_Time) THEN   ---下班时间比17:00早。
            v_Delay_Time:=NULL;                     ---不计算延时。
         ELSE                                     -- 超出17:00计为延时
            ---延时
            v_Delay_Time:=TRUNC((v_FPT_L_T - v_PeaceTime_PM_OFF_Duty_Time)*24/0.5)*0.5;
         END IF;

         <<END_Delay_Time>>
         NULL;
         --- --------------------------------------计算迟到   -------------------------------------
         IF(v_Fpt_F_T IS NULL) THEN                           ---未打上班卡。
            v_Come_Late_Num:=NULL;
            GOTO END_COME_LATE;
         END IF;
         ---先判断是否休息日。
         SELECT COUNT(1) INTO v_Count
         FROM Work_Schedule WS
         WHERE WS.dept = v_Dept
         AND WS.work_and_rest_date = v_FP_D
         AND WS.Work_Or_Rest = 1;
         IF(v_Count=0) THEN  ---休息。
            v_Come_Late_Num:=NULL;
            GOTO END_COME_LATE;
         END IF;
         ---工作日。
         --判断当天有没有请假。
         SELECT COUNT(1) INTO v_Count
         FROM ASK_For_LEAVE A_F_L
         WHERE A_F_L.Job_Number = v_job_Number
         AND  v_FP_D BETWEEN TRUNC(A_F_L.Leave_Start_Time) AND TRUNC(A_F_L.Leave_End_Time);
         IF(v_Count =0) THEN   ---正常班: 8:00之前签到。
            IF(v_Fpt_F_T <=v_PeaceTime_AM_ON_Duty_Time) THEN
                v_Come_Late_Num:=NULL;
                GOTO END_COME_LATE;
            END IF;
             ---迟到。
            IF(v_Fpt_F_T >v_PeaceTime_AM_ON_Duty_Time) THEN
                --v_Come_Late_Num:=ROUND((v_Fpt_F_T -v_PeaceTime_AM_ON_Duty_Time)*24*60);
                v_Come_Late_Num:=1;
                GOTO END_COME_LATE;
            END IF;
         END IF;
         ---已请假。
         SELECT
                  A_F_L.LEAVE_START_TIME,
                  A_F_L.Leave_End_Time
                INTO v_LEAVE_START_TIME,
                     v_LEAVE_END_TIME
                 FROM ASK_For_LEAVE A_F_L
                 WHERE A_F_L.Job_Number = v_job_Number
                 AND v_FP_D BETWEEN TRUNC(A_F_L.Leave_Start_Time) AND TRUNC(A_F_L.Leave_End_Time);

          IF(v_LEAVE_START_TIME <= v_PeaceTime_AM_ON_Duty_Time AND v_LEAVE_END_TIME <=v_PeaceTime_PM_ON_Duty_TIME) THEN  ---请了早上假。
             ---------假期中。第一次刷卡时间<=13:30-------------
             IF(v_Fpt_F_T <= v_PeaceTime_PM_ON_Duty_TIME) THEN
                  v_Come_Late_Num:=NULL;
                  GOTO END_COME_LATE;
             END IF;
             ---假期满后。第一次刷卡时间>13:30
             --v_Come_Late_Num:= ROUND((v_Fpt_F_T - v_PeaceTime_PM_ON_Duty_TIME) * 24 * 60);
             v_Come_Late_Num:=1;
             GOTO END_COME_LATE;
          END IF;
          ---请的是下午假期。
          IF(v_LEAVE_START_TIME >= v_PeaceTime_AM_OFF_Duty_Time) THEN      ---请的是下午假。
               IF(v_Fpt_F_T <= v_PeaceTime_AM_ON_Duty_TIME) THEN   ---正常出勤。
                  v_Come_Late_Num:=NULL;
                  GOTO END_COME_LATE;
               END IF;
             ----迟到. 第一次刷卡时间>08:00:00
             --v_Come_Late_Num:= ROUND((v_Fpt_F_T - v_PeaceTime_AM_ON_Duty_TIME) * 24 * 60);
             v_Come_Late_Num:=1;
          END IF;
        --------------------------------------------计算迟到完毕 ---------------------------------------
        <<END_COME_LATE>>
        NULL;
        --------------------------------------------计算早退------------------------------
        IF(v_Fpt_L_T IS NULL) THEN
            v_LEAVE_Early_Num:=NULL;                          ---未打下班卡。
            GOTO END_LEAVE_EARLY;
         END IF;
         ---先判断是否休息日。
         SELECT COUNT(1) INTO v_Count
         FROM Work_Schedule WS
         WHERE WS.dept = v_Dept
         AND WS.work_and_rest_date = v_FP_D
         AND WS.Work_Or_Rest = 1;
         ----休息日----------------
         IF(v_Count=0) THEN
            v_LEAVE_Early_Num:=NULL;
            GOTO END_LEAVE_EARLY;
         END IF;
         ---工作日-----------------------
         --判断当天有没有请假。
         SELECT COUNT(1) INTO v_Count
         FROM ASK_For_LEAVE A_F_L
         WHERE A_F_L.Job_Number = v_job_Number
         AND v_FP_D BETWEEN TRUNC(A_F_L.Leave_Start_Time) AND TRUNC(A_F_L.Leave_End_Time);
         ---正常班: 17:00之后下班。-------------
         IF(v_Count =0) THEN
            ---正常下班。
            IF(v_Fpt_L_T >=v_PeaceTime_PM_OFF_Duty_Time) THEN
                v_LEAVE_Early_Num:=NULL;
                GOTO END_LEAVE_EARLY;
            END IF;
             ---早退
            IF(v_Fpt_L_T <v_PeaceTime_PM_OFF_Duty_Time) THEN
                --v_LEAVE_Early_Num:=ROUND((v_PeaceTime_PM_OFF_Duty_Time -v_Fpt_L_T)*24*60);
                v_LEAVE_Early_Num:=1;
                GOTO END_LEAVE_EARLY;
            END IF;
         END IF;
         ---已请假。-------------
         SELECT
                  A_F_L.LEAVE_START_TIME,
                  A_F_L.Leave_End_Time
                INTO v_LEAVE_START_TIME,
                     v_LEAVE_END_TIME
                 FROM ASK_For_LEAVE A_F_L
                 WHERE A_F_L.Job_Number = v_job_Number
                 AND v_FP_D BETWEEN TRUNC(A_F_L.Leave_Start_Time) AND TRUNC(A_F_L.Leave_End_Time);
          -----上午假-----------  起始时间<8:00  终止时间< 13:30
         IF(v_LEAVE_START_TIME <= v_PeaceTime_AM_ON_Duty_Time AND v_LEAVE_END_TIME <=v_PeaceTime_PM_ON_Duty_TIME) THEN  ---请了早上假。
             ---下午下班
             IF(v_Fpt_L_T > v_PeaceTime_PM_OFF_Duty_TIME) THEN    ---下午正常班。
                  v_LEAVE_Early_Num:=NULL;
                  GOTO END_LEAVE_EARLY;
             END IF;
             ---早退-------
             --v_LEAVE_Early_Num:= ROUND((v_PeaceTime_PM_OFF_Duty_TIME - v_Fpt_L_T ) * 24 * 60);
             v_LEAVE_Early_Num:= 1;
             GOTO END_LEAVE_EARLY;
         END IF;
          ---下午假-----起始时间>=12:20 --------
         IF(v_LEAVE_START_TIME >= v_PeaceTime_AM_OFF_Duty_Time) THEN      ---请的是下午假。
               IF(v_Fpt_L_T >= v_PeaceTime_AM_OFF_Duty_TIME) THEN   --- 最后一次刷卡时间>=12:20
                  v_LEAVE_Early_Num:=NULL;
                  GOTO END_LEAVE_EARLY;
               END IF;
         END IF;
         ---最后一次刷卡时间<12:20  ---早退----
         --v_LEAVE_Early_Num:= ROUND((v_PeaceTime_AM_OFF_Duty_TIME - v_Fpt_L_T ) * 24 * 60);
         v_LEAVE_Early_Num:= 1;
        ------------------------------------计算早退完毕----------------------------------------
        <<END_LEAVE_EARLY>>
        NULL;
        ----------------------------计算餐补-------------------------------------------------
        IF(v_Fpt_F_T IS NULL OR v_FPT_L_T IS NULL) THEN
            v_dinner_subsidy:=0;
            GOTO END_dinner_subsidy;
        END IF;
       ---没有请假
          ---判断是否请假中。
       SELECT COUNT(1) INTO v_Count
       FROM ASK_For_LEAVE A_F_L
       WHERE A_F_L.Job_Number = v_job_Number
       AND v_FP_D BETWEEN TRUNC(A_F_L.Leave_Start_Time) AND TRUNC(A_F_L.Leave_End_Time);
      ---正常班，或自行加班。
      IF(v_Count =0) THEN
          ---4小时半，就有餐补
          IF (ROUND((v_FPT_L_T-v_Fpt_F_T)*24*60) > 270)  THEN
             v_dinner_subsidy:=1;
          END IF;
          GOTO END_dinner_subsidy;
      END IF;
      ---如果是早上假。
     SELECT
                A_F_L.LEAVE_START_TIME,
                A_F_L.Leave_End_Time
              INTO v_LEAVE_START_TIME,
                   v_LEAVE_END_TIME
               FROM ASK_For_LEAVE A_F_L
               WHERE A_F_L.Job_Number = v_job_Number
               AND v_FP_D BETWEEN TRUNC(A_F_L.Leave_Start_Time) AND TRUNC(A_F_L.Leave_End_Time);
        -----上午假-----------  起始时间<8:00  终止时间< 13:30
       IF(v_LEAVE_START_TIME <= v_PeaceTime_AM_ON_Duty_Time AND v_LEAVE_END_TIME <=v_PeaceTime_PM_ON_Duty_TIME) THEN  ---请了早上假。
          IF ROUND((v_Fpt_L_T - v_PeaceTime_PM_ON_Duty_TIME)*24*60) > 270  THEN
             v_dinner_subsidy := 1;
              GOTO END_dinner_subsidy;
          END IF;
       END IF;
       ----下午假，不计算餐补。
        ----------------------------计算餐补-------------------------------------------------
     <<END_dinner_subsidy >>
     NULL;
     ---开始更新
     UPDATE Attendance_Record AR
     SET
         AR.come_Late_num = v_Come_Late_Num,
         AR.LEAVE_EARLY_NUM = v_LEAVE_Early_Num,
         AR.delay_time = v_Delay_Time,
         AR.MEAL_SUBSIDY = v_dinner_subsidy
     WHERE AR.JOB_NUMBER = v_JOB_NUMBER
     AND AR.fingerprint_date = v_FP_D;

     END LOOP;
     CLOSE v_AR_Cur;
     v_Flag:=1;
     return;
end Analyze_AR_BAk;
/

prompt
prompt Creating procedure GENERAL_JOB_NUMBER
prompt =====================================
prompt
create or replace procedure dukepu.General_Job_Number( v_Job_Number out varchar2) AS
       v_Next_seq  INT;
       v_Count INT;
       str_Next_Seq VARCHAR2(10);
begin

    SELECT Count(1) INTO v_Count
    FROM EMPLOYEES
    WHERE SUBSTR(JOB_NUMBER,1,7) = 'L'||TO_CHAR(SYSDATE,'YYMMDD');

    IF(v_Count =0) THEN
        v_Next_Seq := 1;
    ELSE
        SELECT (MAX(SUBSTR(JOB_NUMBER,LENGTH(JOB_NUMBER)-2,3)) +1) INTO v_Next_Seq
        FROM EMPLOYEES
        WHERE JOB_NUMBER != 'admin'
        AND JOB_NUMBER != 'query'
        AND SUBSTR(JOB_NUMBER,1,7) = 'L'||TO_CHAR(SYSDATE,'YYMMDD');
    END IF;

    str_Next_Seq:= CAST(v_Next_Seq AS VARCHAR2);
    V_JOB_NUMBER:= 'L'||TO_CHAR(SYSDATE,'YYMMDD') || LPAD(str_Next_Seq,3,'0');
end General_Job_Number;
/

prompt
prompt Creating procedure GENERATE_JOB_NUMBER
prompt ======================================
prompt
create or replace procedure dukepu.Generate_Job_Number( v_Job_Number out varchar2) AS
       v_Next_seq  INT;
       v_Count INT;
       str_Next_Seq VARCHAR2(10);
begin

    SELECT Count(1) INTO v_Count
    FROM EMPLOYEES
    WHERE SUBSTR(JOB_NUMBER,1,7) = 'L'||TO_CHAR(SYSDATE,'YYMMDD');

    IF(v_Count =0) THEN
        v_Next_Seq := 1;
    ELSE
        SELECT (MAX(SUBSTR(JOB_NUMBER,LENGTH(JOB_NUMBER)-2,3)) +1) INTO v_Next_Seq
        FROM EMPLOYEES
        WHERE JOB_NUMBER != 'admin'
        AND JOB_NUMBER != 'query'
        AND SUBSTR(JOB_NUMBER,1,7) = 'L'||TO_CHAR(SYSDATE,'YYMMDD');
    END IF;

    str_Next_Seq:= CAST(v_Next_Seq AS VARCHAR2);
    V_JOB_NUMBER:= 'L'||TO_CHAR(SYSDATE,'YYMMDD') || LPAD(str_Next_Seq,3,'0');
end Generate_Job_Number;
/

prompt
prompt Creating procedure GENERATE_REST_DAY
prompt ====================================
prompt
create or replace procedure dukepu.Generate_Rest_Day(
                                              v_name varchar2,
                                              v_YearAndMonth varchar2
                                              )
                                              AS
      --休息日： 最后 一日 。
       v_LastDay int;
       var_LastDay varchar2(2);
       v_date date;
       v_day varchar2(10);
       v_Count INT;
begin

     ---
     SELECT TO_CHAR(LAST_DAY(TO_DATE(v_YearAndMonth,'yyyy-MM')),'dd') INTO var_LastDay
     FROM DUAL;

     v_LastDay:= CAST(var_LastDay AS INT);
     FOR i IN 1..v_LastDay
     LOOP
        SELECT TO_DATE(v_YearAndMonth || '-' || CAST(i AS varchar2(2)),'yyyy-MM-dd') INTO v_date
        FROM DUAL;


        SELECT TO_Char(v_date,'day') INTO v_day
        FROM DUAL;


        IF('星期日' =v_day) THEN
           SELECT COUNT(1) INTO v_Count
           FROM Rest_Day
           WHERE name = v_name
           AND Rest_Day =v_date;

           IF(v_Count=0) THEN

                INSERT INTO Rest_Day(name,Rest_Day,Update_Time)
                VALUES(
                       v_Name,
                       v_date,
                       Sysdate
                );
                commit;
           END IF;
        end IF;

     END LOOP;

end Generate_Rest_Day;
/

prompt
prompt Creating procedure GENERATE_WORK_SUMMARY
prompt ========================================
prompt
create or replace procedure dukepu.Generate_Work_Summary(v_work_Date IN varchar2) AS
       ---   此方法尚未给出 上班时间，下班时间。
       v_Num_On_Duty INT:=0;
       v_Num_Off_Duty INT:=0;
       v_Count INT:=0;

       v_FingerPrint_Date Attendance_Record.Fingerprint_Date%type;
       v_Dept Attendance_Record.Dept%type;

       v_work_or_rest Work_Summary.work_or_rest%type;          --- 1: 工作  0:休息。
       v_Work_and_rest_date Work_Summary.Work_And_Rest_Date%type;    --工作日期
       v_FP_Number Work_Summary.Fp_Number%Type;                      --按指纹人数。

       v_FP_NUMBER_ALL_Staffs Work_Summary.Fp_Number%TYPE;           ---所有出勤的员工数量.


       type t_Cursor is ref  cursor;
       v_Cur_AR_Summary t_Cursor;            ---考勤记录 日期游标.
       v_Cur_WS         t_Cursor;            ----考勤安排游标
       v_Calculate_On_Duty_Time Date;             ---推算的上班时间
       v_Calculate_Off_Duty_Time Date;             ---推算的下班时间
begin
  ---生成工作安排表.
  --休息记录有
  OPEN v_Cur_AR_Summary
  FOR
   SELECT TEmP.fingerprint_date,
         Temp.dept,
          SUM(
          CASE
               WHEN TEMP.On_Duty_Nums IS NULL
                    THEN 0
                    ELSE
                         TEMP.On_Duty_Nums
               END
          ) On_Duty_Nums,                  ---上班人数。
         SUM(
          CASE
               WHEN TEMP.Off_Duty_Nums IS NULL
                    THEN 0
                    ELSE
                         TEMP.Off_Duty_Nums
               END
          ) Off_Duty_Nums                 ---休息人数。
  FROM
  (
     SELECT  fingerprint_date,
             NVL(dept,'NULL') dept,

            (CASE
                   WHEN  NOT(FPT_FIRST_TIME IS NULL AND fpt_last_time IS NULL)
                       THEN COUNT(1)
             END
            ) On_Duty_Nums,
             (CASE  WHEN FPT_FIRST_TIME IS NULL AND fpt_last_time IS NULL
                               THEN COUNT(1)
                     END
                    )  Off_Duty_Nums
    FROM Attendance_Record
    WHERE TRUNC(FingerPrint_Date,'MM') = TO_DATE(v_work_Date,'yyyy-MM')
    GROUP BY FingerPrint_DATE,
          dept,
          fpt_first_time,
          fpt_last_time
    ORDER BY FingerPrint_DATE DESC
    ) TEMP
  GROUP BY TEMP.fingerprint_date,
           TEMP.dept
  ORDER BY FINGERPrint_DATE DESC,
           DEPT dESC;

  LOOP
      FETCH  v_Cur_AR_Summary INTO v_FingerPrint_Date,v_Dept,v_Num_On_Duty,v_Num_Off_Duty;
      EXIT WHEN v_Cur_AR_Summary%NOTFOUND;

      ---获取该日期所有员工出勤的总数.
      SELECT SUM(FP_NUMBER) INTO v_FP_NUMBER_ALL_Staffs
      FROM Work_Summary
      WHERE  WORK_AND_REST_DATE = v_FingerPrint_Date;

      IF(v_FP_NUMBER_ALL_Staffs<3) THEN
            v_work_or_rest :=0;
      ELSE
            v_work_or_rest :=1;
      END IF;


      --保存
      SELECT COUNT(1) INTO v_Count
      FROM Work_Summary
      WHERE WORK_AND_REST_DATE = v_FingerPrint_Date
      AND NVL(dept,'NULL') = v_Dept;

      /*
      IF(v_Num_Off_Duty > v_Num_On_Duty) THEN
            v_work_or_rest := 0;
      ELSE
            v_work_or_rest:=1;
      END IF;
      */
      /*
      ---如果上班人数>=5人
      IF(v_Num_On_Duty <5) THEN
           v_work_or_rest := 0;
      ELSE
           v_work_or_rest:=1;
      END IF;
      */
      IF(v_Count =0) THEN
      --INSERT
              INSERT INTO Work_Summary(
                     seq,
                    dept,
                    work_and_rest_date,
                    on_duty_Time,
                    off_duty_time,
                    work_or_rest,
                    FP_Number,
                    REST_NUMBER,
                    record_time
              )
              VALUES(
                     Seq_Work_Summary.Nextval,
                     v_Dept,
                     v_FingerPrint_Date,
                     null,
                     null,
                     v_work_or_rest,
                     v_Num_On_Duty,     ---统计上班人数。
                     v_Num_Off_Duty,
                     SysDATE
              );
      ELSE
             --UPDATe
         UPDATE Work_Summary
         SET WORK_OR_REST = v_work_or_rest,
             FP_Number = v_Num_On_Duty,
             REST_NUMBER = v_Num_Off_Duty,
             Record_Time = SYSDATE
         WHERE Dept = v_Dept
              AND work_and_rest_date = v_FingerPrint_Date;

      END IF;

  END LOOP;
  CLOSE v_Cur_AR_Summary;

    ----第二步初步确定上下班时间。上班：8:00  下班: 12:20 或者 下午上班:13:30   17:00
      OPEN v_Cur_WS
      FOR
      SELECT work_and_rest_date,
             DEPT,
             WORK_OR_REST,
             FP_NUmber  --上班人数。
      FROM Work_Summary;
      LOOP
          FETCH v_Cur_WS INTO v_Work_and_rest_date,v_Dept,v_work_or_rest,v_FP_Number;
          EXIT WHEN v_Cur_WS%NOTFOUND;
          IF(v_work_or_rest =1) THEN  ---若上班。
              ---8:00前上班人数。
              v_Calculate_On_Duty_Time :=  TO_Date(TO_CHAR(v_Work_and_rest_date,'YYYY-MM-DD')|| ' '||'08:00:00','YYYY-MM-dd HH24:MI:SS');

              SELECt COUNT(1) INTO v_Count
              FROM Attendance_Record AR
              WHERE AR.FINGERPRINT_DATE = v_Work_and_rest_date
              AND Dept = v_Dept
              AND AR.Fpt_First_Time IS NOT NULL
              AND AR.Fpt_First_Time < v_Calculate_On_Duty_Time;

              IF(v_Count>=v_FP_Number/2) THEN  ---8:00前上班人数过半
                   UPDATE  Work_Summary A_R_Summary
                   SET on_duty_time =  v_Calculate_On_Duty_Time
                   WHERE work_and_rest_date   = v_Work_and_rest_date
                   AND Dept = v_Dept;
              ELSE
                   ---上班时间定为13:30
                   v_Calculate_On_Duty_Time :=  TO_Date(TO_CHAR(v_Work_and_rest_date,'YYYY-MM-DD')|| ' '||'13:30:00','YYYY-MM-dd HH24:MI:SS');
                      ---12:30 -- 13:30上班人数过半
                    SELECt COUNT(1) INTO v_Count
                    FROM Attendance_Record AR
                    WHERE AR.FingerPrint_Date = v_Work_and_rest_date
                        AND Dept = v_Dept
                        AND AR.Fpt_First_Time IS NOT NULL
                        AND (v_Calculate_On_Duty_Time-AR.Fpt_First_Time) *24*60 BETWEEN 0 AND 60;
                    IF(v_Count>=v_FP_Number/2) THEN
                          UPDATE  Work_Summary A_R_Summary
                         SET A_R_Summary.on_duty_time =  v_Calculate_On_Duty_Time
                         WHERE A_R_Summary.work_and_rest_date   = v_Work_and_rest_date
                         AND A_R_Summary.Dept = v_Dept;

                    END IF;
              END IF;
              ---处理下班时间。
               ---12:20前下班人数。
              v_Calculate_Off_Duty_Time :=  TO_Date(TO_CHAR(v_Work_and_rest_date,'YYYY-MM-DD')|| ' '||'12:30','YYYY-MM-dd HH24:MI:SS');

              SELECt COUNT(1) INTO v_Count
              FROM Attendance_Record AR
              WHERE AR.FingerPrint_Date = v_Work_and_rest_date
              AND Dept = v_Dept
              AND AR.FPT_Last_Time IS NOT NULL
              AND AR.FPT_Last_Time < v_Calculate_Off_Duty_Time;

              IF(v_Count>=v_FP_Number/2) THEN  ---半数以上人12:30前下班.
                   UPDATE  Work_Summary A_R_Summary
                   SET off_duty_time  =  v_Calculate_Off_Duty_Time
                   WHERE work_and_rest_date   = v_Work_and_rest_date
                   AND Dept = v_Dept;
              ELSE
                   ---下班时间定为17:00:00
                   v_Calculate_Off_Duty_Time :=  TO_Date(TO_CHAR(v_Work_and_rest_date,'YYYY-MM-DD')|| ' '||'17:00:00','YYYY-MM-dd HH24:MI:SS');
                      ---12:30 -- 13:30上班人数过半
                    SELECt COUNT(1) INTO v_Count
                    FROM Attendance_Record AR
                    WHERE AR.FINGERPRINT_DATE = v_Work_and_rest_date
                        AND AR.Dept = v_Dept
                        AND AR.FPT_Last_Time IS NOT NULL
                        AND (AR.FPT_Last_Time>=v_Calculate_Off_Duty_Time);        ---下班时间 晚于17:00
                    IF(v_Count>=v_FP_Number/2) THEN
                          UPDATE  Work_Summary A_R_Summary
                         SET off_duty_Time =  v_Calculate_Off_Duty_Time
                         WHERE work_and_rest_date   = v_Work_and_rest_date
                         AND Dept = v_Dept;

                    END IF;
              END IF;
          END IF;




      END LOOP;
      CLOSE v_Cur_WS;



end Generate_Work_Summary;
/

prompt
prompt Creating procedure GET_ACTUAL_AR_DAYS
prompt =====================================
prompt
create or replace procedure dukepu.get_Actual_AR_Days(v_job_number varchar2,v_year_and_month varchar2,v_AR_Days OUT INT )  AS
begin
         
      SELECT count(distinct(finger_print_date)) INTO v_AR_Days
      FROM Attendance_Record_Detail 
      where job_number = v_job_number
           and trunc(finger_print_date,'MM') = to_date(v_year_and_month,'yyyy-MM')
      and finger_print_time is not null
      order by finger_print_date asc;
      
end get_Actual_AR_Days;

/*
create or replace procedure get_Actual_AR_Days(v_job_number varchar2,v_year_and_month varchar2,v_AR_Days OUT INT )  AS
begin

      select
             sum(
                 case
                     when fpt_first_time is  null and fpt_last_time is null then  0
                     else 1
                 end
              ) INTO v_AR_Days
      from Attendance_Record
      where job_number =v_job_number
      and trunc(fingerprint_date,'MM') = to_date(v_year_and_month,'yyyy-MM');
end get_Actual_AR_Days;
*/
/

prompt
prompt Creating procedure GET_ACTUAL_AR_DAYS_OF_A_R_S
prompt ==============================================
prompt
create or replace procedure dukepu.get_Actual_AR_Days_Of_A_R_S(v_job_number varchar2,v_year_and_month varchar2,v_AR_Days OUT INT )  AS
begin

      select
             sum(
                 case
                     when fpt_first_time is  null and fpt_last_time is null then  0
                     else 1
                 end
              ) INTO v_AR_Days
      from Attendance_Record_Summary
      where job_number =v_job_number
      and trunc(fingerprint_date,'MM') = to_date(v_year_and_month,'yyyy-MM');
end get_Actual_AR_Days_Of_A_R_S;
/

prompt
prompt Creating procedure GET_COME_LATE_NUM
prompt ====================================
prompt
create or replace procedure dukepu.get_Come_Late_Num(v_Job_Number in varchar2,v_Year_And_Month_Str in varchar2,v_COME_LATE_NUM out int) AS

       type t_cur is ref cursor;
       day_cur t_cur;
       v_year_month_day date;
       v_year_month_day_str varchar2(20);
       --下班时间
       v_fpt_fisrt_time date;
       v_Count_flag INT;
       ---上班时间
       V_MORNING_ON_DUTY_TIME date;
       ---姓名
begin
       ---先进行 清空
            --更新 当日 的 考勤记录
        /*UPDATE Attendance_Record
        SET COME_Late_NUM = 0
        WHERE JOB_NUMBER = v_Job_Number
        AND trunc(fingerprint_date,'MM')= TO_DATE(v_Year_And_Month_Str,'yyyy-MM');
        */
     --v_COME_LATE_NUM:=0;
     ---对于没有 考勤 记录 的  计件月薪统计人员：
     /*
     SELECT COUNT(1) INTO v_Count_flag
     FROM Attendance_Record
     WHERE JOB_NUMBER = v_Job_Number
     AND TRUNC(fingerprint_date,'MM') = to_date(v_Year_And_Month_Str,'yyyy-MM');
     --此 工号不存在 考勤记录 。
     IF(v_Count_flag =0 ) THEN

          v_COME_LATE_NUM:=0;
          RETURN;
     END IF;
     */
     v_COME_LATE_NUM:=0;
     --先清空 come_late_num
    
     UPDATE Attendance_Record_Briefly
     SET COME_LATE_NUM = NULL
     WHERE JOB_NUMBER =v_JOB_NUMBER 
     AND TRUNC(Finger_Print_DATE,'MM') =TO_DATE(v_Year_And_Month_Str,'yyyy-MM');
     
  ---获取迟到次数。
     OPEN day_cur FOR
     SELECT Finger_Print_DATE,
            TO_CHAR(Finger_Print_DATE,'YYYY-MM-DD'),
            ARBriefly.FPT_First_Time
     FROM Attendance_Record_Briefly ARBriefly
     WHERE JOB_NUMBER = v_JOB_NUMBER
     AND TRUNC(Finger_Print_DATE,'MM') =TO_DATE(v_Year_And_Month_Str,'yyyy-MM');

     LOOP
        <<NEXT>>
        NULL;
        
        FETCH day_cur INTO v_year_month_day,v_year_month_day_str,v_fpt_fisrt_time;
        EXIT WHEN day_cur%NOTFOUND;

        IF(v_fpt_fisrt_time IS NULL) THEN    ---如果未 刷上班卡，没法计算迟到次数。

            GOTO NEXT;
        END IF;

       ---刷了上班卡.
       --判断今天是否是公司休息日.

        ---注意 休息日  以人工设定。

        SELECT COUNT(1) INTO v_Count_flag
        FROM Rest_Day
        WHERE Rest_Day = v_year_month_day;
        
        ---开始： 加班日----
        IF(v_Count_flag = 1) THEN
              GOTO NEXT;   ----公司加班日,不计迟到.
        END IF;
        ----结束： 加班日----
        
        
        ---====开始： 正常工作日====================================
        --判断是否超过08:00
        V_MORNING_ON_DUTY_TIME:= TO_DATE(v_year_month_day_str||' 08:00:00','yyyy-MM-dd HH24:MI:SS');
        IF(v_fpt_fisrt_time<=V_MORNING_ON_DUTY_TIME)
        THEN
           ---未迟到.
           GOTO NEXT;
        END IF;
        
        
        --  超过8：00
        v_COME_LATE_NUM:= v_COME_LATE_NUM+1;
        
        update Attendance_Record_Briefly 
        set come_late_num =1
        WHERE job_number = v_job_Number
        AND TrUNC(finger_print_date,'DD') = v_year_month_day;
        
        
        ---===结束： 正常工作日====================================
     END LOOP;
     CLOSE day_cur;
end get_Come_Late_Num;
/

prompt
prompt Creating procedure GET_COME_LATE_NUM_OF_ARS
prompt ===========================================
prompt
create or replace procedure dukepu.get_Come_Late_Num_Of_ARS(v_Job_Number in varchar2,v_Year_And_Month in varchar2,v_COME_LATE_NUM out int) AS

       type t_cur is ref cursor;
       day_cur t_cur;

       v_year_month_day date;
       v_year_month_day_str varchar2(20);

       --下班时间
       v_fpt_fisrt_time date;


       V_COUNT INT;


       ---上班时间
       V_MORNING_ON_DUTY_TIME date;
       ---姓名
begin

       ---先进行 清空
            --更新 当日 的 考勤记录
        UPDATE Attendance_Record_Summary
        SET COME_Late_NUM = 0
        WHERE JOB_NUMBER = v_Job_Number
        AND trunc(fingerprint_date,'MM')= TO_DATE(v_Year_And_Month,'yyyy-MM');

     v_COME_LATE_NUM:=0;
     ---对于没有 考勤 记录 的  计件月薪统计人员：
     SELECT COUNT(1) INTO v_COUNT
     FROM Attendance_Record_Summary
     WHERE JOB_NUMBER = v_Job_Number
     AND TRUNC(fingerprint_date,'MM') = to_date(v_year_and_Month,'yyyy-MM');
     --此 工号不存在 考勤记录 。
     IF(v_COUNT =0 ) THEN

          v_COME_LATE_NUM:=0;
          RETURN;
     END IF;

     v_COME_LATE_NUM:=0;
  ---获取迟到次数。
     OPEN day_cur FOR
     SELECT FingerPrint_DATE,TO_CHAR(FingerPrint_Date,'YYYY-MM-DD'),ARS.FPT_First_Time
     FROM Attendance_Record_Summary ARS
     WHERE JOB_NUMBER = v_JOB_NUMBER
     AND TRUNC(FingerPrint_DATE,'MM') =TO_DATE(v_year_and_month,'yyyy-MM');

     LOOP
        <<NEXT>>
        NULL;

        FETCH day_cur INTO v_year_month_day,v_year_month_day_str,v_fpt_fisrt_time;
        EXIT WHEN day_cur%NOTFOUND;

        IF(v_fpt_fisrt_time IS NULL) THEN    ---如果未 刷上班卡，没法计算迟到次数。

            GOTO NEXT;
        END IF;

       ---刷了上班卡.
       --判断今天是否是公司休息日.

        ---注意 休息日  以人工设定。

        SELECT COUNT(1) INTO v_COUNT
        FROM Rest_Day
        WHERE Rest_Day = v_year_month_day;

        IF(v_COUNT = 1) THEN
              GOTO NEXT;   ----公司加班日,不计迟到.
        END IF;

      ---正常工作日
      --判断是否超过08:00
        V_MORNING_ON_DUTY_TIME:= TO_DATE(v_year_month_day_str||' 08:00:00','yyyy-MM-dd HH24:MI:SS');
        IF(v_fpt_fisrt_time<=V_MORNING_ON_DUTY_TIME)
        THEN
           ---未迟到.
           GOTO NEXT;
        END IF;

        --更新 当日 的 考勤记录
        UPDATE Attendance_Record_Summary
        SET COME_Late_NUM = 1
        WHERE JOB_NUMBER = v_Job_Number
        AND fingerprint_date= v_year_month_day;
        --迟到
         v_COME_LATE_NUM:= v_COME_LATE_NUM+1;
     END LOOP;
     CLOSE day_cur;
end get_Come_Late_Num_Of_ARS;
/

prompt
prompt Creating procedure GET_DELAY_TIMES_ORDINARY_DAYS
prompt ================================================
prompt
create or replace procedure dukepu.GET_Delay_times_Ordinary_days(v_Job_Number in varchar2,v_Year_And_Month in varchar2,v_Delay_Total_Time out NUMBER) AS
       ---获取平日加班的 延时时间

       type t_cur is ref cursor;
       day_cur t_cur;
       v_year_month_day date;
       v_year_month_day_str varchar2(20);
       v_fpt_first_time date;
        --下班时间
       v_fpt_last_time date;
       v_Delay_Time_TEMP INT:=0;
       v_count INT;
begin
     v_Delay_Total_Time:=0;
     ---获取某指定日期内的总延时 时间
     OPEN day_cur FOR
     SELECT Finger_Print_DATE,    ---指纹日期
            TO_CHAR(Finger_Print_Date,'YYYY-MM-DD'), ---指纹日期字符串。
            ARBriefly.Fpt_First_Time,
            ARBriefly.Fpt_Last_Time                        ---最后一次指纹时间。
     FROM Attendance_Record_Briefly ARBriefly
     WHERE JOB_NUMBER = v_JOB_NUMBER
     AND TRUNC(Finger_Print_DATE,'MM') =TO_DATE(v_year_and_month ,'yyyy-MM');
     LOOP
         <<NEXT>>
         NULL;

         FETCH day_cur INTO v_year_month_day,
                            v_year_month_day_str,
                            v_fpt_first_time,
                            v_fpt_last_time;
         EXIT WHEN day_cur%NOTFOUND;

          ---判断是否为加班日。
         SELECT COUNT(1) INTO v_Count
         FROM Rest_Day
         WHERE Rest_Day = v_year_month_day;

         --若为加班日,则非平日，进行下次循环。
         IF(v_Count=1) THEN
              GOTO NEXT;
         END IF;
         --工作日，凌晨，起加班。
         IF(v_fpt_first_time is not null AND v_fpt_first_time < to_date(v_year_month_day_str||' 05:00:00','yyyy-MM-dd HH24:MI:SS')) then
               GOTO NEXT;               
         end if;
         IF(v_fpt_last_time IS NULL) THEN
              GOTO NEXT;
         END IF;
         
         
         v_Delay_Time_TEMP := round((v_fpt_last_time- TO_DATE(v_year_month_day_str || ' 17:00:00','yyyy-MM-DD HH24:MI:SS'))*24*60);
         ---只要超过17:00  统一计算为延时。
         IF(v_Delay_Time_TEMP <=0) THEN
               GOTO NEXT;
         END IF;
         v_Delay_Total_Time := v_Delay_Total_Time +FLOOR(v_Delay_Time_TEMP/30) * 0.5;
     END LOOP;
     close day_cur;

end GET_Delay_times_Ordinary_days;
/

prompt
prompt Creating procedure GET_REST_DAY_TIME
prompt ====================================
prompt
create or replace procedure dukepu.GET_Rest_Day_Time(v_Job_Number in varchar2,v_Year_And_Month in varchar2,v_Rest_Day_Time out NUMBER) AS
       --计算 休息日的 加班（8：00-5：00）
       type t_cur is ref cursor;
       day_cur t_cur;
       v_year_month_day date;
       v_year_month_day_str varchar2(20);
       --正常下班时间
       v_normal_off_duty_time date;
       --正常上班时间
       v_normal_on_duty_time date;
       --正午时刻
       v_highnoon_time       date;
       --上班时间
       v_fpt_first_time date;
        --下班时间
       v_fpt_last_time date;
       v_Rest_Day_Time_Temp INT:=0;
       V_COUNT INT:=0;





begin
     v_Rest_Day_Time:=0;
     ---获取某指定日期内的总延时 时间
     OPEN day_cur FOR
     SELECT FingerPrint_DATE,    ---指纹日期
            to_char(FingerPrint_DATE,'yyyy-MM-dd'),
            AR.Fpt_First_Time,
            AR.Fpt_Last_Time                        ---最后一次指纹时间。
     FROM Attendance_Record AR
     WHERE JOB_NUMBER = v_JOB_NUMBER
     AND TRUNC(FingerPrint_DATE,'MM') =TO_DATE(v_year_and_month || '-01','YYYY-MM-DD');
     LOOP
         <<NEXT>>
         NULL;
         FETCH day_cur INTO v_year_month_day,
                            v_year_month_day_str,
                            v_fpt_first_time,
                            v_fpt_last_time;
         EXIT WHEN day_cur%NOTFOUND;
         IF(v_fpt_first_time is NULL) THEN
              GOTO NEXT;
         END IF;
         IF(v_fpt_last_time IS NULL) THEN
              GOTO NEXT;
         END IF;
         SELECT COUNT(1) INTO V_COUNT
         FROM Rest_Day
         WHERE Rest_Day = v_year_month_day;

         IF(v_Count=0)THEN
              GOTO NEXT;
         END IF;
         ---设定 正常 下班时间 。
         v_normal_off_duty_time:=to_date(v_year_month_day_str || ' 17:00:00','yyyy-MM-dd hh24:mi:ss');
         v_normal_on_duty_time:=to_date(v_year_month_day_str || ' 08:00:00','yyyy-MM-dd hh24:mi:ss');
         v_highnoon_time:=to_date(v_year_month_day_str|| ' 12:00:00','yyyy-MM-dd hh24:mi:ss');
         IF(v_fpt_first_time>=v_normal_on_duty_time AND v_fpt_last_time >v_normal_off_duty_time ) THEN
              v_Rest_Day_Time_Temp:= round((v_normal_off_duty_time- v_fpt_first_time)*24*60);
         ELSIF(v_fpt_first_time<v_normal_on_duty_time AND v_fpt_last_time >v_normal_off_duty_time ) THEN
              v_Rest_Day_Time_Temp:= round((v_normal_off_duty_time- v_normal_on_duty_time)*24*60);
         ELSIF(v_fpt_first_time<v_normal_on_duty_time AND v_fpt_last_time <v_normal_off_duty_time) THEN
              v_Rest_Day_Time_Temp := round((v_fpt_last_time- v_normal_on_duty_time)*24*60);
         ELSE
              v_Rest_Day_Time_Temp := round((v_fpt_last_time- v_fpt_first_time)*24*60);
         END IF;
         --跨越正午时刻，总时间减去1小时。
         IF(v_fpt_first_time <=v_highnoon_time AND v_fpt_last_time >=v_highnoon_time) THEN
              v_Rest_Day_Time_Temp := v_Rest_Day_Time_Temp -1*60;
         END IF;
         ---只要超过17:00  统一计算为延时。
         v_Rest_Day_Time := v_Rest_Day_Time +FLOOR(v_Rest_Day_Time_Temp/30) * 0.5;
     END LOOP;
     close day_cur;

end GET_Rest_Day_Time;
/

prompt
prompt Creating procedure GET_DELAY_TOTAL_TIME
prompt =======================================
prompt
create or replace procedure dukepu.GET_Delay_Total_Time(v_Job_Number in varchar2,v_Year_And_Month in varchar2,v_Delay_Total_Time out NUMBER) AS
       type t_cur is ref cursor;
       day_cur t_cur;
       v_year_month_day date;
       v_year_month_day_str varchar2(20);
        --下班时间
       v_fpt_last_time date;
       v_Delay_Time_TEMP INT:=0;
       v_Rest_Day_Time NUMBER;
begin
     v_Delay_Total_Time:=0;
     ---获取某指定日期内的总延时 时间
     OPEN day_cur FOR
     SELECT FingerPrint_DATE,    ---指纹日期
            TO_CHAR(FingerPrint_Date,'YYYY-MM-DD'), ---指纹日期字符串。
            AR.Fpt_Last_Time                        ---最后一次指纹时间。
     FROM Attendance_Record AR
     WHERE JOB_NUMBER = v_JOB_NUMBER
     AND TRUNC(FingerPrint_DATE,'MM') =TO_DATE(v_year_and_month || '-01','YYYY-MM-DD');
     LOOP
         <<NEXT>>
         NULL;
         FETCH day_cur INTO v_year_month_day,
                            v_year_month_day_str,
                            v_fpt_last_time;
         EXIT WHEN day_cur%NOTFOUND;
         IF(v_fpt_last_time IS NULL) THEN

              GOTO NEXT;
         END IF;
         v_Delay_Time_TEMP := round((v_fpt_last_time- TO_DATE(v_year_month_day_str || ' 17:00:00','yyyy-MM-DD HH24:MI:SS'))*24*60);
         ---只要超过17:00  统一计算为延时。
         IF(v_Delay_Time_TEMP <=0) THEN
               GOTO NEXT;
         END IF;
         v_Delay_Total_Time := v_Delay_Total_Time +FLOOR(v_Delay_Time_TEMP/30) * 0.5;
     END LOOP;
     close day_cur;
     GET_Rest_Day_Time(v_Job_Number,v_Year_And_Month,v_Rest_Day_Time);
     v_Delay_Total_Time := v_Delay_Total_Time +v_Rest_Day_Time;
end GET_Delay_Total_Time;
/

prompt
prompt Creating procedure GET_DELAY_T_OF_WEE_HOURS_ORDIN
prompt =================================================
prompt
create or replace procedure dukepu.GET_Delay_t_of_wee_hours_Ordin(v_Job_Number in varchar2,v_Year_And_Month in varchar2,v_Delay_Total_Time out NUMBER) AS
       ---获取平日加班的 延时时间
       type t_cur is ref cursor;
       day_cur t_cur;
       v_year_month_day date;
       v_year_month_day_str varchar2(20);
       --最早刷卡时间
       v_fpt_first_time date;
        --下班时间
       v_fpt_last_time date;
       v_Delay_Time_TEMP INT:=0;
       v_count_flag INT;
       --凌晨加班： 未超过17:00 之前则取  fpt_last_time,
       --           17:00 之后则取  17:00的时间点。 
begin
     v_Delay_Total_Time:=0;
     ---获取某指定日期内的总延时 时间
     OPEN day_cur FOR
     SELECT Finger_Print_DATE,    ---指纹日期
            TO_CHAR(Finger_Print_Date,'YYYY-MM-DD'), ---指纹日期字符串。
            ARBriefly.fpt_first_time,
            ARBriefly.Fpt_Last_Time                        ---最后一次指纹时间。
     FROM Attendance_Record_Briefly ARBriefly
     WHERE JOB_NUMBER = v_JOB_NUMBER
     AND TRUNC(Finger_Print_DATE,'MM') =TO_DATE(v_year_and_month ,'yyyy-MM');
     LOOP
         <<NEXT>>
         NULL;

         FETCH day_cur INTO v_year_month_day,
                            v_year_month_day_str,
                            v_fpt_first_time,
                            v_fpt_last_time;
         EXIT WHEN day_cur%NOTFOUND;

          ---判断是否为加班日。
         SELECT COUNT(1) INTO v_count_flag
         FROM Rest_Day
         WHERE Rest_Day = v_year_month_day;

         --若为加班日,则非平日，进行下次循环。
         IF(v_count_flag=1) THEN
              GOTO NEXT;
         END IF;
         
         -----=========以下为工作日：========================================================= 
         --1.先判断是凌晨加班，条件为fpt_first_time <=05:00:00
         if(v_fpt_first_time is null)then
              GOTO NEXT;
         end if;
         IF(v_fpt_last_time IS NULL) THEN
              GOTO NEXT;
         END IF;
         
         ---5:00之后刷卡，则为正常班。
         IF(v_fpt_first_time >=to_date(v_year_month_day_str||' 05:00:00','yyyy-MM-dd HH24:MI:SS'))then
              GOTO NEXT;
         end if;
         --5:00之前刷卡，凌晨上班。
         --如果下班时间<13:00
         if(v_fpt_last_time<to_date(v_year_month_day_str||' 13:00:00','yyyy-MM-dd HH24:MI:SS'))then
             v_Delay_Time_TEMP := round((v_fpt_last_time- v_fpt_first_time)*24*60);
             IF(v_Delay_Time_TEMP <=0) THEN
               GOTO NEXT;
             END IF;
             --有正数值，计入结果。
             v_Delay_Total_Time := v_Delay_Total_Time +FLOOR(v_Delay_Time_TEMP/30) * 0.5;
             GOTO NEXT;
         end if;
         
         -- 以下为超过13:00 ，则减去中午1小时午餐时间
         /*
         --如果下班时间<=17:00
         if(v_fpt_last_time<=to_date(v_year_month_day_str||' 17:00:00','yyyy-MM-dd HH24:MI:SS'))then
              v_off_duty_time_of_wee_hours:=v_fpt_last_time;
          else --超过17:00 按17:00 算                                          
              v_off_duty_time_of_wee_hours:=to_date(v_year_month_day_str||' 17:00:00','yyyy-MM-dd HH24:MI:SS');
         end if;
          */
         
         v_Delay_Time_TEMP := round((v_fpt_last_time- v_fpt_first_time)*24*60);
         v_Delay_Time_TEMP := v_Delay_Time_TEMP-1*60;
         ---只要超过17:00  统一计算为延时。
         IF(v_Delay_Time_TEMP <=0) THEN
               GOTO NEXT;
         END IF;
         v_Delay_Total_Time := v_Delay_Total_Time +FLOOR(v_Delay_Time_TEMP/30) * 0.5;
     END LOOP;
     close day_cur;

end GET_Delay_t_of_wee_hours_Ordin;
/

prompt
prompt Creating procedure GET_DINNER_SUBSIDY_NUM
prompt =========================================
prompt
create or replace procedure dukepu.Get_Dinner_Subsidy_Num(v_JOB_NUMBER in varchar2, v_Year_And_Month_Str varchar2, v_Dinner_Subsidy_num out int) as
       type t_cur is ref cursor;
       day_cur t_cur;

       v_year_month_day date;
       v_year_month_day_str varchar2(20);

       --上班时间
       v_fpt_first_time date;
       --下班时间
       v_fpt_last_time date;

begin

  v_Dinner_Subsidy_num:=0;
  ---获取迟到次数。
       ---获取某指定日期内的总延时 时间
     OPEN day_cur FOR
     SELECT Finger_Print_DATE,
            TO_CHAR(Finger_Print_DATE,'YYYY-MM-DD'),
            ARBriefly.Fpt_First_Time,
            ARBriefly.Fpt_Last_Time
     FROM Attendance_Record_Briefly ARBriefly
     WHERE JOB_NUMBER = v_JOB_NUMBER
     AND TRUNC(Finger_Print_DATE,'MM') =TO_DATE(v_Year_And_Month_Str,'yyyy-MM');

     LOOP
         <<NEXT>>
         NULL;
         FETCH day_cur INTO v_year_month_day,v_year_month_day_str,v_fpt_first_time,v_fpt_last_time;
         EXIT WHEN day_cur%NOTFOUND;

         
         --===开始： 少打卡---====================
         IF(v_fpt_first_time IS NULL OR v_fpt_last_time IS NULL) THEN
            GOTO NEXT;
         END IF;
         --===结束：少打卡---====================
         
         ---======开始：第一次刷卡时间<=12:00,且上班市场超过4小时。=====================
         --IF(v_fpt_first_time <=TO_DATE(v_year_month_day_str||' 12:00:00','YYYY-MM-DD HH24:MI:SS') AND v_fpt_last_time >=TO_DATE(v_year_month_day_str || ' 12:40:00','YYYY-MM-DD HH24:MI:SS')) THEN
         IF(v_fpt_first_time <=TO_DATE(v_year_month_day_str||' 12:00:00','YYYY-MM-DD HH24:MI:SS')) THEN
              ---其次，上班时间必须超过４小时.
              IF(ROUND((v_fpt_last_time - v_fpt_first_time)*24)>4) THEN
                 v_Dinner_Subsidy_num:= v_Dinner_Subsidy_num +1;
                 GOTO NEXT;
              END IF;
         END IF;
         ---======结束：第一次刷卡时间<=12:00,且上班市场超过4小时。=====================
     END LOOP;
     CLOSE day_cur;

end Get_Dinner_Subsidy_Num;
/

prompt
prompt Creating procedure GET_DINNER_SUBSIDY_NUM_OF_ARS
prompt ================================================
prompt
create or replace procedure dukepu.Get_Dinner_Subsidy_Num_Of_ARS(v_JOB_NUMBER in varchar2, v_year_and_month varchar2, v_Dinner_Subsidy_num out int) as
       type t_cur is ref cursor;
       day_cur t_cur;

       v_year_month_day date;
       v_year_month_day_str varchar2(20);

       --上班时间
       v_fpt_first_time date;
       --下班时间
       v_fpt_last_time date;


begin

  v_Dinner_Subsidy_num:=0;
  ---获取迟到次数。
       ---获取某指定日期内的总延时 时间
     OPEN day_cur FOR
     SELECT FingerPrint_DATE,TO_CHAR(FingerPrint_Date,'YYYY-MM-DD'),ARS.Fpt_First_Time,ARS.Fpt_Last_Time
     FROM Attendance_Record_Summary ARS
     WHERE JOB_NUMBER = v_JOB_NUMBER
     AND TRUNC(FingerPrint_DATE,'MM') =TO_DATE(v_year_and_month,'yyyy-MM');

     LOOP
         <<NEXT>>
         NULL;
       FETCH day_cur INTO v_year_month_day,v_year_month_day_str,v_fpt_first_time,v_fpt_last_time;
       EXIT WHEN day_cur%NOTFOUND;


       --判断起始时间，和终止时间是否都存在
       IF(v_fpt_first_time IS NULL OR v_fpt_last_time IS NULL) THEN
          GOTO NEXT;
       END IF;

       ---判断是否包含范围12:00 --12:40
       IF(v_fpt_first_time <=TO_DATE(v_year_month_day_str||' 12:00:00','YYYY-MM-DD HH24:MI:SS') AND v_fpt_last_time >=TO_DATE(v_year_month_day_str || ' 12:40:00','YYYY-MM-DD HH24:MI:SS')) THEN

            ---其次，上班时间必须超过４小时.
            IF(ROUND((v_fpt_last_time - v_fpt_first_time)*24)>4) THEN
               v_Dinner_Subsidy_num:= v_Dinner_Subsidy_num +1;
               GOTO NEXT;
            END IF;
       END IF;

     END LOOP;
     CLOSE day_cur;

end Get_Dinner_Subsidy_Num_Of_ARS;
/

prompt
prompt Creating procedure GET_DURATION_OF_OVERTIME_DAY
prompt ===============================================
prompt
create or replace procedure dukepu.GET_duration_of_overtime_day(v_Job_Number in varchar2,v_Year_And_Month_Str in varchar2,v_duration_of_days_of_overtime out NUMBER) AS

       type t_cur is ref cursor;
       day_cur t_cur;
       v_year_month_day date;
       v_year_month_day_str varchar2(20);
       --正常下班时间
       v_normal_off_duty_time date;
       --正常上班时间
       v_normal_on_duty_time date;
       --正午时刻
       v_highnoon_time       date;
       --上班时间
       v_fpt_first_time date;
        --下班时间
       v_fpt_last_time date;
       v_Rest_Day_Time_Temp INT:=0;
       V_COUNT INT:=0;

begin
       v_duration_of_days_of_overtime:=0;
     ---获取某指定日期内的总延时 时间
     OPEN day_cur FOR
     SELECT Finger_Print_DATE,    ---指纹日期
            to_char(Finger_Print_DATE,'yyyy-MM-dd'),
            ARBriefly.Fpt_First_Time,
            ARBriefly.Fpt_Last_Time                        ---最后一次指纹时间。
     FROM Attendance_Record_Briefly ARBriefly
     WHERE JOB_NUMBER = v_JOB_NUMBER
     AND TRUNC(Finger_Print_DATE,'MM') =TO_DATE(v_Year_And_Month_Str,'YYYY-MM');
     LOOP
         <<NEXT>>
         NULL;
         --循环中的第一句，应该用以处理游标
         -----以下为加班日
         FETCH day_cur INTO v_year_month_day,
                            v_year_month_day_str,
                            v_fpt_first_time,
                            v_fpt_last_time;
         EXIT WHEN day_cur%NOTFOUND;  
          
         SELECT COUNT(1) INTO V_COUNT
         FROM Rest_Day
         WHERE Rest_Day = v_year_month_day;
         
         IF(v_Count=0)THEN
              ---非加班日，不做 计算 。
              GOTO NEXT;
         END IF;
         
         
         IF(v_fpt_first_time is NULL) THEN
              GOTO NEXT;
         END IF;
         IF(v_fpt_last_time IS NULL) THEN
              GOTO NEXT;
         END IF;
         
       
         ---设定 正常 下班时间 。
         v_normal_off_duty_time:=to_date(v_year_month_day_str || ' 17:00:00','yyyy-MM-dd hh24:mi:ss');
         v_normal_on_duty_time:=to_date(v_year_month_day_str || ' 08:00:00','yyyy-MM-dd hh24:mi:ss');
         v_highnoon_time:=to_date(v_year_month_day_str|| ' 12:00:00','yyyy-MM-dd hh24:mi:ss');
         /*
         ---若加班起始时间晚于8:00，下班时间晚于17:00
         IF(v_fpt_first_time>=v_normal_on_duty_time AND v_fpt_last_time >v_normal_off_duty_time ) THEN
              ---加班日工作时长为： 17:00-  加班起始时间
              v_Rest_Day_Time_Temp:= round((v_normal_off_duty_time- v_fpt_first_time)*24*60);
         ELSIF(v_fpt_first_time<v_normal_on_duty_time AND v_fpt_last_time >v_normal_off_duty_time ) THEN
              v_Rest_Day_Time_Temp:= round((v_normal_off_duty_time- v_normal_on_duty_time)*24*60);
         ELSIF(v_fpt_first_time<v_normal_on_duty_time AND v_fpt_last_time <v_normal_off_duty_time) THEN
              v_Rest_Day_Time_Temp := round((v_fpt_last_time- v_normal_on_duty_time)*24*60);
         ELSE
              v_Rest_Day_Time_Temp := round((v_fpt_last_time- v_fpt_first_time)*24*60);
         END IF;*/
         --工作 时长。
         if(v_fpt_first_time<= v_normal_on_duty_time) then
               v_fpt_first_time:=v_normal_on_duty_time;
         end if;
         v_Rest_Day_Time_Temp:=round((v_fpt_last_time- v_fpt_first_time)*24*60);
         --跨越正午时刻，总时间减去1小时。
         IF(v_fpt_first_time <=v_highnoon_time AND v_fpt_last_time >=v_highnoon_time) THEN
              v_Rest_Day_Time_Temp := v_Rest_Day_Time_Temp -1*60;
         END IF;

         IF(v_Rest_Day_Time_Temp<0) THEN
             v_Rest_Day_Time_Temp:=0 ;
         END IF;

         v_duration_of_days_of_overtime := v_duration_of_days_of_overtime +FLOOR(v_Rest_Day_Time_Temp/30) * 0.5;


     END LOOP;
     close day_cur;

end GET_duration_of_overtime_day;
/

prompt
prompt Creating procedure GET_DURATION_OVERTIME_DAY_ARS
prompt ================================================
prompt
create or replace procedure dukepu.get_duration_overtime_day_ARS(v_Job_Number in varchar2,v_Year_And_Month in varchar2,v_duration_of_days_of_overtime out NUMBER) AS
       --计算 休息日的 加班时长
       type t_cur is ref cursor;
       day_cur t_cur;
       v_year_month_day date;
       v_year_month_day_str varchar2(20);
       --正常下班时间
       v_normal_off_duty_time date;
       --正常上班时间
       v_normal_on_duty_time date;
       --正午时刻
       v_highnoon_time       date;
       --上班时间
       v_fpt_first_time date;
        --下班时间
       v_fpt_last_time date;
       v_Rest_Day_Time_Temp INT:=0;
       V_COUNT INT:=0;
begin
       v_duration_of_days_of_overtime:=0;
     ---获取某指定日期内的总延时 时间
     OPEN day_cur FOR
     SELECT FingerPrint_DATE,    ---指纹日期
            to_char(FingerPrint_DATE,'yyyy-MM-dd'),
            A_R_S.Fpt_First_Time,
            A_R_S.Fpt_Last_Time                        ---最后一次指纹时间。
     FROM Attendance_Record_Summary A_R_S
     WHERE JOB_NUMBER = v_JOB_NUMBER
     AND TRUNC(FingerPrint_DATE,'MM') =TO_DATE(v_year_and_month,'YYYY-MM');
     LOOP
         <<NEXT>>
         NULL;
         FETCH day_cur INTO v_year_month_day,
                            v_year_month_day_str,
                            v_fpt_first_time,
                            v_fpt_last_time;
         EXIT WHEN day_cur%NOTFOUND;
         SELECT COUNT(1) INTO V_COUNT
         FROM Rest_Day
         WHERE Rest_Day = v_year_month_day;

         IF(v_Count=0)THEN
              ---非加班日，不做 计算 。
              GOTO NEXT;
         END IF;
         dbms_output.put_line(to_char(v_fpt_first_time,'yyyy-MM-dd HH24:MI:SS'));
         IF(v_fpt_first_time is NULL AND v_fpt_last_time is NOT NULL) THEN
             dbms_output.put_line('hello world!');
             IF(v_fpt_last_time >to_date(v_year_month_day_str || ' 13:00:00','yyyy-MM-dd hh24:mi:ss')) then

                 v_fpt_first_time:= to_date(v_year_month_day_str || ' 13:00:00','yyyy-MM-dd hh24:mi:ss');
             ELSE
                 v_fpt_first_time:= to_date(v_year_month_day_str || ' 08:00:00','yyyy-MM-dd hh24:mi:ss');
             END IF;

             dbms_output.put_line(to_char(v_fpt_first_time,'yyyy-MM-dd HH24:MI:SS'));
         END IF;
         IF(v_fpt_first_time is NOT NULL AND v_fpt_last_time IS NULL) THEN
              IF(v_fpt_first_time <to_date(v_year_month_day_str || ' 12:00:00','yyyy-MM-dd hh24:mi:ss')) then

                 v_fpt_last_time:= to_date(v_year_month_day_str || ' 12:00:00','yyyy-MM-dd hh24:mi:ss');
              ELSE
                 v_fpt_last_time:= to_date(v_year_month_day_str || ' 17:00:00','yyyy-MM-dd hh24:mi:ss');
              END IF;
         END IF;

         ---设定 正常 下班时间 。
         v_normal_off_duty_time:=to_date(v_year_month_day_str || ' 17:00:00','yyyy-MM-dd hh24:mi:ss');
         v_normal_on_duty_time:=to_date(v_year_month_day_str || ' 08:00:00','yyyy-MM-dd hh24:mi:ss');
         v_highnoon_time:=to_date(v_year_month_day_str|| ' 12:00:00','yyyy-MM-dd hh24:mi:ss');
         /*
         ---若加班起始时间晚于8:00，下班时间晚于17:00
         IF(v_fpt_first_time>=v_normal_on_duty_time AND v_fpt_last_time >v_normal_off_duty_time ) THEN
              ---加班日工作时长为： 17:00-  加班起始时间
              v_Rest_Day_Time_Temp:= round((v_normal_off_duty_time- v_fpt_first_time)*24*60);
         ELSIF(v_fpt_first_time<v_normal_on_duty_time AND v_fpt_last_time >v_normal_off_duty_time ) THEN
              v_Rest_Day_Time_Temp:= round((v_normal_off_duty_time- v_normal_on_duty_time)*24*60);
         ELSIF(v_fpt_first_time<v_normal_on_duty_time AND v_fpt_last_time <v_normal_off_duty_time) THEN
              v_Rest_Day_Time_Temp := round((v_fpt_last_time- v_normal_on_duty_time)*24*60);
         ELSE
              v_Rest_Day_Time_Temp := round((v_fpt_last_time- v_fpt_first_time)*24*60);
         END IF;*/
         --工作 时长。
         v_Rest_Day_Time_Temp:=round((v_fpt_last_time- v_fpt_first_time)*24*60);
         --跨越正午时刻，总时间减去1小时。
         IF(v_fpt_first_time <=v_highnoon_time AND v_fpt_last_time >=v_highnoon_time) THEN
              v_Rest_Day_Time_Temp := v_Rest_Day_Time_Temp -1*60;
         END IF;

         IF(v_Rest_Day_Time_Temp<0) THEN
             v_Rest_Day_Time_Temp:=0 ;
         END IF;

         v_duration_of_days_of_overtime := v_duration_of_days_of_overtime +FLOOR(v_Rest_Day_Time_Temp/30) * 0.5;
     END LOOP;
     close day_cur;

end get_duration_overtime_day_ARS;
/

prompt
prompt Creating procedure GET_D_T_ORDINARY_DAYS_OF_A_R_S
prompt =================================================
prompt
create or replace procedure dukepu.get_d_t_ordinary_days_of_A_R_S(v_Job_Number in varchar2,v_Year_And_Month in varchar2,v_Delay_Total_Time out NUMBER) AS
       ---获取平日加班的 延时时间

       type t_cur is ref cursor;
       day_cur t_cur;
       v_year_month_day date;
       v_year_month_day_str varchar2(20);
        --下班时间
       v_fpt_last_time date;
       v_Delay_Time_TEMP INT:=0;
       v_count INT;
begin
     v_Delay_Total_Time:=0;
     ---获取某指定日期内的总延时 时间
     OPEN day_cur FOR
     SELECT FingerPrint_DATE,    ---指纹日期
            TO_CHAR(FingerPrint_Date,'YYYY-MM-DD'), ---指纹日期字符串。
            A_R_S.Fpt_Last_Time                        ---最后一次指纹时间。
     FROM Attendance_Record_Summary A_R_S
     WHERE JOB_NUMBER = v_JOB_NUMBER
     AND TRUNC(FingerPrint_DATE,'MM') =TO_DATE(v_year_and_month ,'yyyy-MM');
     LOOP
         <<NEXT>>
         NULL;

         FETCH day_cur INTO v_year_month_day,
                            v_year_month_day_str,
                            v_fpt_last_time;
         EXIT WHEN day_cur%NOTFOUND;

          ---判断是否为加班日。
         SELECT COUNT(1) INTO v_Count
         FROM Rest_Day
         WHERE Rest_Day = v_year_month_day;

         --若为加班日,则非平日，进行下次循环。
         IF(v_Count=1) THEN
              GOTO NEXT;
         END IF;

         IF(v_fpt_last_time IS NULL) THEN

              GOTO NEXT;
         END IF;
         v_Delay_Time_TEMP := round((v_fpt_last_time- TO_DATE(v_year_month_day_str || ' 17:00:00','yyyy-MM-DD HH24:MI:SS'))*24*60);
         ---只要超过17:00  统一计算为延时。
         IF(v_Delay_Time_TEMP <=0) THEN
               GOTO NEXT;
         END IF;
         v_Delay_Total_Time := v_Delay_Total_Time +FLOOR(v_Delay_Time_TEMP/30) * 0.5;
     END LOOP;
     close day_cur;

end get_d_t_ordinary_days_of_A_R_S;
/

prompt
prompt Creating procedure GET_JOB_NUMBER
prompt =================================
prompt
create or replace procedure dukepu.GET_JOB_NUMBER(V_JOB_NUMBER OUT VARCHAR2 ) AS
  v_Next_seq  INT;
  v_Count INT;
  str_Next_Seq VARCHAR2(10);
begin

  SELECT Count(1) INTO v_Count
  FROM EMPLOYEES
  WHERE SUBSTR(JOB_NUMBER,1,6) = TO_CHAR(SYSDATE,'YYMMDD');

  IF(v_Count =0) THEN
             v_Next_Seq := 1;
  ELSE
      SELECT (MAX(SUBSTR(JOB_NUMBER,LENGTH(JOB_NUMBER)-2,3)) +1) INTO v_Next_Seq
      FROM EMPLOYEES
      WHERE JOB_NUMBER != 'admin'
      AND JOB_NUMBER != 'query'
      AND SUBSTR(JOB_NUMBER,1,6) = TO_CHAR(SYSDATE,'YYMMDD');
  END IF;

  str_Next_Seq:= CAST(v_Next_Seq AS VARCHAR2);
  V_JOB_NUMBER:= TO_CHAR(SYSDATE,'YYMMDD') || LPAD(str_Next_Seq,3,'0');

end GET_JOB_NUMBER;
/

prompt
prompt Creating procedure GET_LACK_FINGERPRINT_TIMES
prompt =============================================
prompt
create or replace procedure dukepu.Get_lack_FingerPrint_Times(v_Job_Number in varchar2,v_year_and_month_str in varchar2,v_lack_FingerPrint_Times out int) as

       type t_cur is ref cursor;
       day_cur t_cur;

       v_year_month_day date;
       v_year_month_day_str varchar2(20);

       ---上班时间
       v_fpt_first_time date;
     --下班时间
       v_fpt_last_time date;

       v_Count_flag INT;

       --v_leave_Start_time Ask_For_leave.Leave_Start_Time%type;
       --v_leave_end_Time   ASK_FOR_Leave.Leave_End_Time%type;

begin
     v_lack_FingerPrint_Times:=0;
     
     
     --条件： 某月 
     --结果： 记录集，  刷卡日期，刷卡日期字符串，首次刷卡时间，最后一次刷卡时间
     OPEN day_cur FOR
     SELECT Finger_Print_DATE,
            TO_CHAR(Finger_Print_Date,'YYYY-MM-DD'),
            ARBriefly.Fpt_First_Time,
            ARBriefly.Fpt_Last_Time
     FROM Attendance_Record_briefly ARBriefly
     WHERE JOB_NUMBER = v_JOB_NUMBER 
     AND (ARBriefly.Fpt_First_Time IS NULL OR ARBriefly.Fpt_Last_Time IS NULL)
     AND TRUNC(Finger_Print_DATE,'MM') = TO_DATE(v_year_and_month_str|| '-01','YYYY-MM-DD');

     LOOP
         <<NEXT>>
         NULL;
         FETCH day_cur INTO v_year_month_day,v_year_month_day_str,v_fpt_first_time,v_fpt_last_time;
         EXIT WHEN day_cur%NOTFOUND;
         
          --查找休息日，将标识符存于 v_Count_flag_flag
          SELECT COUNT(1) INTO v_Count_flag
          FROM Rest_Day
          WHERE Rest_Day = v_year_Month_day;
          
          IF(v_Count_flag >=1) THEN
                GOTO NEXT;     ---正常休息日，不计算,
          END IF;

       
          --判断当天是否为星期六.--  星期六不计算 少打卡。
          IF('星期六'=TO_CHAR(v_year_Month_day,'DAY')) THEN 
               GOTO NEXT;
          END IF;
                  
          ---判断是否为请假日
          ---2. 正常工作日，判断当天是否请假。
          SELECT COUNT(1) INTO v_Count_flag
          FROM ASK_FOR_LEAVE A_F_L
          WHERE JOB_NUMBER = v_JOB_NUMBER
          AND TRUNC(leave_date,'DD') = v_year_Month_day;
          
          ----开始： 未请假---------------------------------------------------------------------------------
          IF (v_Count_flag = 0) THEN
             --若上下班卡都未刷，有可能是请假，不做统计
             IF(v_fpt_first_time is null and v_fpt_last_time is null)then
                  goto next;
             end if;
             ---少刷上班卡。
             IF(v_fpt_first_time IS NULL) THEN
                  v_lack_FingerPrint_Times:=  v_lack_FingerPrint_Times +1;
                  GOTO NEXT;
             END IF;
             --少刷下班卡
             IF (v_fpt_last_time is NULL) THEN
                  v_lack_FingerPrint_Times:=  v_lack_FingerPrint_Times +1;
                  GOTO NEXT;
             END IF;
             --，上，下班是否刷卡检查完毕。
             GOTO NEXT;
          END IF;
          ---结束： 未请假---------------------------------------------------------------------------
          
          --===开始： 请假了===========================================================================
          SELECT COUNT(1) INTO v_Count_flag
          FROM ASK_FOR_LEAVE A_F_L
          WHERE JOB_NUMBER = v_JOB_NUMBER
          AND TRUNC(A_F_L.Leave_Date,'DD') = v_year_Month_day
          AND A_F_L.leave_start_time <= TO_DATE(v_year_month_day_str || ' 08:00:00','yyyy-MM-dd HH24:MI:SS')  ---从8点开始起假;
          AND A_F_L.Leave_end_Time >=TO_DATE(v_year_month_day_str || ' 17:00:00','yyyy-MM-dd HH24:MI:SS');  ---从17:00 开始下班;
          
          ---开始：请的全天假期-------------------------------------------------
          IF(v_Count_flag >= 1) THEN
              --- 请了全天假
              GOTO NEXT;
          END IF;
          ---结束： 请的全天假期 ---------------------------------------------
          
          --开始：请的早上假----- 8:00 -- 13:00 ------------------------------------------------
          SELECT COUNT(1) INTO v_Count_flag
          FROM ASK_FOR_LEAVE A_F_L
          WHERE JOB_NUMBER = v_JOB_NUMBER
          AND TRUNC(A_F_L.Leave_Date,'DD') = v_year_Month_day
          AND A_F_L.leave_start_time <=TO_DATE(v_year_month_day_str || ' 08:00:00','yyyy-MM-dd HH24:MI:SS')  
          AND A_F_L.Leave_end_Time <=TO_DATE(v_year_month_day_str || ' 12:00:00','yyyy-MM-dd HH24:MI:SS');  
          ----请早上假--------------------------------------------------
          IF(v_Count_flag >= 1) THEN
               -----检查历史记录中是否 存在刷卡时间大于13:00的记录，如果有，表示下午正常出勤-----------------
               SELECT COUNT(1) INTO v_Count_flag
               FROM Attendance_Record_Detail ARDetail
               WHERE JOB_NUMBER = v_JOB_NUMBER
               AND trunc(ARDetail.Finger_Print_Date,'DD') = v_year_Month_day
               AND ARDetail.Finger_Print_Time>=TO_DATE(v_year_month_day_str || ' 13:00:00','yyyy-MM-dd HH24:MI:SS'); 
               --下午没有刷卡记录，表示少刷一次卡。
               IF(v_Count_flag =0) THEN
                     v_lack_FingerPrint_Times := v_lack_FingerPrint_Times + 1; 
               END IF;
               --下午有刷卡记录
               ---什么都不做.
               --下一次循环 GOTO NEXT;    
          END IF;
          ---结束: 请的早上假期------------------------------------------------------------
          
          --开始：请的下午假, 13:00 - 17:00 -----------------------------------------------------------------
          SELECT COUNT(1) INTO v_Count_flag
          FROM ASK_FOR_LEAVE A_F_L
          WHERE JOB_NUMBER = v_JOB_NUMBER
          AND TRUNC(A_F_L.Leave_Date,'DD') = v_year_Month_day
          AND A_F_L.leave_start_time >= TO_DATE(v_year_month_day_str || ' 13:00:00','yyyy-MM-dd HH24:MI:SS') 
          AND A_F_L.Leave_end_Time <=TO_DATE(v_year_month_day_str || ' 17:00:00','yyyy-MM-dd HH24:MI:SS');  
          --请了下午假--------------------------------
          IF(v_Count_flag >= 1) THEN
               --检查上班卡，是否没刷上。
               --检查 8:00前有没有刷卡。
               SELECT COUNT(1) INTO v_Count_flag
               FROM Attendance_Record_Detail ARDetail
               WHERE JOB_NUMBER = v_JOB_NUMBER
               AND trunc(ARDetail.Finger_Print_Date,'DD') = v_year_Month_day
               AND ARDetail.Finger_Print_Time<=TO_DATE(v_year_month_day_str || ' 08:00:00','yyyy-MM-dd HH24:MI:SS'); 
               --8点之前没有刷卡记录，则认为少刷一次卡。
               IF(v_Count_flag =0) THEN
                     v_lack_FingerPrint_Times := v_lack_FingerPrint_Times + 1;
               END IF;
               --8点之前有刷卡记录,do nothing, 进入下次循环。
               ---如果上班卡时间超过12:00,被计为无效卡.
               GOTO NEXT;
          END IF;
          ---结束： 请的下午假---------------------------------------------------------------
          
          --===结束： 请假了===========================================================================
          GOTO NEXT;
     END LOOP;
end Get_lack_FingerPrint_Times;
/

prompt
prompt Creating procedure GET_LEAVE_EARLY_NUM
prompt ======================================
prompt
create or replace procedure dukepu.get_Leave_Early_Num(v_Job_Number in varchar2,v_Year_And_Month_Str in varchar2,v_Leave_Early_Num out int) AS

       type t_cur is ref cursor;
       day_cur t_cur;

       v_year_month_day date;
       v_year_month_day_str varchar2(20);
       
       v_fpt_first_time date;
       --下班时间
       v_fpt_last_time date;

       --当天下班时间
       v_off_duty_time date;

       v_COUNT INT;
begin
    
     UPDATE Attendance_Record_Briefly
     SET LEAVE_EARLY_NUM = NULL
     WHERE JOB_NUMBER = v_JOB_NUMBER 
     AND TRUNC(Finger_Print_DATE,'MM') =TO_DATE(v_Year_And_Month_Str,'yyyy-MM');
     
     v_Leave_Early_Num:=0;

     
  ---获取迟到次数。
       ---获取某指定日期内的总延时 时间
     OPEN day_cur FOR
     SELECT Finger_Print_DATE,
            TO_CHAR(Finger_Print_DATE,'YYYY-MM-DD'),
            ARBriefly.fpt_first_time,
            ARBriefly.Fpt_Last_Time
     FROM Attendance_Record_Briefly ARBriefly
     WHERE JOB_NUMBER = v_JOB_NUMBER
     AND TRUNC(Finger_Print_DATE,'MM') =TO_DATE(v_Year_And_Month_Str,'yyyy-MM');

     LOOP
         <<NEXT>>
         NULL;

         FETCH day_cur INTO v_year_month_day,
                            v_year_month_day_str,
                            v_fpt_first_time,
                            v_fpt_last_time;
         EXIT WHEN day_cur%NOTFOUND;
         IF(v_fpt_last_time IS NULL) THEN    ---如果未 刷下班卡，没法计算迟到次数。

              GOTO NEXT;
         END IF;
         
         --判断 今天 是否 为 加班日
         SELECT COUNT(1) INTO v_COUNT
         FROM Rest_Day
         WHERE Rest_Day= TO_DATE(v_year_month_day_str,'yyyy-MM-dd');

         --======开始：加班日，-================----------------
         IF(1=v_Count) THEN
             GOTO NEXT;
         END IF;
         --====结束： 加班日============================

         ---=====开始：凌晨起打卡, 不计算早退。=====================================================
         IF(v_fpt_first_time < to_date(v_year_month_day_str||' 05:00:00','yyyy-MM-dd HH24:MI:SS')) then
           GOTO NEXT;
         End if;
         ---=====结束: =============================================
         
         ---====开始： 正常工作日======================
         v_off_duty_time:= TO_DATE(v_year_month_day_str || '17:00:00','yyyy-MM-dd HH24:MI:SS');

         IF(v_fpt_last_time>=v_off_duty_time) THEN
              GOTO NEXT;

         END IF;
         ---结束：正常工作日-------------------------------------------
         
        v_Leave_Early_Num:=v_Leave_Early_Num+1;
        
        update Attendance_Record_Briefly 
        set leave_early_num =1
        WHERE JOB_NUmBER = v_job_number
        AND TrUNC(finger_print_date,'DD') = v_year_month_day;
     END LOOP;
     CLOSE day_cur;

end get_Leave_Early_Num;
/

prompt
prompt Creating procedure GET_LEAVE_EARLY_NUM_OF_ARS
prompt =============================================
prompt
create or replace procedure dukepu.get_Leave_Early_Num_Of_ARS(v_Job_Number in varchar2,v_Year_And_Month in varchar2,v_Leave_Early_Num out int) AS

       type t_cur is ref cursor;
       day_cur t_cur;

       v_year_month_day date;
       v_year_month_day_str varchar2(20);

       --下班时间
       v_fpt_last_time date;

       --当天下班时间
       v_off_duty_time date;

       v_COUNT INT;
begin
     v_Leave_Early_Num:=0;


        ---先进行 清空
            --更新 当日 的 考勤记录
        UPDATE Attendance_Record_Summary
        SET LEAVE_EARLY_NUM = 0
        WHERE JOB_NUMBER = v_Job_Number
        AND trunc(fingerprint_date,'MM')= TO_DATE(v_Year_And_Month,'yyyy-MM');

  ---获取迟到次数。
       ---获取某指定日期内的总延时 时间
     OPEN day_cur FOR
     SELECT FingerPrint_DATE,TO_CHAR(FingerPrint_Date,'YYYY-MM-DD'),ARS.Fpt_Last_Time
     FROM Attendance_Record_Summary ARS
     WHERE JOB_NUMBER = v_JOB_NUMBER
     AND TRUNC(FingerPrint_DATE,'MM') =TO_DATE(v_year_and_month,'yyyy-MM');

     LOOP
         <<NEXT>>
         NULL;

         FETCH day_cur INTO v_year_month_day,v_year_month_day_str,v_fpt_last_time;
         EXIT WHEN day_cur%NOTFOUND;
         IF(v_fpt_last_time IS NULL) THEN    ---如果未 刷下班卡，没法计算迟到次数。

              GOTO NEXT;
         END IF;

         ---刷了上班卡.
         --判断今天是否是公司休息日.

         --判断 今天 是否 为 加班日
         SELECT COUNT(1) INTO v_COUNT
         FROM Rest_Day
         WHERE Rest_Day= TO_DATE(v_year_month_day_str,'yyyy-MM-dd');

         --加班日，不计算早退
         IF(1=v_Count) THEN
             GOTO NEXT;
         END IF;

         v_off_duty_time:= TO_DATE(v_year_month_day_str || '17:00:00','yyyy-MM-dd HH24:MI:SS');

         IF(v_fpt_last_time>=v_off_duty_time) THEN
              GOTO NEXT;

         END IF;

          --更新 当日 的 考勤记录
        UPDATE Attendance_Record_Summary
        SET LEAVE_EARLY_NUM = 1
        WHERE JOB_NUMBER = v_Job_Number
        AND fingerprint_date= v_year_month_day;

        v_Leave_Early_Num:=v_Leave_Early_Num+1;
     END LOOP;
     CLOSE day_cur;

end get_Leave_Early_Num_Of_ARS;
/

prompt
prompt Creating procedure GET_NOT_FINGERPRINT_TIMES
prompt ============================================
prompt
create or replace procedure dukepu.Get_Not_FingerPrint_Times(v_Job_Number in varchar2,v_year_and_month in varchar2,v_NOT_FingerPrint_Times out int) as

       type t_cur is ref cursor;
       day_cur t_cur;

       v_year_month_day date;
       v_year_month_day_str varchar2(20);

       ---上班时间
       v_fpt_first_time date;
     --下班时间
       v_fpt_last_time date;

       v_Count INT;

       v_leave_Start_time Ask_For_leave.Leave_Start_Time%type;
       v_leave_end_Time   ASK_FOR_Leave.Leave_End_Time%type;

begin
     v_NOT_FingerPrint_Times:=0;

     OPEN day_cur FOR
     SELECT FingerPrint_DATE,TO_CHAR(FingerPrint_Date,'YYYY-MM-DD'),AR.Fpt_First_Time,AR.Fpt_Last_Time
     FROM Attendance_Record AR
     WHERE JOB_NUMBER = v_JOB_NUMBER
     AND (AR.Fpt_First_Time IS NULL OR AR.Fpt_Last_Time IS NULL)
     AND TRUNC(FingerPrint_DATE,'MM') = TO_DATE(v_year_and_month|| '-01','YYYY-MM-DD');

     LOOP
         <<NEXT>>
         NULL;
         FETCH day_cur INTO v_year_month_day,v_year_month_day_str,v_fpt_first_time,v_fpt_last_time;
         EXIT WHEN day_cur%NOTFOUND;


         ---未出勤,不计算未打卡.
         IF(v_fpt_first_time IS NULL AND v_fpt_last_time IS NULL) THEN
             GOTO NEXT;
         END IF;


         ---判断今天是否为公司休息日。
                ---1.先判断今日是否为公司正常休息日.
          -- 弃用
          /*
          SELECT COUNT(1) INTO v_COUNT
          FROM DUAL
          WHERE EXISTS(
            select 1
            from Attendance_Record AR
            where (AR.Fpt_First_Time IS NOT NULL OR AR.Fpt_Last_Time IS NOT NULL)
                  AND trunc(AR.fingerprint_date,'DD') =v_year_Month_day
                  having count(1) < 99
          );
          */
          --启用
          SELECT COUNT(1) INTO v_COUNT
          FROM Rest_Day
          WHERE Rest_Day = v_year_Month_day;
          
          IF(v_COUNT >=1) THEN
                GOTO NEXT;     ---正常休息日，不计算
          END IF;
          ---判断是否为请假日
          ---2. 正常工作日，判断当天是否请假。
          SELECT COUNT(1) INTO v_Count
          FROM ASK_FOR_LEAVE A_F_L
          WHERE JOB_NUMBER = v_JOB_NUMBER
          AND TRUNC(A_F_L.leave_start_time,'DD') = v_year_Month_day;
          ---未请假
          IF (v_Count = 0) THEN
             ---正常班
             IF(v_fpt_first_time IS NULL AND v_fpt_last_time is not null) THEN
                  v_NOT_FingerPrint_Times:=  v_NOT_FingerPrint_Times +1;
             ELSIF (v_fpt_first_time IS NOT NULL AND v_fpt_last_time is  null) THEN
                  v_NOT_FingerPrint_Times:=  v_NOT_FingerPrint_Times +1;
             END IF;
             GOTO NEXT;
          END IF;

          ---请假了。
          --是否请了全天假期
          SELECT COUNT(1) INTO v_Count
          FROM ASK_FOR_LEAVE A_F_L
          WHERE JOB_NUMBER = v_JOB_NUMBER
          AND TRUNC(A_F_L.leave_start_time,'DD') = v_year_Month_day
          AND A_F_L.leave_start_time <= TO_DATE(v_year_month_day_str || ' 08:00:00','yyyy-MM-dd HH24:MI:SS')  ---从8点开始起假;
          AND A_F_L.Leave_end_Time >=TO_DATE(v_year_month_day_str || ' 17:00:00','yyyy-MM-dd HH24:MI:SS');  ---从17:00 开始下班;

          IF(v_Count >= 1) THEN
              --- 请了全天假
              GOTO NEXT;
          END IF;
          --是否请的早上假
          SELECT COUNT(1) INTO v_Count
          FROM ASK_FOR_LEAVE A_F_L
          WHERE JOB_NUMBER = v_JOB_NUMBER
          AND TRUNC(A_F_L.leave_start_time,'DD') = v_year_Month_day
          AND A_F_L.leave_start_time <=TO_DATE(v_year_month_day_str || ' 08:00:00','yyyy-MM-dd HH24:MI:SS')  ---从8点开始起假;
          AND A_F_L.Leave_end_Time <TO_DATE(v_year_month_day_str || ' 12:00:00','yyyy-MM-dd HH24:MI:SS');  ---从17:00 开始下班;
          IF(v_Count >= 1) THEN
               --检查下班卡，是否没刷上。
               IF(v_fpt_last_time is null) THEN
                     v_NOT_FingerPrint_Times := v_NOT_FingerPrint_Times + 1;
                     GOTO NEXT;
               END IF;
               ---如果下班时间<=12:30,认为刷卡无效
               IF(v_fpt_last_time<=TO_DATE(v_year_month_day_str || ' 12:30:00','yyyy-MM-dd HH24:MI:SS')) THEN
                   v_NOT_FingerPrint_Times := v_NOT_FingerPrint_Times + 1;
                   GOTO NEXT;
               END IF;

          END IF;
          --是否请的下午假
          SELECT COUNT(1) INTO v_Count
          FROM ASK_FOR_LEAVE A_F_L
          WHERE JOB_NUMBER = v_JOB_NUMBER
          AND TRUNC(A_F_L.leave_start_time,'DD') = v_year_Month_day
          AND A_F_L.leave_start_time > TO_DATE(v_year_month_day_str || ' 08:00:00','yyyy-MM-dd HH24:MI:SS')  ---从8点开始起假;
          AND A_F_L.Leave_end_Time >= TO_DATE(v_year_month_day_str || ' 17:00:00','yyyy-MM-dd HH24:MI:SS');  ---从17:00 开始下班;
          IF(v_Count >= 1) THEN
               --检查上班卡，是否没刷上。
               IF(v_fpt_first_time is null) THEN
                     v_NOT_FingerPrint_Times := v_NOT_FingerPrint_Times + 1;
                     GOTO NEXT;
               END IF;
               ---如果上班卡时间超过12:00,被计为无效卡.
               IF(v_fpt_first_time > TO_DATE(v_year_month_day_str || ' 12:00:00','yyyy-MM-dd HH24:MI:SS')) THEN
                    v_NOT_FingerPrint_Times := v_NOT_FingerPrint_Times + 1;
                     GOTO NEXT;
               END IF;
          END IF;
          --请的假是中间，要求两头都要刷卡。
          IF(v_fpt_first_time IS NULL) THEN
             v_NOT_FingerPrint_Times := v_NOT_FingerPrint_Times + 1;
             GOTO NEXT;
          ELSIF(v_fpt_last_time IS NULL) THEN
             v_NOT_FingerPrint_Times := v_NOT_FingerPrint_Times + 1;
              GOTO NEXT;
          END IF;

          SELECT A_F_L.Leave_Start_Time,A_F_L.Leave_End_Time INTO v_Leave_Start_Time,v_Leave_End_Time
          FROM ASK_FOR_LEAVE A_F_L
          WHERE JOB_NUMBER = v_JOB_NUMBER
          AND TRUNC(A_F_L.leave_start_time,'DD') = v_year_Month_day;

          ---如果第一次刷卡时间超过请假时间.
          IF(v_fpt_first_time >= v_Leave_Start_Time) THEN
               ---上班无效卡.
               v_NOT_FingerPrint_Times := v_NOT_FingerPrint_Times + 1;
               GOTO NEXT;
          END IF;
            ---如果最后一次刷卡时间超过请假时间.
          IF(v_fpt_last_time <=v_Leave_end_Time) THEN
               ---最后一次: 无效卡.
               v_NOT_FingerPrint_Times := v_NOT_FingerPrint_Times + 1;
               GOTO NEXT;
          END IF;


     END LOOP;
end Get_Not_FingerPrint_Times;
/

prompt
prompt Creating procedure GET_NOT_FP_TIMES_OF_A_R_S
prompt ============================================
prompt
create or replace procedure dukepu.Get_Not_FP_Times_Of_A_R_S(v_Job_Number in varchar2,v_year_and_month in varchar2,v_NOT_FingerPrint_Times out int) as

       type t_cur is ref cursor;
       day_cur t_cur;

       v_year_month_day date;
       v_year_month_day_str varchar2(20);

       ---上班时间
       v_fpt_first_time date;
     --下班时间
       v_fpt_last_time date;


      -- v_leave_Start_time Ask_For_leave.Leave_Start_Time%type;
       --v_leave_end_Time   ASK_FOR_Leave.Leave_End_Time%type;

begin
     v_NOT_FingerPrint_Times:=0;

     OPEN day_cur FOR
     SELECT FingerPrint_DATE,TO_CHAR(FingerPrint_Date,'YYYY-MM-DD'),AR_S.Fpt_First_Time,AR_S.Fpt_Last_Time
     FROM Attendance_Record_Summary AR_S
     WHERE JOB_NUMBER = v_JOB_NUMBER
     AND (AR_S.Fpt_First_Time IS NULL OR AR_S.Fpt_Last_Time IS NULL)
     AND TRUNC(FingerPrint_DATE,'MM') = TO_DATE(v_year_and_month,'YYYY-MM');

     LOOP
         <<NEXT>>
         NULL;
         FETCH day_cur INTO v_year_month_day,v_year_month_day_str,v_fpt_first_time,v_fpt_last_time;
         EXIT WHEN day_cur%NOTFOUND;


         ---未出勤,不计算未打卡.
         IF(v_fpt_first_time IS NULL AND v_fpt_last_time IS NULL) THEN
             GOTO NEXT;
         END IF;


         ---判断今天是否为公司休息日。
                ---1.先判断今日是否为公司正常休息日.
          /*
          SELECT COUNT(1) INTO v_COUNT
          FROM DUAL
          WHERE EXISTS(
            select 1
            from Attendance_Record AR
            where (AR.Fpt_First_Time IS NOT NULL OR AR.Fpt_Last_Time IS NOT NULL)
                  AND trunc(AR.fingerprint_date,'DD') =v_year_Month_day
                  having count(1) < 99
          );
          */
          --加班日，计算未 打卡。目的是要求 去补 卡。
          /*
          SELECT COUNT(1) INTO v_Count
          FROM Rest_Day
          where Rest_day = to_date(v_year_Month_day,'yyyy-MM-dd');
          IF(v_COUNT >=1) THEN
                GOTO NEXT;     ---加班日，不计算
          END IF;
          */
          --
          ---判断是否为请假日
          ---2. 正常工作日，判断当天是否请假。
          /*
          SELECT COUNT(1) INTO v_Count
          FROM ASK_FOR_LEAVE A_F_L
          WHERE JOB_NUMBER = v_JOB_NUMBER
          AND TRUNC(A_F_L.leave_start_time,'DD') = v_year_Month_day;
          IF (v_Count = 0) THEN
             ---正常班
             IF(v_fpt_first_time IS NULL AND v_fpt_last_time is not null) THEN
                  v_NOT_FingerPrint_Times:=  v_NOT_FingerPrint_Times +1;
             ELSIF (v_fpt_first_time IS NOT NULL AND v_fpt_last_time is  null) THEN
                  v_NOT_FingerPrint_Times:=  v_NOT_FingerPrint_Times +1;
             END IF;
             GOTO NEXT;
          END IF;
          */
          ---请假了。
          --是否请了全天假期
          /*
          SELECT COUNT(1) INTO v_Count
          FROM ASK_FOR_LEAVE A_F_L
          WHERE JOB_NUMBER = v_JOB_NUMBER
          AND TRUNC(A_F_L.leave_start_time,'DD') = v_year_Month_day
          AND A_F_L.leave_start_time <= TO_DATE(v_year_month_day_str || ' 08:00:00','yyyy-MM-dd HH24:MI:SS')  ---从8点开始起假;
          AND A_F_L.Leave_end_Time >=TO_DATE(v_year_month_day_str || ' 17:00:00','yyyy-MM-dd HH24:MI:SS');  ---从17:00 开始下班;

          IF(v_Count >= 1) THEN
              --- 请了全天假
              GOTO NEXT;
          END IF;
          */
          /*
          --是否请的早上假
          SELECT COUNT(1) INTO v_Count
          FROM ASK_FOR_LEAVE A_F_L
          WHERE JOB_NUMBER = v_JOB_NUMBER
          AND TRUNC(A_F_L.leave_start_time,'DD') = v_year_Month_day
          AND A_F_L.leave_start_time <=TO_DATE(v_year_month_day_str || ' 08:00:00','yyyy-MM-dd HH24:MI:SS')  ---从8点开始起假;
          AND A_F_L.Leave_end_Time <TO_DATE(v_year_month_day_str || ' 17:00:00','yyyy-MM-dd HH24:MI:SS');  ---从17:00 开始下班;
          IF(v_Count >= 1) THEN
               --检查下班卡，是否没刷上。
               IF(v_fpt_last_time is null) THEN
                     v_NOT_FingerPrint_Times := v_NOT_FingerPrint_Times + 1;
                     GOTO NEXT;
               END IF;
               ---如果下班时间<=12:30,认为刷卡无效
               IF(v_fpt_last_time<=TO_DATE(v_year_month_day_str || ' 12:30:00','yyyy-MM-dd HH24:MI:SS')) THEN
                   v_NOT_FingerPrint_Times := v_NOT_FingerPrint_Times + 1;
                   GOTO NEXT;
               END IF;

          END IF;
          --是否请的下午假
          SELECT COUNT(1) INTO v_Count
          FROM ASK_FOR_LEAVE A_F_L
          WHERE JOB_NUMBER = v_JOB_NUMBER
          AND TRUNC(A_F_L.leave_start_time,'DD') = v_year_Month_day
          AND A_F_L.leave_start_time > TO_DATE(v_year_month_day_str || ' 08:00:00','yyyy-MM-dd HH24:MI:SS')  ---从8点开始起假;
          AND A_F_L.Leave_end_Time >= TO_DATE(v_year_month_day_str || ' 17:00:00','yyyy-MM-dd HH24:MI:SS');  ---从17:00 开始下班;
          IF(v_Count >= 1) THEN
               --检查上班卡，是否没刷上。
               IF(v_fpt_first_time is null) THEN
                     v_NOT_FingerPrint_Times := v_NOT_FingerPrint_Times + 1;
                     GOTO NEXT;
               END IF;
               ---如果上班卡时间超过12:00,被计为无效卡.
               IF(v_fpt_first_time > TO_DATE(v_year_month_day_str || ' 12:00:00','yyyy-MM-dd HH24:MI:SS')) THEN
                    v_NOT_FingerPrint_Times := v_NOT_FingerPrint_Times + 1;
                     GOTO NEXT;
               END IF;
          END IF;
          */
          --请的假是中间，要求两头都要刷卡。
          IF(v_fpt_first_time IS NULL) THEN
             v_NOT_FingerPrint_Times := v_NOT_FingerPrint_Times + 1;
             GOTO NEXT;
          ELSIF(v_fpt_last_time IS NULL) THEN
             v_NOT_FingerPrint_Times := v_NOT_FingerPrint_Times + 1;
              GOTO NEXT;
          END IF;

          /*
          SELECT A_F_L.Leave_Start_Time,A_F_L.Leave_End_Time INTO v_Leave_Start_Time,v_Leave_End_Time
          FROM ASK_FOR_LEAVE A_F_L
          WHERE JOB_NUMBER = v_JOB_NUMBER
          AND TRUNC(A_F_L.leave_start_time,'DD') = v_year_Month_day;

          ---如果第一次刷卡时间超过请假时间.
          IF(v_fpt_first_time >= v_Leave_Start_Time) THEN
               ---上班无效卡.
               v_NOT_FingerPrint_Times := v_NOT_FingerPrint_Times + 1;
               GOTO NEXT;
          END IF;
            ---如果最后一次刷卡时间超过请假时间.
          IF(v_fpt_last_time <=v_Leave_end_Time) THEN
               ---最后一次: 无效卡.
               v_NOT_FingerPrint_Times := v_NOT_FingerPrint_Times + 1;
               GOTO NEXT;
          END IF;
          */

     END LOOP;
end Get_Not_FP_Times_Of_A_R_S;
/

prompt
prompt Creating procedure GET_SHOULD_AR_DAYS
prompt =====================================
prompt
create or replace procedure dukepu.get_Should_AR_Days(v_year_and_month varchar2,v_should_AR_Days OUT INT )  AS
       ---统计该月休息日天数。
       v_count_of_rest_days int;
       v_total_days INT;
begin
     ---应出勤天数统计
     SELECT COUNT(1) INTO v_count_of_rest_days
     FROM Rest_Day R_D
     WHERE trunc(R_D.Rest_Day,'MM') = to_date(v_year_and_month,'yyyy-MM');

     select substr(to_char(last_day(to_date('2019-03','yyyy-MM')),'yyyy-MM-dd'),length(to_char(last_day(to_date('2019-03','yyyy-MM')),'yyyy-MM-dd'))-1,2) INTO v_total_days
     from dual;

     v_should_AR_Days:=v_total_days - v_count_of_rest_days;


end get_Should_AR_Days;
/

prompt
prompt Creating procedure GET_TOTAL_TIME_FOR_A_F_L
prompt ===========================================
prompt
create or replace procedure dukepu.GET_Total_TIME_For_A_F_L(v_job_number in nvarchar2, v_year_and_month IN VARCHAR2,v_vacation_total_time out int) AS

       ---游标
       type t_cur is ref cursor;
       day_cur t_cur;    ---某月内刷卡记录的日期游标.



       v_finger_print_date_str varchar2(20);

       v_Count_flag INT;                                  ---用于表示数量.
       v_vacation_time_temp   INT:=0;

begin
----某人一个月总共请假多少小时.

       v_vacation_total_time:=0;
      ---打开游标
      ---取出当月所有日期
      open day_cur FOR
      select distinct to_char(finger_print_date,'YYYY-MM-DD') fingerPrint_date_str
      from Attendance_record_Briefly
      where job_number = v_job_number
      and trunc(Finger_print_date,'MM') = to_date(v_year_and_month|| '-01','YYYY-MM-DD');

      LOOP
          <<NEXT>>
          NULL;
          --取出当月所有日期
          FETCH day_cur INTO v_Finger_print_date_str;
          EXIT WHEN day_cur%NOTFOUND;

          v_Count_flag:=0;


         ---当天是否公司休息日.
         /*SELECT COUNT(1) INTO v_Count_flag
         FROM DUAL
         WHERE EXISTS(
             SELeCT 1
             from Attendance_Record AR
             where (AR.Fpt_First_Time IS NOT NULL OR AR.Fpt_Last_Time IS NOT NULL)
             AND AR.Finger_print_date=to_date(v_Finger_print_date_str,'YYYY-MM-DD')
             HAVING COUNT(1) <99
           );
           */
         --当天是否公司休息日. 
         SELECT COUNT(1) INTO v_Count_flag
         FROM Rest_Day
         WHERE Rest_Day = to_date(v_Finger_print_date_str,'yyyy-MM-dd');
         
         ---公司休息日. 该天请假无效。
          IF(v_Count_flag >= 1) THEN
              GOTO NEXT;
          END IF;
          ---2. 正常工作日，判断当天是否请假。
          SELECT COUNT(1) INTO v_Count_flag
          FROM ASK_FOR_LEAVE A_F_L
          WHERE JOB_NUMBER = v_JOB_NUMBER
          AND TRUNC(A_F_L.Leave_Date,'DD') = to_date(v_Finger_print_date_str,'YYYY-MM-DD');
          IF (v_Count_flag = 0) THEN
             GOTO NEXT;             ---没请假，继续循环。
          END IF;
          ---当前日，进行了请假，计算时间。
          SELECT (LEAVE_END_TIME-LEAVE_START_TIME)*24 INTO v_vacation_time_temp
          FROM ASK_FOR_LEAVE A_F_L
          WHERE JOB_NUMBER = v_JOB_NUMBER
          AND TRUNC(A_F_L.Leave_Date,'DD') =to_date(v_Finger_print_date_str,'YYYY-MM-DD');

          ---如果终止时间>13:00,起始时间<12:00,则请假时间-1;
          SELECT COUNT(1) INTO v_Count_flag
          FROM DUAL
          WHERE EXISTS(
                SELECT 1
                FROM ASK_FOR_LEAVE A_F_L
                WHERE JOB_NUMBER = v_JOB_NUMBER
                AND A_F_L.leave_start_time < TO_DATE(v_Finger_print_date_str || ' 12:00:00','YYYY-MM-DD HH24:MI:SS')
                AND A_F_L.Leave_End_Time > TO_DATE(v_Finger_print_date_str|| ' 13:00:00','YYYY-MM-DD HH24:MI:SS')
          );
          IF(v_Count_flag >=1) THEN
                v_vacation_time_temp:=v_vacation_time_temp-1;
          END IF;
          --未 跨越请假12:00 -- 13:00 范围。    
          v_vacation_total_time:= v_vacation_total_time + v_vacation_time_temp;

      END LOOP;
      close day_Cur;
end GET_Total_TIME_For_A_F_L;
/

prompt
prompt Creating procedure GET_T_T_FOR_A_F_L_BY_NAME
prompt ============================================
prompt
create or replace procedure dukepu.GET_T_T_For_A_F_L_By_Name(v_Name in nvarchar2, v_year_and_month IN VARCHAR2,v_vacation_total_time out int) AS

       ---游标
       type t_cur is ref cursor;
       day_cur t_cur;    ---某月内刷卡记录的日期游标.



       v_fingerprint_date_str varchar2(20);

       v_Count INT;                                  ---用于表示数量.
       v_vacation_time_temp   INT:=0;

begin
----某人一个月总共请假多少小时.

       v_vacation_total_time:=0;
      ---打开游标
      open day_cur FOR
      select to_char(fingerprint_date,'YYYY-MM-DD') fingerPrint_date_str
      from Attendance_record
      where name = v_Name
      and trunc(Fingerprint_date,'MM') = to_date(v_year_and_month|| '-01','YYYY-MM-DD');

      LOOP
          <<NEXT>>
          NULL;
          FETCH day_cur INTO v_fingerprint_date_str;
          EXIT WHEN day_cur%NOTFOUND;

          v_Count:=0;


         ---当天是否公司休息日.
         SELECT COUNT(1) INTO v_Count
         FROM DUAL
         WHERE EXISTS(
             SELeCT 1
             from Attendance_Record AR
             where (AR.Fpt_First_Time IS NOT NULL OR AR.Fpt_Last_Time IS NOT NULL)
             AND AR.fingerprint_date=to_date(v_fingerprint_date_str,'YYYY-MM-DD')
             HAVING COUNT(1) <99
           );
         ---公司休息日.
          IF(v_COUNT >= 1) THEN
              GOTO NEXT;
          END IF;
          ---2. 正常工作日，判断当天是否请假。
          SELECT COUNT(1) INTO v_Count
          FROM ASK_FOR_LEAVE A_F_L
          WHERE name = v_name
          AND TRUNC(A_F_L.leave_start_time,'DD') = to_date(v_fingerprint_date_str,'YYYY-MM-DD');
          IF (v_Count = 0) THEN
             GOTO NEXT;             ---没请假，继续循环。
          END IF;
          ---进行了请假，计算时间。
          SELECT (LEAVE_END_TIME-LEAVE_START_TIME)*24 INTO v_vacation_time_temp
          FROM ASK_FOR_LEAVE A_F_L
          WHERE name = v_name
          AND TRUNC(A_F_L.leave_start_time,'DD') =to_date(v_fingerprint_date_str,'YYYY-MM-DD');


          ---如果终止时间>13:30,起始时间<12:00,则请假时间-1;
          SELECT COUNT(1) INTO v_Count
          FROM DUAL
          WHERE EXISTS(
                SELECT 1
                FROM ASK_FOR_LEAVE A_F_L
                WHERE name = v_name
                AND A_F_L.leave_start_time < TO_DATE(v_fingerprint_date_str || ' 12:00:00','YYYY-MM-DD HH24:MI:SS')
                AND A_F_L.Leave_End_Time > TO_DATE(v_fingerprint_date_str|| ' 13:30:00','YYYY-MM-DD HH24:MI:SS')
          );
          IF(v_Count >=1) THEN
                v_vacation_time_temp:=v_vacation_time_temp-1;
          END IF;

          v_vacation_total_time:= v_vacation_total_time + v_vacation_time_temp;

      END LOOP;
      close day_Cur;
end GET_T_T_For_A_F_L_By_Name;
/

prompt
prompt Creating procedure IMPORT_PRODUCT_RECORD
prompt ========================================
prompt
create or replace procedure dukepu.Import_Product_Record(v_dept VARCHAR2,v_year_and_month varchar2,v_RandomStr varchar2,v_result out INT) as

       --type cur_t is ref cursor;
       --name_cur cur_t;

       v_Subject VARCHAR2(30);

       --v_Count INT;

       --v_Name Products_Record_Temp.Name%TYPE;
       --v_Sheet_Name Products_Record_Temp.Sheet_Name%TYPE;
begin
  ---此存储过程用于导入单据BillNo中的数据到 Product_Record.
  ----先检查该单据中的每个姓名是否是唯一的.
       v_Subject:= 'Import_Product_Record';

       dbms_output.put_line(v_dept);
       dbms_output.put_line(v_randomStr);
       dbms_output.put_line(v_year_and_month);
           dbms_output.put_line(v_Subject);
       ---不检查名字在考勤表中是否存在,重复.
       /*
       OPEN name_cur FOR
       SELECT
              DISTINCT
              name,
              SHEET_NAME
       FROM Products_Record_Temp  P_R_T
       WHERE P_R_T.dept = v_dept
       AND   P_R_T.Year_And_Month = v_year_and_month;


       DELETE MESSAGE
       WHERE RANDOM_STR = v_RandomStr;

       ---判断 dep
       LOOP
          FETCH name_cur INTO
                          v_Name,
                          v_Sheet_Name;
          EXIT WHEN  name_cur%NOTFOUND;

          ---判断此人,本月是否有考勤记录.
          select COUNT(distinct job_number) INTO v_Count
          from Attendance_Record AR
          WHERE TRUNC(AR.FingerPrint_Date,'MM') = TO_DATE(v_year_and_month,'YYYY-MM')
          AND AR.Name = v_Name;
          IF(v_Count=0) THEN
               ---保存信息到MESSAGE中.
              ---保存错误信息.
            INSERT INTO MESSAGE(
                   PROMPT,
                   FLAG,
                   OPERATE_TIME,
                   SUBJECT,
                   RANDOM_STR
            )
            VALUES(
                   v_Sheet_Name ||' ' ||v_year_and_month ||' '|| v_dept|| ' '|| v_Name || ' 不存在考勤记录！',
                   '0',
                   SYSDATE,
                   v_Subject,
                   v_RandomStr
            );
            v_Result:=0;
          ELSIF(v_COUNT>1) THEN
            INSERT INTO MESSAGE(
                   PROMPT,
                   FLAG,
                   OPERATE_TIME,
                   SUBJECT,
                   RANDOM_STR
            )
            SELECT
                   v_Sheet_Name ||' ' ||v_year_and_month ||' '|| v_dept|| ' '|| v_Name || ' 考勤表中存在同名用户',
                   0,
                   SYSDATE,
                   v_Subject,
                   v_RandomStr
            FROM DUAL;
             v_Result:=0;
          END IF;
       END LOOP;
       CLOSE name_cur;

       IF(v_Result=0) THEN
          RETURN;
       END IF;
       */
       INSERT INTO Products_Record(
                                       seq,
                                        AR_job_number,
                                        name,
                                        Report_Dept,
                                        products_name,
                                        summary_process,
                                        specific_process,
                                        quantities,
                                         sheet_name,
                                        FILE_NAME,
                                        REPORT_SPECIFIC_MONTH,
                                        update_time
                                     )
       SELECT                         seq_products_record_temp.nextval,
                                        emps.job_number,
                                        P_R_T.name,
                                        P_R_T.Report_Dept,
                                        P_R_T.products_name,
                                        P_R_T.summary_process,
                                        P_R_T.specific_process,
                                        P_R_T.quantities,
                                        P_R_T.sheet_name,
                                        P_R_T.path,
                                        REPORT_SPECIFIC_MONTH,
                                        P_R_T.update_time
       FROM Products_Record_TEMP P_R_T LEFT  JOIN Employees emps
            ON P_R_T.name = emps.name
       WHERE P_R_T.report_dept = v_dept;
       v_Result:=1;
       RETURN;
end Import_Product_Record;
/

prompt
prompt Creating procedure IMPORT_SCATTERED_RECORD
prompt ==========================================
prompt
create or replace procedure dukepu.Import_Scattered_Record(v_dept varchar2,v_year_and_month varchar2, v_randomStr VARCHAR2,v_result out INT) as

       --type cur_t is ref cursor;
       --name_cur cur_t;

       v_Subject VARCHAR2(30);

       --v_Count INT;

       --v_Name Products_Record_Temp.Name%TYPE;
       --v_Sheet_Name Products_Record_Temp.Sheet_Name%TYPE;
begin
  ---此存储过程用于导入单据BillNo中的数据到 Product_Record.
  ----先检查该单据中的每个姓名是否是唯一的.
       v_Subject:= 'Import_Scattered_Record';
       DBMS_OUTPUT.put_line(v_randomStr);
       DBMS_OUTPUT.put_line(v_Subject);

       /*
       OPEN name_cur FOR
       SELECT
              DISTINCT
              name,
              SHEET_NAME
       FROM Scattered_Record_Temp  S_R_T
       WHERE S_R_T.dept = v_dept
       AND S_R_T.Year_And_Month = v_year_and_month;

       DELETE MESSAGE
       WHERE RANDOM_STR = v_randomStr;


       LOOP
          FETCH name_cur INTO
                          v_Name,
                          v_Sheet_Name;
          EXIT WHEN  name_cur%NOTFOUND;
         --判断本单据中的Name是否唯一
            ---判断此人,本月是否有考勤记录.
            ---判断此人,本月是否有考勤记录.
          select COUNT(distinct AR.job_number) INTO v_Count
          from Attendance_Record AR
          WHERE TRUNC(AR.FingerPrint_Date,'MM') = TO_DATE(v_year_and_month,'YYYY-MM')
          AND AR.Name = v_Name;
          IF(v_Count=0) THEN
               ---保存信息到MESSAGE中.
              ---保存错误信息.
            INSERT INTO MESSAGE(
                   PROMPT,
                   FLAG,
                   OPERATE_TIME,
                   SUBJECT,
                   RANDOM_STR
            )
            VALUES(
                   v_Sheet_Name ||' ' ||v_year_and_month ||' '|| v_dept|| ' '|| v_Name || ' 不存在考勤记录！',
                   '0',
                   SYSDATE,
                   v_Subject,
                   v_RandomStr
            );
            v_Result:=0;
          ELSIF(v_COUNT>1) THEN
            INSERT INTO MESSAGE(
                   PROMPT,
                   FLAG,
                   OPERATE_TIME,
                   SUBJECT,
                   RANDOM_STR
            )
            SELECT
                   v_Sheet_Name ||' ' ||v_year_and_month ||' '|| v_dept|| ' '|| v_Name || ' 考勤表中存在同名用户',
                   0,
                   SYSDATE,
                   v_Subject,
                   v_RandomStr
            FROM DUAL;
             v_Result:=0;
          END IF;
       END LOOP;
       CLOSE name_cur;

       IF(v_Result=0) THEN
          RETURN;
       END IF;
       */
       ---先删除,再新增.
       DELETE
       FROM Scattered_Record S_R
       WHERE S_R.REPORT_DEPT = v_dept
       AND trunc(S_R.REPORT_SPECIFIC_MONTH,'MM') =to_date( v_year_and_month,'yyyy-MM');

       INSERT INTO Scattered_Record(
                                       seq,
                                       AR_JOB_NUMBER,
                                        name,
                                        particulars,
                                        quantities,
                                        TOTAL_HOURS,
                                        labour_cost,
                                        aggregate_amount,
                                        Report_Dept,
                                        update_time,
                                        REPORT_SPECIFIC_MONTH
                                     )
       SELECT                         seq_Scattered_record.nextval,
                                        emps.job_number,
                                        S_R_T.Name,
                                        S_R_T.Particulars,
                                        S_R_T.Quantities,
                                        S_R_T.Hours,
                                        S_R_T.Labour_Cost,
                                        S_R_T.Aggregate_Amount,
                                        S_R_T.Report_Dept,
                                        SYSDATE,
                                        REPORT_SPECIFIC_MONTH
       FROM Scattered_Record_TEMP S_R_T LEFT JOIN Employees emps
            ON S_R_T.name = emps.name
       WHERE S_R_T.report_Dept = v_dept;
       v_Result:=1;
       RETURN;
end Import_Scattered_Record;
/

prompt
prompt Creating procedure INSERT_PRODUCT_RECORD_TEMP
prompt =============================================
prompt
create or replace procedure dukepu.INSERT_Product_Record_Temp(
                                                       v_job_number varchar2,
                                                       v_name       nvarchar2,
                                                       v_report_dept  nvarchar2,
                                                       v_products_name nvarchar2,
                                                       v_summary_process nvarchar2,
                                                       v_specific_process nvarchar2,
                                                       v_process_cost number,
                                                       v_quantities   integer,
                                                       v_amount       number,
                                                       v_sheet_name   nvarchar2,
                                                       v_path         nvarchar2,
                                                       v_year_and_month varchar2
) as
begin
        INSERT INTO Products_Record_Temp(
              seq,
              job_number,
              name,
              report_dept,
              products_name,
              summary_process,
              specific_process,
              process_cost ,
              quantities,
              amount,
              sheet_name,
              path,
              report_specific_month,
              update_time
          )
        VALUES(
               SEQ_Products_Record_Temp.nextval,
               v_job_number, ---<<工号>>---
              v_name,  --<<姓名>>----
              v_report_dept,  ---<报表部门.>-------
              v_products_name,  ---<品名>---------
              v_summary_process,  ---<概要工序>----
              v_specific_process,  ------<指定工序>---
              v_process_cost,  ----<单序成本>-------
              v_quantities,  ----<件数>------
              v_amount,  ----<金额>------
              v_sheet_name,     ---<表名>-----
              v_path,     ---<路径>-----
              v_year_and_month,     ---<年月>----
              SYSDATE);

end INSERT_Product_Record_Temp;
/

prompt
prompt Creating procedure ORA_ASPNET_CREATEPAGE
prompt ========================================
prompt
CREATE OR REPLACE PROCEDURE DUKEPU.ora_aspnet_CreatePage wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
7
9200000
1
4
0
1e
2 :e:
1ORA_ASPNET_CREATEPAGE:
1APPID:
1RAW:
1PAGE:
1NVARCHAR2:
1PAGEID:
1OUT:
1TYPE:
1P_CURSOR:
1REF:
1CURSOR:
1L_PAGEID:
116:
1L_CURSOR:
1OPEN:
1PATHID:
1ORA_ASPNET_PATHS:
1APPLICATIONID:
1=:
1LOWEREDPATH:
1LOWER:
1NOTFOUND:
1TRUE:
1SYS_GUID:
1PATH:
1ISOPEN:
1CLOSE:
1TOO_MANY_ROWS:
1ROLLBACK:
1ROLLBACK_NR:
0

0
0
8a
2
0 9a 8f a0 b0 3d 8f a0
b0 3d 90 :2 a0 b0 3f b4 55
6a a0 9d :2 a0 c8 77 a3 a0
51 a5 1c 4d 81 b0 a3 a0
1c 81 b0 :3 a0 ac a0 b2 ee
:2 a0 7e b4 2e :2 a0 7e a0 a5
b b4 2e a 10 ac e5 d0
b2 :2 e9 dd :2 a0 e9 d3 :2 a0 f
a0 7e b4 2e 5a :2 a0 d :a a0
a5 b 5 d7 b2 5 e9 b7
19 3c :2 a0 f a0 7e b4 2e
5a :2 a0 e9 c1 b7 19 3c :2 a0
d b7 :2 a0 57 a0 b4 e9 b7
a6 9 a4 a0 b1 11 68 4f
1d 17 b5
8a
2
0 3 1f 1b 1a 27 34 30
17 3c 49 41 45 2f 50 2c
55 59 5d 71 65 69 6d 61
92 7c 80 83 84 8c 8d 7b
ae 9d a1 a9 78 99 b5 b9
bd be c2 c3 ca ce d2 d5
d6 db df e3 e6 ea eb ed
ee 1 f3 f8 f9 ff 103 104
109 10e 112 116 11a 11f 124 128
12c 131 135 138 139 13e 141 145
149 14d 151 155 159 15d 161 165
169 16d 171 175 176 178 17c 184
185 189 18e 190 194 197 19b 19f
1a4 1a8 1ab 1ac 1b1 1b4 1b8 1bc
1c1 1c3 1c5 1c9 1cc 1d0 1d4 1d8
1da 1de 1e2 1e7 1eb 1ec 1f1 1f3
1f4 1f9 1fd 201 203 20f 213 215
216 21f
8a
2
0 b 3 11 :3 3 10 :3 3 e
12 :2 3 20 :2 1 4 9 15 19
15 4 3 e 12 11 e 19
e :2 3 :3 f :2 3 8 :3 c 4 :2 c
1c :3 1a c 1a 18 20 :2 1a :2 18
:2 c :5 4 3 4 9 17 :2 3 7
10 7 1b :3 19 6 4 10 4
10 21 29 38 3e 52 5c 63
69 6f :2 69 51 :4 4 21 :2 3 7
10 7 19 :3 17 6 7 d :2 7
1f :3 3 d 3 2 8 :5 4 :3 3
2 6 :7 1
8a
4
0 1 :4 2 :4 3
:5 4 :3 1 :6 8 :8 9
:5 a :2 e :2 f :3 10
:5 11 :8 12 :2 11 10
:4 f e f :4 14
:8 16 :3 17 :11 18 :3 16
:8 1b :4 1c :3 1b :3 1f
c 22 :5 24 23
:2 22 21 25 :7 1

221
4
:3 0 1 :a 0 85
1 :7 0 5 2c
0 :2 3 :3 0 2
:7 0 4 3 :3 0
9 :2 0 7 5
:3 0 4 :7 0 8
7 :3 0 7 :3 0
3 :3 0 6 :6 0
d c :3 0 f
:2 0 85 1 10
:2 0 8 :3 0 13
0 16 83 a
:3 0 b :7 0 9
16 13 :4 0 11
99 0 f 3
:3 0 d :2 0 d
19 1b :7 0 1f
1c 1d 83 0
c :6 0 f :3 0
9 :3 0 21 :7 0
24 22 0 83
0 e :6 0 e
:3 0 10 :3 0 13
11 :3 0 15 2a
3a 0 3b :3 0
12 :3 0 2 :3 0
13 :2 0 19 2e
2f :3 0 14 :3 0
15 :3 0 13 :2 0
4 :3 0 1c 32
35 20 33 37
:3 0 30 39 38
:3 0 3d 3e :5 0
28 2b :3 0 3c
:4 0 41 :2 0 77
26 3f :2 0 e
:3 0 c :4 0 45
:2 0 77 42 43
:3 0 e :3 0 16
:3 0 46 47 :3 0
17 :3 0 13 :2 0
25 4a 4b :3 0
4c :2 0 c :3 0
18 :3 0 4e 4f
0 62 11 :3 0
10 :3 0 12 :3 0
19 :3 0 14 :3 0
c :3 0 2 :3 0
4 :3 0 15 :3 0
4 :3 0 28 59
5b 2a :3 0 51
5f 60 61 :4 0
2f 34 :4 0 5e
:2 0 62 36 63
4d 62 0 64
39 0 77 e
:3 0 1a :3 0 65
66 :3 0 17 :3 0
13 :2 0 3d 69
6a :3 0 6b :2 0
1b :3 0 e :4 0
70 :2 0 71 6e
0 40 72 6c
71 0 73 42
0 77 6 :3 0
c :3 0 74 75
0 77 44 84
1c :3 0 1d :3 0
7b 7c :2 0 7d
1e :2 0 80 :2 0
7a :2 0 7e 4a
80 4c 7f 7e
:2 0 81 4e :2 0
84 1 :3 0 50
84 83 77 81
:6 0 85 :2 0 1
10 84 88 :3 0
87 85 89 :8 0

54
4
:3 0 1 2 1
6 1 a 3
5 9 e 1
1a 1 18 1
20 1 27 1
29 1 2d 2
2c 2d 1 34
1 36 2 31
36 1 49 2
48 49 1 5a
4 56 57 58
5c 4 52 53
54 55 1 5d
2 50 61 1
63 1 68 2
67 68 1 6f
1 72 5 40
44 64 73 76
1 7d 1 78
1 80 3 17
1e 23
1
4
0
88
0
1
14
1
7
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
6 1 0
2 1 0
1 0 1
20 1 0
13 1 0
a 1 0
18 1 0
0
/

prompt
prompt Creating procedure ORA_ASPNET_CREATEUSER
prompt ========================================
prompt
CREATE OR REPLACE PROCEDURE DUKEPU.ora_aspnet_CreateUser wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
7
9200000
1
4
0
1f
2 :e:
1ORA_ASPNET_CREATEUSER:
1APPLICATIONID_:
1RAW:
1USERNAME_:
1NVARCHAR2:
1ISUSERANONYMOUS:
1INTEGER:
1LASTACTIVITYDATE_:
1DATE:
1USERID_:
1OUT:
1TYPE:
1P_CURSOR:
1REF:
1CURSOR:
1L_USERID:
116:
1L_CURSOR:
1OPEN:
1USERID:
1ORA_ASPNET_USERS:
1APPLICATIONID:
1=:
1LOWEREDUSERNAME:
1LOWER:
1NOTFOUND:
1TRUE:
1SYS_GUID:
1USERNAME:
1ISANONYMOUS:
1LASTACTIVITYDATE:
0

0
0
7e
2
0 9a 8f a0 b0 3d 8f a0
b0 3d 8f a0 b0 3d 8f a0
b0 3d 90 :2 a0 b0 3f b4 55
6a a0 9d :2 a0 c8 77 a3 a0
51 a5 1c 4d 81 b0 a3 a0
1c 81 b0 :3 a0 ac a0 b2 ee
:2 a0 7e b4 2e :2 a0 7e a0 a5
b b4 2e a 10 ac e5 d0
b2 :2 e9 dd :2 a0 e9 d3 :2 a0 f
a0 7e b4 2e 5a :2 a0 d :c a0
a5 b :2 a0 5 d7 b2 5 e9
b7 19 3c :2 a0 d b7 a4 a0
b1 11 68 4f 1d 17 b5
7e
2
0 3 1f 1b 1a 27 34 30
17 3c 45 41 2f 4d 5a 56
2c 62 6f 67 6b 55 76 52
7b 7f 83 97 8b 8f 93 87
b8 a2 a6 a9 aa b2 b3 a1
d4 c3 c7 cf 9e bf db df
e3 e4 e8 e9 f0 f4 f8 fb
fc 101 105 109 10c 110 111 113
114 1 119 11e 11f 125 129 12a
12f 134 138 13c 140 145 14a 14e
152 157 15b 15e 15f 164 167 16b
16f 173 177 17b 17f 183 187 18b
18f 193 197 19b 19f 1a3 1a4 1a6
1aa 1ae 1b2 1ba 1bb 1bf 1c4 1c6
1ca 1cd 1d1 1d5 1d9 1db 1df 1e3
1e5 1f1 1f5 1f7 1f8 201
7e
2
0 b 7 1e :3 7 20 :3 7 20
:3 7 20 :3 7 1b 20 :2 7 20 :2 1
4 9 15 19 15 4 3 10
14 13 10 1b 10 :2 3 :3 11 3
5 a :3 e 7 :2 e 1e :3 1c e
20 1e 26 :2 20 :2 1e :2 e :5 7 5
7 9 17 :2 3 7 10 7 1b
:3 19 6 7 13 7 13 c 1b
23 c 1d 2a f 1f 29 c
12 :2 c 1e 2f e :4 7 21 :2 3
5 10 5 :2 3 7 :7 1
7e
4
0 1 :4 2 :4 3
:4 4 :4 5 :5 6 :3 1
:6 a :8 b :5 c :2 10
:2 11 :3 12 :5 13 :8 14
:2 13 12 :4 11 10
11 :4 16 :8 18 :3 19
1b :3 1c :3 1d :3 1e
:6 1f 1e :4 1b :3 18
:3 22 :2 e 24 :7 1

203
4
:3 0 1 :a 0 79
1 :7 0 5 2c
0 :2 3 :3 0 2
:7 0 4 3 :3 0
9 52 0 7
5 :3 0 4 :7 0
8 7 :3 0 7
:3 0 6 :7 0 c
b :3 0 d :2 0
b 9 :3 0 8
:7 0 10 f :3 0
b :3 0 3 :3 0
a :6 0 15 14
:3 0 17 :2 0 79
1 18 :2 0 c
:3 0 1b 0 1e
77 e :3 0 f
:7 0 d 1e 1b
:4 0 17 bf 0
15 3 :3 0 11
:2 0 13 21 23
:7 0 27 24 25
77 0 10 :6 0
13 :3 0 d :3 0
29 :7 0 2c 2a
0 77 0 12
:6 0 12 :3 0 14
:3 0 19 15 :3 0
1b 32 42 0
43 :3 0 16 :3 0
2 :3 0 17 :2 0
1f 36 37 :3 0
18 :3 0 19 :3 0
17 :2 0 4 :3 0
22 3a 3d 26
3b 3f :3 0 38
41 40 :3 0 45
46 :5 0 30 33
:3 0 44 :4 0 49
:2 0 74 2e 47
:2 0 12 :3 0 10
:4 0 4d :2 0 74
4a 4b :3 0 12
:3 0 1a :3 0 4e
4f :3 0 1b :3 0
17 :2 0 2b 52
53 :3 0 54 :2 0
10 :3 0 1c :3 0
56 57 0 6e
15 :3 0 16 :3 0
14 :3 0 1d :3 0
18 :3 0 1e :3 0
1f :3 0 2 :3 0
10 :3 0 4 :3 0
19 :3 0 4 :3 0
2e 63 65 6
:3 0 8 :3 0 30
:3 0 59 6b 6c
6d :4 0 37 3e
:4 0 6a :2 0 6e
40 6f 55 6e
0 70 43 0
74 a :3 0 10
:3 0 71 72 0
74 45 78 :3 0
78 1 :3 0 4a
78 77 74 75
:6 0 79 :2 0 1
18 78 7c :3 0
7b 79 7d :8 0

4e
4
:3 0 1 2 1
6 1 a 1
e 1 12 :2 5
9 d 11 16
1 22 1 20
1 28 1 2f
1 31 1 35
2 34 35 1
3c 1 3e 2
39 3e 1 51
2 50 51 1
64 6 60 61
62 66 67 68
6 5a 5b 5c
5d 5e 5f 1
69 2 58 6d
1 6f 4 48
4c 70 73 3
1f 26 2b
1
4
0
7c
0
1
14
1
9
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
6 1 0
a 1 0
28 1 0
1 0 1
20 1 0
1b 1 0
e 1 0
12 1 0
2 1 0
0
/

prompt
prompt Creating procedure ORA_ASPNET_GETSITEMAPDATA
prompt ============================================
prompt
CREATE OR REPLACE PROCEDURE DUKEPU.ora_aspnet_GetSiteMapData wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
7
9200000
1
4
0
14
2 :e:
1ORA_ASPNET_GETSITEMAPDATA:
1APPLICATIONNAME_:
1NVARCHAR2:
1SITEMAPDATA:
1OUT:
1SYS_REFCURSOR:
1L_APPID:
1RAW:
116:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1NO_DATA_FOUND:
1OPEN:
1ROWID:
1SM:
1ORA_ASPNET_SITEMAP:
1ID:
0

0
0
58
2
0 9a 8f a0 b0 3d 96 :2 a0
b0 54 b4 55 6a a3 a0 51
a5 1c 4d 81 b0 a0 ac :2 a0
b2 ee :2 a0 7e a0 a5 b b4
2e ac e5 d0 b2 e9 b7 a0
4f b7 a6 9 a4 b1 11 4f
:4 a0 6b 7 ac :2 a0 b9 b2 ee
:2 a0 7e b4 2e ac a0 de ac
e5 d0 b2 :2 e9 dd b7 a4 a0
b1 11 68 4f 1d 17 b5
58
2
0 3 1f 1b 1a 27 38 30
34 17 3f 2f 44 48 63 50
2c 54 55 5d 5e 4f 6a 4c
6e 72 76 77 7e 82 86 89
8d 8e 90 91 96 97 9d a1
a2 a7 a9 ad af b1 b2 b7
bb bd c9 cb cf d3 d7 db
1 de df e3 e7 e9 ea f1
f5 f9 fc fd 102 103 107 109
10a 110 114 115 11a 11f 123 125
129 12d 12f 13b 13f 141 142 14b
58
2
0 b 3 17 :3 3 10 14 :2 3
:3 1 3 b f e b 16 b
3 :2 c 1f a 5 a b 24
22 2a :2 24 :2 22 :5 5 3 a 7
18 :2 5 3 :3 1 3 8 c :3 13
c 1d 30 1d 18 1d d 1d
:3 1b 18 :2 2e 25 :4 5 3 5 :2 1
5 :7 1
58
4
0 1 :4 3 :5 4
2 :2 1 :8 8 :3 d
:3 e :8 f e :4 d
c 11 13 :3 11
10 :3 a :2 17 :a 18
:5 19 18 :3 19 :4 18
17 18 :2 a 1b
:7 1
14d
4
:3 0 1 :a 0 53
1 :7 0 5 2c
0 :2 3 :3 0 2
:7 0 4 3 :3 0
9 :2 0 7 5
:3 0 6 :3 0 4
:6 0 9 8 :3 0
b :2 0 53 1
c :2 0 e :2 0
c 8 :3 0 a
f 11 :7 0 15
12 13 51 0
7 :6 0 a :3 0
7 :3 0 b :3 0
10 1a 23 0
24 :3 0 c :3 0
d :3 0 e :2 0
2 :3 0 12 1d
20 16 1e 22
:4 0 26 27 :5 0
17 1b 0 19
0 25 :2 0 29
1b 31 f :4 0
2c 1d 2e 1f
2d 2c :2 0 2f
21 :2 0 31 0
31 30 29 2f
:6 0 4e 1 :3 0
10 :3 0 4 :3 0
11 :3 0 12 :3 0
36 38 0 23
13 :3 0 12 :3 0
3a 3b 26 3d
43 0 44 :3 0
a :3 0 7 :3 0
e :2 0 2a 41
42 :4 0 14 :3 0
1 45 2d 49
4a 47 :4 0 39
3e :3 0 48 :4 0
4d :2 0 4e 34
4b :2 0 2f 52
:3 0 52 1 :3 0
32 52 51 4e
4f :6 0 53 :2 0
1 c 52 56
:3 0 55 53 57
:8 0
34
4
:3 0 1 2 1
6 2 5 a
1 10 1 e
1 16 1 19
1 1f 1 21
2 1c 21 1
18 1 28 1
2b 1 2a 1
2e 2 35 37
1 3c 1 40
2 3f 40 1
46 2 31 4c
1 14
1
4
0
56
0
1
14
2
4
0 1 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
e 1 0
6 1 0
1 0 1
2 1 0
0
/

prompt
prompt Creating procedure ORA_ASPNET_LOGWEBEVENTS
prompt ==========================================
prompt
CREATE OR REPLACE PROCEDURE DUKEPU.ora_aspnet_LogWebEvents wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
7
9200000
1
4
0
17
2 :e:
1ORA_ASPNET_LOGWEBEVENTS:
1EVENTID:
1VARCHAR2:
1EVENTTIMEUTC:
1DATE:
1EVENTTIME:
1EVENTTYPE:
1NVARCHAR2:
1EVENTSEQUENCE:
1DECIMAL:
1EVENTOCCURENCE:
1EVENTCODE:
1INT:
1EVENTDETAILCODE:
1MESSAGE:
1APPLICATIONPATH:
1APPLICATIONVIRTUALPATH:
1MACHINENAME:
1REQUESTURL:
1EXCEPTIONTYPE:
1DETAILS:
1NCLOB:
1ORA_ASPNET_WEBEVENTS:
0

0
0
60
2
0 9a 8f a0 b0 3d 8f a0
b0 3d 8f a0 b0 3d 8f a0
b0 3d 8f a0 b0 3d 8f a0
b0 3d 8f a0 b0 3d 8f a0
b0 3d 8f a0 b0 3d 8f a0
b0 3d 8f a0 b0 3d 8f a0
b0 3d 8f a0 b0 3d 8f a0
b0 3d 8f a0 b0 3d b4 55
6a :10 a0 5 d7 b2 5 e9 b7
a4 a0 b1 11 68 4f 1d 17
b5
60
2
0 3 1f 1b 1a 27 34 30
17 3c 45 41 2f 4d 5a 56
2c 62 6b 67 55 73 80 7c
52 88 91 8d 7b 99 a6 a2
78 ae b7 b3 a1 bf cc c8
9e d4 dd d9 c7 e5 f2 ee
c4 fa 103 ff ed 10b 118 114
ea 120 129 125 113 131 110 136
13a 13e 142 146 14a 14e 152 156
15a 15e 162 166 16a 16e 172 176
17a 17e 182 18a 18b 18f 194 196
19a 19e 1a0 1ac 1b0 1b2 1b3 1bc
60
2
0 b 2 a :3 2 f :3 2 c
:3 2 c :3 2 10 :3 2 11 :3 2 c
:3 2 12 :3 2 a :3 2 12 :3 2 19
:3 2 e :3 2 d :3 2 10 :3 2 a
:2 2 22 :2 1 e :5 3 4 :3 3 4
:5 3 9 :4 2 :2 1 5 :7 1
60
4
0 1 :4 2 :4 3
:4 4 :4 5 :4 6 :4 7
:4 8 :4 9 :4 a :4 b
:4 c :4 d :4 e :4 f
:4 10 :3 1 13 15
16 17 18 19
1a 1b 1c 1d
1e 1f 20 21
22 23 14 :4 13
:2 12 25 :7 1
1be
4
:3 0 1 :a 0 5b
1 :7 0 5 2c
0 :2 3 :3 0 2
:7 0 4 3 :3 0
9 52 0 7
5 :3 0 4 :7 0
8 7 :3 0 5
:3 0 6 :7 0 c
b :3 0 d 78
0 b 8 :3 0
7 :7 0 10 f
:3 0 a :3 0 9
:7 0 14 13 :3 0
11 9e 0 f
a :3 0 b :7 0
18 17 :3 0 d
:3 0 c :7 0 1c
1b :3 0 15 c4
0 13 d :3 0
e :7 0 20 1f
:3 0 8 :3 0 f
:7 0 24 23 :3 0
19 ea 0 17
8 :3 0 10 :7 0
28 27 :3 0 8
:3 0 11 :7 0 2c
2b :3 0 1d 110
0 1b 8 :3 0
12 :7 0 30 2f
:3 0 8 :3 0 13
:7 0 34 33 :3 0
21 :2 0 1f 8
:3 0 14 :7 0 38
37 :3 0 16 :3 0
15 :7 0 3c 3b
:3 0 3e :2 0 5b
1 3f :2 0 17
:3 0 2 :3 0 4
:3 0 6 :3 0 7
:3 0 9 :3 0 b
:3 0 c :3 0 e
:3 0 f :3 0 10
:3 0 11 :3 0 12
:3 0 13 :3 0 14
:3 0 15 :3 0 31
:3 0 41 53 54
55 :5 0 41 :4 0
52 :2 0 56 43
5a :3 0 5a 1
:4 0 5a 59 56
57 :6 0 5b :2 0
1 3f 5a 5e
:3 0 5d 5b 5f
:8 0
45
4
:3 0 1 2 1
6 1 a 1
e 1 12 1
16 1 1a 1
1e 1 22 1
26 1 2a 1
2e 1 32 1
36 1 3a f
5 9 d 11
15 19 1d 21
25 29 2d 31
35 39 3d f
42 43 44 45
46 47 48 49
4a 4b 4c 4d
4e 4f 50 1
51 1 55
1
4
0
5e
0
1
14
1
10
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
12 1 0
a 1 0
36 1 0
32 1 0
2 1 0
3a 1 0
1 0 1
2e 1 0
16 1 0
26 1 0
1a 1 0
e 1 0
2a 1 0
1e 1 0
6 1 0
22 1 0
0
/

prompt
prompt Creating procedure ORA_ASPNET_PAU_GETPGSETTINGS
prompt ===============================================
prompt
CREATE OR REPLACE PROCEDURE DUKEPU.ora_aspnet_PAU_GetPgSettings wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
7
9200000
1
4
0
25
2 :e:
1ORA_ASPNET_PAU_GETPGSETTINGS:
1APPNAME:
1NVARCHAR2:
1PAGE:
1PAGESETTINGS:
1OUT:
1BLOB:
1TYPE:
1P_CURSOR:
1REF:
1CURSOR:
1L_PAGESETTINGS:
1L_COUNT:
1NUMBER:
1L_APPLICATIONID:
1RAW:
116:
1L_PAGEID:
1L_CURSOR:
1OPEN:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1NOTFOUND:
1FALSE:
1CLOSE:
1PATHID:
1ORA_ASPNET_PATHS:
1LOWEREDPATH:
1ORA_ASPNET_PERSONALIZNALLUSERS:
1ISOPEN:
1TRUE:
1TOO_MANY_ROWS:
1ROLLBACK:
1ROLLBACK_NR:
0

0
0
cd
2
0 9a 8f a0 b0 3d 8f a0
b0 3d 96 :2 a0 b0 54 b4 55
6a a0 9d :2 a0 c8 77 a3 a0
1c 4d 81 b0 a3 a0 1c 81
b0 a3 a0 51 a5 1c 4d 81
b0 a3 a0 51 a5 1c 4d 81
b0 a3 a0 1c 81 b0 :3 a0 ac
a0 b2 ee :2 a0 7e a0 a5 b
b4 2e ac e5 d0 b2 :2 e9 dd
:2 a0 e9 d3 :2 a0 f a0 7e b4
2e 5a :2 a0 e9 c1 :3 a0 ac a0
b2 ee :2 a0 7e b4 2e :2 a0 7e
a0 a5 b b4 2e a 10 ac
e5 d0 b2 :2 e9 dd :2 a0 e9 d3
:2 a0 f a0 7e b4 2e 5a :2 a0
e9 c1 :3 a0 ac a0 b2 ee :2 a0
7e b4 2e ac e5 d0 b2 :2 e9
dd :2 a0 e9 d3 b7 19 3c b7
19 3c :2 a0 f a0 7e b4 2e
5a :2 a0 e9 c1 b7 19 3c :2 a0
d b7 :2 a0 57 a0 b4 e9 b7
a6 9 a4 a0 b1 11 68 4f
1d 17 b5
cd
2
0 3 1f 1b 1a 27 34 30
17 3c 49 41 45 2f 50 2c
55 59 5d 71 65 69 6d 61
8e 7c 80 88 89 7b aa 99
9d a5 78 c7 b1 b5 b8 b9
c1 c2 98 e5 d2 95 d6 d7
df e0 d1 101 f0 f4 fc ce
ec 108 10c 110 111 115 116 11d
121 125 128 12c 12d 12f 130 135
136 13c 140 141 146 14b 14f 153
157 15c 161 165 169 16e 172 175
176 17b 17e 182 186 18b 18d 191
195 199 19a 19e 19f 1a6 1aa 1ae
1b1 1b2 1b7 1bb 1bf 1c2 1c6 1c7
1c9 1ca 1 1cf 1d4 1d5 1db 1df
1e0 1e5 1ea 1ee 1f2 1f6 1fb 200
204 208 20d 211 214 215 21a 21d
221 225 22a 22c 230 234 238 239
23d 23e 245 249 24d 250 251 256
257 25d 261 262 267 26c 270 274
278 27d 282 284 288 28b 28d 291
294 298 29c 2a1 2a5 2a8 2a9 2ae
2b1 2b5 2b9 2be 2c0 2c2 2c6 2c9
2cd 2d1 2d5 2d7 2db 2df 2e4 2e8
2e9 2ee 2f0 2f1 2f6 2fa 2fe 300
30c 310 312 313 31c
cd
2
0 b 3 13 :3 3 12 :3 3 10
15 :2 3 27 :2 1 4 9 15 19
15 4 3 :2 14 1c 14 :2 3 :3 13
3 5 17 1b 1a 17 22 17
5 3 13 17 16 13 1e 13
:2 3 :3 15 :2 3 8 :3 b 4 b c
25 23 2b :2 25 :2 23 :5 4 3 4
9 17 :2 3 7 10 7 1b :3 19
6 4 a :3 4 9 :3 c 5 c
d 1d :3 1b d 1b 19 21 :2 1b
:2 19 :2 d :5 5 4 5 a 18 :2 4
8 11 8 1c :3 1a 7 5 b
:3 5 a :3 d 6 d e 17 :3 15
:5 6 5 6 b 19 :2 5 23 :2 4
23 :2 3 7 10 7 19 :3 17 6
4 a :2 4 1f :3 3 13 3 2
8 :5 4 :3 3 2 6 :7 1
cd
4
0 1 :4 2 :4 3
:5 4 :3 1 :6 8 :6 9
:5 a :8 b :8 c :5 d
:2 12 :2 13 :3 14 :8 15
14 :4 13 12 13
:4 17 :8 19 :4 1a :2 1d
:2 1e :3 1f :5 20 :8 21
:2 20 1f :4 1e 1d
1e :4 23 :8 25 :4 26
:2 29 :2 2a :3 2b :5 2c
2b :4 2a 29 2a
:4 2e :3 25 :3 19 :8 32
:4 33 :3 32 :3 36 f
39 :5 3b 3a :2 39
38 3d :7 1
31e
4
:3 0 1 :a 0 c8
1 :7 0 5 2c
0 :2 3 :3 0 2
:7 0 4 3 :3 0
9 :2 0 7 3
:3 0 4 :7 0 8
7 :3 0 6 :3 0
7 :3 0 5 :6 0
d c :3 0 f
:2 0 c8 1 10
:2 0 8 :3 0 13
0 16 c6 a
:3 0 b :7 0 9
16 13 :4 0 f
95 0 d 7
:3 0 19 :8 0 1d
1a 1b c6 0
c :6 0 11 :2 0
13 e :3 0 1f
:7 0 22 20 0
c6 0 d :6 0
10 :3 0 11 :2 0
11 24 26 :7 0
2a 27 28 c6
0 f :6 0 19
ec 0 17 10
:3 0 15 2c 2e
:7 0 32 2f 30
c6 0 12 :6 0
14 :3 0 9 :3 0
34 :7 0 37 35
0 c6 0 13
:6 0 13 :3 0 15
:3 0 1b 16 :3 0
1d 3d 46 0
47 :3 0 17 :3 0
18 :3 0 19 :2 0
2 :3 0 1f 40
43 23 41 45
:4 0 49 4a :5 0
3b 3e :3 0 48
:4 0 4d :2 0 ba
39 4b :2 0 13
:3 0 f :4 0 51
:2 0 ba 4e 4f
:3 0 13 :3 0 1a
:3 0 52 53 :3 0
1b :3 0 19 :2 0
28 56 57 :3 0
58 :2 0 1c :3 0
13 :4 0 5d :2 0
a5 5b 0 14
:3 0 13 :3 0 1d
:3 0 2b 1e :3 0
2d 63 73 0
74 :3 0 15 :3 0
f :3 0 19 :2 0
31 67 68 :3 0
1f :3 0 18 :3 0
19 :2 0 4 :3 0
34 6b 6e 38
6c 70 :3 0 69
72 71 :3 0 76
77 :5 0 61 64
:3 0 75 :4 0 7a
:2 0 a5 5f 78
:2 0 13 :3 0 12
:4 0 7e :2 0 a5
7b 7c :3 0 13
:3 0 1a :3 0 7f
80 :3 0 1b :3 0
19 :2 0 3d 83
84 :3 0 85 :2 0
1c :3 0 13 :4 0
8a :2 0 a2 88
0 14 :3 0 13
:3 0 5 :3 0 40
20 :3 0 42 90
96 0 97 :3 0
1d :3 0 12 :3 0
19 :2 0 46 94
95 :4 0 99 9a
:5 0 8e 91 :3 0
98 :4 0 9d :2 0
a2 8c 9b :2 0
13 :3 0 c :4 0
a1 :2 0 a2 9e
9f :3 0 49 a3
86 a2 0 a4
4d 0 a5 4f
a6 59 a5 0
a7
/

prompt
prompt Creating procedure ORA_ASPNET_PAU_RESETPGSETTINGS
prompt =================================================
prompt
CREATE OR REPLACE PROCEDURE DUKEPU.ora_aspnet_PAU_ResetPgSettings wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
7
9200000
1
4
0
1f
2 :e:
1ORA_ASPNET_PAU_RESETPGSETTINGS:
1APPNAME:
1NVARCHAR2:
1PAGE:
1TYPE:
1P_CURSOR:
1REF:
1CURSOR:
1L_COUNT:
1NUMBER:
1L_APPLICATIONID:
1RAW:
116:
1L_PAGEID:
1L_USERID:
1L_CURSOR:
1OPEN:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1NOTFOUND:
1FALSE:
1CLOSE:
1PATHID:
1ORA_ASPNET_PATHS:
1LOWEREDPATH:
1ORA_ASPNET_PERSONALIZNALLUSERS:
1ISOPEN:
1TRUE:
0

0
0
af
2
0 9a 8f a0 b0 3d 8f a0
b0 3d b4 55 6a a0 9d :2 a0
c8 77 a3 a0 1c 81 b0 a3
a0 51 a5 1c 4d 81 b0 a3
a0 51 a5 1c 4d 81 b0 a3
a0 51 a5 1c 4d 81 b0 a3
a0 1c 81 b0 :3 a0 ac a0 b2
ee :2 a0 7e a0 a5 b b4 2e
ac e5 d0 b2 :2 e9 dd :2 a0 e9
d3 :2 a0 f a0 7e b4 2e 5a
:2 a0 e9 c1 :3 a0 ac a0 b2 ee
:2 a0 7e b4 2e :2 a0 7e a0 a5
b b4 2e a 10 ac e5 d0
b2 :2 e9 dd :2 a0 e9 d3 :2 a0 f
a0 7e b4 2e 5a :2 a0 e9 c1
:3 a0 7e b4 2e cd e9 b7 19
3c b7 19 3c :2 a0 f a0 7e
b4 2e 5a :2 a0 e9 c1 b7 19
3c b7 a4 a0 b1 11 68 4f
1d 17 b5
af
2
0 3 1f 1b 1a 27 34 30
17 3c 2f 41 45 49 5d 51
55 59 4d 79 68 6c 74 2c
96 80 84 87 88 90 91 67
b4 a1 64 a5 a6 ae af a0
d2 bf 9d c3 c4 cc cd be
ee dd e1 e9 bb d9 f5 f9
fd fe 102 103 10a 10e 112 115
119 11a 11c 11d 122 123 129 12d
12e 133 138 13c 140 144 149 14e
152 156 15b 15f 162 163 168 16b
16f 173 178 17a 17e 182 186 187
18b 18c 193 197 19b 19e 19f 1a4
1a8 1ac 1af 1b3 1b4 1b6 1b7 1
1bc 1c1 1c2 1c8 1cc 1cd 1d2 1d7
1db 1df 1e3 1e8 1ed 1f1 1f5 1fa
1fe 201 202 207 20a 20e 212 217
219 21d 221 225 228 229 22e 233
238 23a 23e 241 243 247 24a 24e
252 257 25b 25e 25f 264 267 26b
26f 274 276 278 27c 27f 281 285
289 28b 297 29b 29d 29e 2a7
af
2
0 b 3 e :3 3 c :2 3 29
:2 1 4 9 15 19 15 4 3
:3 10 3 5 15 19 18 15 20
15 5 3 10 14 13 10 1b
10 :2 3 10 14 13 10 1b 10
:2 3 :3 13 :2 3 8 :2 b 9 4 9
a 23 21 29 :2 23 :2 21 :5 4 3
4 9 17 :2 3 7 10 7 1b
:3 19 6 4 a :3 4 9 :3 c 5
c d 1d :3 1b d 1b 19 21
:2 1b :2 19 :2 d :5 5 4 5 a 18
:2 4 8 11 8 1c :3 1a 7 5
b :2 5 11 b 14 :3 12 :2 5 23
:2 4 22 :2 3 7 10 7 19 :3 17
6 4 a :2 4 1f :2 3 :2 2 6
:7 1
af
4
0 1 :4 2 :4 3
:3 1 :6 7 :5 8 :8 9
:8 a :8 b :5 c :2 11
:2 12 :3 13 :8 14 13
:4 12 11 12 :4 16
:8 18 :4 19 :2 1c :2 1d
:3 1e :5 1f :8 20 :2 1f
1e :4 1d 1c 1d
:4 22 :8 24 :4 25 28
:5 29 :2 28 :3 24 :3 18
:8 2d :4 2e :3 2d :2 e
31 :7 1
2a9
4
:3 0 1 :a 0 aa
1 :7 0 5 2c
0 :2 3 :3 0 2
:7 0 4 3 :3 0
a 64 0 7
3 :3 0 4 :7 0
8 7 :3 0 a
:2 0 aa 1 b
:2 0 5 :3 0 e
0 11 a8 7
:3 0 8 :7 0 6
11 e :4 0 d
:2 0 e a :3 0
14 :7 0 17 15
0 a8 0 9
:6 0 c :3 0 d
:2 0 c 19 1b
:7 0 1f 1c 1d
a8 0 b :6 0
d :2 0 12 c
:3 0 10 21 23
:7 0 27 24 25
a8 0 e :6 0
18 d9 0 16
c :3 0 14 29
2b :7 0 2f 2c
2d a8 0 f
:6 0 11 :3 0 6
:3 0 31 :7 0 34
32 0 a8 0
10 :6 0 10 :3 0
12 :3 0 1a 13
:3 0 1c 3a 43
0 44 :3 0 14
:3 0 15 :3 0 16
:2 0 2 :3 0 1e
3d 40 22 3e
42 :4 0 46 47
:5 0 38 3b :3 0
45 :4 0 4a :2 0
a5 36 48 :2 0
10 :3 0 b :4 0
4e :2 0 a5 4b
4c :3 0 10 :3 0
17 :3 0 4f 50
:3 0 18 :3 0 16
:2 0 27 53 54
:3 0 55 :2 0 19
:3 0 10 :4 0 5a
:2 0 93 58 0
11 :3 0 10 :3 0
1a :3 0 2a 1b
:3 0 2c 60 70
0 71 :3 0 12
:3 0 b :3 0 16
:2 0 30 64 65
:3 0 1c :3 0 15
:3 0 16 :2 0 4
:3 0 33 68 6b
37 69 6d :3 0
66 6f 6e :3 0
73 74 :5 0 5e
61 :3 0 72 :4 0
77 :2 0 93 5c
75 :2 0 10 :3 0
e :4 0 7b :2 0
93 78 79 :3 0
10 :3 0 17 :3 0
7c 7d :3 0 18
:3 0 16 :2 0 3c
80 81 :3 0 82
:2 0 19 :3 0 10
:4 0 87 :2 0 90
85 0 1d :3 0
1a :3 0 e :3 0
16 :2 0 41 8b
8c :3 0 88 8d
0 8f :2 0 8e
:2 0 90 44 91
83 90 0 92
47 0 93 49
94 56 93 0
95 4e 0 a5
10 :3 0 1e :3 0
96 97 :3 0 1f
:3 0 16 :2 0 52
9a 9b :3 0 9c
:2 0 19 :3 0 10
:4 0 a1 :2 0 a2
9f 0 55 a3
9d a2 0 a4
57 0 a5 59
a9 :3 0 a9 1
:3 0 5e a9 a8
a5 a6 :6 0 aa
:2 0 1 b a9
ad :3 0 ac aa
ae :8 0
65
4
:3 0 1 2 1
6 2 5 9
1 13 1 1a
1 18 1 22
1 20 1 2a
1 28 1 30
1 37 1 39
1 3f 1 41
2 3c 41 1
52 2 51 52
1 5d 1 5f
1 63 2 62
63 1 6a 1
6c 2 67 6c
1 7f 2 7e
7f 1 8a 2
89 8a 2 86
8f 1 91 4
59 76 7a 92
1 94 1 99
2 98 99 1
a0 1 a3 4
49 4d 95 a4
6 12 16 1e
26 2e 33
1
4
0
ad
0
1
14
1
9
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0
/

prompt
prompt Creating procedure ORA_ASPNET_PAU_SETPGSETTINGS
prompt ===============================================
prompt
CREATE OR REPLACE PROCEDURE DUKEPU.ora_aspnet_PAU_SetPgSettings wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
7
9200000
1
4
0
23
2 :e:
1ORA_ASPNET_PAU_SETPGSETTINGS:
1APPNAME:
1NVARCHAR2:
1PAGE:
1PAGESETTINGS_:
1OUT:
1BLOB:
1CURRENTTIME:
1DATE:
1TYPE:
1P_CURSOR:
1REF:
1CURSOR:
1L_APPLICATIONID:
1RAW:
116:
1L_PAGEID:
1L_USERID:
1L_DUMMY:
1L_TEMP:
1INTEGER:
1L_CURSOR:
1ORA_ASPNET_APPS_CREATEAPP:
1ORA_ASPNET_CREATEPAGE:
1OPEN:
1PATHID:
1ORA_ASPNET_PERSONALIZNALLUSERS:
1=:
1NOTFOUND:
1TRUE:
1PAGESETTINGS:
1LASTUPDATEDDATE:
1EMPTY_BLOB:
1ISOPEN:
1CLOSE:
0

0
0
bc
2
0 9a 8f a0 b0 3d 8f a0
b0 3d 96 :2 a0 b0 54 8f a0
b0 3d b4 55 6a a0 9d :2 a0
c8 77 a3 a0 51 a5 1c 4d
81 b0 a3 a0 51 a5 1c 4d
81 b0 a3 a0 51 a5 1c 4d
81 b0 a3 a0 51 a5 1c 4d
81 b0 a3 a0 1c 4d 81 b0
a3 a0 1c 81 b0 :4 a0 a5 b
d :4 a0 a5 57 :3 a0 ac a0 b2
ee :2 a0 7e b4 2e ac e5 d0
b2 :2 e9 dd :2 a0 e9 d3 :2 a0 f
a0 7e b4 2e 5a :6 a0 b4 2e
a0 5 d7 b2 5 e9 b7 :3 a0
e7 :2 a0 7e b4 2e ef f9 e9
b7 :2 19 3c a0 ac :2 a0 b2 ee
:2 a0 7e b4 2e ac ad e5 d0
b2 e9 :2 a0 f a0 7e b4 2e
5a :2 a0 e9 c1 b7 19 3c b7
a4 a0 b1 11 68 4f 1d 17
b5
bc
2
0 3 1f 1b 1a 27 34 30
17 3c 49 41 45 2f 50 5d
59 2c 65 58 6a 6e 72 86
7a 7e 82 76 a4 91 55 95
96 9e 9f 90 c2 af 8d b3
b4 bc bd ae e0 cd ab d1
d2 da db cc fe eb c9 ef
f0 f8 f9 ea 11a 109 10d e7
115 108 136 125 129 131 105 121
13d 141 145 149 14a 14c 150 154
158 15c 160 161 166 16a 16e 172
173 177 178 17f 183 187 18a 18b
190 191 197 19b 19c 1a1 1a6 1aa
1ae 1b2 1b7 1bc 1c0 1c4 1c9 1cd
1d0 1d1 1d6 1d9 1dd 1e1 1e5 1e9
1ed 1f1 1f2 1f7 1fb 1ff 207 208
20c 211 213 217 21b 21f 221 225
229 22c 22d 232 238 239 23e 240
244 248 24b 24f 250 254 258 259
260 264 268 26b 26c 271 1 272
278 27c 27d 282 286 28a 28f 293
296 297 29c 29f 2a3 2a7 2ac 2ae
2b0 2b4 2b7 2b9 2bd 2c1 2c3 2cf
2d3 2d5 2d6 2df
bc
2
0 b 3 13 :3 3 12 :3 3 11
16 :3 3 14 :2 3 27 :2 1 4 9
15 19 15 4 3 14 18 17
14 1f 14 :2 3 e 12 11 e
19 e :2 3 e 12 11 e 19
e :2 3 e 12 11 e 19 e
3 5 :2 10 1b 10 5 3 :3 11
3 7 11 2b 34 :2 11 7 4
1a 2b 31 :2 4 5 a :3 d 6
:2 d 16 :3 14 :5 6 5 6 a 18
:2 4 8 11 8 1c :3 1a 7 11
8 10 1e 8 :3 12 20 6 :4 5
22 :2 e 20 :2 e 17 :3 15 :3 6 :4 4
:2 d 1f d 5 :2 d 16 :3 14 :6 5
7 10 7 19 :3 17 6 7 d
:2 7 :3 3 :2 2 6 :7 1
bc
4
0 1 :4 2 :4 3
:5 4 :4 5 :3 1 :6 9
:8 a :8 b :8 c :8 d
:6 e :5 f :7 14 :6 17
:2 1a :2 1b :3 1c :5 1d
1c :4 1b 1a 1b
:4 20 :8 23 25 :3 26
:6 28 :4 25 23 2b
:3 2c :5 2d :3 2b 29
:3 23 :3 31 :3 32 :5 33
32 34 :4 31 :8 36
:4 38 37 :2 36 :2 11
3b :7 1
2e1
4
:3 0 1 :a 0 b7
1 :7 0 5 2c
0 :2 3 :3 0 2
:7 0 4 3 :3 0
9 55 0 7
3 :3 0 4 :7 0
8 7 :3 0 6
:3 0 7 :3 0 5
:6 0 d c :3 0
10 :2 0 b 9
:3 0 8 :7 0 11
10 :3 0 13 :2 0
b7 1 14 :2 0
a :3 0 17 0
1a b5 c :3 0
d :7 0 b 1a
17 :4 0 10 :2 0
12 f :3 0 10
1d 1f :7 0 23
20 21 b5 0
e :6 0 10 :2 0
16 f :3 0 14
25 27 :7 0 2b
28 29 b5 0
11 :6 0 10 :2 0
1a f :3 0 18
2d 2f :7 0 33
30 31 b5 0
12 :9 0 1e f
:3 0 1c 35 37
:7 0 3b 38 39
b5 0 13 :6 0
22 121 0 20
15 :3 0 3d :7 0
41 3e 3f b5
0 14 :6 0 14
:3 0 b :3 0 43
:7 0 46 44 0
b5 0 16 :6 0
17 :3 0 2 :3 0
e :3 0 24 48
4b 47 4c 0
b2 18 :3 0 e
:3 0 4 :3 0 11
:3 0 27 4e 52
:2 0 b2 19 :3 0
16 :3 0 1a :3 0
2b 1b :3 0 2d
59 5f 0 60
:3 0 1a :3 0 11
:3 0 1c :2 0 31
5d 5e :4 0 62
63 :5 0 57 5a
:3 0 61 :4 0 66
:2 0 b2 55 64
:2 0 16 :3 0 13
:4 0 6a :2 0 b2
67 68 :3 0 16
:3 0 1d :3 0 6b
6c :3 0 1e :3 0
1c :2 0 36 6f
70 :3 0 71 :2 0
1b :3 0 1a :3 0
1f :3 0 20 :3 0
11 :3 0 21 :4 0
78 79 :3 0 8
:3 0 39 :3 0 73
7e 7f 80 :4 0
3d 41 :4 0 7d
:2 0 81 43 8f
1b :3 0 20 :3 0
8 :3 0 83 84
1a :3 0 11 :3 0
1c :2 0 47 88
89 :3 0 82 8c
8a 0 8d 0
4a 0 8b :2 0
8e 4c 90 72
81 0 91 0
8e 0 91 4e
0 b2 1f :3 0
51 5 :3 0 1b
:3 0 53 96 9c
0 9d :3 0 1a
:3 0 11 :3 0 1c
:2 0 57 9a 9b
:4 0 a0 a1 :2 0
9e :2 0 93 97
0 5a 0 9f
:2 0 b2 16 :3 0
22 :3 0 a3 a4
:3 0 1e :3 0 1c
:2 0 5e a7 a8
:3 0 a9 :2 0 23
:3 0 16 :4 0 ae
:2 0 af ac 0
61 b0 aa af
0 b1 63 0
b2 65 b6 :3 0
b6 1 :3 0 6d
b6 b5 b2 b3
:6 0 b7 :2 0 1
14 b6 ba :3 0
b9 b7 bb :8 0

75
4
:3 0 1 2 1
6 1 a 1
f 4 5 9
e 12 1 1e
1 1c 1 26
1 24 1 2e
1 2c 1 36
1 34 1 3c
1 42 2 49
/

prompt
prompt Creating procedure ORA_ASPNET_PA_FINDSTATE
prompt ==========================================
prompt
CREATE OR REPLACE PROCEDURE DUKEPU.ora_aspnet_PA_FindState wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
7
9200000
1
4
0
56
2 :e:
1ORA_ASPNET_PA_FINDSTATE:
1SCOPE:
1NVARCHAR2:
1APPNAME:
1PAGE:
1PAGEINDEX:
1NUMBER:
1PAGESIZE:
1TOTALRECORDS:
1OUT:
1PERSONALIZATIONINFO:
1SYS_REFCURSOR:
1USRNAME:
1INACTIVESINCEDATE:
1DATE:
1TYPE:
1P_CURSOR:
1REF:
1CURSOR:
1L_APPLICATIONID:
1RAW:
116:
1L_PAGELOWERBOUND:
1L_PAGEUPPERBOUND:
1L_CURSOR:
1L_PERSONALIZATIONINFO:
1OPEN:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1NOTFOUND:
1FALSE:
1CLOSE:
1*:
1+:
11:
1-:
1shared:
1COUNT:
1ORA_ASPNET_PATHS:
1PAGES:
1SHAREDPAGEID:
1SHAREDLASTACTIVITYDATE:
1SHAREDDATALENGTH:
1USERPAGEID:
1USERDATALENGTH:
1USERCOUNT:
1PAU:
1PATHID:
1LASTUPDATEDDATE:
1DBMS_LOB:
1GETLENGTH:
1PAGESETTINGS:
1ORA_ASPNET_PERSONALIZNALLUSERS:
1PATHS:
1IS NULL:
1LOWEREDPATH:
1LIKE:
1SHAREDDATAPERPATH:
1SUM:
1PPU:
1ORA_ASPNET_PERSONALIZNPERUSER:
1USERDATAPERPATH:
1(+):
1X:
1EXISTS:
1NOT:
1UNIONTAB:
1ROWNUM:
1RX:
1TEMPTABLE:
1PATH:
1COMBINEDTAB:
1<=:
1>=:
1ORA_ASPNET_USERS:
1USERS:
1USERID:
1USERNAME:
1LASTACTIVITYDATE:
1PAGENAME:
1PAGESETTINGSSIZE:
1ISOPEN:
1TRUE:
0

0
0
52d
2
0 9a 8f a0 b0 3d 8f a0
b0 3d 8f a0 b0 3d 8f a0
b0 3d 8f a0 b0 3d 96 :2 a0
b0 54 96 :2 a0 b0 54 8f a0
4d b0 3d 8f a0 4d b0 3d
b4 55 6a a0 9d :2 a0 c8 77
a3 a0 51 a5 1c 4d 81 b0
a3 a0 1c 81 b0 a3 a0 1c
81 b0 a3 a0 1c 81 b0 a3
a0 1c 81 b0 :3 a0 ac a0 b2
ee :2 a0 7e a0 a5 b b4 2e
ac e5 d0 b2 :2 e9 dd :2 a0 e9
d3 :2 a0 f a0 7e b4 2e 5a
:2 a0 e9 c1 :2 a0 7e a0 b4 2e
7e 51 b4 2e d :2 a0 7e a0
b4 2e 7e 51 b4 2e d :2 a0
a5 b 7e 6e b4 2e 5a a0
d2 9f ac :3 a0 b9 :6 a0 ac :2 a0
6b a0 b9 :2 a0 6b a0 b9 :2 a0
6b :2 a0 6b a5 b a0 b9 ac
:2 a0 b9 :2 a0 b9 b2 ee :2 a0 6b
a0 7e b4 2e :2 a0 6b a0 7e
a0 6b b4 2e a 10 a0 7e
b4 2e 5a :2 a0 6b 7e :2 a0 a5
b b4 2e 5a 52 10 5a a
10 ac d0 eb a0 b9 :2 a0 6b
a0 b9 a0 9f :2 a0 6b :2 a0 6b
a5 b d2 a0 b9 a0 d2 9f
a0 b9 ac :2 a0 b9 :2 a0 b9 b2
ee :2 a0 6b a0 7e b4 2e :2 a0
6b a0 7e a0 6b b4 2e a
10 a0 7e b4 2e 5a :2 a0 6b
7e :2 a0 a5 b b4 2e 5a 52
10 5a a 10 :2 a0 6b ac d0
eb a0 b9 b2 ee :2 a0 :2 7e b4
2e b4 2e ac d0 4d a0 b9
4d a0 b9 4d a0 b9 :3 a0 ac
:2 a0 6b a0 b9 a0 9f :2 a0 6b
:2 a0 6b a5 b d2 a0 b9 a0
d2 9f a0 b9 ac :2 a0 b9 :2 a0
b9 b2 ee :2 a0 6b a0 7e b4
2e :2 a0 6b a0 7e a0 6b b4
2e a 10 a0 7e b4 2e 5a
:2 a0 6b 7e :2 a0 a5 b b4 2e
5a 52 10 5a a 10 :2 a0 6b
ac d0 eb a0 b9 b2 ee 6e
ac :2 a0 6b a0 b9 :2 a0 6b a0
b9 :2 a0 6b :2 a0 6b a5 b a0
b9 ac :2 a0 b9 :2 a0 b9 b2 ee
:2 a0 6b a0 7e b4 2e :2 a0 6b
a0 7e a0 6b b4 2e a 10
a0 7e b4 2e 5a :2 a0 6b 7e
:2 a0 a5 b b4 2e 5a 52 10
5a a 10 ac d0 eb a0 b9
b2 ee :2 a0 7e b4 2e ac d0
eb 7e b4 2e 7e b4 2e ac
d0 bb eb a0 b9 b2 ee :2 a0
6b a0 7e a0 6b b4 2e :2 a0
6b a0 7e a0 6b b4 2e 52
10 5a ac e5 d0 b2 e9 :2 a0
ac :2 a0 b9 a0 6b 7 ac :2 a0
6b :2 a0 6b :2 a0 6b :2 a0 6b :2 a0
6b ac :2 a0 b9 :6 a0 ac :2 a0 6b
a0 b9 :2 a0 6b a0 b9 :2 a0 6b
:2 a0 6b a5 b a0 b9 ac :2 a0
b9 :2 a0 b9 b2 ee :2 a0 6b a0
7e b4 2e :2 a0 6b a0 7e a0
6b b4 2e a 10 a0 7e b4
2e 5a :2 a0 6b 7e :2 a0 a5 b
b4 2e 5a 52 10 5a a 10
ac d0 eb a0 b9 :2 a0 6b a0
b9 a0 9f :2 a0 6b :2 a0 6b a5
b d2 a0 b9 a0 d2 9f a0
b9 ac :2 a0 b9 :2 a0 b9 b2 ee
:2 a0 6b a0 7e b4 2e :2 a0 6b
a0 7e a0 6b b4 2e a 10
a0 7e b4 2e 5a :2 a0 6b 7e
:2 a0 a5 b b4 2e 5a 52 10
5a a 10 :2 a0 6b ac d0 eb
a0 b9 b2 ee :2 a0 :2 7e b4 2e
b4 2e ac d0 4d a0 b9 4d
a0 b9 4d a0 b9 :3 a0 ac :2 a0
6b a0 b9 a0 9f :2 a0 6b :2 a0
6b a5 b d2 a0 b9 a0 d2
9f a0 b9 ac :2 a0 b9 :2 a0 b9
b2 ee :2 a0 6b a0 7e b4 2e
:2 a0 6b a0 7e a0 6b b4 2e
a 10 a0 7e b4 2e 5a :2 a0
6b 7e :2 a0 a5 b b4 2e 5a
52 10 5a a 10 :2 a0 6b ac
d0 eb a0 b9 b2 ee 6e ac
:2 a0 6b a0 b9 :2 a0 6b a0 b9
:2 a0 6b :2 a0 6b a5 b a0 b9
ac :2 a0 b9 :2 a0 b9 b2 ee :2 a0
6b a0 7e b4 2e :2 a0 6b a0
7e a0 6b b4 2e a 10 a0
7e b4 2e 5a :2 a0 6b 7e :2 a0
a5 b b4 2e 5a 52 10 5a
a 10 ac d0 eb a0 b9 b2
ee :2 a0 7e b4 2e ac d0 eb
7e b4 2e 7e b4 2e ac d0
bb eb a0 b9 b2 ee :2 a0 6b
a0 7e a0 6b b4 2e :2 a0 6b
a0 7e a0 6b b4 2e 52 10
5a ac d0
/

prompt
prompt Creating procedure ORA_ASPNET_PA_GETCOUNTOFSTATE
prompt ================================================
prompt
CREATE OR REPLACE PROCEDURE DUKEPU.ora_aspnet_PA_GetCountOfState wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
7
9200000
1
4
0
31
2 :e:
1ORA_ASPNET_PA_GETCOUNTOFSTATE:
1SCOPE:
1NVARCHAR2:
1APPNAME:
1PAGE:
1COUNT:
1OUT:
1NUMBER:
1USRNAME:
1INACTIVESINCEDATE:
1DATE:
1TYPE:
1P_CURSOR:
1REF:
1CURSOR:
1L_APPLICATIONID:
1RAW:
116:
1L_CURSOR:
1L_COUNT:
10:
1OPEN:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1NOTFOUND:
1FALSE:
1CLOSE:
1shared:
1ORA_ASPNET_PATHS:
1P:
1ORA_ASPNET_PERSONALIZNALLUSERS:
1PAU:
1PATHID:
1IS NULL:
1LOWEREDPATH:
1LIKE:
1ORA_ASPNET_USERS:
1U:
1ORA_ASPNET_PERSONALIZNPERUSER:
1PPU:
1USERID:
1LOWEREDUSERNAME:
1LASTACTIVITYDATE:
1<=:
1ISOPEN:
1TRUE:
0

0
0
133
2
0 9a 8f a0 b0 3d 8f a0
b0 3d 8f a0 b0 3d 96 :2 a0
b0 54 8f a0 4d b0 3d 8f
a0 4d b0 3d b4 55 6a a0
9d :2 a0 c8 77 a3 a0 51 a5
1c 4d 81 b0 a3 a0 1c 81
b0 a3 a0 1c 51 81 b0 :3 a0
ac a0 b2 ee :2 a0 7e a0 a5
b b4 2e ac e5 d0 b2 :2 e9
dd :2 a0 e9 d3 :2 a0 f a0 7e
b4 2e 5a :2 a0 e9 c1 :2 a0 a5
b 7e 6e b4 2e 5a a0 d2
9f ac :3 a0 b9 :2 a0 b9 b2 ee
:2 a0 6b a0 7e b4 2e :2 a0 6b
a0 7e a0 6b b4 2e a 10
a0 7e b4 2e 5a :2 a0 6b 7e
:2 a0 a5 b b4 2e 5a 52 10
5a a 10 ac e5 d0 b2 e9
b7 a0 d2 9f ac :3 a0 b9 :2 a0
b9 :2 a0 b9 b2 ee :2 a0 6b a0
7e a0 6b b4 2e :2 a0 6b a0
7e a0 6b b4 2e a 10 :2 a0
6b a0 7e b4 2e a 10 a0
7e b4 2e 5a :2 a0 6b 7e :2 a0
a5 b b4 2e 5a 52 10 5a
a 10 a0 7e b4 2e 5a :2 a0
6b 7e :2 a0 a5 b b4 2e 5a
52 10 5a a 10 a0 7e b4
2e 5a :2 a0 6b a0 7e b4 2e
5a 52 10 5a a 10 ac e5
d0 b2 e9 b7 :2 19 3c b7 19
3c :2 a0 f a0 7e b4 2e 5a
:2 a0 e9 c1 b7 19 3c :2 a0 d
b7 a4 a0 b1 11 68 4f 1d
17 b5
133
2
0 3 1f 1b 1a 27 34 30
17 3c 45 41 2f 4d 5e 56
5a 2c 65 6f 6a 6e 55 77
84 80 52 7f 8c 7c 91 95
99 ad a1 a5 a9 9d ce b8
bc bf c0 c8 c9 b7 ea d9
dd e5 b4 105 f1 f5 fd 100
d8 10c 110 114 d5 118 11c 11d
124 128 12c 12f 133 134 136 137
13c 13d 143 147 148 14d 152 156
15a 15e 163 168 16c 170 175 179
17c 17d 182 185 189 18d 192 194
198 19c 19d 19f 1a2 1a7 1a8 1ad
1b0 1b4 1b8 1bb 1bc 1c0 1c4 1c8
1ca 1ce 1d2 1d4 1d5 1dc 1e0 1e4
1e7 1eb 1ee 1ef 1f4 1f8 1fc 1ff
203 206 20a 20d 20e 1 213 218
21c 21f 220 225 228 22c 230 233
236 23a 23e 23f 241 242 247 1
24a 24f 1 252 257 258 25e 262
263 268 26a 26e 272 275 276 27a
27e 282 284 288 28c 28e 292 296
298 299 2a0 2a4 2a8 2ab 2af 2b2
2b6 2b9 2ba 2bf 2c3 2c7 2ca 2ce
2d1 2d5 2d8 2d9 1 2de 2e3 2e7
2eb 2ee 2f2 2f5 2f6 1 2fb 300
304 307 308 30d 310 314 318 31b
31e 322 326 327 329 32a 32f 1
332 337 1 33a 33f 343 346 347
34c 34f 353 357 35a 35d 361 365
366 368 369 36e 1 371 376 1
379 37e 382 385 386 38b 38e 392
396 399 39d 3a0 3a1 3a6 1 3a9
3ae 1 3b1 3b6 3b7 3bd 3c1 3c2
3c7 3c9 3cd 3d1 3d4 3d6 3da 3dd
3e1 3e5 3ea 3ee 3f1 3f2 3f7 3fa
3fe 402 407 409 40b 40f 412 416
41a 41e 420 424 428 42a 436 43a
43c 43d 446
133
2
0 b 5 17 :2 5 3 16 :3 3
15 :3 3 12 17 :3 3 17 29 :3 3
19 26 :2 3 28 :2 1 4 9 15
19 15 4 5 17 1b 1a 17
22 17 5 3 :3 f :2 3 :2 f 19
f :2 3 8 :3 b 4 b c 25
23 2b :2 25 :2 23 :5 4 3 4 9
17 :2 3 7 10 7 1b :3 19 6
4 a :2 4 8 e :2 8 15 17
:2 15 7 :4 e 1c d 1e d c
2b c 8 d e :2 10 20 :3 1e
e :2 10 19 17 :2 1d :2 17 :2 e :4 f
e 21 :2 23 21 34 3a :2 34 :2 21
20 :2 e d :2 e 8 :4 7 21 :4 e
1c d 1e d c 1d :2 c 2a
c 8 d e :2 10 19 17 :2 1d
:2 17 d :2 f 18 16 :2 1c :2 16 :2 e
d :2 f 1f :3 1d :2 e :4 f e 24
:2 26 24 3b 41 :2 3b :2 24 23 :2 e
d :2 e :4 f e 21 :2 23 21 34
3a :2 34 :2 21 20 :2 e d :2 e :4 f
e 2e :2 30 44 :3 41 2d :2 e d
:2 e 8 :4 7 :4 4 22 :2 3 7 10
7 19 :3 17 6 4 a :2 4 1f
:3 3 c 3 :2 2 6 :7 1
133
4
0 1 :4 2 :4 3
:4 4 :5 5 :5 6 :5 7
:3 1 :6 b :8 c :5 d
:6 e :2 12 :2 13 :3 14
:8 15 14 :4 13 12
13 :4 17 :8 19 :4 1a
:9 1c :5 1e :3 1f :3 20
:2 1f :7 21 :9 22 :2 21
:13 23 :2 21 1f :4 1e
1c :5 27 :3 28 :3 29
:3 2a :2 28 :9 2b :9 2c
:2 2b :7 2d :2 2b :13 2e
:2 2b :13 2f :2 2b :10 30
:2 2b 28 :4 27 24
:3 1c :3 19 :8 34 :4 35
:3 34 :3 38 :2 10 3a
:7 1
448
4
:3 0 1 :a 0 12e
1 :7 0 5 2c
0 :2 3 :3 0 2
:7 0 4 3 :3 0
9 52 0 7
3 :3 0 4 :7 0
8 7 :3 0 3
:3 0 5 :7 0 c
b :6 0 b 7
:3 0 8 :3 0 6
:6 0 11 10 :3 0
3
/

prompt
prompt Creating procedure ORA_ASPNET_PA_RESETSHAREDSTATE
prompt =================================================
prompt
CREATE OR REPLACE PROCEDURE DUKEPU.ora_aspnet_PA_ResetSharedState wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
7
9200000
1
4
0
23
2 :e:
1ORA_ASPNET_PA_RESETSHAREDSTATE:
1RESETCOUNT:
1OUT:
1NUMBER:
1APPNAME:
1NVARCHAR2:
1PAGE:
1TYPE:
1P_CURSOR:
1REF:
1CURSOR:
1L_APPLICATIONID:
1RAW:
116:
1L_CURSOR:
1OPEN:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1NOTFOUND:
1FALSE:
1ORA_ASPNET_PERSONALIZNALLUSERS:
1PATHID:
1PAU:
1ORA_ASPNET_PATHS:
1P:
1IS NULL:
1LOWEREDPATH:
1ROWCOUNT:
10:
1ISOPEN:
1TRUE:
1CLOSE:
0

0
0
a9
2
0 9a 96 :2 a0 b0 54 8f a0
b0 3d 8f a0 4d b0 3d b4
55 6a a0 9d :2 a0 c8 77 a3
a0 51 a5 1c 4d 81 b0 a3
a0 1c 81 b0 :3 a0 ac a0 b2
ee :2 a0 7e a0 a5 b b4 2e
ac e5 d0 b2 :2 e9 dd :2 a0 e9
d3 :2 a0 f a0 7e b4 2e 5a
:2 a0 3e :2 a0 6b ac :2 a0 b9 :2 a0
b9 b2 ee :2 a0 6b a0 7e b4
2e :2 a0 6b a0 7e a0 6b b4
2e a 10 a0 7e b4 2e 5a
:2 a0 6b a0 7e a0 a5 b b4
2e 5a 52 10 5a a 10 ac
d0 eb 48 cd e9 :2 a0 f d
b7 a0 51 d b7 :2 19 3c :2 a0
f a0 7e b4 2e 5a :2 a0 e9
c1 b7 19 3c b7 a4 a0 b1
11 68 4f 1d 17 b5
a9
2
0 3 23 1b 1f 1a 2a 37
33 17 3f 49 44 48 32 51
2f 56 5a 5e 72 66 6a 6e
62 93 7d 81 84 85 8d 8e
7c af 9e a2 aa 79 9a b6
ba be bf c3 c4 cb cf d3
d6 da db dd de e3 e4 ea
ee ef f4 f9 fd 101 105 10a
10f 113 117 11c 120 123 124 129
12c 130 1 134 138 13c 13f 140
144 148 14a 14e 152 154 155 15c
160 164 167 16b 16e 16f 174 178
17c 17f 183 186 18a 18d 18e 1
193 198 19c 19f 1a0 1a5 1a8 1ac
1b0 1b3 1b7 1ba 1be 1bf 1c1 1c2
1c7 1 1ca 1cf 1 1d2 1d7 1d8
1dc 1e0 1e3 1e8 1ed 1f1 1f5 1fa
1fe 200 204 207 20b 20d 211 215
218 21c 220 225 229 22c 22d 232
235 239 23d 242 244 246 24a 24d
24f 253 257 259 265 269 26b 26c
275
a9
2
0 b 3 e 12 :3 3 12 :3 3
10 22 :2 3 29 :2 1 2 7 13
17 13 :2 2 12 16 15 12 1d
12 :2 2 :3 c 2 3 8 :2 b 9
4 9 a 23 21 29 :2 23 :2 21
:5 4 3 4 9 17 :2 3 7 10
7 1b :3 19 6 13 :2 d 17 :2 1b
17 12 31 12 36 47 36 c
:2 12 :2 14 24 :3 22 12 :2 16 1f 1d
:2 21 :2 1d :2 12 :4 14 13 26 :2 28 36
34 3c :2 36 :2 34 25 :2 13 :3 12 c
10 f d :2 7 5 17 13 5
22 5 13 5 :4 3 7 10 7
19 :3 17 6 4 a :2 4 1f :2 3
:2 2 6 :7 1
a9
4
0 1 :5 2 :4 3
:5 4 :3 1 :6 8 :8 9
:5 a :2 e :2 f :3 10
:8 11 10 :4 f e
f :4 13 :8 15 17
:2 18 :4 19 :8 1a :7 1b
:9 1c :2 1b :13 1d :2 1b
1a :2 19 18 :2 17
:4 20 15 :3 22 21
:3 15 :8 25 :4 26 :3 25
:2 c 29 :7 1
277
4
:3 0 1 :a 0 a4
1 :7 0 5 2f
0 :2 3 :3 0 4
:3 0 2 :6 0 5
4 :3 0 9 :2 0
7 6 :3 0 5
:7 0 9 8 :3 0
6 :4 0 7 :7 0
e c d :2 0
10 :2 0 a4 1
11 :2 0 8 :3 0
14 0 17 a2
a :3 0 b :7 0
9 17 14 :4 0
11 9a 0 f
d :3 0 e :2 0
d 1a 1c :7 0
20 1d 1e a2
0 c :6 0 10
:3 0 9 :3 0 22
:7 0 25 23 0
a2 0 f :6 0
f :3 0 11 :3 0
13 12 :3 0 15
2b 34 0 35
:3 0 13 :3 0 14
:3 0 15 :2 0 5
:3 0 17 2e 31
1b 2f 33 :4 0
37 38 :5 0 29
2c :3 0 36 :4 0
3b :2 0 9f 27
39 :2 0 f :3 0
c :4 0 3f :2 0
9f 3c 3d :3 0
f :3 0 16 :3 0
40 41 :3 0 17
:3 0 15 :2 0 20
44 45 :3 0 46
:2 0 18 :3 0 19
:3 0 1a :3 0 19
:3 0 4b 4c 0
23 18 :3 0 1a
:3 0 4f 50 1b
:3 0 1c :3 0 52
53 25 55 7d
0 7e :3 0 1c
:3 0 11 :3 0 57
58 0 c :3 0
15 :2 0 2a 5b
5c :3 0 1a :3 0
19 :3 0 5e 5f
0 1c :3 0 15
:2 0 19 :3 0 61
63 0 2f 62
65 :3 0 5d 67
66 :2 0 7 :3 0
1d :2 0 32 6a
6b :3 0 6c :2 0
1c :3 0 1e :3 0
6e 6f 0 14
:3 0 15 :2 0 7
:3 0 34 71 74
38 72 76 :3 0
77 :2 0 6d 79
78 :2 0 7a :2 0
68 7c 7b :4 0
4e 56 0 7f
:3 0 49 4a 80
48 81 0 83
:2 0 82 :2 0 88
2 :3 0 1f :4 0
85 :3 0 84 86
0 88 3b 8d
2 :3 0 20 :2 0
89 8a 0 8c
3e 8e 47 88
0 8f 0 8c
0 8f 40 0
9f f :3 0 21
:3 0 90 91 :3 0
22 :3 0 15 :2 0
45 94 95 :3 0
96 :2 0 23 :3 0
f :4 0 9b :2 0
9c 99 0 48
9d 97 9c 0
9e 4a 0 9f
4c a3 :3 0 a3
1 :3 0 51 a3
a2 9f a0 :6 0
a4 :2 0 1 11
a3 a7 :3 0 a6
a4 a8 :8 0
55
4
:3 0 1 2 1
7 1 b 3
6 a f 1
1b 1 19 1
21 1 28 1
2a 1 30 1
32 2 2d 32
1 43 2 42
43 1 4d 2
51 54 1 5a
2 59 5a 1
64 2 60 64
1 69 1 73
1 75 2 70
75 2 83 87
1 8b 2 8d
8e 1 93 2
92 93 1 9a
1 9d 4 3a
3e 8f 9e 3
18 1f 24
1
4
0
a7
0
1
14
1
7
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
7 1 0
b 1 0
21 1 0
14 1 0
2 1 0
19 1 0
1 0 1
0
/

prompt
prompt Creating procedure ORA_ASPNET_PA_RESETUSERSTATE
prompt ===============================================
prompt
CREATE OR REPLACE PROCEDURE DUKEPU.ora_aspnet_PA_ResetUserState wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
7
9200000
1
4
0
2d
2 :e:
1ORA_ASPNET_PA_RESETUSERSTATE:
1RESETCOUNT:
1OUT:
1NUMBER:
1APPNAME:
1NVARCHAR2:
1PAGE:
1INACTIVESINCEDATE:
1DATE:
1USRNAME:
1TYPE:
1P_CURSOR:
1REF:
1CURSOR:
1L_APPLICATIONID:
1RAW:
116:
1L_CURSOR:
1OPEN:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1NOTFOUND:
1FALSE:
1CLOSE:
1ORA_ASPNET_PERSONALIZNPERUSER:
1ID:
1PPU:
1ORA_ASPNET_USERS:
1U:
1ORA_ASPNET_PATHS:
1P:
1USERID:
1PATHID:
1IS NULL:
1LOWEREDPATH:
1LOWEREDUSERNAME:
1LASTACTIVITYDATE:
1<=:
1ROWCOUNT:
10:
1ISOPEN:
1TRUE:
0

0
0
ec
2
0 9a 96 :2 a0 b0 54 8f a0
b0 3d 8f a0 4d b0 3d 8f
a0 4d b0 3d 8f a0 4d b0
3d b4 55 6a a0 9d :2 a0 c8
77 a3 a0 51 a5 1c 4d 81
b0 a3 a0 1c 81 b0 :3 a0 ac
a0 b2 ee :2 a0 7e a0 a5 b
b4 2e ac e5 d0 b2 :2 e9 dd
:2 a0 e9 d3 :2 a0 f a0 7e b4
2e 5a :2 a0 e9 c1 :2 a0 3e :2 a0
6b ac :2 a0 b9 :2 a0 b9 :2 a0 b9
b2 ee :2 a0 6b a0 7e a0 6b
b4 2e :2 a0 6b a0 7e a0 6b
b4 2e a 10 :2 a0 6b a0 7e
b4 2e a 10 a0 7e b4 2e
5a :2 a0 6b a0 7e a0 a5 b
b4 2e 5a 52 10 5a a 10
a0 7e b4 2e 5a :2 a0 6b a0
7e a0 a5 b b4 2e 5a 52
10 5a a 10 a0 7e b4 2e
5a :2 a0 6b a0 7e b4 2e 5a
52 10 5a a 10 ac d0 eb
48 cd e9 :2 a0 f d b7 a0
51 d b7 :2 19 3c :2 a0 f a0
7e b4 2e 5a :2 a0 e9 c1 b7
19 3c b7 a4 a0 b1 11 68
4f 1d 17 b5
ec
2
0 3 23 1b 1f 1a 2a 37
33 17 3f 49 44 48 32 51
5e 5a 2f 59 66 73 6f 56
6e 7b 6b 80 84 88 9c 90
94 98 8c bd a7 ab ae af
b7 b8 a6 d9 c8 cc d4 a3
c4 e0 e4 e8 e9 ed ee f5
f9 fd 100 104 105 107 108 10d
10e 114 118 119 11e 123 127 12b
12f 134 139 13d 141 146 14a 14d
14e 153 156 15a 15e 163 165 169
1 16d 171 175 178 179 17d 181
183 187 18b 18d 191 195 197 198
19f 1a3 1a7 1aa 1ae 1b1 1b5 1b8
1b9 1be 1c2 1c6 1c9 1cd 1d0 1d4
1d7 1d8 1 1dd 1e2 1e6 1ea 1ed
1f1 1f4 1f5 1 1fa 1ff 203 206
207 20c 20f 213 217 21a 21e 221
225 226 228 229 22e 1 231 236
1 239 23e 242 245 246 24b 24e
252 256 259 25d 260 264 265 267
268 26d 1 270 275 1 278 27d
281 284 285 28a 28d 291 295 298
29c 29f 2a0 2a5 1 2a8 2ad 1
2b0 2b5 2b6 2ba 2be 2c1 2c6 2cb
2cf 2d3 2d8 2dc 2de 2e2 2e5 2e9
2eb 2ef 2f3 2f6 2fa 2fe 303 307
30a 30b 310 313 317 31b 320 322
324 328 32b 32d 331 335 337 343
347 349 34a 353
ec
2
0 b 3 13 18 :3 3 18 :3 3
16 28 :3 3 19 26 :3 3 18 2a
:2 3 27 :2 1 2 7 13 17 13
:2 2 12 16 15 12 1d 12 :2 2
:3 c 2 3 8 :2 b 9 4 9
a 23 21 29 :2 23 :2 21 :5 4 3
4 9 17 :2 3 7 10 7 1b
:3 19 6 4 a :2 4 10 :2 a 18
:2 1c 18 e 2c e 31 42 31
45 56 45 9 e f :2 13 1c
1a :2 1e :2 1a f :2 13 1c 1a :2 1e
:2 1a :3 f :2 11 21 :3 1f :2 f :4 11 10
24 :2 26 34 32 3a :2 34 :2 32 23
:2 10 :3 f :4 11 10 26 :2 28 3a 38
40 :2 3a :2 38 25 :2 10 :3 f :4 11 10
30 :2 32 46 :3 43 2f :2 10 :3 f 9
11 10 a :3 4 16 12 4 22
5 13 5 :4 3 7 10 7 19
:3 17 6 4 a :2 4 1f :2 3 :2 2
6 :7 1
ec
4
0 1 :5 2 :4 3
:5 4 :5 5 :5 6 :3 1
:6 a :8 b :5 c :2 10
:2 11 :3 12 :8 13 12
:4 11 10 11 :4 15
:8 17 :4 18 1b :6 1c
:b 1d :9 1e :9 1f :2 1e
:7 20 :2 1e :13 21 :2 1e
:13 22 :2 1e :10 23 :2 1e
1d :3 1c :2 1b :4 25
17 :3 27 26 :3 17
:8 2a :4 2b :3 2a :2 e
2e :7 1
355
4
:3 0 1 :a 0 e7
1 :7 0 5 2f
0 :2 3 :3 0 4
:3 0 2 :6 0 5
4 :6 0 7 6
:3 0 5 :7 0 9
8 :3 0 6 :4 0
7 :7 0 e c
d :5 0 :2 9 :3 0
8 :7 0 13 11
12 :2 0 d :2 0
b 6 :3 0 a
:7 0 18 16 17
:2 0 1a :2 0 e7
1 1b :2 0 b
:3 0 1e 0 21
e5 d :3 0 e
:7 0 c 21 1e
:4 0 17 c4 0
15 10 :3 0 11
:2 0 13 24 26
:7 0 2a 27 28
e5 0 f :6 0
13 :3 0 c :3 0
2c :7 0 2f 2d
0 e5 0 12
:6 0 12 :3 0 14
:3 0 19 15 :3 0
1b 35 3e 0
3f :3 0 16 :3 0
17 :3 0 18 :2 0
5 :3 0 1d 38
3b 21 39 3d
:4 0 41 42 :5 0
33 36 :3 0 40
:4 0 45 :2 0 e2
31 43 :2 0 12
:3 0 f :4 0 49
:2 0 e2 46 47
:3 0 12 :3 0 19
:3 0 4a 4b :3 0
1a :3 0 18 :2 0
26 4e 4f :3 0
50 :2 0 1b :3 0
12 :4 0 55 :2 0
cb 53 0 1c
:3 0 1d :3 0 1e
:3 0 1d :3 0 59
5a 0 29 1c
:3 0 1e :3 0 5d
5e 1f :3 0 20
:3 0 60 61 21
:3 0 22 :3 0 63
64 2b 66 c0
0 c1 :3 0 1e
:3 0 23 :3 0 68
69 0 20 :3 0
18 :2 0 23 :3 0
6b 6d 0 31
6c 6f :3 0 1e
:3 0 24 :3 0 71
72 0 22 :3 0
18 :2 0 24 :3 0
74 76 0 36
75 78 :3 0 70
7a 79 :2 0 22
:3 0
/

prompt
prompt Creating procedure ORA_ASPNET_PPU_GETPGSETTINGS
prompt ===============================================
prompt
CREATE OR REPLACE PROCEDURE DUKEPU.ora_aspnet_PPU_GetPgSettings wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
7
9200000
1
4
0
2b
2 :e:
1ORA_ASPNET_PPU_GETPGSETTINGS:
1APPNAME:
1NVARCHAR2:
1PAGE:
1PAGESETTINGS:
1OUT:
1BLOB:
1USRNAME:
1CURRENTTIME:
1DATE:
1TYPE:
1P_CURSOR:
1REF:
1CURSOR:
1L_PAGESETTINGS:
1L_APPLICATIONID:
1RAW:
116:
1L_PAGEID:
1L_USERID:
1L_CURSOR:
1OPEN:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1NOTFOUND:
1FALSE:
1CLOSE:
1PATHID:
1ORA_ASPNET_PATHS:
1LOWEREDPATH:
1USERID:
1ORA_ASPNET_USERS:
1LOWEREDUSERNAME:
1LASTACTIVITYDATE:
1ORA_ASPNET_PERSONALIZNPERUSER:
1ISOPEN:
1TRUE:
1TOO_MANY_ROWS:
1ROLLBACK:
1ROLLBACK_NR:
0

0
0
11d
2
0 9a 8f a0 b0 3d 8f a0
b0 3d 96 :2 a0 b0 54 8f a0
4d b0 3d 8f a0 4d b0 3d
b4 55 6a a0 9d :2 a0 c8 77
a3 a0 1c 4d 81 b0 a3 a0
51 a5 1c 4d 81 b0 a3 a0
51 a5 1c 4d 81 b0 a3 a0
51 a5 1c 4d 81 b0 a3 a0
1c 81 b0 :3 a0 ac a0 b2 ee
:2 a0 7e a0 a5 b b4 2e ac
e5 d0 b2 :2 e9 dd :2 a0 e9 d3
:2 a0 f a0 7e b4 2e 5a :2 a0
e9 c1 :3 a0 ac a0 b2 ee :2 a0
7e b4 2e :2 a0 7e a0 a5 b
b4 2e a 10 ac e5 d0 b2
:2 e9 dd :2 a0 e9 d3 :2 a0 f a0
7e b4 2e 5a :2 a0 e9 c1 :3 a0
ac a0 b2 ee :2 a0 7e b4 2e
:2 a0 7e a0 a5 b b4 2e a
10 ac e5 d0 b2 :2 e9 dd :2 a0
e9 d3 :2 a0 f a0 7e b4 2e
5a :2 a0 e9 c1 :3 a0 e7 :2 a0 7e
b4 2e ef f9 e9 :3 a0 ac a0
b2 ee :2 a0 7e b4 2e :2 a0 7e
b4 2e a 10 ac e5 d0 b2
:2 e9 dd :2 a0 e9 d3 b7 19 3c
b7 19 3c b7 19 3c :2 a0 f
a0 7e b4 2e 5a :2 a0 e9 c1
b7 19 3c :2 a0 d b7 :2 a0 57
a0 b4 e9 b7 a6 9 a4 a0
b1 11 68 4f 1d 17 b5
11d
2
0 3 1f 1b 1a 27 34 30
17 3c 49 41 45 2f 50 5d
59 2c 58 65 72 6e 55 6d
7a 6a 7f 83 87 9b 8f 93
97 8b b8 a6 aa b2 b3 a5
d6 c3 a2 c7 c8 d0 d1 c2
f4 e1 bf e5 e6 ee ef e0
112 ff dd 103 104 10c 10d fe
12e 11d 121 129 fb 119 135 139
13d 13e 142 143 14a 14e 152 155
159 15a 15c 15d 162 163 169 16d
16e 173 178 17c 180 184 189 18e
192 196 19b 19f 1a2 1a3 1a8 1ab
1af 1b3 1b8 1ba 1be 1c2 1c6 1c7
1cb 1cc 1d3 1d7 1db 1de 1df 1e4
1e8 1ec 1ef 1f3 1f4 1f6 1f7 1
1fc 201 202 208 20c 20d 212 217
21b 21f 223 228 22d 231 235 23a
23e 241 242 247 24a 24e 252 257
259 25d 261 265 266 26a 26b 272
276 27a 27d 27e 283 287 28b 28e
292 293 295 296 1 29b 2a0 2a1
2a7 2ab 2ac 2b1 2b6 2ba 2be 2c2
2c7 2cc 2d0 2d4 2d9 2dd 2e0 2e1
2e6 2e9 2ed 2f1 2f6 2f8 2fc 300
304 306 30a 30e 311 312 317 31d
31e 323 327 32b 32f 330 334 335
33c 340 344 347 348 34d 351 355
358 359 1 35e 363 364 36a 36e
36f 374 379 37d 381 385 38a 38f
391 395 398 39a 39e 3a1 3a3 3a7
3aa 3ae 3b2 3b7 3bb 3be 3bf 3c4
3c7 3cb 3cf 3d4 3d6 3d8 3dc 3df
3e3 3e7 3eb 3ed 3f1 3f5 3fa 3fe
3ff 404 406 407 40c 410 414 416
422 426 428 429 432
11d
2
0 b 3 13 :3 3 12 :3 3 10
15 :3 3 14 26 :3 3 14 21 :2 3
27 :2 1 4 9 15 19 15 4
3 :2 14 1c 14 3 5 17 1b
1a 17 22 17 5 3 13 17
16 13 1e 13 :2 3 13 17 16
13 1e 13 :2 3 :3 15 :2 3 8 :3 b
4 b c 25 23 2b :2 25 :2 23
:5 4 3 4 9 17 :2 3 7 10
7 1b :3 19 6 4 a :3 4 9
:3 c 5 c d 1d :3 1b d 1b
19 21 :2 1b :2 19 :2 d :5 5 4 5
a 18 :2 4 8 11 8 1c :3 1a
7 5 b :3 5 a :3 d 6 d
e 1e :3 1c e 20 1e 26 :2 20
:2 1e :2 e :5 6 5 6 d 1b :2 7
d 16 d 21 :3 1f c 7 d
:2 7 :2 f 22 :2 f 18 :3 16 :4 7 c
:3 f 8 f 10 19 :3 17 f 18
:3 16 :2 10 :5 8 7 8 d 1b :2 7
28 :2 9 23 :2 4 23 :2 3 7 10
7 19 :3 17 6 4 a :2 4 1f
:3 3 13 3 2 8 :5 4 :3 3 2
6 :7 1
11d
4
0 1 :4 2 :4 3
:5 4 :5 5 :5 6 :3 1
:6 a :6 b :8 c :8 d
:8 e :5 f :2 14 :2 15
:3 16 :8 17 16 :4 15
14 15 :4 19 :8 1b
:4 1c :2 1f :2 20 :3 21
:5 22 :8 23 :2 22 21
:4 20 1f 20 :4 25
:8 27 :4 28 :2 2b :2 2c
:3 2d :5 2e :8 2f :2 2e
2d :4 2c 2b 2c
:4 32 :8 34 :4 36 39
:3 3a :5 3b :3 39 :2 3e
:2 3f :3 40 :5 41 :5 42
:2 41 40 :4 3f 3e
3f :4 44 :3 34 :3 27
:3 1b :8 49 :4 4a :3 49
:3 4d 11 50 :5 52
51 :2 50 4f 54
:7 1
434
4
:3 0 1 :a 0 118
1 :7 0 5 2c
0 :2 3 :3 0 2
:7 0 4 3 :6 0
7 3 :3 0 4
:7 0 8 7 :3 0
6 :3 0 7 :3 0
5 :6 0 d c
:6 0 9 3 :3 0
8 :7 0 12 10
11 :2 0 d :2 0
b a :3 0 9
:7 0 17 15 16
:2 0 19 :2 0 118
1 1a :2 0 b
:3 0 1d 0 20
116 d :3 0 e
:7 0 c 20 1d
:4 0 12 :2 0 13
7 :3 0 23 :8 0
27 24 25 116
0 f :6 0 12
:2 0 17 11 :3 0
15 29 2b :7 0
2f 2c 2d 116
0
/

prompt
prompt Creating procedure ORA_ASPNET_PPU_RESETPGSETTINGS
prompt =================================================
prompt
CREATE OR REPLACE PROCEDURE DUKEPU.ora_aspnet_PPU_ResetPgSettings wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
7
9200000
1
4
0
26
2 :e:
1ORA_ASPNET_PPU_RESETPGSETTINGS:
1APPNAME:
1NVARCHAR2:
1PAGE:
1USRNAME:
1CURRENTTIME:
1DATE:
1TYPE:
1P_CURSOR:
1REF:
1CURSOR:
1L_COUNT:
1NUMBER:
1L_APPLICATIONID:
1RAW:
116:
1L_PAGEID:
1L_USERID:
1L_CURSOR:
1OPEN:
1APPLICATIONID:
1ORA_ASPNET_APPLICATIONS:
1LOWEREDAPPLICATIONNAME:
1LOWER:
1=:
1NOTFOUND:
1FALSE:
1CLOSE:
1PATHID:
1ORA_ASPNET_PATHS:
1LOWEREDPATH:
1USERID:
1ORA_ASPNET_USERS:
1LOWEREDUSERNAME:
1LASTACTIVITYDATE:
1ORA_ASPNET_PERSONALIZNPERUSER:
1ISOPEN:
1TRUE:
0

0
0
fc
2
0 9a 8f a0 b0 3d 8f a0
b0 3d 8f a0 4d b0 3d 8f
a0 4d b0 3d b4 55 6a a0
9d :2 a0 c8 77 a3 a0 1c 81
b0 a3 a0 51 a5 1c 4d 81
b0 a3 a0 51 a5 1c 4d 81
b0 a3 a0 51 a5 1c 4d 81
b0 a3 a0 1c 81 b0 :3 a0 ac
a0 b2 ee :2 a0 7e a0 a5 b
b4 2e ac e5 d0 b2 :2 e9 dd
:2 a0 e9 d3 :2 a0 f a0 7e b4
2e 5a :2 a0 e9 c1 :3 a0 ac a0
b2 ee :2 a0 7e b4 2e :2 a0 7e
a0 a5 b b4 2e a 10 ac
e5 d0 b2 :2 e9 dd :2 a0 e9 d3
:2 a0 f a0 7e b4 2e 5a :2 a0
e9 c1 :3 a0 ac a0 b2 ee :2 a0
7e b4 2e :2 a0 7e a0 a5 b
b4 2e a 10 ac e5 d0 b2
:2 e9 dd :2 a0 e9 d3 :2 a0 f a0
7e b4 2e 5a :2 a0 e9 c1 :3 a0
e7 :2 a0 7e b4 2e ef f9 e9
:3 a0 7e b4 2e :2 a0 7e b4 2e
a 10 cd e9 b7 19 3c b7
19 3c b7 19 3c :2 a0 f a0
7e b4 2e 5a :2 a0 e9 c1 b7
19 3c b7 a4 a0 b1 11 68
4f 1d 17 b5
fc
2
0 3 1f 1b 1a 27 34 30
17 3c 46 41 45 2f 4e 5b
57 2c 56 63 53 68 6c 70
84 78 7c 80 74 a0 8f 93
9b 8e be ab 8b af b0 b8
b9 aa dc c9 a7 cd ce d6
d7 c8 fa e7 c5 eb ec f4
f5 e6 116 105 109 111 e3 101
11d 121 125 126 12a 12b 132 136
13a 13d 141 142 144 145 14a 14b
151 155 156 15b 160 164 168 16c
171 176 17a 17e 183 187 18a 18b
190 193 197 19b 1a0 1a2 1a6 1aa
1ae 1af 1b3 1b4 1bb 1bf 1c3 1c6
1c7 1cc 1d0 1d4 1d7 1db 1dc 1de
1df 1 1e4 1e9 1ea 1f0 1f4 1f5
1fa 1ff 203 207 20b 210 215 219
21d 222 226 229 22a 22f 232 236
23a 23f 241 245 249 24d 24e 252
253 25a 25e 262 265 266 26b 26f
273 276 27a 27b 27d 27e 1 283
288 289 28f 293 294 299 29e 2a2
2a6 2aa 2af 2b4 2b8 2bc 2c1 2c5
2c8 2c9 2ce 2d1 2d5 2d9 2de 2e0
2e4 2e8 2ec 2ee 2f2 2f6 2f9 2fa
2ff 305 306 30b 30f 313 317 31a
31b 320 324 328 32b 32c 1 331
336 33b 340 342 346 349 34b 34f
352 354 358 35b 35f 363 368 36c
36f 370 375 378 37c 380 385 387
389 38d 390 392 396 39a 39c 3a8
3ac 3ae 3af 3b8
fc
2
0 b 3 11 :3 3 f :3 3 11
23 :3 3 13 23 :2 3 29 :2 1 4
9 15 19 15 4 3 :3 10 3
5 15 19 18 15 20 15 5
3 10 14 13 10 1b 10 :2 3
10 14 13 10 1b 10 :2 3 :3 13
:2 3 8 :3 b 4 :2 b 24 22 2a
:2 24 :2 22 :5 4 3 4 9 17 :2 3
7 10 7 1b :3 19 6 4 a
:3 4 9 :3 c 5 c d 1d :3 1b
d 1b 19 21 :2 1b :2 19 :2 d :5 5
4 5 a 18 :2 4 8 11 8
1c :3 1a 7 5 b :3 5 a :3 d
6 d e 1e :3 1c e 20 1e
26 :2 20 :2 1e :2 e :5 6 5 6 c
1a :2 6 d 16 d 21 :3 1f c
7 d :2 7 :2 f 22 :2 f 18 :3 16
:3 7 13 d 16 :3 14 c 15 :3 13
:2 d :2 7 28 :2 9 23 :2 4 22 :2 3
7 10 7 19 :3 17 6 4 a
:2 4 1f :2 3 :2 2 6 :7 1
fc
4
0 1 :4 2 :4 3
:5 4 :5 5 :3 1 :6 9
:5 a :8 b :8 c :8 d
:5 e :2 13 :2 14 :3 15
:8 16 15 :4 14 13
14 :4 18 :8 1a :4 1b
:2 1e :2 1f :3 20 :5 21
:8 22 :2 21 20 :4 1f
1e 1f :4 24 :8 26
:4 27 :2 2a :2 2b :3 2c
:5 2d :8 2e :2 2d 2c
:4 2b 2a 2b :4 30
:8 32 :4 33 36 :3 37
:5 38 :3 36 3b :5 3c
:5 3d :2 3c :2 3b :3 32
:3 26 :3 1a :8 42 :4 43
:3 42 :2 10 46 :7 1

3ba
4
:3 0 1 :a 0 f7
1 :7 0 5 2c
0 :2 3 :3 0 2
:7 0 4 3 :6 0
7 3 :3 0 4
:7 0 8 7 :3 0
3 :4 0 5 :7 0
d b c :2 0
b :2 0 9 7
:3 0 6 :7 0 12
10 11 :2 0 14
:2 0 f7 1 15
:2 0 8 :3 0 18
0 1b f5 a
:3 0 b :7 0 9
1b 18 :4 0 10
:2 0 10 d :3 0
1e :7 0 21 1f
0 f5 0 c
:6 0 10 :2 0 14
f :3 0 12 23
25 :7 0 29 26
27 f5 0 e
:6 0 10 :2 0 18
f :3 0 16 2b
2d :7 0 31 2e
2f f5 0 11
:6 0 1e 101 0
1c f :3 0 1a
33 35 :7 0 39
36 37 f5 0
12 :6 0 14 :3 0
9 :3 0 3b :7 0
3e 3c 0 f5
0 13 :6 0 13
:3 0 15 :3 0 20
16 :3 0 22 44
4d 0 4e :3 0
17 :3 0 18 :3 0
19 :2 0 2 :3 0
24 47 4a 28
48 4c :4 0 50
51 :5 0 42 45
:3 0 4f :4 0 54
:2 0 f2 40 52
:2 0 13 :3 0 e
:4 0 58 :2 0 f2
55 56 :3 0 13
:3 0 1a :3 0 59
5a :3 0 1b :3 0
19 :2 0 2d 5d
5e :3 0 5f :2 0
1c :3 0 13 :4 0
64 :2 0 e0 62
0 14 :3
/

prompt
prompt Creating procedure ORA_ASPNET_PPU_SETPGSETTINGS
prompt ===============================================
prompt
CREATE OR REPLACE PROCEDURE DUKEPU.ora_aspnet_PPU_SetPgSettings wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
7
9200000
1
4
0
29
2 :e:
1ORA_ASPNET_PPU_SETPGSETTINGS:
1APPNAME:
1NVARCHAR2:
1PAGE:
1PAGESETTINGS_:
1OUT:
1BLOB:
1CURRENTTIME:
1DATE:
1USRNAME:
1TYPE:
1P_CURSOR:
1REF:
1CURSOR:
1L_APPLICATIONID:
1RAW:
116:
1L_PAGEID:
1L_USERID:
1L_DUMMY:
1L_TEMP:
1INTEGER:
1L_CURSOR:
1ORA_ASPNET_APPS_CREATEAPP:
1ORA_ASPNET_CREATEPAGE:
1ORA_ASPNET_CREATEUSER:
10:
1ORA_ASPNET_USERS:
1LASTACTIVITYDATE:
1USERID:
1=:
1OPEN:
1PATHID:
1ORA_ASPNET_PERSONALIZNPERUSER:
1NOTFOUND:
1TRUE:
1PAGESETTINGS:
1LASTUPDATEDDATE:
1EMPTY_BLOB:
1ISOPEN:
1CLOSE:
0

0
0
ec
2
0 9a 8f a0 b0 3d 8f a0
b0 3d 96 :2 a0 b0 54 8f a0
b0 3d 8f a0 4d b0 3d b4
55 6a a0 9d :2 a0 c8 77 a3
a0 51 a5 1c 4d 81 b0 a3
a0 51 a5 1c 4d 81 b0 a3
a0 51 a5 1c 4d 81 b0 a3
a0 51 a5 1c 4d 81 b0 a3
a0 1c 4d 81 b0 a3 a0 1c
81 b0 :4 a0 a5 b d :4 a0 a5
57 :3 a0 51 :2 a0 a5 57 :3 a0 e7
:2 a0 7e b4 2e ef f9 e9 :3 a0
ac a0 b2 ee :2 a0 7e b4 2e
:2 a0 7e b4 2e a 10 ac e5
d0 b2 :2 e9 dd :2 a0 e9 d3 :2 a0
f a0 7e b4 2e 5a :8 a0 b4
2e a0 5 d7 b2 5 e9 b7
:3 a0 e7 :2 a0 7e b4 2e :2 a0 7e
b4 2e a 10 ef f9 e9 b7
:2 19 3c a0 ac :2 a0 b2 ee :2 a0
7e b4 2e :2 a0 7e b4 2e a
10 ac ad e5 d0 b2 e9 :2 a0
f a0 7e b4 2e 5a :2 a0 e9
c1 b7 19 3c b7 a4 a0 b1
11 68 4f 1d 17 b5
ec
2
0 3 1f 1b 1a 27 34 30
17 3c 49 41 45 2f 50 5d
59 2c 65 6f 6a 6e 58 77
55 7c 80 84 98 8c 90 94
88 b9 a3 a7 aa ab b3 b4
a2 d7 c4 9f c8 c9 d1 d2
c3 f5 e2 c0 e6 e7 ef f0
e1 113 100 de 104 105 10d 10e
ff 12f 11e 122 fc 12a 11d 14b
13a 13e 146 11a 136 152 156 15a
15e 15f 161 165 169 16d 171 175
176 17b 17f 183 187 18a 18e 192
193 198 19c 1a0 1a4 1a6 1aa 1ae
1b1 1b2 1b7 1bd 1be 1c3 1c7 1cb
1cf 1d0 1d4 1d5 1dc 1e0 1e4 1e7
1e8 1ed 1f1 1f5 1f8 1f9 1 1fe
203 204 20a 20e 20f 214 219 21d
221 225 22a 22f 233 237 23c 240
243 244 249 24c 250 254 258 25c
260 264 268 26c 26d 272 276 27a
282 283 287 28c 28e 292 296 29a
29c 2a0 2a4 2a7 2a8 2ad 2b1 2b5
2b8 2b9 1 2be 2c3 2c9 2ca 2cf
2d1 2d5 2d9 2dc 2e0 2e1 2e5 2e9
2ea 2f1 2f5 2f9 2fc 2fd 302 306
30a 30d 30e 1 313 318 1 319
31f 323 324 329 32d 331 336 33a
33d 33e 343 346 34a 34e 353 355
357 35b 35e 360 364 368 36a 376
37a 37c 37d 386
ec
2
0 b 3 13 :3 3 12 :3 3 11
16 :3 3 14 :3 3 14 26 :2 3 27
:2 1 4 9 15 19 15 4 3
14 18 17 14 1f 14 :2 3 12
16 15 12 1d 12 :2 3 12 16
15 12 1d 12 :2 3 12 16 15
12 1d 12 3 5 :2 14 1f 14
5 3 :3 15 3 7 11 2b 34
:2 11 7 4 1a 2b 31 :2 4 5
1b 2c 35 38 45 :2 5 :2 b 1e
b c 15 :3 13 :3 4 5 a :3 d
6 d e 17 :3 15 d 16 :3 14
:2 e :5 6 5 6 a 18 :2 4 8
11 8 1c :3 1a 7 12 8 10
18 26 8 12 :3 1c 2a :5 6 22
:2 e 20 :2 e 17 :3 15 e 17 :3 15
:2 e :3 6 :4 4 :2 d 1f d 5 :2 d
16 :3 14 d 16 :3 14 :2 d :6 5 7
10 7 19 :3 17 6 7 d :2 7
1f :2 3 :2 2 6 :7 1
ec
4
0 1 :4 2 :4 3
:5 4 :4 5 :5 6 :3 1
:6 a :8 b :8 c :8 d
:8 e :6 f :5 10 :7 15
:6 18 :8 1b 1e :3 1f
:5 20 :3 1e :2 23 :2 24
:3 25 :5 26 :5 27 :2 26
25 :4 24 23 24
:4 2a :8 2d 2f :4 30
:7 32 :4 2f 2d 35
:3 36 :5 37 :5 38 :2 37
:3 35 33 :3 2d :3 3c
:3 3d :5 3e :5 3f :2 3e
3d 40 :4 3c :8 42
:4 43 :3 42 :2 12 46
:7 1
388
4
:3 0 1 :a 0 e7
1 :7 0 5 2c
0 :2 3 :3 0 2
:7 0 4 3 :3 0
9 55 0 7
3 :3 0 4 :7 0
8 7 :3 0 6
:3 0 7 :3 0 5
:6 0 d c :3 0
d :2 0 b 9
:3 0 8 :7 0 11
10 :3 0 3 :4 0
a :7 0 16 14
15 :2 0 18 :2 0
e7 1 19 :2 0
b :3 0 1c 0
1f e5 d :3 0
e :7 0 c 1f
1c :4 0 11 :2 0
15 10 :3 0 11
:2 0 13 22 24
:7 0 28 25 26
e5 0 f :6 0
11 :2 0 19 10
:3 0 17 2a 2c
:7 0 30 2d 2e
e5 0 12 :6 0
11 :2 0 1d 10
:3 0 1b 32 34
:7 0 38 35 36
e5 0 13 :9 0
21 10 :3 0 1f
3a 3c :7 0 40
3d 3e e5 0
14 :6 0 25 136
0 23 16 :3 0
42 :7 0 46 43
44 e5 0 15
:6 0 15 :3 0 c
:3 0 48 :7 0 4b
49 0 e5 0
17 :6 0 18 :3 0
2 :3 0 f :3 0
27 4d 50 4c
51 0 e2 19
:3 0 f :3 0 4
:3 0 12 :3 0 2a
53 57 :2 0 e2
1a :3 0 f :3 0
a :3 0 1b :2 0
8 :3 0 13 :3 0
2e 59 5f :2 0
e2 1c :3 0 1d
:3 0 8 :3 0 62
63 1e :3 0 13
:3 0 1f :2 0 36
67 68 :3 0 61
6b 69 0 6c
0 39 0 6a
:2 0 e2 20 :3 0
17 :3 0 21 :3 0
3b 22 :3 0 3d
72 7f 0 80
:3 0 1e :3 0 13
:3 0 1f :2 0 41
76 77 :3 0 21
:3 0 12 :3 0 1f
:2 0 46 7b 7c
:3 0 78
/

prompt
prompt Creating procedure SAVEDAILYCAPACITYTOHISTORY
prompt =============================================
prompt
create or replace procedure dukepu.SaveDailyCapacityToHistory(S_D_C IN INTEGER)
is
begin

     INSERT INTO Daily_Capacity_History(
            SEQ,
            JOB_NUMBER,
            PRODUCTS_NAME,
            SUMMARY_PROCESS,
            SPECIFIC_PROCESS,
            MANUFACTURE_QUANTITIES,
            YIELDS_TIME,
            SUBMIT_PERSON,
            UPDATE_TIME,
            SAVED_HISTORY_TIME
     )
     SELECT SEQ,
            JOB_NUMBER,
            PRODUCTS_NAME,
            NVL(SUMMARY_PROCESS,'NULL'),
            SPECIFIC_PROCESS,
            MANUFACTURE_QUANTITIES,
            YIELDS_TIME,
            SUBMIT_PERSON,
            UPDATE_TIME,
            SYSDATE
     FROM Daily_Capacity
     WHERE SEQ =S_D_C;


end SaveDailyCapacityToHistory;
/

prompt
prompt Creating procedure SAVETOAFL
prompt ============================
prompt
create or replace procedure dukepu.SaveToAFL AS
     v_Job_Number Ask_For_leave.Job_Number%type;
     v_name Ask_For_leave_temp.name%type;
     v_leave_Start_Time Ask_For_Leave.Leave_Start_Time%type;
     v_leave_End_Time Ask_For_Leave.leave_end_Time%type;
     v_NO Ask_For_Leave_Temp.No%type;

       ---获取起始日的:  年月日字符串.
     v_current_date            date;        ---当前日期:
     v_start_date_temp         date;        ---起始日期变量.(临时变量)
     v_end_date_temp           date;        ---终止日期变量(临时变量)
     v_start_time_str_temp     varchar2(20);   ---时间变量(字符串部分)
     v_end_time_str_temp       varchar2(20);   --时间变量(字符串变量)

begin
     ---将临时记录保存到Ask_For_Leave表中.
     ----如果
     select JOB_NUMBER,name,LEAVE_START_TIME,LEAVE_END_TIME,NO
            INTO V_JOB_NUMBER,v_name,v_leave_Start_Time,v_leave_End_Time,v_NO
     FROM ASK_FOR_LEAVE_TEMP;
       ---如果起始时间与结束时间不是同一日
          v_start_date_temp := trunc(v_leave_start_time,'DD');
          v_end_date_temp:= trunc(v_leave_end_time,'DD');
          v_current_date:= trunc(v_leave_start_time,'DD');

     LOOP
          EXIT WHEN v_current_date > v_end_date_temp;
          IF (v_current_date = v_start_date_temp)  THEN
              v_start_time_str_temp := TO_CHAR(v_leave_Start_Time,'YYYY-MM-DD HH24:MI:SS');
          ELSE
              v_start_time_str_temp:= TO_CHAR(v_current_date,'YYYY-MM-DD') || ' 08:00:00';
          END IF;

          IF (v_current_date = v_end_date_temp) THEN
              v_end_time_str_temp := TO_CHAR(v_leave_End_Time,'YYYY-MM-DD HH24:MI:SS');
          ELSE
              v_end_time_str_temp:= TO_CHAR(v_current_date,'YYYY-MM-DD') || ' 17:00:00';
          END IF;

          INSERT INTO ASK_FOR_LEAVE(
                seq,
                job_number,
                name,
                leave_start_time,
                leave_end_time,
                record_time,
                no
          )VALUES(
                SEQ_ASK_FOR_LEAVE.NEXTVAL,
                v_JOB_NUMBER,
                v_name,
                TO_DATE(v_start_time_str_temp,'YYYY-MM-DD HH24:MI:SS'),
                TO_DATE(v_end_time_str_temp,'YYYY-MM-DD HH24:MI:SS'),
                SYSDATE,
                v_NO
          );
          v_current_date:= v_current_date + 1;
     END LOOP;
end SaveToAFL;
/

prompt
prompt Creating procedure SP_DEMO
prompt ==========================
prompt
create or replace procedure dukepu.sp_demo(
       emp_no in varchar2,
       o_res1 out varchar2,
       o_res2 out varchar2,
       o_ds1 out sys_refcursor,
       o_ds2 out sys_refcursor
)
is
   v_count number;
begin
     open o_ds1 for
     select 'hello world'
     from dual;

     open o_ds2
     for select 'hello world'
     from dual;

     o_res1:= 'ok';
     o_res2:= to_char(sysdate,'yyyy/mm/dd hh24:mi:ss');

     return;

end;
/

prompt
prompt Creating procedure SP_IMPORT_DC_TEMP_TO_PR
prompt ==========================================
prompt
create or replace procedure dukepu.sp_import_DC_Temp_To_PR(v_Dept nvarchar2,v_result out INT) as

       --type cur_t is ref cursor;
       --name_cur cur_t;


       --v_Count INT;

       --v_Name Products_Record_Temp.Name%TYPE;
       --v_Sheet_Name Products_Record_Temp.Sheet_Name%TYPE;
begin
  ---此存储过程用于导入单据BillNo中的数据到 Product_Record.
  ----先检查该单据中的每个姓名是否是唯一的.

       ---不检查名字在考勤表中是否存在,重复.
       /*
       OPEN name_cur FOR
       SELECT
              DISTINCT
              name,
              SHEET_NAME
       FROM Products_Record_Temp  P_R_T
       WHERE P_R_T.dept = v_dept
       AND   P_R_T.Year_And_Month = v_year_and_month;


       DELETE MESSAGE
       WHERE RANDOM_STR = v_RandomStr;

       ---判断 dep
       LOOP
          FETCH name_cur INTO
                          v_Name,
                          v_Sheet_Name;
          EXIT WHEN  name_cur%NOTFOUND;

          ---判断此人,本月是否有考勤记录.
          select COUNT(distinct job_number) INTO v_Count
          from Attendance_Record AR
          WHERE TRUNC(AR.FingerPrint_Date,'MM') = TO_DATE(v_year_and_month,'YYYY-MM')
          AND AR.Name = v_Name;
          IF(v_Count=0) THEN
               ---保存信息到MESSAGE中.
              ---保存错误信息.
            INSERT INTO MESSAGE(
                   PROMPT,
                   FLAG,
                   OPERATE_TIME,
                   SUBJECT,
                   RANDOM_STR
            )
            VALUES(
                   v_Sheet_Name ||' ' ||v_year_and_month ||' '|| v_dept|| ' '|| v_Name || ' 不存在考勤记录！',
                   '0',
                   SYSDATE,
                   v_Subject,
                   v_RandomStr
            );
            v_Result:=0;
          ELSIF(v_COUNT>1) THEN
            INSERT INTO MESSAGE(
                   PROMPT,
                   FLAG,
                   OPERATE_TIME,
                   SUBJECT,
                   RANDOM_STR
            )
            SELECT
                   v_Sheet_Name ||' ' ||v_year_and_month ||' '|| v_dept|| ' '|| v_Name || ' 考勤表中存在同名用户',
                   0,
                   SYSDATE,
                   v_Subject,
                   v_RandomStr
            FROM DUAL;
             v_Result:=0;
          END IF;
       END LOOP;
       CLOSE name_cur;

       IF(v_Result=0) THEN
          RETURN;
       END IF;
       */
       INSERT INTO Products_Record(
                                       seq,
                                        ar_job_number,
                                        name,
                                        Report_Dept,
                                        products_name,
                                        summary_process,
                                        specific_process,
                                        quantities,
                                        sheet_name,
                                        file_name,
                                        submit_date,
                                        update_time
                                     )
       SELECT                         seq_products_record_temp.nextval,
                                        emps.job_number,
                                        P_R_T.name,
                                        P_R_T.Report_Dept,
                                        P_R_T.products_name,
                                        P_R_T.summary_process,
                                        P_R_T.specific_process,
                                        P_R_T.quantities,
                                        P_R_T.sheet_name,
                                        P_R_T.path,
                                        P_R_T.UPDATE_TIME,
                                        P_R_T.update_time
       FROM Products_Record_TEMP P_R_T LEFT  JOIN Employees emps
            ON P_R_T.name = emps.name
       WHERE P_R_T.report_dept = v_dept;
       v_Result:=1;
       RETURN;
end sp_import_DC_Temp_To_PR;
/

prompt
prompt Creating procedure SP_IMPORT_SR_TEMP_TO_SR
prompt ==========================================
prompt
create or replace procedure dukepu.sp_import_SR_Temp_to_SR(v_dept varchar2,v_submit_date varchar2, v_randomStr VARCHAR2,v_result out INT) as

       --type cur_t is ref cursor;
       --name_cur cur_t;

       v_Subject VARCHAR2(30);

       --v_Count INT;

       --v_Name Products_Record_Temp.Name%TYPE;
       --v_Sheet_Name Products_Record_Temp.Sheet_Name%TYPE;
begin
  ---此存储过程用于导入单据BillNo中的数据到 Product_Record.
  ----先检查该单据中的每个姓名是否是唯一的.
       v_Subject:= 'Import_Scattered_Record';
       DBMS_OUTPUT.put_line(v_randomStr);
       DBMS_OUTPUT.put_line(v_Subject);

       /*
       OPEN name_cur FOR
       SELECT
              DISTINCT
              name,
              SHEET_NAME
       FROM Scattered_Record_Temp  S_R_T
       WHERE S_R_T.dept = v_dept
       AND S_R_T.Year_And_Month = v_year_and_month;

       DELETE MESSAGE
       WHERE RANDOM_STR = v_randomStr;


       LOOP
          FETCH name_cur INTO
                          v_Name,
                          v_Sheet_Name;
          EXIT WHEN  name_cur%NOTFOUND;
         --判断本单据中的Name是否唯一
            ---判断此人,本月是否有考勤记录.
            ---判断此人,本月是否有考勤记录.
          select COUNT(distinct AR.job_number) INTO v_Count
          from Attendance_Record AR
          WHERE TRUNC(AR.FingerPrint_Date,'MM') = TO_DATE(v_year_and_month,'YYYY-MM')
          AND AR.Name = v_Name;
          IF(v_Count=0) THEN
               ---保存信息到MESSAGE中.
              ---保存错误信息.
            INSERT INTO MESSAGE(
                   PROMPT,
                   FLAG,
                   OPERATE_TIME,
                   SUBJECT,
                   RANDOM_STR
            )
            VALUES(
                   v_Sheet_Name ||' ' ||v_year_and_month ||' '|| v_dept|| ' '|| v_Name || ' 不存在考勤记录！',
                   '0',
                   SYSDATE,
                   v_Subject,
                   v_RandomStr
            );
            v_Result:=0;
          ELSIF(v_COUNT>1) THEN
            INSERT INTO MESSAGE(
                   PROMPT,
                   FLAG,
                   OPERATE_TIME,
                   SUBJECT,
                   RANDOM_STR
            )
            SELECT
                   v_Sheet_Name ||' ' ||v_year_and_month ||' '|| v_dept|| ' '|| v_Name || ' 考勤表中存在同名用户',
                   0,
                   SYSDATE,
                   v_Subject,
                   v_RandomStr
            FROM DUAL;
             v_Result:=0;
          END IF;
       END LOOP;
       CLOSE name_cur;

       IF(v_Result=0) THEN
          RETURN;
       END IF;
       */
       ---先删除,再新增.
       DELETE
       FROM Scattered_Record S_R
       WHERE S_R.REPORT_DEPT = v_dept
       AND S_R.submit_date = v_submit_date;

       INSERT INTO Scattered_Record(
                                       seq,
                                       ar_job_number,
                                        name,
                                        particulars,
                                        quantities,
                                        TOTAL_HOURS,
                                        labour_cost,
                                        aggregate_amount,
                                        REPORT_DEPT,
                                        update_time,
                                        submit_date
                                     )
       SELECT                         seq_Scattered_record.nextval,
                                        emps.job_number,
                                        S_R_T.Name,
                                        S_R_T.Particulars,
                                        S_R_T.Quantities,
                                        S_R_T.HOURS,
                                        S_R_T.Labour_Cost,
                                        S_R_T.Aggregate_Amount,
                                        S_R_T.REPORT_DEPT,
                                        SYSDATE,
                                        S_R_T.update_time
       FROM Scattered_Record_TEMP S_R_T LEFT JOIN Employees emps
            ON S_R_T.name = emps.name
       WHERE S_R_T.report_Dept = v_dept;
       v_Result:=1;
       RETURN;
end sp_import_SR_Temp_to_SR;
/

prompt
prompt Creating procedure SP_SAVE_EMPS
prompt ===============================
prompt
create or replace procedure dukepu.sp_save_emps as

       type cur_t is  ref cursor;
       emps_temp_cur cur_t;

       v_dept nvarchar2(10);
       v_name nvarchar2(10);



       v_ar_name nvarchar2(20);   --考勤表中姓名.
       v_job_number varchar2(20);                ---考勤表中的工号.

       v_random_str varchar2(50);
       v_Report_Time date;               ---报表时间.

       v_count int:=0;
begin

     ---先分析
     open   emps_temp_cur
     for
         select distinct department,
                         name,
                         random_str,
                         Report_Time
         from employees_temp;

     fetch  emps_temp_cur into v_dept,v_name,v_random_str,v_Report_Time;
     loop
         exit when emps_temp_cur%notfound;

         select count(1) into v_count
         from employees
         where name = v_name;

         if(v_count=0)
         then
             ---这里要求Attendance_Record中的名称唯一,即同一个姓名只能对应一个Job_Number;

             insert into employees(
                                    seq,
                                    job_number,
                                    department,
                                    name,
                                    random_str,
                                    Report_Time
                                    )
              values(
                     Seq_Employees.Nextval,
                     'NULL',
                     v_dept,
                     v_name,
                     v_random_str,
                     v_Report_Time
              );

             ---取最近3个月,指定姓名的工号.
             select count(distinct job_number)  into v_count
             from attendance_record ar
             where ar.name = v_name
             and trunc(ar.fingerprint_date,'MM')>= trunc(add_months(sysdate,-2),'MM');

             if(v_count =1) then
                 select ar.job_number,ar.name into v_job_number,v_ar_name
                 from attendance_record ar
                 where ar.name = v_name
                 and rownum =1;

                          --更新AR_Name,Job_Number
                 UPDATE Employees
                 set Job_Number =v_job_number,
                     ar_name = v_ar_name,
                     ar_job_number = v_job_number
                 where name = v_name;

             end if;

         end if;
         fetch  emps_temp_cur into v_dept,v_name,v_random_str,v_Report_Time;
     end loop;
     close emps_temp_cur;
end sp_save_emps;
/

prompt
prompt Creating procedure SUMMARIZE_ATTENDANCE_RECORD
prompt ==============================================
prompt
create or replace procedure dukepu.summarize_Attendance_Record(v_year_and_month_str varchar2)
as
    v_sql_str varchar2(2000);
begin
       --先进行删除。
       delete
       from attendance_record_briefly
       where trunc(finger_print_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM');
       
       ---提取考勤记录中的每员工，每日期记录
       
       ---先找出同名，但工号不同的用户。
       v_sql_str:='
        update Attendance_record_detail ARDetail_out
           set job_number = (
               select ARDetailTemp.job_number
               from 
               (
                 select name,
                        replace(wmsys.wm_concat(distinct(cast(job_number as varchar2(100)))),'','',''_'') as job_number
                  from Attendance_Record_Detail 
                  where  trunc(finger_print_date,''MM'') = to_date(:1,''yyyy-MM'')
                 group by name
                 having count(distinct job_number)>1
                 ) ARDetailTemp
                 where ARDetail_out.name = ARdetailTemp.name
           ) 
            where trunc(ARDetail_out.finger_print_date,''MM'') = to_date(:1,''yyyy-MM'')
            and exists(
               select 1
               from 
               (
                   select name,
                          replace(wmsys.wm_concat(distinct(cast(job_number as varchar2(100)))),'','',''_'') as job_number
                    from Attendance_Record_Detail 
                    where  trunc(finger_print_date,''MM'') = to_date(:1,''yyyy-MM'')
                   group by name
                   having count(distinct job_number)>1
                 ) ARDetailTemp
                 where ARDetail_out.name = ARdetailTemp.name
            )';
        
        execute immediate v_sql_str using v_year_and_month_str,v_year_and_month_str,v_year_and_month_str;
          
        ---当月，当天 未打卡
       INSERT INTO Attendance_Record_Briefly(
              start_date, 
              end_date, 
              tabulation_time, 
              finger_print_date, 
              job_number, 
              name, 
              dept, 
              fpt_first_time,
              fpt_last_time,
              random_str 
       )
       SELECT 
              distinct 
              start_date, 
              end_date, 
              tabulation_time, 
              finger_print_date, 
              job_number, 
              name, 
              dept, 
              null,
              null,
              random_Str
       FROM Attendance_Record_Detail
       WHERE trunc(finger_print_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
       group by  
            start_date, 
            end_date, 
            tabulation_time, 
            finger_print_date, 
            job_number, 
            name, 
            dept, 
            random_str
       having count(finger_print_time) =0
       order by  start_date, 
            end_date, 
            tabulation_time, 
            job_number,
            finger_print_date, 
            name, 
            dept, 
            random_str;
       

       --当月当天，只打了一次卡
       INSERT INTO Attendance_Record_Briefly(
              start_date, 
              end_date, 
              tabulation_time, 
              finger_print_date, 
              job_number, 
              name, 
              dept, 
              fpt_first_time,
              fpt_last_time,
              random_str 
       )
      select
            start_date, 
            end_date, 
            tabulation_time, 
            finger_print_date, 
            job_number, 
            name, 
            dept, 
            (
              case when min(finger_print_time) <to_date(to_char(finger_print_date,'yyyy-MM-dd')||' 13:00:00','yyyy-MM-dd HH24:MI:SS')
                        then  min(finger_print_time)
                   else null
              end
            )  as fpt_first_time,
            (
              case when min(finger_print_time) >=to_date(to_char(finger_print_date,'yyyy-MM-dd')||' 13:00:00','yyyy-MM-dd HH24:MI:SS')
                        then  min(finger_print_time)
                   else null
              end
            )  as fpt_last_time,
            random_str 
      FROM Attendance_Record_Detail ARDetail
      WHERE TRUNC(finger_print_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
      group by  
            start_date, 
            end_date, 
            tabulation_time, 
            finger_print_date, 
            job_number, 
            name, 
            dept, 
            random_str
       having count(finger_print_time) = 1
       order by  start_date, 
            end_date, 
            tabulation_time, 
            job_number,
            finger_print_date, 
            name, 
            dept, 
            random_str;
            
      ---当月当天打卡超过2次。
      INSERT INTO Attendance_Record_Briefly(
              start_date, 
              end_date, 
              tabulation_time, 
              finger_print_date, 
              job_number, 
              name, 
              dept, 
              fpt_first_time,
              fpt_last_time,
              random_str 
       )
        select
            start_date, 
            end_date, 
            tabulation_time, 
            finger_print_date, 
            job_number, 
            name, 
            dept, 
            (
              min(finger_print_time)
            )  as fpt_first_time,
            (
               max(finger_print_time)
            )  as fpt_last_time,
            random_str 
      FROM Attendance_Record_Detail ARDetail
      WHERE TRUNC(finger_print_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
      group by  
            start_date, 
            end_date, 
            tabulation_time, 
            finger_print_date, 
            job_number, 
            name, 
            dept, 
            random_str
       having count(finger_print_time) >=2
          order by  start_date, 
            end_date, 
            tabulation_time, 
            job_number,
            finger_print_date, 
            name, 
            dept, 
            random_str;

     
       

end;
/

prompt
prompt Creating procedure SUMMARIZE_A_RECORD_BAK
prompt =========================================
prompt
create or replace procedure dukepu.summarize_A_Record_bak(v_year_and_month_str varchar2)
as
      
begin
       --先进行删除。
       delete
       from attendance_record_briefly
       where trunc(finger_print_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM');
       
       ---提取考勤记录中的每员工，每日期记录
       
         --保存11月中，未刷一次卡的每员工，每日信息。
         
       INSERT INTO Attendance_Record_Briefly(
              start_date, 
              end_date, 
              tabulation_time, 
              finger_print_date, 
              job_number, 
              name, 
              dept, 
              fpt_first_time,
              fpt_last_time,
              random_str 
       )
  select start_date, 
        end_date, 
        tabulation_time, 
        finger_print_date, 
        job_number, 
        name, 
        dept, 
        null as fpt_first_time,
        null as fpt_last_time,
        random_str 
  FROM Attendance_Record_Detail ARDetail
  WHERE trunc(finger_print_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
  AND finger_print_time is null
  ORDER BY 
        job_number asc,
        finger_print_date asc;
        
  --获取11月中,只刷一次卡，且刷卡时间<=12:00
      INSERT INTO Attendance_Record_Briefly(
              start_date, 
              end_date, 
              tabulation_time, 
              finger_print_date, 
              job_number, 
              name, 
              dept, 
              fpt_first_time,
              fpt_last_time,
              random_str 
       )
     SELECT 
        ARDetail.start_date, 
        ARDetail.end_date, 
        ARDetail.tabulation_time, 
        ARDetail.finger_print_date, 
        ARDetail.job_number, 
        ARDetail.name, 
        ARDetail.dept, 
        ARDetail.finger_print_time fpt_first_time, 
        null as fpt_last_time,
        ARDetail.random_str 
      FROM 
     ( 
         SELECT  
                finger_print_date, 
                job_number
          FROM Attendance_Record_Detail ARDetail
          WHERE trunc(finger_print_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
          AND finger_print_time is not null
          group by 
                start_date, 
                end_date, 
                tabulation_time, 
                finger_print_date, 
                job_number, 
                name, 
                dept, 
                random_str
          having count(1) =1 
    ) TEMP INNER JOIN Attendance_Record_Detail ARDetail
    ON( TEMP.job_number = ARDetail.job_number
        AND Temp.finger_print_date = ARDetail.finger_print_date
     )
     WHERE ARDetail.finger_print_time <= TO_DATE(TO_CHAR(ARDetail.finger_print_date,'yyyy-MM-dd')||' 12:00:00','yyyy-MM-dd HH24:MI:SS')
     ORDER bY ARDetail.Job_Number asc,
     ARDetail.Finger_Print_Date ASC;
        
     
     --获取11月中,只刷一次卡，且刷卡时间>=13:00  
      INSERT INTO Attendance_Record_Briefly(
              start_date, 
              end_date, 
              tabulation_time, 
              finger_print_date, 
              job_number, 
              name, 
              dept, 
              fpt_first_time,
              fpt_last_time,
              random_str 
       ) 
       SELECT 
        ARDetail.start_date, 
        ARDetail.end_date, 
        ARDetail.tabulation_time, 
        ARDetail.finger_print_date, 
        ARDetail.job_number, 
        ARDetail.name, 
        ARDetail.dept, 
        null as fpt_first_time,
        ARDetail.finger_print_time as fpt_last_time, 
        ARDetail.random_str 
      FROM 
     ( 
         SELECT  
                finger_print_date, 
                job_number
          FROM Attendance_Record_Detail ARDetail
          WHERE trunc(finger_print_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
          AND finger_print_time is not null
          group by 
                start_date, 
                end_date, 
                tabulation_time, 
                finger_print_date, 
                job_number, 
                name, 
                dept, 
                random_str
          having count(1) =1 
    ) TEMP INNER JOIN Attendance_Record_Detail ARDetail
    ON( TEMP.job_number = ARDetail.job_number
        AND Temp.finger_print_date = ARDetail.finger_print_date
     )
     WHERE ARDetail.finger_print_time >= TO_DATE(TO_CHAR(ARDetail.finger_print_date,'yyyy-MM-dd')||' 13:00:00','yyyy-MM-dd HH24:MI:SS')
     ORDER bY ARDetail.Job_Number asc,
     ARDetail.Finger_Print_Date ASC;   
        
     
      --获取11月中,刷了两次卡
       INSERT INTO Attendance_Record_Briefly(
              start_date, 
              end_date, 
              tabulation_time, 
              finger_print_date, 
              job_number, 
              name, 
              dept, 
              fpt_first_time,
              fpt_last_time,
              random_str 
       )
       SELECT 
        ARDetail.start_date, 
        ARDetail.end_date, 
        ARDetail.tabulation_time, 
        ARDetail.finger_print_date, 
        ARDetail.job_number, 
        ARDetail.name, 
        ARDetail.dept, 
        min(ARDetail.finger_print_time) as fpt_first_time,
        max(ARDetail.finger_print_time) as fpt_last_time,
        ARDetail.random_str 
      FROM 
     ( 
         SELECT  
                finger_print_date, 
                job_number
          FROM Attendance_Record_Detail ARDetail
          WHERE trunc(finger_print_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
          AND finger_print_time is not null
          group by 
                start_date, 
                end_date, 
                tabulation_time, 
                finger_print_date, 
                job_number, 
                name, 
                dept, 
                random_str
          having count(1) >=2 
    ) TEMP INNER JOIN Attendance_Record_Detail ARDetail
    ON( TEMP.job_number = ARDetail.job_number
        AND Temp.finger_print_date = ARDetail.finger_print_date
     )
     group by 
      ARDetail.start_date, 
        ARDetail.end_date, 
        ARDetail.tabulation_time, 
        ARDetail.finger_print_date, 
        ARDetail.job_number, 
        ARDetail.name, 
        ARDetail.dept, 
        ARDetail.random_str 
     ORDER bY ARDetail.Job_Number asc,
     ARDetail.Finger_Print_Date ASC;   
       
       
end;
/

prompt
prompt Creating procedure TEST_FOR_INSERT_TO_T
prompt =======================================
prompt
create or replace procedure dukepu.test_for_insert_To_T as
  begin
       insert into T(num,name) values(6,'f');
  end;
/

prompt
prompt Creating procedure UPDATE_JN_BY_NAME
prompt ====================================
prompt
create or replace procedure dukepu.UPDATE_JN_By_Name(v_JN varchar2,v_Name varchar2) AS
          ---更新Employees    中 Job_Number
          -- Products_Record  中 Job_Number
          -- Scattered_Record 中 Job_Number

begin

              UPDATE EMPLOYEES
              SET JOB_Number = v_JN
              WHERE Name = v_Name;


              ---更新产量表
              UPDATE Products_Record
              SET AR_JOB_NUMBER = v_JN
              WHERE Name = v_Name
              AND (
                  TRUNC(submit_date,'MM') >TRUNC(ADD_MONTHS(SYSDATE,-2),'MM')
              );


              ---更新零活表
              UPDATE Scattered_Record
              SET ar_JOB_Number = v_JN
              WHERE Name = v_Name
              AND (
                TRUNC(submit_date,'MM') >TRUNC(ADD_MONTHS(SYSDATE,-2),'MM')
              );

end UPDATE_JN_By_Name;
/

prompt
prompt Creating procedure UPDATE_JN_IN_EMPS_IS_NULL
prompt ============================================
prompt
create or replace procedure dukepu.UPDATE_JN_IN_EMPS_IS_NULL AS
          ---更新Employees    中 Job_Number
          -- Products_Record  中 Job_Number
          -- Scattered_Record 中 Job_Number

           v_Job_Number VARCHAR2(20);
           v_Name       varchar2(20);
          type cur_t is ref cursor;
          jN_Cursor cur_t;
begin
          OPEN jN_Cursor
          FOR SELECT NAME
          FROM EMPLOYEES EMPS
          WHERE EMPS.Job_Number = 'NULL';

          FETCH jN_Cursor INTO v_NAME;
          LOOP
              ---获取一个新的工号.
              general_job_number(v_Job_Number);

              UPDATE EMPLOYEES
              SET JOB_Number = V_Job_Number
              WHERE Name = v_Name;

              COMMIT;

              ---更新产量表
              UPDATE Products_Record
              SET AR_JOB_Number = v_Job_Number
              WHERE Name = v_Name
              AND (
                    REPORT_SPECIFIC_MONTH >TRUNC(ADD_MONTHS(SYSDATE,-2),'MM')
                  OR TRUNC(submit_date,'MM') >TRUNC(ADD_MONTHS(SYSDATE,-2),'MM')
              );

              COMMIT;
              ---更新零活表
              UPDATE Scattered_Record
              SET ar_JOB_Number = v_Job_Number
              WHERE Name = v_Name
              AND (
                    REPORT_SPECIFIC_MONTH  >TRUNC(ADD_MONTHS(SYSDATE,-2),'MM')
                  OR TRUNC(submit_date,'MM') >TRUNC(ADD_MONTHS(SYSDATE,-2),'MM')
              );
              COMMIT;

              FETCH jN_Cursor INTO v_NAME;
          END LOOP;
          CLOSE jN_Cursor;


end UPDATE_JN_IN_EMPS_IS_NULL;
/

prompt
prompt Creating procedure UPDATE_JN_IN_PR_AND_SR_BY_NAME
prompt =================================================
prompt
create or replace procedure dukepu.UPDATE_JN_IN_PR_And_SR_By_Name(v_JN nvarchar2, v_name nvarchar2) AS
          ---更新Employees    中 Job_Number
          -- Products_Record  中 Job_Number
          -- Scattered_Record 中 Job_Number
             ---此v_JN 为考勤表中的工号.
             v_AR_Name             VARCHAR2(20):='';   ---考勤中姓名.
             v_Count               INT;
begin
                   ---更新产量表
              UPDATE Products_Record
              SET AR_JOB_Number = v_JN
              WHERE Name = v_Name
              AND (
                    REPORT_SPECIFIC_MONTH >TRUNC(ADD_MONTHS(SYSDATE,-2),'MM')
                  OR TRUNC(submit_date,'MM') >TRUNC(ADD_MONTHS(SYSDATE,-2),'MM')
              );


              ---更新零活表
              UPDATE Scattered_Record
              SET AR_JOB_Number = v_JN
              WHERE Name = v_Name
              AND (
                    REPORT_SPECIFIC_MONTH >TRUNC(ADD_MONTHS(SYSDATE,-2),'MM')
                  OR TRUNC(submit_date,'MM') >TRUNC(ADD_MONTHS(SYSDATE,-2),'MM')
              );


              SELECT COUNT(1) INTO v_Count
              FROM Attendance_Record AR
              WHERE AR.Job_Number = v_JN
              AND TRUNC(AR.Fingerprint_Date,'MM') >= ADD_MONTHS(TRUNC(SYSDATE,'MM'),-2)
              AND ROWNUM = 1;

              if(v_Count =1)
              THEN
                    SELECT name INTO V_AR_Name
                    FROM Attendance_Record AR
                    WHERE AR.Job_Number = v_JN
                    AND TRUNC(AR.Fingerprint_Date,'MM') >= ADD_MONTHS(TRUNC(SYSDATE,'MM'),-2)
                    AND ROWNUM = 1;
              END IF;

              UPDATE EMPLOYEES
              SET JOB_Number = v_JN,
                  AR_Name = v_AR_Name,
                  AR_Job_Number = v_JN
              WHERE Name = v_Name;



end UPDATE_JN_IN_PR_And_SR_By_Name;
/

prompt
prompt Creating package body GETHZPY
prompt =============================
prompt
create or replace package body dukepu.GetHZPY is

  -- Private type declarations
  --type <TypeName> is <Datatype>;

  -- Private constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Private variable declarations
  --<VariableName> <Datatype>;

  -- Function and procedure implementations
  FUNCTION GetHzPY_by_index(p_PY_Index number) RETURN VARCHAR2 IS
   v_PY_List THZPY_LIST :=  THZPY_LIST(
    'a',      'aes',    'ai',     'an',     'ang',    'ao',     'ba',     'bai',    'baike',  'baiwa',
    'ban',    'bang',   'bao',    'be',     'bei',    'ben',    'beng',   'bi',     'bia',    'bian',
    'biao',   'bie',    'bin',    'bing',   'bo',     'bu',     'ca',     'cai',    'cal',    'can',
    'cang',   'cao',    'ce',     'cen',    'ceng',   'ceok',   'ceom',   'ceon',   'ceor',   'cha',
    'chai',   'chan',   'chang',  'chao',   'che',    'chen',   'cheng',  'chi',    'chong',  'chou',
    'chu',    'chua',   'chuai',  'chuan',  'chuang', 'chui',   'chun',   'chuo',   'ci',     'cis',
    'cong',   'cou',    'cu',     'cuan',   'cui',    'cun',    'cuo',    'da',     'dai',    'dan',
    'dang',   'dao',    'de',     'defa',   'dei',    'deli',   'dem',    'den',    'deng',   'deo',
    'di',     'dia',    'dian',   'diao',   'die',    'dim',    'ding',   'diu',    'dong',   'dou',
    'du',     'duan',   'dug',    'dui',    'dul',    'dun',    'duo',    'e',      'ei',     'en',
    'eng',    'eo',     'eol',    'eom',    'eos',    'er',     'fa',     'fan',    'fang',   'fei',
    'fen',    'feng',   'fenwa',  'fiao',   'fo',     'fou',    'fu',     'fui',    'ga',     'gad',
    'gai',    'gan',    'gang',   'gao',    'ge',     'gei',    'gen',    'geng',   'geo',    'geu',
    'gib',    'go',     'gong',   'gongli', 'gou',    'gu',     'gua',    'guai',   'guan',   'guang',
    'gui',    'gun',    'guo',    'ha',     'hai',    'hal',    'han',    'hang',   'hao',    'haoke',
    'he',     'hei',    'hem',    'hen',    'heng',   'heui',   'ho',     'hol',    'hong',   'hou',
    'hu',     'hua',    'huai',   'huan',   'huang',  'hui',    'hun',    'huo',    'hwa',    'hweong',
    'i',      'ji',     'jia',    'jialun', 'jian',   'jiang',  'jiao',   'jie',    'jin',    'jing',
    'jiong',  'jiu',    'jou',    'ju',     'juan',   'jue',    'jun',    'ka',     'kai',    'kal',
    'kan',    'kang',   'kao',    'ke',     'keg',    'kei',    'kem',    'ken',    'keng',   'keo',
    'keol',   'keop',   'keos',   'keum',   'ki',     'kong',   'kos',    'kou',    'ku',     'kua',
    'kuai',   'kuan',   'kuang',  'kui',    'kun',    'kuo',    'kweok',  'kwi',    'la',     'lai',
    'lan',    'lang',   'lao',    'le',     'lei',    'lem',    'len',    'leng',   'li',     'lia',
    'lian',   'liang',  'liao',   'lie',    'lin',    'ling',   'liu',    'liwa',   'lo',     'long',
    'lou',    'lu',     'luan',   'lue',    'lun',    'luo',    'lv',     'm',      'ma',     'mai',
    'man',    'mang',   'mangmi', 'mao',    'mas',    'me',     'mei',    'men',    'meng',   'meo',
    'mi',     'mian',   'miao',   'mie',    'min',    'ming',   'miu',    'mo',     'mol',    'mou',
    'mu',     'myeo',   'myeon',  'myeong', 'n',      'na',     'nai',    'nan',    'nang',   'nao',
    'ne',     'nei',    'nem',    'nen',    'neng',   'neus',   'ng',     'ngag',   'ngai',   'ngam',
    'ni',     'nian',   'niang',  'niao',   'nie',    'nin',    'ning',   'niu',    'nong',   'nou',
    'nu',     'nuan',   'nue',    'nun',    'nung',   'nuo',    'nv',     'nve',    'o',      'oes',
    'ol',     'on',     'ou',     'pa',     'pai',    'pak',    'pan',    'pang',   'pao',    'pei',
    'pen',    'peng',   'peol',   'phas',   'phdeng', 'phoi',   'phos',   'pi',     'pian',   'piao',
    'pie',    'pin',    'ping',   'po',     'pou',    'ppun',   'pu',     'q',      'qi',     'qia',
    'qian',   'qiang',  'qianke', 'qianwa', 'qiao',   'qie',    'qin',    'qing',   'qiong',  'qiu',
    'qu',     'quan',   'que',    'qun',    'ra',     'ram',    'ran',    'rang',   'rao',    're',
    'ren',    'reng',   'ri',     'rong',   'rou',    'ru',     'rua',    'ruan',   'rui',    'run',
    'ruo',    'sa',     'saeng',  'sai',    'sal',    'san',    'sang',   'sao',    'se',     'sed',
    'sei',    'sen',    'seng',   'seo',    'seon',   'sha',    'shai',   'shan',   'shang',  'shao',
    'she',    'shei',   'shen',   'sheng',  'shi',    'shike',  'shiwa',  'shou',   'shu',    'shua',
    'shuai',  'shuan',  'shuang', 'shui',   'shun',   'shuo',   'shw',    'si',     'so',     'sol',
    'song',   'sou',    'su',     'suan',   'sui',    'sun',    'suo',    'ta',     'tae',    'tai',
    'tan',    'tang',   'tao',    'tap',    'te',     'tei',    'teng',   'teo',    'teul',   'teun',
    'ti',     'tian',   'tiao',   'tie',    'ting',   'tiu',    'tol',    'ton',    'tong',   'tou',
    'tu',     'tuan',   'tui',    'tun',    'tuo',    'uu',     'wa',     'wai',    'wan',    'wang',
    'wei',    'wen',    'weng',   'wie',    'wo',     'wu',     'xi',     'xia',    'xian',   'xiang',
    'xiao',   'xie',    'xin',    'xing',   'xiong',  'xiu',    'xu',     'xuan',   'xue',    'xun',
    'ya',     'yan',    'yang',   'yao',    'ye',     'yen',    'yi',     'yin',    'ying',   'yo',
    'yong',   'you',    'yu',     'yuan',   'yue',    'yug',    'yun',    'za',     'zad',    'zai',
    'zan',    'zang',   'zao',    'ze',     'zei',    'zen',    'zeng',   'zha',    'zhai',   'zhan',
    'zhang',  'zhao',   'zhe',    'zhei',   'zhen',   'zheng',  'zhi',    'zhong',  'zhou',   'zhu',
    'zhua',   'zhuai',  'zhuan',  'zhuang', 'zhui',   'zhun',   'zhuo',   'zi',     'zo',     'zong',
    'zou',    'zu',     'zuan',   'zui',    'zun',    'zuo'
    );
BEGIN
    IF (p_PY_Index>0) AND (p_PY_Index<527) THEN
       RETURN  INITCAP(v_PY_List(p_PY_Index));
    ELSE
      RETURN '';
    END IF;
END GetHzPY_by_index;


FUNCTION get_greece_alphabet_py(p_Index NUMBER)
RETURN NUMBER IS
  v_greece_alphabet_list TGREECE_ALPHABET_LIST := TGREECE_ALPHABET_LIST(
    'a','b','g','d','e','z','e','th','i','k','l','m','n','x','o','p','r',
    's','t','u','ph','kh','ps','o'
  );
BEGIN
  IF (p_Index>0) AND (p_Index<95) THEN
    RETURN v_greece_alphabet_list(p_Index);
  ELSE
    RETURN '';
  END IF;
end get_greece_alphabet_py;


FUNCTION get_roma_num_py(p_Index NUMBER)
RETURN NUMBER IS
  v_rom_num_list TROMA_NUM_LIST := TROMA_NUM_LIST(
    '1','2','3','4','5','6','7','8','9','10','','','','','','',
    '1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20',
    '1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20',
    '1','2','3','4','5','6','7','8','9','10','','',
    '1','2','3','4','5','6','7','8','9','10','','',
    '1','2','3','4','5','6','7','8','9','10','11','12','',''
  );
BEGIN
  IF (p_Index>0) AND (p_Index<95) THEN
    RETURN v_rom_num_list(p_Index);
  ELSE
    RETURN '';
  END IF;
end get_roma_num_py;


FUNCTION get_py_index_01(p_Index1 NUMBER, p_Index NUMBER)
RETURN NUMBER IS
  v_list01 TPYIndex_list := TPYIndex_list(
    TPYIndex_191_list(483,389,458,273,262, 50,395, 88,350,232,482, 24,182,172,178,213, 42,517,144,180,
     117,477,477,456,182,157,508,161,394,478,471,121,182,146,158, 90,395,279,190,201,
     437,269,311, 29,469,472,326,386,276,341,410,103, 65, 39,507,141,122,243,235,477,
     186,249,507,  0,483,408,415,128,471,499,471, 68,475,460,180,475,482,500,231, 97,
     451,172,355,456,  7, 24,115,423,102,459,503,159,147, 25, 44,501,389,361,108,263,
     341,455,474,112, 55,450, 81,508,320,483, 84, 96,456,477,463,172,  3,478,328,393,
     117,422,522,487,184,459,470,463,494,459,301,291,462,467,509,522, 17,328,477,408,
     477,506,147,250,510, 26,351, 18,502, 59,473,500, 18,459,351,395, 13,166,151,460,
     125,107,266, 24,155,168,141,352, 59,464,393,445,145,220,477,140,478,261,467,  4,
     242,106,245, 40, 48,470,509,366,175,408, 69),
    TPYIndex_191_list(418,297,179,181,435,505,526, 50,247,184,399,435,393,445, 25,278,461,443,483,457,
     467,140,209,456,477,117,232,167,479,459,376,320,457,262,458,466, 81,184,507,220,
     408,168,461,175, 21,431,110,471, 15,483,463,161,506,507, 24,182,474,522,232,449,
     234, 55,520,  0,125,432,399,258,421,515,464,333,339,122,232,415,346,109,507,520,
     245,411,236,167, 89,518, 16,456,184,277, 28,175,475,386,346,479, 47,341,368,508,
      57,451,483, 24,431,472,112,422,455, 98, 45,394,191, 81, 40, 15,498,165,474,500,
     521,472,482,467,498, 59,117,117,507,262,172,477,462,470,408, 92,499,505,440, 15,
     491,346,451,412,507,413,458,484,364,301,487,176,249, 83,422,149,178,457,388,341,
     353, 46, 51,376, 15,461,481,474,421,417,473,107, 24,460,490,136,376,225,481,493,
     520,322,411,513,483,499,522,389, 55,180,147),
    TPYIndex_191_list(501,348,478, 81,462,241, 15,330,179,231,242,251,341,459,421,479, 89,525,388,345,
     181,443,525,337,223, 43,140,339,427,513,451,172, 25,166, 57,434,388,474,111,459,
     483, 98,235, 25,136,459,459,265,475,179,340,345,112,509,  3,374,477,187,299,421,
     477, 71,211,  0,175, 51,177,386,490, 30, 23,  4,420, 72, 41,221,477,179,341,259,
     456,297,349,291, 43,234,247,213, 13,483, 21,491,507,408,482,149,348,347,229,427,
     451,240, 51, 42,460,433,462,229,246,491,306,422,472,246,279,491,465,369,369,441,
      43,291,291,179,472,395,396,343,  0,150,393, 90,  9,134,165,456,369,232,483,147,
     432,336,172,477,254,357,472,254,498,181,137,181,254,509,135,467,482,191,477,261,
     395,259,184,208,265,117,462,261,420,123,161,317,117,265,340,175,412,257,441,136,
     180,348, 89,122,478,  3,229, 31,266,516, 65),
    TPYIndex_191_list(408, 97,179,235,457, 91,108,108,184, 51,506,112,271,507,112,112,189,122,333,211,
     147,361, 55,172,341, 66,172, 70,449,186,229,117,351, 84,265,236,508, 22,178,178,
     388, 42,128, 55,214, 97,106,178, 59,180, 90,246,494,484, 67,194,386, 55, 67,229,
     110, 42,339,  0, 55,518,123,337, 97,348,517,175,172,472,168, 97,507,456,137,394,
     175,498,189,342, 54, 42,513,242,229,322,388,208,137,162,498,517,231,184,237,141,
     177,141,175,175,439,172,175,175,507, 42,523,268,229,510,471,180,199,462,507,477,
     510,268,223,185,208,473,447,461,270,213,178,234,194,180,124,265, 48,222,481,194,
     185,348,242, 26,220,189,262, 89,467,456,477,470,473,394,233,242,330,395,172,342,
     177,352,460,477,469,108,185,439,184, 70,250,470,470,247,229, 45,460,352,487,182,
      13,253, 18,121,121,477,322,184,474,125, 98),
    TPYIndex_191_list(133, 68,182,133,280,182,477,176,192,161,351,108,346,492,213,161,483,141,166, 70,
     214,231,231,414, 91,182,351,457,194,472,351,470,292,522,395,457,449,449,462,388,
     172,401,213,457,462,357,473,349,390, 48,467,457,214,172, 98,457,376,472,503,147,
     471, 81,499,  0,318,  2,346,471,507,252,431,391,435,524,110,494,484,229, 83,347,
       6,141,472,229, 43,341,229,472,472,484,159,262,365,351,204,225, 91,513,393,393,
     393,477, 69,398,186,  7,371,395,517,458,461,172,487,369, 61,137,350, 48, 93,159,
     264,252,468,518, 97,475,313,168,477, 50,347,462,335,162,159,483,306,469,366,313,
     124,187,247,125,452,339,456,177,487, 48,394,444,452, 98,395,185,321,452,270,357,
      81,395,509,434,457,477,339,333,518,467,477,461,471,351,459,445,335, 22,117,473,
     168,420, 68,447,526, 26,418,459,168,339,106),
    TPYIndex_191_list( 98,507,510,470,461,210,395,433,275,468,448,223,439,465,482,261,292,464,336,149,
     487,240,335,252,522,151,459,223,334,232,  7,264,247,415,117,147,485,482,136,136,
      15,147,477,341,441,472,449,229,350, 45,493,471, 90,339, 81,347,255,159,428,203,
     232,222,386,  0,519,455,478,339,447,342,  4,494,292,483,432,220,457,  3,300,517,
     499,488,461,460,516,456,452,431,136,339,339, 70,475,518,441, 65,151,471,339,503,
     232,459,479,137,494,143,246,290, 81,352,445,130,422,  4, 70,483,503,509, 41,448,
     483,491,474,262,161,487,164,484,172,508,451,386,467,165,498,472,232,483,377,189,
     345,472,388,321,416,480,451,479,327, 15,131,493,168,431,474,461,342,379,481,159,
     462,249, 40,145,366,447,172,318,456,459,518,242,447,174,417, 60,374,132,276,342,
      18,  6,231,524,510,268,421,177, 49,177,189),
    TPYIndex_191_list(421,393,  3,461,241,461,161,166,143,467,459,494, 43,334, 73,249,161,119,422,475,
     374,177,461,162,250,357,461,461,172,214,461,149,248,345,467,445,421,470,456,525,
     108,189,166, 30, 55,488, 70,483,444,457,339,149,231,467,166,478,470,474,408,472,
     479, 68,500,  0,517,299,485,462,345,484,  3,481,451,483,321, 72,463, 96, 71,463,
     328,478,524,297, 81,221,418,455,458,475, 97,466,509,499,179, 43,470,256,507,242,
     166,319,482,474,478,480,257,159,503,229,237,145,279,268,472,229,242,240,268, 70,
      46,332,328,460,256,457, 97,209,472, 42,479, 86,219,418,461, 58,164,168,513,503,
     461,498,229, 42, 41,229,477,246,491,413,156,496,175,488,510,221,295,356,239,166,
     478,296,442,192,484,181,329,487, 61,166, 98,143,439,441,143,354,363,143,420,143,
     478,167,147,245,143, 56,451,484,352,209,337),
    TPYIndex_191_list(484,484,471,442,441,441,442,244,166,477,243,243,471,441,435,337,242,211,471,516,
     413,413,517, 71,340,458,388,295,268,173,507,470,477,347,257,364,444,111, 18,464,
     221,180,172, 81,464,317,422,351,517,137,420,181,473,115,242,350,135,469,  7,236,
     510,117,161,  0,507,  6, 69,319,265,172,151,247, 59, 48,478,160, 94,502,117,140,
     474, 97,141, 40,473,462,398, 24,159, 68,188, 71,148,  4,464,459, 12,335, 15,477,
     478,147,467,515,347,112,109,353,481,187,458, 81,222,185,347,503,234,162, 26,181,
     475, 81,471,352,415,506,449,184,245,506,206,389, 89,421, 28,440, 17,459, 97,477,
     507,516,339,184,291,194,215,291,175,123,483,471,136,228,109,471,215,  4,393,280,
     441, 47,164, 18,231,455,513, 13,483,456,178,368,475,128,520,483,165, 98,474,117,
     172,257,389,445,478,112,508,178,179,155,123),
    TPYIndex_191_list( 57,459,333,225,464,165, 92,449,468,457,172,211,479,481,189,413,395,261,453, 47,
     441,353,508,229,322, 12,492, 94,505,456,506,470,505,  3,133,472,191,452,462,237,
     145,222,389,322, 17, 46,242,242,313,341,257,268,513,403,241, 21, 33,507,501,191,
      83, 46,517,  0,172,143,342,347, 81, 65,472,418,497,341,451,515,345,388,388,110,
     337,443,442,108,353, 96,525, 81,394,166, 97,421, 79,456,111,165,421, 68,475,510,
     175,483,342,345,198,477,328, 83,176,475,469,421,221,184,163, 71,358,341,470,459,
     457,  3,471, 72,368,179,247,213,242,472,421,451,166,240,240,369,229,235, 42,470,
     472,225,  7,449,376,514,477,250,510,514,161,215,161,467,215,398,252, 96,398,477,
     479,176,318,499, 20,415,354,236, 67,468,462,280,458,484,449,507,348,310,135,339,
     259,259, 46,494,186,124,423,420,472, 18,169),
    TPYIndex_191_list(487,462,  7,100,431,319,185,462, 83,473,164,189,498, 16,165,110, 84,470,199,  6,
     453,420,456,  6,176,231, 97,487,176,395,111,168, 18,243, 97,435,341,182,302, 40,
     459,108,172,159, 70,482,180,178,452,508,314,199,508,487,328, 48,485,514,472,278,
     463,111,112,  0,484, 91, 25,517,502,291,484,440,468,507, 98,268, 18,393, 98,151,
     467,107,506,265, 11,117,236,518,357,459,473,251,518,184,361, 89,172,121,460,168,
     185,135,175,175,292,507,505,459,155,140,470,210,472,266,234,320,471,482,472,459,
     431,447,352,411,159,459,390,394,462,252,117,456,194,220, 63,435,464,278,483,334,
     415,507,147,514,333,443,459,483,472,456,457,472,483,408,229,184,515,339,459,517,
      89,242, 98, 98,247,262, 61,335,184, 28,236,461,399,339,166,117,455,455,421,110,
     110,432,291,352,180,180,341, 83,464,161,449)
     );
BEGIN
  IF (p_Index>0) AND (p_Index<192) THEN
    RETURN v_list01(p_Index1)(p_Index);
  ELSE
    RETURN 0;
  END IF;
end get_py_index_01;


FUNCTION get_py_index_02(p_Index1 NUMBER, p_Index NUMBER)
RETURN NUMBER IS
  v_list02 TPYIndex_list := TPYIndex_list(
     TPYIndex_191_list(220,478,509,280,117,245,  4,215,478,471,184,229, 83,459,162,162,473,474,278,371,
     173,483,483,451,431,365,257, 70,368,348,166,455,341, 57,263,117,178, 92,477,508,
     165,262,472,479,468,178,451,506,350,507,462,445,231,254,357,408,329,451,447, 63,
     161,346, 13,  0,467,483,141,521,474,484,364,366,237,257,317,487,249,214,393,505,
     484,417,364,266,479,413,294,423,318,222,280, 13,328,477,483,468,484,477,192,481,
     291,524,179,513,494,278,223,503,161,161,  6,368,249,331,136,456,345,445,500,263,
     459,459,268,233,231,162,141, 79,507,467,477,162,457,214,474,472, 42,177,257,117,
     108,472,477,152,177,117,395,415,342,231,468,463,294, 89,477, 30,  3,293,297,249,
     433, 50,179, 59,483,332,364,366,291,472,420,479,341,485,262, 18,393,464,291, 91,
     237,484,221,472,236,177,358,221,459,479,403),
    TPYIndex_191_list(462,352,261,229,243,472,510,221,186,518,463,408,420,482,513,470,264, 61,449,471,
     477,518,229,469, 25,277,295,479,243,364,349,441,365,474,477,180,516,510,159,395,
     477,433,457, 47,354,133,461,498,395,393,165,261,208, 28,491,484,350,151,505,175,
     297, 24,164,  0,347,395,297,179,297,507,483, 13,212,297,247,347,161,507,297,393,
     451,462,212,166,187,477,477, 13,347,240, 13,112,247, 94,334,513,334,194,473,513,
     470,510, 94, 72,178,261,261,399,389,268,233,459,459,215,482,294,318,450,450,450,
     474, 97,214,508,122,136,512,122,122,457, 18,178,432, 84,395,505,462,291,457,446,
     251,241,333,462,110,462,247, 35,462,184,186,233,186,510,462,334,447,459,229,472,
      72,166,240,361,456,147,393, 51,476,485, 11,474,  5,456,178,172,111,449,341,339,
     178,526,526,473,184,123,469,334,229,433,522),
    TPYIndex_191_list(117,445,328,  6,213,351,334,433,236, 48,333, 37, 12,439,469, 20,151,194,246, 98,
     295, 85,242,100,106,121,352,477,271,395,  4,451,164,261,229,172,439,451,482,136,
     234,474,177, 98,475, 26,354,112,280,229,482,459,364, 72,393, 47,441,128,124,458,
     478,483,279,  0,191,472,353, 49,418,235,162,184,220,265,215,215,522,136,471,123,
     245,245,236, 97,506,478, 89,147,506,451,328,178,522,209, 89,478,518,494,165,483,
     473,112,350,473,431,477,507,395, 98,510,500,247,472,257,147,172,164,435,456,483,
     520,221,194,472,472,451,520, 40,417,194,347,431,441, 94,457,453, 31,422,479,178,
     189,237,456,345, 17, 83,341,481,295, 67,395,371,411,520,176,233,192, 42, 85, 34,
      87,441,241,500,500,  6, 32,351,342,524,524, 72, 72,457,483,328,240,460,506, 25,
     347,177,472,223,500,233,233,347, 97,525,345),
    TPYIndex_191_list(186,474,177,474,186,500,477,469,280,475,475,477,295,472,172,462,194,457, 81,  6,
     524,451,364, 72,236,178,483,485,478,366,178,234,457,240,240,479,457,184, 42,479,
     451,472,280,352, 44, 64,243, 83, 83,295,472,472,472,280,472,211,165,464, 44,234,
     200,337,337,  0,350,507,502,477,179,416,352,324,334,488, 87,295,111,314,507,161,
      70, 69,447,117,268,477,477,333,340,185,366,401,404,345,505,395,354, 69,141,333,
     501,376,449, 69,386,339, 91,160,506,467,451,477, 12,333, 85,133,317,423,261,173,
     427,166,508,393, 21,143,494,271, 12,180, 42,507,456, 18, 18,501,261,345, 42,111,
     259, 12, 72,264, 51,178,459,221,175, 24,122,172,435,494,140,256,347,444,471,463,
     178,514,471, 59,439,477,507,433,507,461,441,141,209,259,482, 26, 24, 47,220,172,
     411,399,348,483,263,412,494,460,110,182, 98),
    TPYIndex_191_list(451,237,458,412,507, 26,348,182,182,241,478,457,242,477, 51,441,408,463,263, 43,
     456,110,213,207,211, 18,379,235,233,247,172,479,459,435,481,229,435,472, 81,334,
     166,277,166,111,351,472,492,477,106,376,106,395, 84,161,456,443,176,  7,393,501,
     423,117, 81,  0, 44,505,477,352,390,484,180, 84,501,176,342,322, 18,391,421,175,
     125,107, 18,208,175, 22,461,421,143,342,159,291,143,449,186,172,242,166,166,477,
     477,477,485,485,452,472,483, 48, 84,481,330, 48,517,477,172,508,450, 81,236,117,
     450,457,450,506,507,180, 61,507, 61,446,172,507,520,509,220,462,178,175,431,458,
     329,117,451,318,457,506,330,431, 73,507, 22,508, 45,474,166,257,240,460, 13,351,
     224,361,435,121,361,147,477,420,457,108,479,452,452,456,172,457,178,449, 61,483,
     395, 65,420,516,347,167,465,450,459,192,184),
    TPYIndex_191_list(477, 13,265,320,208, 11,298,500,161,522,482, 81,443,482,117,457, 18,482,468, 61,
      24,165,469,328,399,457,421,481,268,205,395,457,223,155,213,270,507,462,474, 85,
     149,451,467,461,408,210,350,166, 48,477,465,138,235, 48,389,513,485,322, 73,166,
     461,252,481,  0,484,328,485,483,483,194,503,235,177,346,431, 26,341,457,258,477,
     155, 47,456,229,232, 61,477,229,280, 98,456, 61, 73, 43,258,229,139,139,339,206,
     432,245,457,191,142,291, 96,143,500,484,179,172,235,483,151,352,421,431,295, 58,
     258,463,456,417,520,175,481, 73,280,487,434, 57,349, 33, 20,167,520,431, 15,468,
     451,125,451, 18,468,164,262,481,339,422,478,463,254,340,194,  3,346,472,368,520,
     408,479,353,159,487,413,339,474,411,165,172,136,184, 55,291,462,189,506,481, 32,
     470,393, 25,457,462,167,481,473,229,378,423),
    TPYIndex_191_list(478,467,420,487,266,133, 61,330,271,143, 48, 30, 30, 30, 65,265,501,439,  6,403,
     139,353,493,182,231,313,411,347,478,247,389,442,251,459,391,348, 81,507,247,185,
     339,339,483,333,233,411,482, 49,507,439, 47,339,351,322, 15,349,177, 48,231,333,
     214,166,506,  0,478,478,457,457, 70,421, 97,444,413,186, 33,461,108,111,223,223,
     459,265,233,456, 30,186, 63,459,421,394,328,477,459,299, 70,421,180,411,177,451,
     468,347,347,184,378,198,479,477,235,379,187,163,  3,475,216,458, 48,483,478, 69,
     259,291,259, 94,339,268,459,258, 50,507,306, 51,473, 25,507,213,213,482,117,237,
     264, 47,166, 42,221,163,468,358, 42,172,184,164,391,231,278,268,422,186,514,514,
     485,125,175, 89, 85, 28,173,507,214,500,342,125,175,483,482,457,500,457,457,351,
     161,161, 98,477,431,254, 83,389,477,477,472),
    TPYIndex_191_list(350,229,108,366,490,501,485,483,456,147,393,498,477,339,456, 78,361,457,347,173,
     483,  6,503,507,507, 78,472,450, 20,184,452,161,485,347,393,506,487,449,369,335,
     335,  7,298,494,487, 24,507,278,337,474,505,498,473,340,291,475, 48,328,173,257,
     351, 51,471,  0,500,319,276,341,445,  8,507,184,216,340,341,154,296,133,525,477,
     462,379,166,  8,507,216, 97, 97,299,505,151,177, 89,366,234,498,242,391,186,234,
     184,471,459,483,472, 25,128,431, 47,417,341,257,299,184,322,175,472,415,462,498,
     112,209,350,168,441,335,494,412,483,517,449,507,525,512,499,242,412,472, 12,451,
     449,347,391,265,258,117, 72,455,352,485,520,432,441, 16,455,526,458,339, 47,378,
     245,348,123, 81,167,339,399,449,236,471,506,232,137,477,467,472,506, 28, 24,431,
     521,198,398,178,266,128,259,378,322,306,175),
    TPYIndex_191_list(506,482,341,472,278,468,328,451,374,295,395,520,505,470,481, 20,473,164,472,523,
     467,340,172,431,219,219, 46,182,441,167,127, 89,461,462,341,498, 15,474,451, 77,
     456,520,127,135,347,364,353,521,416,416,364,322,194,474, 72,507,306,462,350,459,
     179,264,477,  0, 94,388,418,498,334,229,423,209,507,447,458,452,342,432,505, 98,
     306,352,498,456,503,192,364,387,416,417,233, 49, 55,143,322,507,339,412,231, 47,
      48,139,242,241,520,457,161,511,342,422,162,507,342,141,479,345,507,295,251, 42,
     313, 51,413,513,177,388,341,330,176,474,135,341,172,331,223, 96,459,371,141,496,
     477,470, 47,461,159,140,418,292,235,506,451,193,172, 32,463,421,107, 45,186,461,
      16,268,517,451,337,347, 96,162,177,418,474,511,231,481,279,242,517,499,337, 58,
     457, 71,379,348,178,211,388,462,498,  6,184),
    TPYIndex_191_list(475, 98,259,261,172,420, 72,221,184,475,366,475,475,291,455,178, 23,297,125,507,
     507,422,268,175,462,234,421,  8,412,242,485,359,507,473,225,372,399, 64,292,459,
     320,229,220,164,479,246,240,341,341,341,221,459,479,257,388,479, 64,462,503,246,
     257,268, 48,  0,523,243,421,387, 83,447,422,177,221,246,141,141,339,470,193,477,
     147, 11,334, 83,208,265,456,151, 33,398,143,467,177, 46,505, 97,483,  8,467, 97,
     295, 83,353,477,194,472,339,440,461, 97,473,458,265,510,  3, 81,505,399,233,351,
     465,477,177,388,177,517,477,231, 18,420,461,461,469,339,339,186,499,446, 11,483,
     221,451,394,173,173,483,177,440, 90,507,342,351,500,517,517,517,347,235,517, 51,
      92,510,178,148,320,482,272,339,328,237,117,109,180,502,477,390,175,105,507,108,
     330,108,500,211,415,483,172,172,168,462,433)
     );
BEGIN
  IF (p_Index>0) AND (p_Index<192) THEN
    RETURN v_list02(p_Index1)(p_Index);
  ELSE
    RETURN 0;
  END IF;
end get_py_index_02;


FUNCTION get_py_index_03(p_Index1 NUMBER, p_Index NUMBER)
RETURN NUMBER IS
  v_list03 TPYIndex_list := TPYIndex_list(
     TPYIndex_191_list(479, 81,467, 42,473,395,265,265,516, 57,456, 15, 11,178,394,161,109,181,468,111,
     347,161,472,494,109,393,184,473,109,468,334,505,236,149,268, 20,467,167,520,458,
     110,477,452, 89,  3, 24,  5,240,213,433,395,165,468,214,467,177,179,507,439,159,
     121,460,147,  0,187,459,215,509,457,394,503,503,147,149,449,432,517,524,509,388,
     291,457,339,506,477,472,449,235, 43,450,461,110,468,477,487,166,467,265,475,479,
     399,451,348,254,278,221,473, 57,474,417,337,177,189,149,453, 43,339,149,472,229,
     172,258,491,462,149,268, 61,291,501,166,147,468, 54,233,421,180,331,235,457,477,
     178,165, 69,475,475,229,421,439,461,110,393,502,149,477,460,464,388,177, 13,180,
     472,  3,475,366,259,229, 46,213, 85,446,474,168,247,364,240,246,243,387,422,472,
     510,485,477,161,399, 32,394,497,341,467,216),
    TPYIndex_191_list(478,346,111,328,111,236,209,446,307,433,222,524,266,450,444,339,479,520,450,439,
     222,223,240,332,399,429,361,  7, 97,433,229,350,182, 18,505, 59,366,341,483,456,
     470,108,518,361,503, 97,252, 48,477,125,133,507,176,388,449,182,252,507,484,110,
      89,459, 57,  0,399,162,463,298, 50,411,485,179,172,254,328,  5,111,477,117,278,
     161,475,510,463,474, 98,502,487,524,394, 97,242,411,278,505,420,457,138,117,268,
     477,475,475,395,295, 18,477,291,219,151,317,108,508, 69, 59,479,117,399,390,411,
     393,357,481,507,522, 70,136,337,  6,117,117,526, 22,498,408,510,320,395,138, 40,
     474,182,237,257,229,364,493,373,481,470,339,505,477,460,505,229,379,191, 24,361,
       8,361, 24,518, 50,477, 59,525,524,106,106,483,107,133,500,229,478,507,395,117,
     366,477,209,349,377,469, 97, 56,483,491,446),
    TPYIndex_191_list(479,178,237,500,470,372,505, 15,479,216,180,334, 16,369,457,222,237,112,339,452,
     187,147,478,350,482,240,322,514, 81,469,441,493,482, 18, 81,147,507,361, 15,459,
     164,449,306,173,433,172,461,247,212, 34,111,411,408, 90,347,479,184,215,517, 42,
     451,180,229,  0, 24,458,115,423,507,220,231,517,229,339, 24,245,411,341,339, 28,
      42,503,110,320,335,167, 47,493,234,483,483,136,142, 89,123,450, 67,108, 47,500,
     339,484,472,483,352,477,393,457,517,413,220,521,521,111, 46,348,295,449,242,149,
     346,509,184,184, 47,526,342,471,328,517,518, 23,322, 87, 51, 43,258,162,175,141,
     457, 72,141, 83,507,352,274,117,128,322,388,477,393, 97,117,451,451,173,520,175,
     477,457,472,472,500,483,151,455,329, 18,474,210,467,371,473,219,472, 16,166,214,
     178,214,408,112,445,507,271,254,209,161,435),
    TPYIndex_191_list(483,482,411,484,473,505,329,475,340,475,405,483,451,257,431,172,178,365,165,224,
     352,460,395,421,487,393, 51,328,173,477,505,117,306,261,136,179,418,474,462,484,
     518,266,413,173,474,178,165,147,341,249,484,364,395,507,452,435,364,422,499,408,
     394,194,457,  0,136,339,193,416,317,423,125, 57,505,300,172,178,342,459,257,467,
     123,517,445,345,473, 83,173,507, 72,240,377,457,172,231,166,481,341,143,121,121,
     442,162,393,524,322,482,176,161,164,141,477,477,124,192,141,141,449,507,514,487,
     222, 46,520,229,466,348,403,439,139,494,413,225,242,232,261,247,177,413,194, 21,
     242,233,503,498,399,251,294,473,433,322,510,386,352,175, 61,172,472,469,507,470,
     507,524, 61,337,399,162,214,505,388,457, 57, 83,110,268,456,359,235,237,345,459,
     370,108,500,223,487,405,443, 47,422,259,461),
    TPYIndex_191_list(186,463,166,172,306,445,297,369,439,497,111,349,472,155,347,136,237,223,124,457,
     394,518,376,172, 90,180,175, 51, 68,399,176,235,280,478,166,388,524,468, 47,122,
     184,524,477,337,112,166, 71,172,415,333, 47, 51,511,166,172,178,173,499,175,342,
      72,477, 21,  0,411,391,229,478,423,420,262,339,442, 24,168,172,341,291,297,477,
     124,191,478,368,348,472,339,261,502,141, 57,172,214,334, 79, 51,125,262,482,507,
     165,341,225,234,372,242,229, 64,247,264,166,313,247,507,124, 91,484,485,110,517,
     412,231,176, 51,348,510,247,472,229,510,347,178, 98,413,163,295,483,240,220,177,
     459,141,184,466,236,479,388,478,482,479,460,299, 25,500,231,184,403,391,524, 61,
     352,351, 31,183,483,246,229,523,243,422,186,472,221,221,510,246,229,  7,279,483,
     236,140,477,459,467, 44,457,339,194,478,186),
    TPYIndex_191_list(457,467,458,214,222,463,412,462,467, 53,478,341,463,341, 54,137,478,483,461,475,
     473,421,354,313,161,461,164,467,321,477,461,467,446,231, 51,477, 98,483, 58,164,
      26, 26,184,341,507,379, 48,379,508,417,415,229,494,483,229,214, 98,503,452,268,
     474,394,467,  0,186,340,350,413,348,477,475,475, 30,258, 85,505,487,452, 50,431,
     179,389,478, 84,182,214, 64, 70, 91,176,231, 23, 91,175,175,510,394,477,462,353,
     345,474,470,166,353,339,351,166, 92,477,461,139,257,  3,178,328, 42,446,446,328,
     234,173,374,271,445,470,106,364,459,184,350,306,446,320,184, 97, 18,376,254,415,
     399,445,194,418,376,399,271,254,439,364,500,378,500,259,242, 85,186,339,473,282,
      23,393,457,457,348,471, 89,473,487,506, 24, 71,404,224,291,108,350,314,494,262,
      84,517, 54,449,108, 69,445,252,482,332,341),
    TPYIndex_191_list(483,483,441,182,507,507,341,180,180,444,187,159,352, 20,147,508,318,469,165,482,
     467,467,487,472, 70,482,161,168,307,268,456, 49,318, 18,507,317,518,488,237,494,
     112,257,488,445,505,505,477,107,432,408,213,479,184,477,173,508,166, 16,494,510,
     482,136,161,  0,333,518,507,413, 47,408,184,469,394,469,117,172,139, 70,478,509,
     475,166,490, 47,451,160,175,408,106,464,117,518,507,478,456,193,446,472,431,270,
     225,477,261,352,334,461,477,413,213,346,184,333,465,507,165,266,456,351,477,180,
     395,323, 42,179,234,350,451,147,252,482, 25, 90,159,477,506,221,147,229,128,231,
      57,159,477,439,223,458, 49,181,415, 47,320,459,393,215,333,147,348,361,441,461,
     435, 98,487,229,404,408,225,404, 91,487,155,464,423, 58,501,279,484,445, 89,455,
     184,391,232,167,418,346, 73,185,161,143,472),
    TPYIndex_191_list(509,322,149, 43,341,109, 48,242,184,229,503,333,432,483,291,242,261,180,236,245,
     351,483,393,161,161,484,220,348,341,507,478,334, 16,484,452,371,110,484,194,339,
     391,379,339,328,457,484,365,164,175,302,456,435,112,455,431,451,368, 33,151,472,
     159,261,254,  0,479,472,348,394,257,490,167,277,141, 48, 98,231,339,339,257,432,
      62,451, 30,265,334,467,172,175,112,477,478,395,462,506,421,483, 18,265,395,441,
     394,481,184,439,442,350,350,473,240,168,484,278,317,482,352,514,232, 42,472,516,
     151,518,258,479,219,112,241,451,458,479,334,179,472,417,484,459,474,259,517, 47,
     420,418,447,208,378,498,395,245,249,451,490,456,452,342,494,395,  3,487,478,413,
     417,395,  3,317,467,453, 31,264,125,469,165,462, 81,507,479,178,125,415,177,166,
     478,494,403, 57,461,483,466,161, 18, 21,507),
    TPYIndex_191_list(176,208,393,389,261,  6,242,467,482, 42,108,481,142,258,348,483,172,471, 44,457,
     172,242,240,179,143,411,507,121,342,177, 61, 57,513,313,427,475,457,261,422,422,
     421,231,447,420,122,322,518,192,322,501,514,467,216,341,472,403,461, 65,431,176,
     520,479,159,  0,463,399,164,520,215,467,507,331,399,345,334,473,166,178,456,314,
     172,451,461,341,471,457,416, 96,265,370,413,505,520,477,507,449,421,478,462,475,
     498,376,152, 18, 42,399,337,235,451,379,379, 47,181,162,280,223, 66,159,147,487,
     237,159,117,149,151,459,175,388,457,483,242,297,483,235,394, 71,164,494,462,483,
     395,469,236,449,518,481,211, 30,231, 83,475,468,505,251, 70,477,415,328,184,418,
     347,517,299,455,347,321,379,386,451, 51,418,411,435,379,510,231,291,457,399,261,
     297,479,479,259,179,339,339,524,455,423,478),
    TPYIndex_191_list(478, 94, 59,168,348,221,470,194,451, 23,136,341,479, 23,216,110, 31,256,491,451,
     334,491,242,229,482,473,242,408,507,479, 91,450,166,462,317,393, 21, 42,268,237,
     175,379, 47,136, 23,168,459,242,347,364,229,180,461,479,415,451,448,469,510,403,
     220, 94,108,  0,161,220,399,236,479,291,172,231,525,479,235,477,175, 42, 69,358,
     175,221,108,403,484,517,112,391,225,221, 61,351,481,341,107,186,472,479,459,491,
     243,472,229,261,388,421, 71,177, 42,479,149,510,221,221,279,449,243,470,459,472,
     122,472,483,140,461,461,166,159,513,498,462, 48,490,339,508,111,298,452,337,477,
     328,189,317,472,318,271,233,140,463,140,140, 20, 68,458,506,510,194,502,117,  7,
     462,462,236,517,319,420,473,439,388,451,165,509,474,467,155,352,164,466,466,459,
     478,471,509,474,395,451,439,469,490,189,458)
     );
BEGIN
  IF (p_Index>0) AND (p_Index<192) THEN
    RETURN v_list03(p_Index1)(p_Index);
  ELSE
    RETURN 0;
  END IF;
end get_py_index_03;


FUNCTION get_py_index_04(p_Index1 NUMBER, p_Index NUMBER)
RETURN NUMBER IS
  v_list04 TPYIndex_list := TPYIndex_list(
     TPYIndex_191_list(468,506,334,166,140, 45,166, 46,446,234,117,181,462,337,435,517,435,145,222,472,
     467, 48,364,161,457,399,168,470,209,485,461,457,514,351, 81,462,339,446,247,472,
     184,235,215,167,444,457, 65,456,159,184,117,455, 61,112,333,349,371,477,349,463,
     477,345,483,  0,123,328,479,450,394,137,390,446,283,128,451, 46,151,214,508,458,
     487,112,231,464,177, 18,479,510,451,442,388,457,468,302, 42,472,181,181,257,451,
     498,179,349,365,164,108,350,415,473,234,178,493,137,487,278,395,232,135,422, 44,
     487, 25,475,462,457,456,487,151,461,477,487,277,388,349,474,261,341,479,456,133,
     472,342, 18, 21,520,242,175,241,322,415,477,439,186,520,161,477,507,451,237,357,
     313,360,181,215, 64,497,175,457,457,477,461, 48,165, 70,475,470,472,470,461,187,
      79,444,393,345,111,457,483,235,439,390,111),
    TPYIndex_191_list(470,221,257,422,477,181,258,180,446,479,477,469,221,420, 30,457,353,520,341,166,
     510,236,483,477,462,502,166, 68,305, 24,368,461,470,179, 50,423,474,151,221, 21,
     364,234,268,371,247,234,  6,470,213,485,233,229,242,186,233,472,457,462,240,475,
      30,358,485,  0,221, 61,439,139,184, 45,261,422,221,510,221,236,483,502,506,319,
      47,451,147,186,475,522,261, 55,194,492, 85,342,481,342,317, 44,175, 55,483,498,
     262,317, 25, 55,482, 91, 47,298,224,445,361,252,109,123,472,492, 15,408,482,125,
     271,499,352,352,518,252,199,341,229,335,123,507, 16,352, 57,173,112,194,184, 51,
     457, 15,246,178,249,376,451,254, 96,439,345,457,229, 91,234,315,330, 25,457, 50,
     451,359, 50,  7,172, 41,517,151,192,320,160,471,478,164,514,213,508,271,328,184,
     477,464,477,236,328,291,474,482,469, 70, 25),
    TPYIndex_191_list(  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0, 98,  0,  0,  0,171,  0,  0,
       0,248,275,309,  0,338,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  1,  0,  0,  0, 98,  0,  0,  0,171,  0,  0,  0,248,275,309,  0,338,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  0,
       0, 98,  0, 98,  0,171,  0,  0,248,275,  0,309,  0,  0,  0,  0,  0,  0,  0,  0,
     309,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0, 98,  0, 98,  0,171,  0,  0,
     248,275,  0,309,  0,  0,  0,  0,  0,  0,  0,  0,309,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0)
     );
BEGIN
  IF (p_Index>0) AND (p_Index<192) THEN
    RETURN v_list04(p_Index1)(p_Index);
  ELSE
    RETURN 0;
  END IF;
end get_py_index_04;


FUNCTION get_py_index_05(p_Index1 NUMBER, p_Index NUMBER)
RETURN NUMBER IS
  v_list05 TPYIndex_list := TPYIndex_list(
     TPYIndex_191_list(  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(209,459,468,268,502,178,470,388,418,439,223,517,457,458, 15,507,472,386,147,180,
     315,110,461,328,339, 21,478,220,175,342,215,472,520,507,506,471,234, 38,520,118,
     112,455,484,388,442,471,462,173,329,482,474,416,334,266,412,249,484, 69,483,395,
     149,342,477,  0,505, 31,149,251,176,271, 42,  6,124, 65,111, 18, 18,165,337,235,
     483,514,474,457,461,398, 96,177,125,468, 91,166,211,459,459,297, 20,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(168,366,259,234,482,180,398,242,418,459,261,358,280,246,459,339,186,474,518,242,
     413,350,119,224,  7,159, 81, 54,122,483,339,483, 43,159,456,117,178,471,258, 12,
     485,186,487,186,478, 70,332,342,477,122,333,117,468, 62,135,173,390, 59,357,394,
     393,477,522,  0,237, 18,505,179,177,175,229,140,459,509,472,466,473,467,413,347,
     478,470, 13,460,458,141, 49,467,320,223, 71,479,452, 98,435,431,456,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(456, 47,187,257, 15,435,459, 51,147,468,472,468,466,117,457,236,229,179,417,112,
     449, 83,332,500,379,265,483,220,265,450,483,432, 51,320, 47, 98, 43, 17,242,352,
      84,320,342,517,347,107,179, 91,178,167,483,257, 57,468,431,464, 69,365,265,175,
     451,368,164,  0,462, 54,175,513,473,231,352, 92,471,165,237,395,364,417,474,452,
     456,505,179,479,249,423,237,229,222,432,342, 67,186,502, 23,441, 43,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(215,513, 61,477,339,180,493,350,  6,231,258,478,162,451,456, 79,466,497,470,351,
      71,235,233,349,413,141,180,108,179,237,172,166,180,  3,493, 71,177,142,421,211,
     164,379,415,432, 51,483,179,242,329,399,524,221,457,518,468,368,455,121,225, 91,
     229,507,365,  0,229,491,468,431,141,415,219,240,242,229,221,479,457,460,451,139,
      72,491,475, 25,319,507,229,397,460,344, 11,321,109, 70,113,  0,447,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(161,477, 10,185, 43, 48,238, 71,259,515,333, 20,509,238, 59,479,339,459,241, 81,
     313,513,235,456, 70,453,479,472,432,147, 43,348,393, 42, 42,369,413,393,242,112,
     498,117,333, 87,516,259, 18,237,416,237,271,487,117,128,178,117,432,271,424,176,
     447,117,278,  0,271,271,172,432,121, 18, 68,507,244,317,477,162,483,483,271,187,
     477,237, 85,162, 71,515,176, 47, 43,444,225, 40,237, 85,235,176, 50,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(328, 85, 85,346, 70,399,507,277, 18,123,509,458,467, 46,469,339,471, 65, 18,520,
     469,507,107,507,110,184,388,295,427,439,178,483,166,421, 48,257,180,461,441,252,
     461,414,337, 97,398,477,322,501,139,249,235,172,432,475, 48,328,265, 94,194,471,
      63,393,508,  0,507,483,112,473, 46,441,143,452,164,209,478,186,457,139,477, 55,
     225,308, 83,501,393, 63,477,520,412,379, 84,241,247,347,117,406,345,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(237,223,459,110,421,478,151,459,139,451,299,483,451,481,225,229,399, 70,235,235,
      22,172, 48,473,178,506,256,229,168,220,172,468,479,478,481,421, 83,246,243,243,
      25,446,  7,107,107,346,172,493,254,314, 59,236,268,172,322,124, 98,147, 18, 50,
     341,  3,461,  0,149,165,149,494, 65,149,461,475,149,177,  3,464,165,246,330,151,
     177,122,319,350,353,498,136,187,187,509,498,446,502, 91,339,479, 15,  1,  1,  3,
       3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  4,  4,  4,  4,  4,  4,  4,  4,
       4,  5,  5,  5,  6,  6,  6,  6,  6,  6,  6,  6,  6,  7,  7,  7,  7,  7,  7,  7,
       7,  7,  7,  7,  7,  7,314,  7,  7,  7,  7,  8,  8,  8,  8,  8,  8,  8,  8, 11,
      11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 12, 12, 12, 12, 12, 12,
      12, 12, 12, 12, 12, 12, 13, 13, 13, 13, 13),
    TPYIndex_191_list(502,151,151, 25,449,483,108,117,350, 72,242,500,229,179,467,191,468,  4,247,467,
     509, 71,  4,136,229,122,450,339,484,459,463,457,112,265,266,395,487,317,109,257,
     459,395,479,506,474,393,168, 68,505,213,467,393,257,268,510,505,395, 85,291,518,
      44,109,317,  0,240,439,507, 81,281,266,470,505,473,268,508,268,257,461,147,164,
      47,512,185, 98,251,459,457,215,388,432,245,449,228,395,349,234,506, 13, 13, 13,
      13, 13, 13, 13, 13, 13, 13, 13, 13, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
      15, 15, 15, 15, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18,
      18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,328, 18, 18, 18, 18, 20, 20,
      20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 21, 21, 21, 21, 22, 22, 22, 22, 23, 23,
      23, 23, 23, 23, 24, 24, 24, 24, 24, 24, 24),
    TPYIndex_191_list(229,220,524,185,328,167,242,494,509,483,167,249,458,464,166,142,490, 57,175,257,
     160,468,432,467,107,455,141,261,453,208, 71,432,349,268,111,494,501,477, 90,208,
     268,405, 61,247, 48,258,141,164,405,457,337,393,233, 45,459,475,469,456,451,175,
     475,  3,166,  0,175,502,257, 50,378,297,470,474,485,259,262,332,262,225,213,468,
     262,168,242,259,240,352,251,457,422,191,510,347,483,406,517,186,393, 24, 24, 25,
      25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 26, 25,
      26, 26, 26, 26, 26, 26, 26, 26, 26, 27, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28,
      28, 30, 30, 30, 30, 30, 30, 30, 31, 31, 31, 31, 31, 32, 32, 32, 32, 32, 33, 33,
      33, 33, 33, 35, 35, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 41, 41, 41, 42,
      42, 42, 42, 42, 42, 42, 42, 42, 42, 43, 43)
     );
BEGIN
  IF (p_Index>0) AND (p_Index<192) THEN
    RETURN v_list05(p_Index1)(p_Index);
  ELSE
    RETURN 0;
  END IF;
end get_py_index_05;


FUNCTION get_py_index_06(p_Index1 NUMBER, p_Index NUMBER)
RETURN NUMBER IS
  v_list06 TPYIndex_list := TPYIndex_list(
     TPYIndex_191_list(160,479,509,177,497,485,  7, 87,339,518,456,503,340,342, 70,186,229,117,452, 98,
     192,507,178,332, 98,503,415,447,179,268,522,483,246,445, 98,271,510,301,333,236,
     337,224, 98,334,481,213,199,352,510,213, 98,340,242,451,  3,478,472,333,223,159,
     348,451,345,  0, 36,348,353, 42,222,159,483,461,458,252,246,481, 45, 45,472,386,
     215,136, 36,162,242, 46,303,411,517,199,472,515,206, 47,339,520,348, 43, 43, 43,
     501, 43, 43, 43, 43, 43, 43, 43, 44, 44, 44, 44, 44, 44, 44, 44, 44, 45, 45, 45,
      45, 45, 45, 46, 46, 46, 46, 46, 46, 46, 46, 46, 46, 47, 47, 47, 47, 47, 47, 47,
      47, 47, 47, 47, 47, 47, 47, 47, 48, 48, 48,395, 48, 48, 48, 48, 48, 48, 48, 48,
      48, 48, 48, 48, 49, 49, 49, 49, 49, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,
      50, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51),
    TPYIndex_191_list(235,187,317,265,500,151,457,228,478,456,339,245,280,368,472, 87,445,479,194,451,
     406,505, 92,458, 71,431,280,432,339, 96,112,353,353,249,133,462, 98,237,431,422,
     194,328,451,432,471,339,231,451,487,515,219,316,474,513, 42,339,345,322,237,242,
     191, 55, 46,  0,478,225,330,339,510, 65,520, 58,245,172,388,223,497,175,457, 87,
      83,317,488,345, 81,229,175,457,501,345,459,483,515,345,194,494,225, 51, 51, 51,
      51, 51, 51, 53, 54, 54, 54, 54, 54, 54, 54, 55, 55,514, 55, 55, 55, 56, 56, 56,
      56, 56, 57, 57, 57, 57, 57, 57, 57, 58, 44, 59, 59, 59, 59, 59, 59, 59, 59, 59,
      59, 59, 59, 61, 61, 61, 61, 61, 61, 62, 63, 63, 63, 63, 64, 64, 64, 65, 65, 65,
      65, 65, 65, 65, 65, 66, 66, 66, 67, 67, 67, 67, 67, 67, 68, 68, 68, 68, 68, 68,
      69, 69, 69, 69, 69, 69, 69, 69, 69, 69, 69),
    TPYIndex_191_list(178, 51,475,353, 71,477,328,328,483,332,339,477,194,175,483,368,319, 59, 25,473,
     249,463,213,225,225,507,229,246,108,353,319,479,229,240,240,268,403,139,221, 27,
     472,362,485,418,249,462,474,507,109, 94,508,446,477,395,482,507,433,117,261,414,
     257, 41,247,  0,483,456,510,141,458,507,124,124,404,179,393,121,215, 81,423,136,
     139,524,236,242, 72,507, 18, 51,166,482,478,518,168,505,484,456,459, 69, 70, 70,
      70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 71, 71, 71, 71, 71, 72, 72,
      72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 73, 73, 73, 79, 79, 79, 79, 79, 79, 79,
      81, 81, 81, 81, 81, 81, 81, 81,499, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 83,
      83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 83, 84, 84, 84, 84, 84,
      84, 84, 84,433, 85, 85, 85, 85, 85, 85, 85),
    TPYIndex_191_list(473,507,477,257,408, 81, 15,505,481,172,124,422,408,249,418,117,468,339,483,339,
     408,421, 70,141,415,229,299,459, 72,229,485,507,491,225,365,462,441,361,518,276,
     507,459,292,350,111,254,487,507,180,507,483,209, 11,328,291,229,482,328, 25,236,
     292,526,507,  0,184,168,439,507,216,151,478,518,507,361, 91,510,299,337,124,494,
     445,215,122,180,431,441,471,245,242,136,526,516, 12,339,507,215,228, 87, 87, 87,
      87, 87, 87, 87, 87, 87, 88, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 90, 90, 90,
      90, 90, 90, 90, 90, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 91, 92,
      92, 92, 92, 92, 92, 94, 94, 94, 94, 96, 96, 96, 96, 96,444, 96, 96, 96, 97, 97,
      97, 97, 97, 97, 97, 97, 97, 97, 97, 97, 98, 98, 98, 98, 98, 98, 98, 98, 98, 98,
      98, 98, 98,100,106,106,106,106,106,106,106),
    TPYIndex_191_list(322,235,524,483,413,446,477,457, 20,172,117,328,306,178,508,520,467, 47, 72,459,
     518,483,467,507,193,136,364,415,364,172,192,388,261,507,172,242,413,172,479,452,
     350,217,477,165,346,172,461,337,177,517,508,524,247,415,299,379,166,358,306,483,
     332,518,443,  0,452, 47,168,213,247,319,379,517,229,491,471,483,393,180,474,223,
     474, 13, 24,447,510,319, 84,456,447, 55,474,461, 47,208, 70,517,467,106,107,107,
     107,107,107,107,107,107,108,108,108,108,108,108,108,108,108,108,108,108,108,108,
     108,108,108,109,109,109,109,109,109,109,109,109,109,109,110,110,110,110,110,110,
     110,110,110,110,110,110,111,111,111,111,111,111,111,111,111,111,111,111,111,111,
     111,112,112,112,112,112,112,112,112,112,112,112,112,112,112,112,115,116,117,117,
     117,117,117,117,117,117,117,117,117,117,117),
    TPYIndex_191_list(413,139,517,455,447,475,349,474,474,433, 44,432, 84,241,233,457,456,214, 55,502,
     212,212, 47, 65,233,493, 64,345,349, 91,493,240,346, 51,395,117,341, 51,159,339,
     149,394,111,263,351,510,236,285, 24,  8,408,159,505, 84,477,399,180,351,333,229,
     513, 35, 79,  0, 66,448,180,191,180,224,322, 48,252,510,449,177,414,347,471,515,
     484,148,179,328,477, 89,388,458,510,276,136,346,265, 13,388,320,236,117,117,117,
     117,117,117,117,117,117,117,117,337,117,117,117,117,117,117,117,117,117,117,117,
     117,117,117,117,117,117,117,117,117,119,119,121,121,121,121,121,121,122,122,122,
     122,122,122,122,122,122,122,122,123,123,123,123,123,123,123,123,123,124,124,124,
     124,124,124,124,124,124,124,125,125,125,125,125,125,125,125,125,125,125,144,125,
     125,125,125,125,126,127,127,128,128,128,128),
    TPYIndex_191_list(301,117,108,122,108,395,254,461,349,265,246,141,351, 48,478,474, 18,216,177,487,
     366,172,148,508,220, 71, 33,117,441,229,222,184,139,459,147,481,458,507, 47,414,
     510,526,435,173,124,122,213,487,309,461,337,220,521,315,328,125,420,138,483,175,
     502,161,506,  0,498,509,242,235,354,117,498,136,341,187,515, 33,522, 25,468, 20,
     416,459,333,464,161,477,485, 57,247,456, 89,461,172,178,464,257,108,128,128,128,
     133,133,133,133,133,133,133,133,133,133,133,133,133,133,133,135,135,135,135,135,
     135,135,135,135,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,
     136,136,137,137,137,137,137,137,138,138,138,139,139,139,139,139,139,139,139,139,
     139,139,140,140,140,141,141,141,141,141,141,141,141,141,141,141,141,141,141,141,
     141,142,142,142,143,143,143,143,143,143,144),
    TPYIndex_191_list( 92,112,510,159,346,350,263,341,136,395,487,151,422,485, 50,371,506,295,341,461,
     240,322, 91,517, 51,395,510,342,240,175, 26,166, 18,510, 61,472,491,523,328,330,
     483,513,499,387,143,477,161, 42,208,333,493,172,247,172,292,417, 64, 84,417,224,
     232,461, 25,  0,261,408,422,233, 70,117,175,265,214, 69,177,513,223,461,242,395,
     491,339,315,339,328,122,184,242,242,472, 71,374,511,135,341,231,395,145,145,145,
     145,145,145,145,147,147,147,147,147,147,147,147,147,147,147,147,147,147,147,147,
     147,147,147, 16,148,148,149,149,149,149,149,149,149,149,149,151,151,151,151,151,
     151,151,151,151,151,268,151,151,151,151,151,151,151,152,152,154,154,154,154,155,
     155,155,155,155,159,159,159,159,159,159,159,159,159,160,160,160,160,160,160,160,
     161,161,161,161,161,161,161,161,161,161,161),
    TPYIndex_191_list(221,214,483,485,149,505,420,431,295,423,477,339,427,513,509,317,412,509,341,517,
     427,242,242,175,445,479,483,220,240,346,231,221,341,485,508,351,231, 20, 92,523,
     229,395,246,479,485,517,483,108,393,503,393,307,151,291, 66,501,341,499,328, 11,
     456,386,192,  0,365, 18,415,478,503,261,420,161,122,184,268,509,229,413,159,439,
     379,235,514,  8,223,106,351,151,459,117,229,485,242,184,339,  8,501,161,161,161,
     161,161,161,161,162,162,162,162,162,162,162,162,162,163,163,163,163,163,164,164,
     164,145,164,164,164,164,164,164,164,164,164,164,165,165,165,165,165,165,165,165,
     165,165,165,165,165,165,166,166,166,166,166,166,166,166,166,166,166,166,166,166,
     166,166,166,166,166,166,166,167,167,167,167,167,167,168,168,168,168,168,168,168,
     168,168,168,172,172,172,172,172,172,172,172),
    TPYIndex_191_list(162,162,376,422, 20,262,520,175,229,462,117,306, 15,136,466,173,514,422,376,111,
     176,268,376,376,306,457,232,211, 25,164,399,172,459,442,295,229,526, 81,295,433,
     221,408,182,133,506,182,482,172, 40,509,470,485,176,483,178,449,361,452,350,276,
     518,440,298,  0,116,178,399,516,328,505,386,159,507,172,111,487,361, 70,179,109,
     522,182,498,  7,117,507,339,509,159,498,457,117,477,393, 25,510,351,172,172,172,
     172,172,172,172,172,172,172,172,172,172,172,172,172,172,172,172,172,172,172,172,
     172,172,172,172,172,172,172,172,172,172,172,172,172,172,172,172,172,172,172,172,
     172,172,173,173,173,173,173,173,173,173,173,173,173,173,173,173,173,173,173,175,
     175,175,175,175,175,175,175,175,175,175,175,175,175,175,175,175,175,175,175,175,
     175,175,175,191,175,175,175,175,175,175,175)
     );
BEGIN
  IF (p_Index>0) AND (p_Index<192) THEN
    RETURN v_list06(p_Index1)(p_Index);
  ELSE
    RETURN 0;
  END IF;
end get_py_index_06;


FUNCTION get_py_index_07(p_Index1 NUMBER, p_Index NUMBER)
RETURN NUMBER IS
  v_list07 TPYIndex_list := TPYIndex_list(
     TPYIndex_191_list(236,510,390,122,473,117,445,505, 69, 51,395,508,468,522,181, 11,351,268,399,524,
     213,180,361,148,477,178,510, 50,210,268,186,213,161, 59,164,128,423,462,209,461,
     352,121,246,470,322,459,117,458,439,364,433,478,225,462,185,145, 85,439,408,176,
     460,166,186,  0,175,468,507,452,505,247, 47,350,399, 12,439,461,449,459,128,466,
     431,466,462,159,457,117,435,415, 94,215,117,180,161,507,472,181,112,175,175,175,
     175,175,175,175,175,176,176,176,176,176,176,176,176,176,176,176,176,176,177,177,
     177,177,177,177,177,177,177,177,177,177,177,177,474,177,177,177,177,177,177,177,
     177,177,177,177,177,177,178,178,178,178,178,178,178,178,178,184,178,178,178,178,
     178,178,178,178,178,172,178,178,178,178,178,178,178,179,179,179,179,179,179,179,
     179,179,179,179,179,179,179,179,179,179,179),
    TPYIndex_191_list(172,467,361,520,393, 97,234,247,232,423,352,390,339,516,339,449,506,459,398,477,
     423,449,123,450, 17,515, 28,143,522,245,237,477,500, 18, 58,236,262,339,346,432,
     520,167,521,457,518,464,232,179,110,369,265,483,520,108,247,467,479,389,339,467,
     460,175,194,  0,459,368,262,339, 92,508, 81,265,263,484,475, 13,408,350, 20,164,
     128,520,262,451,117,451,467,135,263,462,231,520,329,487,478,431,137,179,179,180,
     180,180,180,180,180,180,180,180,180,180,180,180,180,180,180,180,180,180,180,180,
     180,180,180,180,181,181,182,182,182,182,182,182,182,182,182,182,182,182,182,182,
     182,182,182,184,184,184,184,184,184,184,184,184,184,184,184,184,184,184,184,184,
     184,184,184,184,184,184,184,184,185,185,185,185,185,185,185,186,186,186,186,186,
     186,177,186,186,186,187,187,187,187,187,187),
    TPYIndex_191_list(507,487, 47, 42, 69,458,484,520,467,479,451,128,385,479,179,477,515,291, 12,161,
     317,509,175,417,352,403,487,458,415,457,364,423,117,487,505,124,366,161,497,427,
     468,413,505,520,423,165, 28, 18,112, 63,229,417,478,457,520,225,513,341,251,507,
     247,271,330,  0,231,468,520,172,461,415,247, 17,477,493,271,342,167,459,172,386,
     466,357,468,415,345,497,526,507,388,376,235,483,108,359, 58,525,175,187,187,187,
     187,187,188,188,188,125,189,189,189,189,189,191,191,191,191,191,191,192,192,192,
     192,192,192,192,193,193,193,193,194,194,194,194,194,194,194,194,194,194,194,194,
     194,194,194,198,198,198,198,199,199,206,206,206,206,208,208,208,208,209,209,209,
     209,209,209,209,210,210,210,210,210,211,211,211,211,212,212,213,213,213,213,213,
     213,213,213,214,214,214,214,214,214,214,214),
    TPYIndex_191_list(359, 42,369,466,166,162,523,457,342,487, 68,479,166,457,379,175,176,164,493, 61,
     462,517, 18,421,477,299,415,477,387,467,172, 23,341,221,337,470,339,322,474,268,
     225,462,523,213,482,467,225,459, 42,177,242, 42,479,388,460,459,524,523,246,457,
     221,225,231,  0,159,361,510,505, 85,457,479,423,487,459,415,462,116,116,339, 25,
     333,460,502,123,479,139,525,421, 31,339,453,479,225,421,242,408,123,214,214,214,
     215,215,215,215,216,216,216,216,219,219,219,219,219,219,219,220,220,220,221,221,
     221,221,221,221,221,221,221,221,221,221,221,221,221,222,222,222,222,222,222,222,
     223,223,223,223,223,223,223,223,223,224,224,225,225,225,225,225,225,225,225,225,
     225,225,228,228,228,229,229,229,229,229,229,229,229,229,229,229,229,229,229,229,
     229,229,229,229,229,229,229,229,229,229,229),
    TPYIndex_191_list(355,393,136,510,184,259,265,137,431,185,117,393,138,517,483,  4,107,408,249,237,
     328,107, 44,451, 18,172, 49,237,185,261,502,246,328,172,172,243,261, 68,473,482,
     482,111,  7,473,136,482,492,257,477,510,477,364,354,342,164,477,477,473,342,459,
     483,222,484,  0,108,388,111,388,231,300,342,159, 49,111,159, 48, 65,117,458,321,
     219,334,242,507,483,457,462,457,194,166,166,461,386,159,176,509,386,229,229,229,
     229,229,229,229,229,232,231,231,231,231,231,231,231,231,231,231,231,231,231,231,
     232,232,232,232,232,232,232,232,232,232,232,233,233,233,233,233,233,233,233,224,
     233,233,233,233,234,234,234,234,234,235,235,235,235,235,235,235,235,235,235,235,
     235,236,236,236,236,236,236,236,236,236,236,236,236,236,236,237,237,237,237,237,
     237,237,237,237,237,237,240,240,240,240,240),
    TPYIndex_191_list( 48,468, 48,520,449,166,160,151,330,231,351,  6,235,321,345,  6,166,468, 72,446,
     135,135,135, 85,368,277,513,435,328,477,351,173,184, 51,245,178,498,241,172,223,
     168,482,163,477,347,487, 70,159,507,446,505, 45,506,482,517,433,307,471,503,381,
     149,394,234,  0,180, 18, 81,143,452,467,333, 61, 87,446,435,184, 61,214,231,231,
     453,214,231,231, 61,394,411,435,214,503,507, 70,297,346,291,435,435,240,240,240,
     240,241,241,241,241,241,241,242,242,242,242,242,242,242,242,242,242,242,242,242,
     242,242,242,242,242,242,242,247,247,247,247,247,247,247,247,247,247,247,247,247,
     247,243,243,243,243,243,243,244,244,245,245,245,245,245,245,245,246,246,246,246,
     246,246,246,246,246,246,246,246,249,249,249,249,249,249,249,249,249,250,250,250,
     250,250,250,251,251,251,251,251,251,251,251),
    TPYIndex_191_list(240,502,408,413,502,477,350,198, 32,339, 81,164, 48,361,366,484, 40,347,111,320,
     318,482,357,452,339,328,457,457,198, 85,110,  7, 25,467,432,518,209,507,291,333,
     518,509,459,271,351,194, 48,473,318,507,465,106,155,518,214,506,433, 65,257,462,
     462,250,462,  0,296,452,452,466,199,482,155,319,388,435,257, 57,393,351,425,524,
     172,482,463,445, 47,443, 90,280,328,136,229,501,415,178,232,404, 21,251,252,252,
     252,252,252,252,254,254,254,254,254,254,254,254,254,254,254,254,256,257,257,257,
     257,257,257,257,257,257,257,257,257,257,257,257,257,258,258,258,259,259,259,259,
     259,259,259,259,261,261,261,261,261,261,261,261,261,261,261,261,261,261,262,262,
     262,262,262,262,262,262,262,263,263,263,263,263,263,263,263,264,264,265,265,265,
     265,265,265,266,266,266,266,266,266,267,268),
    TPYIndex_191_list(245,329,225,352,160, 70,282,277,361,393,515,184, 89,328,168,455,257,368,513, 48,
     246,313, 81,  4,280,402,487,508,365,441,451,186,173, 92, 18, 43,472,447,398,422,
     413,515,477,233,172,328,462,247,313, 43,242,168,318, 53,176,242,513,242,177,479,
     247,469, 34,  0,439,291,233, 65,214,461,444,317,507,177,456, 65,476,460,415,111,
     511, 70,211,299,186, 51,185,219,231,444,339, 65, 23,470,366,485,492,268,268,268,
     268,268,268,268,268,268,268,268,268,268,268,268,268,270,270,270,271,271,271,271,
     271,271,271,271,271,271,271,271,271,271,271,276,276,276,276,276,276,276,277,277,
     277,277,277,278,278,278,279,280,280,280,280,280,281,282,282,284,285,291,291,291,
     291,291,291,291,291,291,291,291,292,292,292,292,292,292,292,293,293,294,294,295,
     295,295,295,295,295,295,296,297,297,297,297),
    TPYIndex_191_list(459, 21,464,215,234,472,242,168,488,246,351,492,243,291,491,459,455,181,235,181,
     177,172,149,466,262,295,125,175,507,507,466,420,459, 40,457,483,464,184,182,463,
     391,182,432,395,421,337,337,139,339,432,458, 72,108,314,420,108,108,242,236,458,
     349,318,210,  0,117,493,112,229,483,222,446, 25,341,184,165,520, 20,271, 85, 90,
      12, 40,477, 31,241, 69,469,474, 79, 71,342,242,477,172,175,455,339,297,297,298,
     298,298,298,299,299,299,299,301,301,301,307,302,303,303,306,306,306,306,309,313,
     313,313,313,313,313,313,314,314,314,314,314,314,315,315,315,315,315,315,317,317,
     317,317,317,317,317,317,318,318,318,318,318,319,319,319,319,319,319,319,320,320,
     320,320,320,320,320,320,320,321,321,322,322,322,322,322,322,322,322,322,322,322,
     322,322,322,328,328,328,328,328,328,328,328),
    TPYIndex_191_list(242,242, 42,403,175,333,472,472, 32,224,435,433,177,322,477, 40,262,122,483,458,
     518,166,415,507,444,451,339,452,361,117,510,162,186,172,  6,521,254,362,148,478,
     482,477,346,328,431, 81,229,481, 15,477,510,291,314, 24,466,474,459,159,526, 89,
      85,295,161,  0,257,394,137,261,451,117,518,507,172, 61,446,469,246,229,364,507,
      46,483,466,518,234,456,172,141, 59,135,140,294,483,518,320,271,508,328,328,328,
     328,328,328,328,328,328,329,329,329,329,330,330,330,330,331,331,332,332,332,332,
     332,333,333,333,333,333,333,333,333,333,334,334,334,334,334,334,334,334,335,337,
     337,337,337,337,337,337,337,337,337,337,337,337,337, 13,339,339,339,339,339,339,
     339,339,339,339,339,339,339,339,339,339,339,339,339,339,339,339,339,339,339,339,
     339,339,339,339,339,339,339,339,339,339,340)
     );
BEGIN
  IF (p_Index>0) AND (p_Index<192) THEN
    RETURN v_list07(p_Index1)(p_Index);
  ELSE
    RETURN 0;
  END IF;
end get_py_index_07;


FUNCTION get_py_index_08(p_Index1 NUMBER, p_Index NUMBER)
RETURN NUMBER IS
  v_list08 TPYIndex_list := TPYIndex_list(
     TPYIndex_191_list(341,510,164,117,121,418, 54,180,106,  4,345, 48,333,341,223,399,514, 68, 33,483,
      91,451,229, 90,117,361,478,337,487,415, 47,299,456, 22,457,128,510,268,514,526,
     445,350,417, 46,322,457,464,479, 45,187,472, 67,147, 67,173,450,482,365,461,459,
     452,178,278,  0,271,441,286,252, 59, 81,351, 89,521,219,242,451,361,215,337,518,
     124,143,245, 50, 56,500,258,229, 13,347,185,347, 81,386,179,502,507,340,340,341,
     341,341,341,341,341,341,341,341,341,341,341,341,341,341,341,341,341,341,341,341,
     341,342,342,342,342,342,342,342,342,345,345,345,345,345,345,345,345,345,345,345,
     345,345,345,345,346,346,346,346,346,347,347,347,347,347,347,347,347,347,347,347,
     348,348,348,348,348,348,348,348,348,348,348,348,348,349,349,350,350,350,350,350,
     350,350,350,351,351,351,351,351,351,351,351),
    TPYIndex_191_list(128,210,347,472,450, 17,509,175,235,421,432, 72,161,151, 57, 43,164,117,220,386,
     472,477,433,339,449, 33,505,494,182, 18,477,259, 14,319, 87,350,194,460,449,483,
     483,117,231,468,278, 33,455, 57,461,329,271,  4,479,216,216,176,262,526,526,522,
     365,457,475,  0,472,351,175,117,247,175,321,159,159,160,472,441,518,348,261,165,
     393,121,509,341,451, 25,451,172, 92,474,417,352,505,470,395,221,520,351,351,351,
     351,351,352,352,352,352,352,352,352,352,352,352,352,353,353,353,353,353,353,353,
     353,354,354,357,357,357,357,358,358,358,358,358,359,359,359,360,360,361,361,361,
     361,361,361,361,361,361,361,362,362,363,364,364,364,364,364,364,364,364,364,364,
     365,365,365,366,366,366,366,366,366,366,366,366,366,368,368,369,369,369,370,370,
     371,371,372,372,372,374,374,374,374,376,376),
    TPYIndex_191_list(474,484,257,487,399,513,139,357,469,446,451,482,412,478,395, 57,395,487,505,366,
     229,353,484,229,184,457, 51,467,441,237,455, 83,341,522,334, 67,484, 51,483,317,
     337,276,457,111,487,371, 31,261,416,266,412,237,457,136,222,125, 67,422,246,468,
     517,141,520,  0,142,526,433, 33,320,446,393,222,236,433,466,254,439,510,  4,231,
     520,333,467,179,442,178,451,443, 32,483,477,518, 18,242, 26,501,225,376,376,377,
     377,377,378,378,378,378,379,379,379,382,383,386,386,386, 40,386,386,386,386,386,
     387,387,388,388,388,388,388,388,388,388,388,388,388,388,388,388,388,388,389,389,
     389,389,389,389,389,389,390,390,390,390,390,390,390,390,390,390,390,391,391,391,
     391,391,391,391,391,391,391,391,391,393,393,393,393,393,393,393,393,393,393,393,
     393,393,393,393,393,394,394,394,394,394,394),
    TPYIndex_191_list(342,251,472,236,457,330,142,147, 81,242,391,389, 81,470, 25, 81,498,393,468,161,
       6,261,247,508,334,176,261, 61,294,166,187,478,388,478,143, 46,161,386,208,341,
     249,492,494,229,451,172,470,394,259,313, 42, 83,369,225,483,345,510,210,175,250,
     487, 13,482,  0,242,474, 98,431,110,186,110,366,111,214,405,471,467,117,422,456,
      89,408,461,457,372,487,390,175,416,236,483,458,408,299,468,487,483,394,394,394,
     394,394,395,395,395,395,395,395,395,395,395,395,395,395,393,395,395,395,395,395,
     395,395,395,395,395,395,395,395,395,395,395,395,395,395,395,395,395,395,395,395,
     395,395,395,395,395,395,395,395,395,398,398,398,398,398,398,398,398,398,398,399,
     399,399,399,399,399,399,399,399,399,399,399,399,399,399,399,399,399,399,399,399,
     399,399,399,399,399,399,399,399,399,399,399),
    TPYIndex_191_list(461,149,  3,166,166,172,518,460,449,264,228,176, 30,393,379,231,194,484, 68,507,
     422,500,416,472,108, 87,462,136,510,175,193,372,470,474,  8, 94,332,484,297,509,
     455,330,339,493, 46,505,106,291,479, 61,461,339,107,175,483,214, 20,517,261,221,
     179,349,346,  0,446,459,413,247,477,467,462,477,219,225,177, 81,507, 15,474,268,
     164,319,412,421,443,349,345,451,237,166,313,193,487, 13,229,510,510,399,400,400,
     401,401,401,401,402,402,403,403,403,404,404,404,404,405,405,405,405,406,406,406,
     406,408,408,408,408,408,408,408,408,408,408,408,408,408,395,408,408,411,411,411,
     411,411,411,411,411,412,412,412,412,413,413,413,413,413,413,413,413,413,466,413,
     413,414,414,414,415,415,415,415,415,415,415,415,415,415,415,416,416,416,417,417,
     417,417,417,417,417,417,418,418,418,418,418),
    TPYIndex_191_list(  3,235,468,347,220,494,456,369,369,347,242,413,443,252,487,333,483,470,172,181,
     468,350,413,181,112, 25,460,477,459,483,184,459,459,478,342,479,240,440,162,485,
     236,474,257,221,214,221,172,422,251,225,225,166,411,507,451,214,163,229,172,225,
     163,246,172,  0,214,242,175,375,427,225,352,461,477,243,258, 22,507,461,184,161,
     467, 67,117,467,242,161,149,177,184, 13,472,500,500,214, 23,457,399,418,418,418,
     418,420,420,420,420,420,420,420,420,420,421,421,421,421,421,421,421,421,421,421,
     421,421,421,421,421,421,421,421,422,422,422,422,422,422,422,422,422,422,422,422,
     422,423,423,423,423,423,423,423,423,423,423,423,425,427,427,427,427,431,431,431,
     431,431,431,431,431,431,431,431,431,431,431,431,432,432,432,432,432,432,432,432,
     433,433,433,433,433,434,434,434,435,435,435),
    TPYIndex_191_list( 84,350, 87,446,186,503,475,483,147,518,460,109, 98,  7, 48,341,452,485,485,187,
     339,439,507,484,353,482,347,339,508,271,450,111,111,148,117,357,319,291,425,333,
      81,184,229,117,498,467,328,328,459, 84, 22, 24,500,434,136,479,246, 59,166,252,
     117,234,477,  0,459,229,477,333,346,391,477,450,268,346,141,349,223,464,178,350,
     173,485, 45, 15,147,468,505,337,459,232, 18,484,482,178, 70, 83,166,435,435,435,
     435,435,435,435,439,439,439,439,439,439,439,439,439,439,439,439,439,440,440,440,
     440,441,441,441,441,441,441,441,441,441,441,441,442,442,443,443,443,443,443,443,
     444,444,444,445,445,445,445,445,445,445,445,445,445,445,447,447,447,447,447,447,
     447,448,448,449,449,449,449,449,449,449,449,449,449,449,449,449,449,449,449,449,
     450,450,450,450,450,450,450,450,450,450,451),
    TPYIndex_191_list(411,184,339,483,187,457,245,229, 85,423,215,147,147, 12,110,451,444,487,417,341,
     451,291,451,232, 89, 98, 11,517,450, 30,261,446,219,178,435,254,467,262,178,395,
     468,472,365,451,117,484,257,451,368,462,458,479,395,508,422,510,520,431,484,259,
     219, 91,350,  0,457,455,487,483,479,176, 11,408, 59,457,453,231,317,364,172,456,
     466,147,477,328,162,477, 91,285,458,161,166,249,477,452,479,427,508,451,451,451,
     451,451,451,451,451,451,451,451,451,451,451,451,451,451,451,451,451,451,451,451,
     451,451,451,451,451,451,451,451,451,452,452,452,452,452,452,452,452,452,452,453,
     453,453,455,455,455,455,455,455,455,455,455,456,456,456,456,456,456,456,456,456,
     456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,456,
     457,457,457,457,457,457,457,457,457,457,457),
    TPYIndex_191_list( 31,409,339,433,389, 81,242,451,507, 46,351,328,483,175,241,347,478,176,452,461,
     251,503,503,249,483,237, 61,229,251,461, 43,268,524,408,350,425,507,322,345,351,
      22,233,141,457,339,513,110,233,186,186,478,431,177,359,461,456,508,470,408, 51,
      47, 71,229,  0,445,477,180, 68,339,172,460,391,347,479, 41,229,495,468,510,494,
     462,252,462,339,364,175,149,517,178, 23,151,108,225,178,219,265,229,457,457,457,
     457,457,457,457,457,457,457,457,457,457,457,457,457,457,457,459,457,457,457,457,
     457,458,458,458,458,458,458,458,458,458,458,386,458,458,459,459,459,459,459,459,
     459,459,459,459,459,459,459,459,459,459,459,459,459,459,459,459,459,459,459,459,
     460,460,460,460,460,460,460,460,460,460,460,460,460,460,460,460,460,460,460,460,
     461,461,461,469,461,461,461,461,461,461,461),
    TPYIndex_191_list(350,295,242, 91,461,510,240,229,240,318,475,328,389,475,479,399,457, 30,351,352,
      30,251,178,510,517,165,307,320,508,250,106,194,264,457,191,484,351,236,468,399,
     439,460,483,161,451, 72, 49,451, 72,516,122,483,477,117,321,178,508, 70,477,508,
     178,507,462,  0,357,507,187, 41,477,357,445,236,319,474,526, 18,390,184,210,469,
     505,477,314,117, 81,117,142,507,507,357,477,445,276,135,468,503,351,461,461,461,
     461,461,461,461,462,462,462,462,462,462,173,462,462,462,462,462,462,462,462,462,
     462,462,462,462,462,463,463,463,463,463,463,463,463,463,463,464,464,464,464,464,
     464,464,464,464,148,464,464,464,464,464,465,465,465,465,465,465,465,466,466,466,
     466,466,466,466,466,466,467,467,467,467,467,467,467,467,467,467,467,467,467, 51,
     467,467,467,467,467,468,468,468,468,468,468)
     );
BEGIN
  IF (p_Index>0) AND (p_Index<192) THEN
    RETURN v_list08(p_Index1)(p_Index);
  ELSE
    RETURN 0;
  END IF;
end get_py_index_08;


FUNCTION get_py_index_09(p_Index1 NUMBER, p_Index NUMBER)
RETURN NUMBER IS
  v_list09 TPYIndex_list := TPYIndex_list(
     TPYIndex_191_list(483,291, 25,446,306,339,209,361,176,525,268,178,106,366,510,141,478,188,464,380,
     215,294,399,462,215,229,185,393,178,505,237,172,477, 26,514,404,354,229,466,421,
     215,423,484,236, 48, 43, 72,232,320,110,484,472, 91,507,477,339,143,198,339,431,
     431,117,508,  0,462, 85,215,442,482,482,484,117,483,442,472,477,319, 70,487,418,
     135,163,364,484,277,181,417,317,377,294,479,178,163,209,231,229,395,468,468,468,
     468,469,469,469,469,469,469,470,470,470,470,470,470,470,470,470,470,470,470,470,
     470,471,471,471,471,471,471,471,471,471,471,471,471,471,471,471,471,472,472,472,
     472,472,472,472,472,472,472,472,472,472,472,472,472,472,472,472,472,472,472,472,
     472,472,472,472,472,472,472,472,472,472,473,473,473,473,473,473,473,473,473,473,
     473,473,473,473,473,473,473,474,474,474,474),
    TPYIndex_191_list(247,477, 85,462,459,451, 21, 32,172,388,335, 18,337,175,513,175, 67,172, 70,488,
     108,110,460,470, 22,359,251,221,  6,494,166, 32,415,299, 70,231, 71,399,500, 18,
     221,337,507,419,399,447,395, 15,462, 25, 46,220,240,457,459,221,503, 69,184,491,
     395,175,477,  0,221,471,457,112,117,114,  7,151,172,172,459,139, 20,472,467,186,
     329,254,261,261,331,395,408,172,505,186,261,433,231,474,507,187,457,474,474,474,
     474,474,474,474,474,474,474,474,475,475,475,475,475,475,475,475,475,475,475,475,
     475,475,475,477,477,477,477,477,477,477,477,477,477,477,477,477,477,477,477,477,
     477,477,477,477,477,477,477,477,477,477,477,477,477,477,477,477,477,477,477,477,
     477,477,477,477,477,477,477,477,477,477,477,477,477,477,477,477,478,478,478,478,
     478,478,478,478,478,478,478,478,478,478,478),
    TPYIndex_191_list(388,451,457,432,483,221, 98, 91,347,318,172,266,479,135,351,500,179,139, 79,175,
     246,351,175,451,186,351,246,221,393,172,139,472,432,350,179, 63,507, 44,172, 70,
     507,462,352,125,395,141,462,167,350,464,291,339,242,498, 18,464,389,133,507,469,
      51,457,477,  0,242,186,457,472,457,472, 87,117,350,350,177,172,108,470, 84,159,
      41,423,467,178,477,361,470,478,388,339,445,172,470,478, 98,111,471,478,479,479,
     479,479,479,479,479,479,479,479,479,479,479,479,479,479,479,479,480,481,481,481,
     481,481,481,481,481,481,481,481,481,481,481,481,482,482,482,482,482,482,482,482,
     482,482,482,482,482,482,482,482,482,482,482,482,483,483,483,483,483,483,483,483,
     483,483,483,483,483,483,483,483,483,483,483,483,483,483,483,483,483,483,483,483,
     483,467,483,483,483,483,483,483,483,483,483),
    TPYIndex_191_list(474,411,393,478,478,186,461,281, 46,482,507,465,109,463,263,391,472,372,516,467,
     477,477,413, 48,151,393,151,467,505,510,506,135,518,500,136,117,175, 85,236,431,
     473,301,317,509,122,477,184,474,498,477,477,351,502,333, 18,465,351, 25, 68,522,
     423,510, 59,  0,503,481,467,470,477,165,151,395,346,461,395,154, 91,160,141,352,
     166,178,162,121,473,451,393,509,439,261,266,246,166,472,465,137,106,483,483,483,
     483,483,483,484,484,484,484,484,484,484,484,484,484,484,484,484,484,484,484,484,
     484,484,484,485,485,485,485,474,485,485,485,485,485,487,487,487,487,487,487,487,
     487,487,487,487,487,488,488,488,490,490,490,490,490,490,490,491,491,491,491,492,
     492,492,493,493,493,493,493,493,493,493,493,493,493,493,493,493,494,494,494,494,
     495,496,497,497, 35,497,498,498,498,498,498),
    TPYIndex_191_list( 24,433,477,225,510,213,351,456,172,507,361, 63,222, 98,213,477,435, 70, 15, 42,
     482,199,345,347,400,  4,483,461, 47,178,459,456,456,124,411, 26,166,180,485,505,
     485, 91,162, 43,404,178,194,351, 61,461,415,450,459,110,220,418,477,291,478,509,
     328,517, 42,  0, 46,516,172,339,421,515,451,184,348, 89,506,526,521,341,517,232,
     175,172,458,245,393, 21,162,329,483,462,467,329,395,468,395,167,162,498,498,498,
     388,498,488,498,498,498,499,499,499,499,499,499,500,500,500,500,500,500,500,500,
     500,500,500,500,500,500,500,500,500,501,501,501,501,501,501,501,501,501,501,501,
     501,501,501,501,502,502,502,502,502,502,502,502,502,502,503,503,503,503,503,503,
     503,503,503,503,505,505,505,505,505,505,505,505,505,505,505,505,505,505,505,505,
     506,506,506,506,506,506,506,506,506,506,506),
    TPYIndex_191_list( 98,508,431,462,117,337,435,221,339,483,518,513,457,166,478,440,459,278, 46,112,
     510,473,472,165,468,125,306,467,270,475,451,464,427,509,388,334,443,165,168,125,
     479,261,461,261,458,342,505,469,431,413, 12, 48,500,477,176,484,462,461,423,474,
     474,507,483,  0,330, 61,229,268,268,389,503,267,175,494,522,231,247,493,467,142,
     457,517,  6,  6,179,503,477,461,176,251,502,459,447, 70,467,497,379,505,506,506,
     506,507,507,507,507,507,507,507,507,507,507,507,507,507,507,507,507,507,507,507,
     507,507,507,507,507,507,507,507,507,507,507,507,507,507,507,507,507,507,507,507,
     507,507,507,507,508,508,508,508,508,508,508,508,508,508,508,509,509,509,509,509,
     509,509,509,509,509,509,509,509,509,510,510,510,510,510,510,510,510,510,510,510,
     510,510,510,510,510,510,510,510,510,510,510),
    TPYIndex_191_list(457,498, 94,506,461,221, 98,479,186,172,525,345, 25,166,513,456,496,498,507,345,
     421,496,337,394,468,493,421, 71,415,459,172,177,500,300,477,  3,500,166,462,477,
     477,388,358,300,341, 94,418,161,509,149,477,479,191,483,175,166, 91,503,468,491,
     225,393,451,  0, 42,229,477, 20,503,472, 98, 50,451, 50,474, 42,358,478,221, 46,
     462,295,164,491,477, 71,500,472, 91,445,361,465,465, 18,509,393,467,510,510,510,
     510,511,502,512,513,513,513,513,523,513,514,514,514,514,514,514,514,515,515,515,
     515,515,515,516,516,517,517,517,517,517,517,517,517,503,517,517,518,518,518,518,
     518,518,518,518,490,518,518,518,518,518,518,520,520,520,520,520,520,520,521,521,
     521,521,522,522,522,522,522,522,522,522,523,523,524,524,524,524,525,525,526,526,
     526,498,526,526,526,526,  0,  0,  0,  0,  0),
    TPYIndex_191_list(341,159,458,172,159,147,240,457,457,233,147, 91,240,339,229, 79, 20,399,459,112,
     507,507,472,472, 51,166,444,477,477,472,  7,160, 98, 51,472,215,121,184,337,457,
     164,510,173,111,457,168,452,164, 81,520,111,477,  4,328,276,328,135,276,482,268,
     408,164,254,  0,268,  4,483,291, 18,483,173,442,254,457,477,483, 51,421,164,186,
      15,505,487,117, 28,133,425,477,148,449,332,168,108,421,449,499,507, 51,172,456,
     121,292,372,328,127, 47,125,280, 98,399,483,331, 18,445,474,474,507, 81,463,478,
     214,483,124,423, 83,172,277,295,172,339,261, 15,379,136,494,391, 67,472,186,408,
     475,472,351,334,141,214, 20,494,137,482, 33,477,452,180,209,141,189,219,172,472,
     449,211,330,186,345,168,477,439,450, 70, 87,501,224,372,477,271,361,483,328,471,
     447,456, 43, 31,192,510,297,188,482,477,135),
    TPYIndex_191_list(106,510,395, 18,518,106,141,329,107,250,425,394,213,117,434,477, 48,254,151,111,
     242,235,166,121,329,518,173,467,495,177,121,492,175,479,470,505,391, 23, 23,350,
     391, 54,492,509,220,491, 59, 46,389,432,320,128,459,250,175,415,117,421, 61, 61,
     507,172,501,  0, 91,179,465, 57,487, 13,490,220,112, 31,172,394,477,523,117,135,
     374,494,233,477,  8, 46,449,507,515, 21,487,497, 70,491,472,337,388,439,445,291,
     119,172,106,482,210,191,510,477,433, 41,177,299,270, 50,472,229,350,229,483,333,
     481,408,112,341,371,315,517,399,246,455, 18,431,139,206,184,111,472,462,172,451,
     520,247,422, 23,306, 48,457,180,175,177,182,439,468, 70,439,444,391,341,522,485,
      64, 81,457,470,159,143, 42,214, 13,337,159,117,117,413,408,452,472, 25,142,254,
     462,243,335, 24,479,246,225,232,161,234,459),
    TPYIndex_191_list(449,479,179,514,459,492, 18, 91,399,472,446,468,240,514,492,487, 18,509,112,487,
     457,465,457, 47, 47,458,422,521,229,388,349,478,459,518,186,347, 81, 59,505,441,
      81,457,500,186,178,351, 51,168,469,433, 97,122,417, 63,457,502,413,478,351,175,
     353,517,451,  0,242, 71,350,518,431,351, 48,165,345,345,177,493,485,106,522,456,
     194,186, 46,318,485,314,339,445,477,292,236,257,209,518,340,510,351,411,333,508,
     266,472,178,159,388,313,184,281,136,151, 81,502,351,477,213,225,137,178,166,393,
     135,352,506,167,467,345,124,213, 99,521,517,451,483,393, 42,415, 46,175,469,475,
      98,483,468,  4, 81,518,329,268, 71,413,395,261,503,175,496,345,186,472,500, 46,
      70,179,526,456,341,180, 11, 83,526, 15,464,121,507,295,521, 56,328,451,165,451,
     457,147,349,213,252,456,109, 24,328, 15,475)
     );
BEGIN
  IF (p_Index>0) AND (p_Index<192) THEN
    RETURN v_list09(p_Index1)(p_Index);
  ELSE
    RETURN 0;
  END IF;
end get_py_index_09;


FUNCTION get_py_index_10(p_Index1 NUMBER, p_Index NUMBER)
RETURN NUMBER IS
  v_list10 TPYIndex_list := TPYIndex_list(
     TPYIndex_191_list(500,317,510,291,477,172, 97, 97,510,525,512,460, 85,329,507,178, 28, 68,351,399,
     441, 63,199,295,461, 26,525,271,399,177,345,260,175,339,455,451,178,353,295,184,
     295,245,242,228,455,352,522,346,477, 81,520,322,506,483, 96, 57,481,507,498, 46,
     445,422,117,  0,522,360,498,443,342,500, 83,431,172,237,491, 18, 49,242,233,422,
     507,413,457,214,172,517,342,507,317,520,231,493,357,443,184,459,508, 81,420,173,
     507,510,211,346,470,487,229,479,124,457,117,328,421,472,185,472,478,501,334,388,
     521,236,112, 51,164,250,351,390,151,125,259,467,462,412,462,186,175,388, 71, 43,
     408, 20, 16,350, 16, 98,107,399,172,481,151,467,456,125,505,213,328,477,229,339,
      11,122,240, 83,242, 45, 81,445,291,271,  6,471, 85, 89,189,388,389,280,121,478,
      47,395,143,470,234,484,507,  4,477,328,292),
    TPYIndex_191_list( 25, 63,186,235,418,345,345,233, 96,139, 68, 18, 18,184,345, 96, 50,172,456,485,
     292,507,485,507, 51, 92,451,240,235,459,451,221,358,462,295,418,351,353, 64,523,
     457,214,339,235, 70,111,431, 97,133,222,361,246,  3,172,184,206,446,472,257,192,
     351,247,223,  0,445,507,472,431, 72,479,483, 45,498,141,187,485,463, 69,468,108,
     361,388,213,399,444,339,420, 98,276,339,254,368,213,341,513,159,161,322,441,378,
      69,209, 85,478,228,160,125,484,251,481,232, 48,463,328,477, 32,177,277, 91,341,
     172,449,465,339,460,117,484,487,110,172,229, 98,184,328,507,369,459, 43, 61,347,
     456,341,339,388, 20,510,208,477,268,122,331,240,  7,271,184,357,348, 48,117,236,
     294,478,254,479,349,265,433,341,477,359, 18, 59,184,439,166,510,435,345,117,361,
     464,352,166,470,266,339,177, 49,176,246,479),
    TPYIndex_191_list(351,213, 81,236, 69,  6,505,108,213,473,322, 15,136,136,319,510,364, 98,  7,509,
     507,474,194,503,507,395,333,106,133,184,461,140,471,189,352,509,518,507,391,232,
     483,390,482,484,478,503,449,117,348,509,477,236,503,500,232,518,166,450, 58,166,
     191,477,322,  0,341,142,292,333,139, 15,245,315,232,368,365,172,473,459, 54, 62,
     405,471,482,159,399,117,518,117,487, 16,500,483,487,423,136,505,458,470,127,179,
     250,416,159,509,191, 18,395,455,482, 98,257,482,229,441,459,117,415,482, 81,393,
     139,232,479, 57,180,339,457,411,179,277,339,  7,399, 43,434,483,164, 18,117,441,
      70, 65,472,522, 71,175,449,479,136,147,340,112,393,460,451, 42,189,339,214,457,
      98, 13,314,435,241,315,468,173,505,395,366,268,100, 15,453,149,172,229, 12,175,
     406,222,479,483,413,259, 90,457,231, 63,235),
    TPYIndex_191_list(484,242,461, 44,513,451,468,469,503,177,500, 26,233,111,108,235,125,379,191,164,
     477,172,515,106,483,175,159,225,320,229,229,242,235, 69,509,232,487, 59,524, 20,
     219, 59,477, 20, 20,446, 11, 59, 20,329,299,299,505, 58,477,362,108,395,366, 42,
     122,483,477,  0,339,498,450,441,516,431,460,431, 98,508, 45,291,507,505,510,423,
     477,351,166, 89,482,277,477,178,234,470, 96,181,482,350, 81,180,477,351,208,467,
     233,166,470,186,369,524,172,259,108,339,159,462,159,451,477,453,412, 18,149,420,
     366,470,459,124,229,168,351,155,108,295,261,299,477,213,231, 68,477,457,492,319,
     482,233,119,122,431,258,442, 46,117,332,298,178,177,488,477,247,187,432,475,  3,
     276,172,143,  8,184,335,234,341,139, 85,498,471,347,483,  4,468, 24,214,484,399,
     100, 53,175,406,500,306,377,246,479,507,147),
    TPYIndex_191_list(472,456,231,417,166,136,220, 16, 67,510,322,482,509,179,483, 58,431,418,484,306,
     422,415,472, 48,431,395,505,482,487, 98,168,418,451,278,474, 50,470,418,395,507,
     484,413,249,139,501,503, 27, 48,413, 96,395,241,507, 67,359,341,468,483,477, 98,
     233,395,250,  0,468,500,427,106, 20, 20,229,484,482,246,229,435,339,388,483,366,
     449,117,192, 23,463,393,484, 66,168, 12,184, 20,447,213,141,395,209,503,462,242,
     525, 64,122,164,328,464,517,168,523,279,477,443, 69,395, 26, 48,172,208, 72,224,
     498,  1,474,117,271,477,420,229, 98, 18, 15,143,347,478,488,188,119,137,236, 89,
     297, 97,280,482,408,213,172,393,166, 68,234,477,461, 18, 59,140,166,466,477,315,
     211, 97,172,264,261,498,299,127,270,250, 48,223,128,100,498,417,493,457,526,172,
     112,494,306,263,235,513,509,423,161, 65,386),
    TPYIndex_191_list(145,458,172,160,464,457,141,306,222,472, 47, 90,247,117,483,222,173,128, 25,457,
     351,461,339,348,509,521,333,225,291,482,335,460,184,481,345,477,257,371, 15,399,
     483,487,160,214,460,460,412,422,266,457,366, 51,518,521,475,456,460,487,345,481,
     254, 44,242,  0,233,513,161,345,449,345,467, 79, 18,470, 18,497,451,506,254,235,
      97,259,475,378,211,112,259,216,231,491, 42,482,339,472, 42,491,352,480, 70, 25,
      87,222,229,400, 58,498, 68,278,229,214,178,481,214,182,412,478, 48,178,241,209,
     455,166,347,  6,413, 91,194,295,151, 46,417,125,  1,100,149, 82,  3,  3,417,152,
     439, 48,320,225, 32,330,339,479, 17,412, 81,261,322,186,233,337, 53,177,309,347,
     242, 35, 79,149,179,469,477,374,328,366, 40,168,279,451,175,278,245,161,236,482,
     483,348,483,164,451,507,320,422, 50,494,143),
    TPYIndex_191_list(457,491,507,483,478,524,254,505, 90,505,484,117,432,340,334, 50,524, 58,482,478,
     337,524,145,515,242,221,472,423,500,421,515,459, 91,421,350, 57,487,107,194,412,
      50, 67,487,481,  5,498,176,330, 46,483,229,493,477,176,421,334,299,477,472,477,
     293,366,398,  0,472,236,261,261,293,463,177,395,261,472, 20,395,477,457,179,350,
     477,233, 72,502,236,334,350,  7,505,507,  7,243,117,277, 84,459,345,451,455,251,
     501,117,108,172,339,341,339,351,471,459,  6, 34,221,  7,161,194, 89,173,466, 69,
     135,254,265,477, 89,345,470,506,223,220,411,472,136,461,143,206,186,364,474,448,
     490,451,483, 67,241,518,257,394,411,172,501,235, 79, 23,477, 83, 48,318, 63,470,
     473,160,220,457, 43,165,474,507,177,351,376,108,350,  4,140,249,298,487,458,319,
     110,364,211,398,416, 18,185,229,483,459,478),
    TPYIndex_191_list(208, 54,518,108,483,456,147,123,339,252,363, 81,408,457,477, 41,477,441,457,307,
     341,350,175,502,475,478,314,109,505,464, 90,485,508,117,328,369,463, 98,186, 96,
     135,478,341, 11,457,361, 44,298,111,487,477,347,328,143,159,478,187, 84,477,508,
     457,121,363,  0,168,420,192,484,242,288,452, 97,518,291,441,395,265,328,194,236,
      24,420,161, 25,328,483,408,526, 26,509,432,173,505,395,522,507,184,414,477,143,
     246,291,391, 63,261,161, 40,451,451,257,280,501,180,186,233,462,470,164, 54,168,
     416,478, 89,395,422,444,457,361,483, 48,477,460, 25,483,167, 40,412,268,466,179,
     376,513,279,328,456,141,319,466,460,445,  4,483, 18,128,  6,179, 42,462,235,479,
     399, 72, 66, 42,456,507,313, 49,456,189, 43, 55,411, 20,298,161, 51,322, 68,473,
     526,291,117, 44,477,477,439,472, 33,189,470),
    TPYIndex_191_list(434,477,477,468,502,319,151,379,394,522,522, 25,510, 48,488,334,439,341,117,499,
     254,472,117,229,485,328,473, 11, 25,178,351,467,506,271,457,457, 81,173,271,421,
     393,477,408,213,188, 15,517,464,159,177, 48,199,246,333,395,270,194,478,187,509,
      49,460,439,  0,268,225,172,483,467,361,525,507,406,229,459,464,352,328,477,510,
     460,266,210,474,459,459,466,187, 40,223,172,328,366,261,477,478,140,194,487, 15,
     411,341,214,215,477,431,352,346,464,110, 43,450, 50,161, 65,487,214, 98,228,515,
     345, 18,413,341,481,180,345, 49, 51,235,259,432,166,402,472,451,159,265,192,418,
     247,215,182,222,483, 43,457,452,167, 98,351,353,151,432,353,191,514,317,342,376,
     339,408, 40,112,484,271,262, 96,261,136, 20,452,148,451,224,122,399,240,242,473,
     408, 97,236,254,246,468,317,445,159,265,180),
    TPYIndex_191_list(  4, 88,482,379,193,341,408,289, 84,147,485,507,199,350,461,503,482,492,431, 67,
     137,159,508,441,247,259,222,449,518,487, 15,413,483, 42,435, 25,147,173,159,185,
     112, 42,449,507,445,468,456,483,433,213,517,244,464,347,393,147,244,475,184,497,
     184,459,434,  0,252,337,229,317,485, 47,124,229,425, 24,510,505,441,237,524,184,
      43,484,175,123, 84,423, 43,245,210,236,328,242,229,342,335,185,265,164,451,234,
     173,505,478,166,510,172,467,166,423,470,176,237,161,470,366,413,456,220,451,517,
     185, 34, 12,457,257,164,510,339,457,411, 91,517,328,262,122,110, 61,393,139,242,
     402,462,472,262,350,412,165,467,321,175,468,455,257,472,347,194,391,252,479,337,
     229,366,418,167, 18,466,117,422,318,266,165,479,461,221, 32,161,246,164,231,510,
     477,242,468,122,399,408,388,390,439, 42,220)
     );
BEGIN
  IF (p_Index>0) AND (p_Index<192) THEN
    RETURN v_list10(p_Index1)(p_Index);
  ELSE
    RETURN 0;
  END IF;
end get_py_index_10;


FUNCTION get_py_index_11(p_Index1 NUMBER, p_Index NUMBER)
RETURN NUMBER IS
  v_list11 TPYIndex_list := TPYIndex_list(
     TPYIndex_191_list(524,322,  4,328,459,471,515,229,194,206,418,215, 91,515, 56,518,506, 16,295,520,
      97,472, 87,477,341,515,172,483,179,139,254, 43,444,457,231,423,136,457,399,505,
     247,259,242,162, 21,119,220,198,109,456,277,449,161, 73,459,446,168,232,107,258,
     189,473,395,  0,231,143,459, 91,441,451,449,117,365,172, 98,187,505,431,498,161,
     473, 92,458,483,199,394,165,451,117,502, 40,346,395,159,214,432,345,415,229, 70,
      42,231,366,337, 18,149,517,147,462,479,485,111,149,  7, 13,141, 71,261,482, 46,
     297,341,341,456,233,341,164,175,175,521,471,456,181,494,477,106,173,180, 69,160,
     318, 26,229,350,461,431,354,214,451,164,242, 54,165,350,458,  6,135,418,237,459,
     235,184,462,263,415,219,470,166,442,507,193,507,172, 98, 42,457,184, 42,180,301,
     261,117, 18,483, 51,406,110,472,456,483, 18),
    TPYIndex_191_list(345,160,440,520,164,475,265,175, 92,175,411,214,161,468,503,178,505, 20,508,518,
     466,475,257,315,  3,121,341,257,417,418,318,458,231,417,189,522,475,300,453,364,
     422,417,342,229,406,515, 25,317,372,328,377,123,518,456,479,165,433,237,189,416,
     395,412,449,  0,149,505,505,246,477,484,422,295,457,173,125,249,185,411,522,417,
     446,112,452,276,242,417,313,522,442,466,139,468,231,412,251,268,246,179,518,141,
     298,483,408, 68,509,388,346,471,359,399,243,177,332, 40,229,333,447,459,417, 81,
     451, 98,180, 21,178, 43, 18, 42,301,  6,484,435,456,135,268,328,  3,332, 48,229,
     472,342,330, 43,225,501,457,388, 18,294,268,403,119,119,117,301,518,178,186, 13,
     492,408,117,521,477,301,420,461,162,329,229,339,194,515, 30,507,456,  6,237,388,
      21, 61, 42,172,460,177,483,509,125,449,213),
    TPYIndex_191_list( 18,451,237, 81,376,520,477,242,199,342, 65,339, 43,422,251,481, 42,112,180, 21,
     399,247,466, 61,240,491,491, 32,229,458,457,192,403, 17,501,341, 47,242,162,172,
     337,415,342,334,235,379,466,459, 47,214,408,237,280,165,331,415,108,345,352,473,
     422,460,483,  0,177,525,233,346,223, 96,463,491,339,175,508, 79,471,479, 96,186,
     300,491,337,434,446,501, 87,388,189,175,110,415,242,185,166,483,231,487,328,399,
     122,462,117,509,117, 51, 69,209,148,176,128,461,431,236,339,110,389,142, 97,398,
     237,352,449,518,194,460,431,263,166,408, 20,135,515,265,179,505,366,124,229,477,
     175, 23,330,251,225,267,378,462,233,497,176,341,345,164,523,474,172, 54,490,481,
      87,172,451, 23,265,186,194,240, 83, 69,334,265,173,106,133,467,471,155,474,246,
     457,166,231,339,479,339,161,215,472, 61,449),
    TPYIndex_191_list(517,378,341,517,225, 18,434,468,475, 97,143,422,351,111, 68,477,  3,520,470, 84,
     510,155,515,172,295,151,168,348, 23,479,214,297,467,175,175,341, 40,507,264,229,
     225,172,523,213,389,322,219, 91,485, 58,247, 21, 13,242,459,212,240, 98,242,175,
     221, 25,341,  0,474, 42,460,175,457,139, 31,295,225, 64,351,317,246,523,243,526,
     477,186,422,510,221,457,473,464,319,464,252,471,507,459,483,477, 43, 46,184,254,
     483,484,458,280,  3,422,179,165,479, 65, 61,468,501,337, 30,351,242, 18,491,452,
     451,487,423,456,390,339, 40,249,229,328,263,474,369,175, 51, 47, 61,461,109,314,
     510,277,507,503,240,182,333,242,458,461,482,507,445,507,236,135, 81,229,445, 47,
     193,223,471,359,507,505,140,339,435,216,182,162,155,141,178,243,185,  4,467,108,
     136,117,186,518,417,236, 51,111, 91,341,502),
    TPYIndex_191_list(507,479,165,518, 25,422,364, 17,237,468,219, 42,501,501,182,  6, 85,186,233,291,
     258,249,402,388,388,258,472, 18,147, 18,388,341,192, 17,159,370,376,459,459,175,
     265,458,404, 90,498,280,500,322,458,236,139, 18,370,151,449,125,125,107, 51,460,
     141,265,384,  0,215,232,247,435,386,184,485,485, 42,351,235,422,387,215,472,452,
     472,483,167,483,452,460, 13,460,351,474,452,317,478,451,478,216,353,246, 56,232,
     143,175, 81,184, 62,393,278,498,231,221,172,332,184,350, 92, 56, 46,247, 40,184,
     468,257,479,505,110,418,416,462,124, 65,124,406, 23,364,510,462,179,342,339, 51,
     422,510,161,122,485,348,445,186,345,347,242,525,457,184,484,225,472,235, 25, 40,
     482,  6,268, 63,389,432,487,231,330, 70,172, 23,477,361, 98,136,194,242,507,477,
     505,161,229,474,395,507,352,242,503,292,450),
    TPYIndex_191_list(221,391,352,325,432,295,418,189,151,353, 55,449, 90,339,214,422,449,330,459,457,
     166, 42,328,422,164,418,452,446,147,189,391,166,418,164,224,463,477,507,478,473,
      90, 98,394,320,199,487,507,328, 47, 98,351, 81,236,507, 24, 97,399,415,106,141,
     483,187,345,  0,464, 57,456,458,388,394,337,505,459, 72,320,477, 94,245,478,184,
     505,242,394,459,478,510,473,362,458, 49,472,478,483, 81,451,295,515, 58,518, 62,
     242,235,451,175,342,173,172,172,191, 79,121,175,492,313,236, 26, 17,497,328,334,
     119,219,122,149,421,124,494,463,487,141,151,491,254,483, 43,291,339,394,475, 44,
     472,166, 26,147,141,468,214,  3,266,444,470,474,457,279, 16,395,213,477,507,518,
     121,179,505,220,350,172, 70,117, 42,172,457, 81,483,135,179,351,175,176,332,254,
     136,456,136,172,184,175,329,193,346,417,  8),
    TPYIndex_191_list(  4,178,339,472,166,487,456,422,172, 72,  6,457,478,372,359,235,443, 79,328,415,
     483,472,111,291,106,172, 72,478,507,240,457,229,229,353,507,477,347,341,164,135,
     524,161,488,483, 50,415,147,455,403,164,184,488,481,172,457,237,229,306,469,488,
     172,172,276,  0,116,457,271,111,318,487, 48,473,  4,456, 83, 71,161, 84,271, 46,
     498,236,339,509,159,500,478,510,444,236, 89,479,456,236,236,159,478,125, 25,254,
     271, 65,175,376,399, 43,242,337,351,331, 72,459, 54, 89,471,478,194,487,108, 48,
     177, 91, 85,482,484,143,485,455,364,165,180,368,420,133,516,276,474,341,240, 89,
     188,242,173,393,509,526,137,505,351,507,180,140, 89,472,211,372,145,329,505,261,
     444,246, 67,319,449,294,180,472,110,483,520, 87,175, 62,278,262,447, 98,399, 47,
     479,125,247, 23,427,507, 53,136,259,378,388),
    TPYIndex_191_list(250,250,487,237,259, 23,456,451,216,457,477, 70,427,483,240, 69,172,318,473,451,
     446,457,172,456,259,225,229,417,  3,110, 69,240,236,477,112,229, 13,151,151,151,
      24,348,432,505, 47,348,232,180,432,110,262, 13,432,166,475, 87, 40,341,361, 81,
      91,456,361,  0,347,298,478,372,276,447,522, 11,477,474,423, 18,178,159,319, 24,
     478,418,423,178,  4,154,133,340,435,479,415,433,468,206, 17,418,501,231,235,483,
     457,477,386,463,457, 21,372,184,412, 21, 21,399,135,136,161,110,172,221,483,320,
     254,500,180,291,237,477,473,451, 96,342,395,161,510,468,420,475,473,456,147,258,
      44,472,161,483,451, 92, 13,468, 20,443,237,251,389,487,477,483,108,415,459,186,
      64,408,423,467,457,229,161,181,161,110,395,408,459,507,351,161,117,526,261,507,
      59,505,433,339, 42,457,517,457,358,425,421),
    TPYIndex_191_list(328,216,219,498, 12,101,350,350,391,390,271,175, 81,312,423,418,462,317,125, 24,
     216,422,241,166,345,469,172,175,176, 42,418,161,459,341, 91,447,175,221,451,361,
     117,447,352,125,451,390,147, 43,216,365,487,391,451,125,117,423,135,487,124, 18,
     469,415, 91,  0,447, 91,117,182,459,462,459,172,488,224,322,479,479,487,322,  4,
     478,460,161,475, 87,348,214,460,405,147,467,477,467,136,411,214,339, 94,173,166,
     307,296,473,518,353,341,265,425,339, 94,254,258,123,483,483,418,469,263,172,122,
      71,162, 45, 96,471,517, 20,112,107,  3,229,240,498,439, 81,219,445,117,464,252,
     458,345,499, 89,280,125,455,339, 94, 15, 87, 46,509,178, 81,468, 20,503,142,377,
     348,351, 96, 79,176, 27,259, 25,191,507,117,117,467,262,208, 96,263, 70,394,484,
     477,415,518, 48,270,220,175, 81,417,471,291),
    TPYIndex_191_list(148,483,449,111, 96, 81, 83,317,334,236, 45,180,225,347,345, 98, 98,451,462,216,
     393,477,477,194, 94,483,333,225,433,173,440,166,214,173,246,435, 47,479,487,161,
     147,180,443,443,332,220,443,518,518, 56, 87,220,421,147,341,212,522,459,347,477,
     374,431, 98,  0, 98,472,452,472,483,513,472,459,463,477,484,377,432,432,176,214,
     225,223,330,512,251, 63,474,149,345,136,470,472,166,388,366,259, 23,415,328,369,
     412,214,254,194,266,330, 47,191,235,136, 87, 18,352,432,108,505,391,449,442,117,
     123,136,229,472,328,221,229,172,497,151,139,185,179,119,477,334,502,233,441, 54,
     388,258, 41,307, 26,420,184, 11,341,109,192,440,168,314,483,506,136,194,334, 26,
      25,485,271,421, 83,406,395,468,418, 18,291,328, 97,193,223,106,482, 47,173,280,
     475, 47, 84,478,189,510, 87, 88,162,352,144)
     );
BEGIN
  IF (p_Index>0) AND (p_Index<192) THEN
    RETURN v_list11(p_Index1)(p_Index);
  ELSE
    RETURN 0;
  END IF;
end get_py_index_11;


FUNCTION get_py_index_12(p_Index1 NUMBER, p_Index NUMBER)
RETURN NUMBER IS
  v_list12 TPYIndex_list := TPYIndex_list(
     TPYIndex_191_list(459,332,242,235,295,352,435,181,335,479,483,225,112, 88,137,117,458,500,319,372,
     117,420,234,172,468,461,184, 21,408,451,473,474,412,189,412,108,237,457,237,330,
     330,237, 21, 21, 21,233, 21,379,112,466,473,500,408,474,237,110,108,110,395, 30,
     172, 87,408,  0,445,500,516,361,483,473,395,478,108,108,416,478,510,477,526, 18,
     178,423, 13, 59,434,408, 13,395, 97,145,361,432,177,173, 24,474,439,386, 84,506,
     379, 49,422,  4,366,223,220,425,199,497,229,124, 98, 67,244,237,189,175,222,347,
     184,  1,342,306, 16, 73,194,215,136,168,320,185,421,518,346,189,408, 98, 40,412,
     164,  3,241,342,110,257,268,125,185,276,237,477,173, 23, 21,422,251,246,481,522,
     468, 81, 42,186,337,242, 96,221,337, 64,342, 79,168,517,477, 40, 21,508,393, 67,
     507, 18,518,268,399,247,172,117,222,194,361),
    TPYIndex_191_list( 59,460,473,185,106,224,457, 25,282, 98, 26,187, 90,413,483,457,474,215,143,395,
     175,515, 24,459, 26,475,421,110,501,451,139, 98,302,487,161,165,166,500,160,151,
     464,111,451,136, 40,411,422, 25,124,457,214,237,412,459,475,452,268,422,251, 18,
     483,466,179,  0,376,443,513,388, 48, 70,477,339,359, 47,451,460,500,111,145,259,
     472,268, 42,460,246,491,279, 87,445, 97,173,224,457, 90,187,143,136,505,172,379,
     292,117,358,141,177,149,457,334, 85,161,481,182,484, 13,505,136, 89,242,351, 48,
     408,106,507,137,466,243, 25,229,161,483,459,431,456,263,  4, 15, 57,161, 98, 59,
     257,456,474,175,479,503,237,233,177,182,483,161,242,139, 24, 87,178,229,388,229,
     482,122,194, 70,498,319,510,468,173,471,477,507,223,456, 67,459,386,510,110,136,
     451,483,483, 70,219,477,160, 67,241,173,378),
    TPYIndex_191_list(475, 25,111, 25,291, 18,334,441,147,110,175,  4,  3,459,487,111,332,463,249,483,
     333,341, 81,445,503, 48,470,510,507,320,463,363,372,487,452,507, 70,247,482, 25,
      13,211,445,477,351,337,351,181,334,502,484,322,509,184,510,301,184,328,522,173,
     236,505,499,  0,117,473,395, 18,445,445,408,237,249,329,423,507,364,427, 89,470,
     352,393,181,106,145, 25,510,478,246,509, 70,145,237,184,411,347,252, 48,268, 11,
     172,165, 21,246,479,499,240,478, 50, 11,220,477, 83,328, 83,351,477,411,457,349,
     516, 20,474,433, 90,194,483,470,184,483,477, 40,276,361,179,257,317, 71,340,125,
     198,231, 47,231,175, 21, 51,431, 18,184, 97, 68, 15, 13,247, 20,221, 48,503,342,
     366,317,399,467,187, 66,179,225,518, 44,408,168,223,422,313,241,176,300,268, 85,
      87, 70,236,297,143,214,  6,421,147,339,148),
    TPYIndex_191_list(232,147,441,468,443,187, 98, 47,464,408,242,515,509,391,329,215,423,220,520,194,
     339,339,472,110,378,472,125,474,456,329, 61,329,341,110,165,341,168,483,431,352,
     458,520,214,365,408,137,445,443,412,341, 47,507,237,322,427,457, 32, 91,472,484,
     521,461,388,  0,339,507,403,242,457,246,501,268,474, 30,330, 61,351, 18,507,483,
     467,162, 25,413,461,235,500, 96,237,445, 35, 83,461,434,472,246,500,178,151,479,
     194,147, 98,513,295,251,377,149,366,332,161,341,350,172, 41,166,125,259,117,328,
     369,459,149,178,133, 90,478, 48,147,136,194,229,482,357,498,350,236, 47,482,349,
     173,280,507,408,351,435,216,339,177,473,270,393,503,390,456,229, 51,117,342,348,
     339,457,483,110,143,143,477,328,433,352,449,222,259, 57,364,278,117,214,194,117,
     412,483,482,241,350, 20,270,347,  6,251,252),
    TPYIndex_191_list(180,477,475,503,332,509,472,492,247,427,460,172,403,184,457,164,229,330,363,478,
     330,464,347,520,413,214,403,451,451,451,483,122,477,192, 13, 15,499,431,461,210,
     443,128,329,483,415,334,461,318,186, 67,268,233,241,461,492,431, 23,212,242,124,
     345,193,345,  0,223,378,215,431,109,466,357, 70,215, 23,107,328,107,431, 13, 18,
     365,117,106,364,351,133,485,322,511,390,417,431,229, 23,431,322,411,249,484,457,
      48,422,318,395,165, 32,330,422,457,460,508,501,401,254,322,166,317,388,168,259,
      42,231,264,229, 91,351,116,479,348,458,395,510,483,172, 91,172,175,502,518,161,
     349,334, 68,394,494,135,229,408,433,173, 20, 48,208, 18,459,472,352,506,187,395,
     123,314,390,461,348,494,346,510,371,341,445, 18, 70,206,484,461,505,214,165,160,
     135,110,229, 18, 48,413,264, 90,242, 92,141),
    TPYIndex_191_list(506,520,405,175, 97,161,219,339,231,505,322,249,376,251,251,383,467,234,341,341,
     279,216,297, 23,358, 90, 90,280,460,457, 90,147, 90, 90,182,483,483,472,229,463,
     141,520,237,462,389,257,339,339,119,467,483,443,339,232,122,330, 18,339,467, 50,
     472,500,483,  0, 72,361,178,  7,159,445, 84,172,483,162,346,417,148,444,268,178,
     393, 11,484,328,247,452,161,242,488,109,111,276,482,329,268,151,458, 83,491, 79,
      25,220,509,483,483, 49,457,295,307, 54,388,477, 18,508, 11,109,125,242,510,494,
     457,390,451,259,398, 32, 49,259,347,294,173,350,386, 18, 81,342,417,178,422,457,
     459,261,  7,229,433,457, 59, 30,235,520,376,160,491, 59,467,365,350,176,127,172,
     477,236,457,510,110,175,329,151,477,261,507,339,339,474, 72,117,351,182,346,234,
     518,491,278,503,176, 48, 87,122,509,477,136),
    TPYIndex_191_list(462,147,328,236,445, 25,350,333,117, 18,172,451,351, 84, 25,482,142,328,292,506,
     420,319,117,498,184,136,395, 89, 69,418,340,399,160,505,106,  4,451,502,510,478,
     234,246,439,477,477, 24,451,177,209,462,459,125,166,223,117,193,466, 97,187,431,
     262,390,498,  0,417,347,483,282,503,142,128,413,456,350,393,337,164,433,229,386,
     386,193,259, 47,229,521,457,481,393,518,339,506,460,282, 57,172, 84,526,445,459,
     266,507,472,387, 47,441,225,215,320,161,431,467,145,422,223, 26,177,457,184,229,
     470,395, 67, 96,349,469, 63, 22, 13,418,175,117,342,507,117,388,229,445,173, 25,
     420,214,345, 18,459,459,172,177,232,172, 58,163, 48,507, 83, 25,507,175, 85, 53,
     508,184, 97, 67,329,365,295,317,339, 51,186,337,108, 63,510,235, 42,234,523,462,
     507, 84,268,466,268,328,161,186,389,136,524),
    TPYIndex_191_list(346,136,509, 89,220,110,291,477,215,242,182, 43,180,245,236,521,229,259,520,507,
     292,161,483, 81,395,393,164,431,160,506,510,219,520,495, 20, 20,164,352,495,451,
     451,483, 57,365,498,165,231,472,350,350,175, 18, 98,473,117,457,459,458,451,161,
     395,371,468,  0,452,341,149,456,318,378,237,249,395,395,215,518,427,418,474,125,
     481,341,339,452,371,393,231,  6,224,166,265,172,433,351,175,393,251,133,413,507,
     518,348,232,483,229,452,435,172,320,110,386,478,  3,459,250, 46,184, 13,433,518,
     478,483, 58,455,265,484,445,515,416,187,184,246,351, 50,349,243,456,491,270,  6,
     237, 15,463,482,109,  7,333,292,242,413,117,160,420,141,178,451,106,172,177,460,
     470,128,229,231,175,395,433,142,386,164,172,348,236,521,110,215, 43,136,291,292,
      84,395,518,111, 85, 98,350,117,165, 20,378),
    TPYIndex_191_list(457,350, 21,172,172,510,176,466,513,481,501,192,469, 22,483,351,460, 25,177,470,
     413,165,525,445,388,108,186,235,470,263,457,497,460,111,139,160,211,495,378,500,
     122,141,479,229, 43,225,399,  3,366,172,483,161,399,229,234,246,264,505,460, 98,
     242,139,229,  0,459, 72,172,444,  7,151,482,498, 25,328,193,439,495,160,211,498,
     187,481,339,393, 18, 43,431,452,451,352,176,318,341,451,457,161,122,  6,339,418,
     139,474,224, 21,469,251,265,481,141,388,525,229, 68,473, 68,345,251,175,184,365,
     135, 15,178,440,209,136, 81,160,125,194, 18,241,340,212, 23, 91,257,  7,472,232,
     461,450, 48,460,472,434,423,481, 19,215,254,357,433,172,518,466,352,182, 23,164,
     234,256,166,261,172,187,510,261,339,  6,391,235, 69, 51,482,458,477,351, 91,229,
     348, 30,  4,111,482,456,472,457,350,147,498),
    TPYIndex_191_list(500,139,353,477,117,229,507, 26,472,117,502,172,112,366,472,395,112,266, 13,484,
     507,161,347,141,111,452,500,395,483,116,474,186,186,328,164,505, 13,472,471,506,
     109,112,452,313, 69,125,366,236,264,117,445,452,229, 20,507,125,484, 59,351,461,
      48, 70,184,  0,474,136,508,483,473,483,471,434,483,432,479, 94,456,106,137,  3,
     507,472,155,461,173,234,510,473,477,159,242,366,270,125,361,461,466,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0)
     );
BEGIN
  IF (p_Index>0) AND (p_Index<192) THEN
    RETURN v_list12(p_Index1)(p_Index);
  ELSE
    RETURN 0;
  END IF;
end get_py_index_12;


FUNCTION get_py_index_13(p_Index1 NUMBER, p_Index NUMBER)
RETURN NUMBER IS
  v_list13 TPYIndex_list := TPYIndex_list(
     TPYIndex_191_list(509, 48,246,155,292, 98,243,173,172,441,185,445,337,456,185,483, 25,187,187, 18,
     457,187,184,441,180,431, 98, 98,213,161,456,393,220,177,317,242,328,399,117,471,
     517,322,350,341, 15, 84,242,353,175,184,441,471,484,339,229,475,515,206, 97,215,
     394,339,180,  0,477,477,348,518,220, 89,339,442,128,184,351,477,525,172,399,446,
      48,263,365,471,350,431,161,431, 98,178,254,117, 57,441,472,151,484,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(329,215,257,161,479,507,456,184, 89,342,109,161,479,484,459,453,395,151, 51,422,
     458,371,237,172,161,341,470,147, 59, 59,477,474,472,172,229,432,208,431,431,477,
     441,249,461,124,432, 46,172,442,503,  6,474,477,313, 48,507,237,481,247, 18,403,
     517,483,456,  0,186,478,431,408,177,477,162, 18,479,413,165,108,177,233,472,124,
     182,459,459,441,250,525,483,479,242,442,459,469,477,328,510,246,457,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(477,172,494,483,500,475,473,328,297,161,261,479,259, 81,485,483,225, 26,242,151,
     240,403,485,479,352,351,229,243,395,342,461,236,469,155,509,456,215,341,128,484,
     413,151,350,477,453,237,172,477,477,164,500,259,403,242,179,236,175,459, 67,175,
     175,472,482,  0, 63,319, 63,319,510,175,261,483,237, 46,354,235,291,182,354,180,
     408,460,472,173,261,229,501,180,339,236,472, 63,250,151, 44,117,262,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(262,117,319,351,351,270,117,472,220,262, 48,112,351,262,268,268,521,304,111,165,
     179,140,432,440,162,213,159, 48,152,477, 70,457,444,268,341,500,472,257,472,485,
     422,472,472,472,505,505,516, 30,477,257,500,472, 91,242,111,265,484, 63,351,502,
     447,510,507,  0,259,  6, 22,445, 18,502,261,505,518,136, 89,111,484, 43,124,339,
     484,422,427,399,110,452,110, 84,445,508,351,394,395,395,435,457,180,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(167,457,472,441,408,459,225,474,456,456,209,462,151,466,453,498,299,279,518,499,
     172,518,172,172, 48, 46, 46,151,471,478,462, 13,494,462,518, 48,472,498,433,236,
     236, 51,352,462,478,295,182,474, 58,487,483, 51,477,291,498,521,351,487,472,483,
      98,455,477,  0, 67,521, 83, 51,179,471,151,478,252,318,455,318,472,252,240,133,
     194, 68,236, 68,350,350, 22, 56,151,186,462,485,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0),
    TPYIndex_191_list(  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
       0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0)
     );
BEGIN
  IF (p_Index>0) AND (p_Index<192) THEN
    RETURN v_list13(p_Index1)(p_Index);
  ELSE
    RETURN 0;
  END IF;
end get_py_index_13;


FUNCTION GetHzFullPY(p_String varchar2)
 RETURN VARCHAR2 IS
--declare
 --p_String varchar2(200) := '???????';
 v_char varchar2(2);  --????
 n_loop number;    --??
 n_len number;     --????
 n_ascii number;   --??ASCII?
 n_ord_high number; --n_ascii/156
 n_ord_low number;  --n mod 256
 n_temp number;
 n_temp1 number;
 v_PY varchar2(32767);

BEGIN
  v_PY := '';
  n_len := length(p_String);
  FOR n_loop IN 1..n_len LOOP
    v_char := substr(p_string,n_loop,1);
    IF upper(v_char) IN (
        'A','B','C','D','E','F','G',
        'H','I','J','K','L','M','N',
        'O','P','Q','R','S','T',
        'U','V','W','X','Y','Z',
        '0','1','2','3','4','5','6','7','8','9',
        '(', ')', '[', ']','.', '!', '@', '#', '$',
        '%', '^', '&', '*', '-', '+','<', '>', '?', ':', '"')  THEN
      v_PY := v_PY||v_char;
    ELSE
        n_ascii := ascii(v_char);
        n_ord_high := trunc(n_ascii/256,0);
        n_ord_low := n_ascii-(n_ord_high*256);
        --DBMS_OUTPUT.PUT_LINE('n_ascii = '||to_char(n_ascii,'9999999'));
        --DBMS_OUTPUT.PUT_LINE('n_ord_high = '||to_char(n_ord_high,'9999999'));
        --DBMS_OUTPUT.PUT_LINE('n_ord_low = '||to_char(n_ord_low,'9999999'));
        IF (n_ord_high>128) and (n_ord_low>63) THEN
          CASE n_ord_high
            WHEN 162 THEN     --????
              IF n_ord_low>160 THEN
                v_PY := v_PY||get_roma_num_py(n_ord_low-160);
              END IF;
            WHEN 163 THEN     --??ASCII
              IF n_ord_low>128 THEN
                v_char := chr(n_ord_low-128);
                IF upper(v_char) IN (
                   'A','B','C','D','E','F','G',
                   'H','I','J','K','L','M','N',
                   'O','P','Q','R','S','T',
                   'U','V','W','X','Y','Z',
                   '0','1','2','3','4','5','6','7','8','9',
                   '(', ')', '[', ']') THEN
                  v_PY := v_PY||v_char;
                END IF;
              END IF;
            WHEN 166 THEN     --????
              IF (n_ord_low>160) AND (n_ord_low<185) THEN --A1--B8
                v_PY := v_PY||get_greece_alphabet_py(n_ord_low-160);
              ELSE
                IF (n_ord_low>192) AND (n_ord_low<217) THEN --C1--D8
                  v_PY := v_PY||get_greece_alphabet_py(n_ord_low-192);
                END IF;
              END IF;
            ELSE
            BEGIN
              n_temp := n_ord_high-128;
              n_ord_low := n_ord_low-63;
              n_temp1 := trunc(n_temp/10,0);
              n_temp1 := n_temp-n_temp1*10;
              IF n_temp1=0 THEN
                n_temp1 := 10;
              END IF;
              --DBMS_OUTPUT.PUT_LINE('n_temp = '||to_char(n_temp,'9999999'));
              --DBMS_OUTPUT.PUT_LINE('n_temp1 = '||to_char(n_temp1,'9999999'));
              CASE
              WHEN n_temp<11 THEN
                n_temp1 := get_py_index_01(n_temp1,n_ord_low);
              WHEN n_temp<21 THEN
                n_temp1 := get_py_index_02(n_temp1,n_ord_low);
              WHEN n_temp<31 THEN
                n_temp1 := get_py_index_03(n_temp1,n_ord_low);
              WHEN n_temp<41 THEN
                n_temp1 := get_py_index_04(n_temp1,n_ord_low);
              WHEN n_temp<51 THEN
                n_temp1 := get_py_index_05(n_temp1,n_ord_low);
              WHEN n_temp<61 THEN
                n_temp1 := get_py_index_06(n_temp1,n_ord_low);
              WHEN n_temp<71 THEN
                n_temp1 := get_py_index_07(n_temp1,n_ord_low);
              WHEN n_temp<81 THEN
                n_temp1 := get_py_index_08(n_temp1,n_ord_low);
              WHEN n_temp<91 THEN
                n_temp1 := get_py_index_09(n_temp1,n_ord_low);
              WHEN n_temp<101 THEN
                n_temp1 := get_py_index_10(n_temp1,n_ord_low);
              WHEN n_temp<111 THEN
                n_temp1 := get_py_index_11(n_temp1,n_ord_low);
              WHEN n_temp<121 THEN
                n_temp1 := get_py_index_12(n_temp1,n_ord_low);
              WHEN n_temp<121 THEN
                n_temp1 := get_py_index_13(n_temp1,n_ord_low);
              ELSE
                n_temp1 := 0;
              END CASE;
              v_PY := v_PY||GetHzPY_by_index(n_temp1);
            END;
          END CASE;
        END IF;
    END IF;
  END LOOP;
  RETURN v_PY;
  --DBMS_OUTPUT.PUT_LINE(v_PY);
END;


 FUNCTION GetHzPYCAP(p_String varchar2) RETURN VARCHAR2 IS
--declare
 --p_String varchar2(200) := '???????';
 v_char varchar2(2);  --????
 n_loop number;    --??
 n_len number;     --????
 n_ascii number;   --??ASCII?
 n_ord_high number; --n_ascii/156
 n_ord_low number;  --n mod 256
 n_temp number;
 n_temp1 number;
 v_PY varchar2(32767);

BEGIN
  v_PY := '';
  n_len := length(p_String);
  FOR n_loop IN 1..n_len LOOP
    v_char := substr(p_string,n_loop,1);
    IF upper(v_char) IN (
        'A','B','C','D','E','F','G',
        'H','I','J','K','L','M','N',
        'O','P','Q','R','S','T',
        'U','V','W','X','Y','Z',
        '0','1','2','3','4','5','6','7','8','9',
        '(', ')', '[', ']','.', '!', '@', '#', '$',
        '%', '^', '&', '*', '-', '+','<', '>', '?', ':', '"')  THEN
      v_PY := v_PY||v_char;
    ELSE
        n_ascii := ascii(v_char);
        n_ord_high := trunc(n_ascii/256,0);
        n_ord_low := n_ascii-(n_ord_high*256);
        --DBMS_OUTPUT.PUT_LINE('n_ascii = '||to_char(n_ascii,'9999999'));
        --DBMS_OUTPUT.PUT_LINE('n_ord_high = '||to_char(n_ord_high,'9999999'));
        --DBMS_OUTPUT.PUT_LINE('n_ord_low = '||to_char(n_ord_low,'9999999'));
        IF (n_ord_high>128) and (n_ord_low>63) THEN
          CASE n_ord_high
            WHEN 162 THEN     --????
              IF n_ord_low>160 THEN
                v_PY := v_PY||get_roma_num_py(n_ord_low-160);
              END IF;
            WHEN 163 THEN     --??ASCII
              IF n_ord_low>128 THEN
                v_char := chr(n_ord_low-128);
                IF upper(v_char) IN (
                   'A','B','C','D','E','F','G',
                   'H','I','J','K','L','M','N',
                   'O','P','Q','R','S','T',
                   'U','V','W','X','Y','Z',
                   '0','1','2','3','4','5','6','7','8','9',
                   '(', ')', '[', ']') THEN
                  v_PY := v_PY||v_char;
                END IF;
              END IF;
            WHEN 166 THEN     --????
              IF (n_ord_low>160) AND (n_ord_low<185) THEN --A1--B8
                v_PY := v_PY||get_greece_alphabet_py(n_ord_low-160);
              ELSE
                IF (n_ord_low>192) AND (n_ord_low<217) THEN --C1--D8
                  v_PY := v_PY||get_greece_alphabet_py(n_ord_low-192);
                END IF;
              END IF;
            ELSE
            BEGIN
              n_temp := n_ord_high-128;
              n_ord_low := n_ord_low-63;
              n_temp1 := trunc(n_temp/10,0);
              n_temp1 := n_temp-n_temp1*10;
              IF n_temp1=0 THEN
                n_temp1 := 10;
              END IF;
              --DBMS_OUTPUT.PUT_LINE('n_temp = '||to_char(n_temp,'9999999'));
              --DBMS_OUTPUT.PUT_LINE('n_temp1 = '||to_char(n_temp1,'9999999'));
              CASE
              WHEN n_temp<11 THEN
                n_temp1 := get_py_index_01(n_temp1,n_ord_low);
              WHEN n_temp<21 THEN
                n_temp1 := get_py_index_02(n_temp1,n_ord_low);
              WHEN n_temp<31 THEN
                n_temp1 := get_py_index_03(n_temp1,n_ord_low);
              WHEN n_temp<41 THEN
                n_temp1 := get_py_index_04(n_temp1,n_ord_low);
              WHEN n_temp<51 THEN
                n_temp1 := get_py_index_05(n_temp1,n_ord_low);
              WHEN n_temp<61 THEN
                n_temp1 := get_py_index_06(n_temp1,n_ord_low);
              WHEN n_temp<71 THEN
                n_temp1 := get_py_index_07(n_temp1,n_ord_low);
              WHEN n_temp<81 THEN
                n_temp1 := get_py_index_08(n_temp1,n_ord_low);
              WHEN n_temp<91 THEN
                n_temp1 := get_py_index_09(n_temp1,n_ord_low);
              WHEN n_temp<101 THEN
                n_temp1 := get_py_index_10(n_temp1,n_ord_low);
              WHEN n_temp<111 THEN
                n_temp1 := get_py_index_11(n_temp1,n_ord_low);
              WHEN n_temp<121 THEN
                n_temp1 := get_py_index_12(n_temp1,n_ord_low);
              WHEN n_temp<121 THEN
                n_temp1 := get_py_index_13(n_temp1,n_ord_low);
              ELSE
                n_temp1 := 0;
              END CASE;
              v_PY := v_PY||substr(GetHzPY_by_index(n_temp1),1,1);
            END;
          END CASE;
        END IF;
    END IF;
  END LOOP;
  RETURN v_PY;
  --DBMS_OUTPUT.PUT_LINE(v_PY);
END GetHzPYCAP;

end GetHZPY;
/

prompt
prompt Creating package body GET_AR_SUMMARY
prompt ====================================
prompt
create or replace package body dukepu.get_AR_Summary is

   function get_nums_of_staffs(v_attendance_machine_NO int,v_year_month_str varchar2) return int is
            v_count int;
   begin
         select count(distinct job_number)  INTO v_count
      from attendance_record ar
      where substr(ar.job_number,1,1) = v_attendance_machine_NO
      and trunc(ar.fingerprint_date,'MM') = to_date(v_year_month_str,'yyyy-MM');

      return v_count;
   end;


  function get_nums_of_ar_days(v_attendance_machine_NO int,v_year_month_str varchar2) return int is
       v_count int;
  begin
       select count(distinct fingerprint_date) INTO v_count
      from attendance_record ar
      where substr(ar.job_number,1,1) = v_attendance_machine_NO
      and trunc(ar.fingerprint_date,'MM') = to_date(v_year_month_str,'yyyy-MM');

      return v_count;
  end;

  function get_machines_no(v_year_month_str varchar2) return t_cur is
           v_cur t_cur;
  begin
       open v_cur
       for  select distinct substr(job_number,1,1) machine_no
        from Attendance_Record AR
        where trunc(ar.fingerprint_date,'MM') = to_date(v_year_month_str,'yyyy-MM')
        order by machine_no asc;
        return v_cur;
  end;


  -- Private type declarations
  -- Function and procedure implementations
  function get_Statff_Info(v_attendance_machine_NO int,v_year_month_str varchar2) return t_cur is
           v_cur t_cur;
  begin

         open v_cur
         for
         select distinct substr(job_number,10,3) AS job_number,
          name,
          dept
        from Attendance_record
        where substr(job_number,1,1) = v_attendance_machine_NO
        and trunc(fingerprint_date,'MM') = to_date(v_year_month_str,'yyyy-MM')
        order by job_number asc;

        return v_cur;
  end;


  function get_AR_Of_Each_Staff(v_attendance_machine_no int,v_year_month_str varchar2) return t_cur is
           v_cur t_cur;
  begin

       OPEN v_cur
       FOR
           SELECT SUBSTR(job_number,10,3) last_three_digits_Of_jn,
           name,
           dept,
           to_char(fpt_first_time,'HH24:MI') || '   ' || to_char(fpt_last_time,'HH24:MI') ar_time
            FROM Attendance_Record AR
            WHERE substr(AR.Job_Number,1,1) = v_attendance_machine_no
            AND TRUNC(AR.Fingerprint_Date,'MM') = to_date(v_year_month_str,'yyyy-MM')
            ORDER BY JOB_NUMBER ASC;

        return v_cur;
  end;

  function Get_AR_Summary(v_attendance_machine_no int,v_year_month_str varchar2) return t_cur
  is
     v_cur t_cur;
     PRAGMA AUTONOMOUS_TRANSACTION;
     v_sw_am_on_duty_time varchar2(20):= '08:00';
     v_ne_am_on_duty_time varchar2(20):= '08:30';
     v_am_on_duty_time varchar2(20);
  begin

       /*
        job_number
       name,
        dept,
        actual_attendance_days,
        not_brush_fingerprint,
        come_late_num,
        leave_early_num,
        delay_time,
        meal_subsidy

        ---先 删除 AR_Summary
        DELETE FROM AR_Summary;
        if(v_attendance_machine_no = 4) then
            v_am_on_duty_time:=v_ne_am_on_duty_time;
        else
            v_am_on_duty_time:=v_sw_am_on_duty_time;
        end if;

          ---先 计算  实际 出勤 天数 ，并储存数据。
        insert into AR_Summary(
                               AR_JOB_NUMBER,
                                name,
                                dept,
                                DAYS_OF_REAL_ATTENDANCE,
                                not_finger_print,
                                Come_Late_Num,
                                leave_early_num)
        select job_number,
         name,
         dept,
         sum(case when fpt_first_time is not null or fpt_last_time is not null then 1
                  else 0 end) actual_attendance_days,
         sum(case when (fpt_first_time is null and fpt_last_time is not null)
                  or (fpt_first_time is not null and fpt_last_time is null) then 1 else 0 end) not_brush_fingerprint,
         sum(case when (fpt_first_time is not null and to_char(fpt_first_time,'HH24:MI') <=v_am_on_duty_time) then 0  when fpt_first_time is null then 0 else 1 end) come_late_num,
         sum(case when (fpt_last_time is not null and to_char(fpt_last_time,'HH24:MI')>='17:00') then 0 when fpt_last_time is null then 0 else 1 end) leave_early_num
        from Attendance_Record AR
        where substr(job_number,1,1) = v_attendance_machine_no
        and trunc(fingerprint_date,'MM') = to_date(v_year_month_str,'yyyy-MM')
        group by job_number,name,dept
        order by job_number asc;



        ---延迟 时间
        ---统计 非休息日的 加班时间
        UPDATE Attendance_Record
        SET DELAY_TIME = floor((fpt_last_time -to_date(to_char(fingerprint_date,'yyyy-MM-dd')||' 17:00:00','yyyy-MM-dd HH24:MI:SS'))*24*60/30) *0.5
        WHERE substr(job_number,1,1) = v_attendance_machine_no
        and fpt_last_time is not null
        and fpt_last_time >to_date(to_char(fingerprint_date,'yyyy-MM-dd')||' 17:30:00','yyyy-MM-dd HH24:MI:SS')
        and trunc(fingerprint_date,'MM') = to_date(v_year_month_str,'yyyy-MM')
        and fingerprint_date not in (
            select rest_day
            from rest_day
        );

        --统计 休息日的加班时间
        UPDATE Attendance_Record
        SET DELAY_TIME = DELAY_TIME + floor((fpt_last_time -fpt_first_time)*24*60/30) *0.5
        WHERE substr(job_number,1,1) = v_attendance_machine_no
        and fpt_first_time is not null
        and fpt_last_time is not null
        and trunc(fingerprint_date,'MM') = to_date(v_year_month_str,'yyyy-MM')
        and fingerprint_date  in (
            select rest_day
            from rest_day
        );

        --统计 休息日的加班时间 如果早上未刷卡，则从下午13:00:00计算。
        UPDATE Attendance_Record
        SET DELAY_TIME = DELAY_TIME + floor((fpt_last_time -to_date(to_char(fingerprint_date,'yyyy-MM-dd')||' 13:00:00','yyyy-MM-dd HH24:MI:SS'))*24*60/30) *0.5
        WHERE substr(job_number,1,1) = v_attendance_machine_no
        and fpt_first_time is not null
        and fpt_last_time is not null
        and trunc(fingerprint_date,'MM') = to_date(v_year_month_str,'yyyy-MM')
        and fingerprint_date  in (
            select rest_day
            from rest_day
        );

        --计算餐补。
        UPDATE Attendance_Record
        SET MEAL_SUBSIDY = 1
        WHERE substr(job_number,1,1) = v_attendance_machine_no
        and fpt_first_time is not null
        and fpt_last_time is not null
        and trunc(fingerprint_date,'MM') = to_date(v_year_month_str,'yyyy-MM')
        and fpt_first_time <= TO_DATE(TO_CHAR(fingerprint_date,'yyyy-MM-dd')||' 12:50:00','yyyy-MM-dd HH24:MI:SS')
        and fpt_last_time >= TO_DATE(TO_CHAR(fingerprint_date,'yyyy-MM-dd')||' 13:30:00','yyyy-MM-dd HH24:MI:SS')
        and (fpt_last_time - fpt_first_time) * 24 >4;


        --更新AR_Summary中的 Delay_Time
        UPDATE AR_Summary
        SET Delay_time = (SELECT SUM(DELAY_TIME) FROM Attendance_Record AR WHERE AR.JOB_NUMBER =  AR_Summary.job_number)
        WHERE EXISTS(
              SELECT 1
              FROM Attendance_Record AR
              WHERE AR.JOB_NUMBER =  AR_Summary.job_number
        );

        ---更新AR_Summary中的meal_subsidy
        UPDATE AR_Summary
        SET meal_subsidy  = (SELECT SUM(meal_subsidy) FROM Attendance_Record AR WHERE AR.JOB_NUMBER = AR_SUMMARY.JOB_NUMBER)
        WHERE EXISTS(
              SELECT 1
              FROM Attendance_Record AR
              WHERE AR.JOB_NUMBER =  AR_Summary.job_number
        );

        commit;
        */
        open v_cur
        for
        select
                AR_JOB_NUMBER,
                name,
                dept,
                DAYS_OF_REAL_ATTENDANCE,
                NOT_FINGER_PRINT,
                come_late_num,
                leave_early_num,
                OVERTIME_WORKDAY_ONE_MONTH
         from AR_Summary
         order by AR_JOB_NUMBER asc
        ;
        return v_cur;
  end Get_AR_Summary;
end get_AR_Summary;
/

prompt
prompt Creating package body IMPORT_PRODUCTS_COST
prompt ==========================================
prompt
create or replace package body dukepu.Import_Products_Cost is


  -- Function and procedure implementations
  function ifExists(v_PN nvarchar2) return int is
           v_Count INT;
  begin
        select Count(1) INTO v_Count
        FROM Products_Cost
        WHERE products_name = v_PN;

        IF(v_Count=0)
        THEN
             RETURN 0;
        END IF;

        ---保存 至History.
        INSERT  INTO Products_COST_HISTORY(
                                  seq,
                                  summary_process,
                                  specific_process,
                                  man_hours,
                                  labour_cost,
                                  supplier,
                                  insert_time,
                                  products_name
        )
        SELECT seq_products_cost_history.nextval,
                summary_process,
                specific_process,
                man_hours,
                labour_cost,
                supplier,
                SYSDATE,
                products_name
        FROM Products_COST;


        --删除 Products_Cost中 的 成品名
        DELETE
        FROM Products_Cost
        WHERE Products_Name = v_PN;

        return 1;
  end;

  function add(v_summary_process nvarchar2,
                v_specific_process nvarchar2,
                v_man_hours number,
                v_labour_cost number,
                v_supplier nvarchar2,
                v_products_name nvarchar2) return int is
  begin
       INSERT INTO Products_Cost(
              SEQ,
              summary_process,
              specific_process,
              man_hours,
              labour_cost,
              supplier,
              products_name
       )
       VALUES(
              Seq_Products_Cost.Nextval,
              v_summary_process ,
                v_specific_process,
                v_man_hours ,
                v_labour_cost ,
                v_supplier ,
                v_products_name
       );
       return 1;
  end;
end Import_Products_Cost;
/

prompt
prompt Creating package body ORA_ASPNET_PROF_PKG
prompt =========================================
prompt
CREATE OR REPLACE PACKAGE BODY DUKEPU.ora_aspnet_Prof_pkg wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
b
9200000
1
4
0
3
2 :e:
1PACKAGE:
1BODY:
1ORA_ASPNET_PROF_PKG:
0

0
0
f
2
0 :2 a0 97 b1 b7 a4 11 a0
b1 56 4f 1d 17 b5
f
2
0 3 7 b 15 17 19 1d
29 2d 2f 32 34 35 3e
f
2
0 1 9 e :4 0 5 :6 1
f
4
0 :3 1 :4 0 2
:6 1
40
4
:3 0 1 :3 0 2
:3 0 3 :6 0 1
:3 0 7 0 7
:3 0 7 9 5
6 :6 0 a :2 0
3 :5 0 3 7
d :3 0 c a
e :8 0
3
4
:3 0
1
4
0
d
0
1
14
1
1
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
3 0 1
0
/

prompt
prompt Creating package body ORA_ASPNET_ROLES_PKG
prompt ==========================================
prompt
create or replace package body dukepu.ORA_ASPNET_ROLES_PKG wrapped
0
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
3
b
9200000
1
4
0
3
2 :e:
1PACKAGE:
1BODY:
1ORA_ASPNET_ROLES_PKG:
0

0
0
f
2
0 :2 a0 97 b1 b7 a4 11 a0
b1 56 4f 1d 17 b5
f
2
0 3 7 b 15 17 19 1d
29 2d 2f 32 34 35 3e
f
2
0 1 9 e :4 0 5 :6 1
f
4
0 :3 1 :4 0 4
:6 1
40
4
:3 0 1 :3 0 2
:3 0 3 :6 0 1
:3 0 7 0 7
:3 0 7 9 5
6 :6 0 a :2 0
3 :5 0 3 7
d :3 0 c a
e :8 0
3
4
:3 0
1
4
0
d
0
1
14
1
1
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0
3 0 1
0
/

prompt
prompt Creating package body PKG_ANALYZE_AR
prompt ====================================
prompt
create or replace package body dukepu.PKG_Analyze_AR is

  -- Private type declarations
  function get_Same_PY_Of_Staffs return t_cur
  as
    v_count int;
    v_cur t_cur;
    v_name       nvarchar2(20);

    PRAGMA AUTONOMOUS_TRANSACTION;
  begin

       DELETE FROM AR_SAME_PINYIN;

       open v_cur
       for
       select distinct name
       from AR_Temp;

       LOOP
           <<NEXT>>
           FETCH v_cur INTO v_name;
           EXIT WHEN v_cur%Notfound;

           --先判断AR_Same_PinYin中是否有该用户
           SELECT COUNT(1) INTO v_Count
           FROM AR_Same_PINYIN
           WHERE name = v_name;

           IF(v_count!=0) THEN
               GOTO NEXT;

           END IF;

           dbms_output.put_line('v_name =' || v_name);

           SELECT COUNT(1) INTO v_Count
           FROM AR_Temp
           WHERE name != v_name
           AND gethzpy.GetHzFullPY(name) = gethzpy.GetHzFullPY(v_name);

           --拼音相同，但汉字不同！
           IF(v_count >=1) THEN
              --INSERT
              INSERT INTO AR_Same_PINYIN(
                     job_number,
                      name,
                      attendance_machine_flag,
                      row_index,
                      record_time
              )
              SELECT job_number,
                      name,
                      attendance_machine_flag,
                      row_index,
                      record_time
              FROM AR_TEMP
              WHERE gethzpy.GetHzFullPY(name) = gethzpy.GetHzFullPY(v_name);

           END IF;

       END LOOP;
       CLOSE v_cur;

       OPEN v_cur
       FOR
       SELECT job_number,
            name,
            attendance_machine_flag,
            row_index,
            record_time
       FROM AR_Same_PINYIN;
       RETURN v_cur;
  end;
end PKG_Analyze_AR;
/

prompt
prompt Creating package body PKG_ANALYZE_PRODUCTS_COST
prompt ===============================================
prompt
create or replace package body dukepu.PKG_Analyze_Products_Cost is
       procedure analyze_P_C(v_product_name varchar2)
       as

       begin
               --先清空.
              update Products_Cost
              set amount = null,
                  specific_each_process =null,
                  each_cost = null,
                  final_labour_cost = null
              where product_name = v_product_name;


              update Products_Cost
              set amount = substr(specific_process,instr(specific_process,'*')+1,1),
                  specific_each_process = replace(specific_process,substr(specific_process,instr(specific_process,'*')+1,1),'1'),
                  each_cost = round(labour_cost/substr(specific_process,instr(specific_process,'*')+1,1),4)
              where product_name = v_product_name
              and (length(specific_process) - length(replace(specific_process,'*')) =1)
              and  substr(specific_process,instr(specific_process,'*')+1,1) >1;


              update Products_Cost
              set
                  specific_each_process = specific_process,
                  final_labour_cost = labour_cost
              where product_name = v_product_name
              and(
                    instr(specific_process,'*1') >0
                    or instr(specific_process,'*')= 0
                    or length(specific_process) - length(replace(specific_process,'*')) >1
              );

       end;
end PKG_Analyze_Products_Cost;
/

prompt
prompt Creating package body PKG_AR
prompt ============================
prompt
create or replace package body dukepu.PKG_AR is

       procedure     get_ar_By_RandomStr(v_Random_Str varchar2,v_cur_ar out cur_t) as
       begin
            
           
                     
            OPEN v_cur_ar FOR
            select '暂时不使用！',
                   v_Random_Str
            
            from dual;
            /*
            SELECT
                          start_date AS "起始日期",
                          end_date AS "终止日期",
                          tabulation_time AS "制表日期",
                          fingerprint_date AS "指纹日期",
                          dept AS "部门",
                          SUBSTR(job_number,10,3) AS "工号",
                          name AS "姓名",
                          SUBSTR(TO_CHAR(fpt_first_time,'yyyy-MM-dd HH24:MI:SS'),12,5) AS "上班时间点",
                          SUBSTR(TO_CHAR(fpt_last_time,'yyyy-MM-dd HH24:MI:SS'),12,5) AS "下班时间点",
                          file_path As "文件路径",
                          to_char(record_time,'yyyy-MM-dd HH24:MI:SS') AS "记录时间",
                          random_str  AS "随机字符串"
            FROM Attendance_Record
            WHERE Random_Str= v_Random_Str
            OrDER bY
                      JOB_NUMBER ASC,
                      fingerprint_date ASC;
                      */

       end;
       
       
       function     get_ar_By_Random_Str(v_Random_Str varchar2) return cur_t
       as
         v_cur_ar cur_t;
       begin
            OPEN v_cur_ar FOR
             select '暂时不使用！',
                    v_Random_Str
            from dual;
            /*
            SELECT
                          start_date AS "起始日期",
                          end_date AS "终止日期",
                          tabulation_time AS "制表日期",
                          fingerprint_date AS "指纹日期",
                          dept AS "部门",
                          SUBSTR(job_number,10,3) AS "工号",
                          name AS "姓名",
                          SUBSTR(TO_CHAR(fpt_first_time,'yyyy-MM-dd HH24:MI:SS'),12,5) AS "上班时间点",
                          SUBSTR(TO_CHAR(fpt_last_time,'yyyy-MM-dd HH24:MI:SS'),12,5) AS "下班时间点",
                          file_path As "文件路径",
                          to_char(record_time,'yyyy-MM-dd HH24:MI:SS') AS "记录时间",
                          random_str  AS "随机字符串"
            FROM Attendance_Record
            WHERE Random_Str= v_Random_Str
            OrDER bY
                      JOB_NUMBER ASC,
                      fingerprint_date ASC;
             */
            return v_cur_ar;
            

       end;
         function     get_ARDetail_By_Random_Str(v_Random_Str varchar2) return cur_t
       as
         v_cur_ar cur_t;
       begin
            OPEN v_cur_ar FOR
            SELECT
                          start_date AS "起始日期",
                          end_date AS "终止日期",
                          tabulation_time AS "制表日期",
                          finger_print_date AS "指纹日期",
                          dept AS "部门",
                          SUBSTR(job_number,10,3) AS "工号",
                          name AS "姓名",
                          SUBSTR(TO_CHAR(finger_print_time,'yyyy-MM-dd HH24:MI:SS'),12,5) AS "刷卡时间",
                          file_path As "文件路径",
                          to_char(record_time,'yyyy-MM-dd HH24:MI:SS') AS "记录时间",
                          random_str  AS "随机字符串"
            FROM Attendance_Record_Detail
            WHERE Random_Str= v_Random_Str
            OrDER bY
                      JOB_NUMBER ASC,
                      finger_print_date ASC;

            return v_cur_ar;

       end;
end PKG_AR;
/

prompt
prompt Creating package body PKG_ARTIME
prompt ================================
prompt
create or replace package body dukepu.PKG_ARTime is

  procedure GET_JN_And_AR_Day(v_job_number varchar2,v_ar_day varchar2, v_cur_result out t_cur) as
  begin
            
       open v_cur_result
       FOR
       
       select '暂时注释',
              '',
              '',
              ''
              from dual;
       /*
       SELECT TO_CHAR(TEMP.TIME,'HH24:MI') AS TIME,
              TEMP.FLAG FLAG,
              TEMP.COME_LATE_NUM COME_LATE_NUM,
              TEMP.LEAVE_EARLY_NUM AS LEAVE_EARLY_NUM
        FROM
             (
              SELECT AR.Fpt_First_Time TIME,
                                  0 AS FLAG,
                                  AR.COME_LATE_NUM AS COME_LATE_NUM ,
                                  0 AS LEAVE_EARLY_NUM
                      FROM Attendance_Record AR
                        WHERE AR.JOB_NUMBER = v_job_number
                        AND TRUNC(AR.FingerPrint_Date,'DD') = TO_DATE(v_ar_day,'YYYY-MM-DD')
                      UNION
                        SELECT AR.FPT_LAST_TIME TIME,0 AS FLAG,0 AS COME_LATE_NUM ,AR.LEAVE_EARLY_NUM AS LEAVE_EARLY_NUM
                        FROM Attendance_Record AR
                        WHERE AR.JOB_NUMBER = v_job_number
                        AND TRUNC(AR.FingerPrint_Date,'DD') = TO_DATE(v_ar_day,'YYYY-MM-DD')
                      UNION
                        SELECT LEAVE_START_TIME TIME, 1 AS FLAG, 0 AS COME_LATE_NUM,0 AS LEAVE_EARLY_NUM
                        FROM ASK_FOR_LEAVE A_F_L
                        WHERE A_F_L.Job_Number = v_job_number
                        AND TRUNC(A_F_L.Leave_start_time,'DD') = TO_DATE(v_ar_day,'yyyy-MM-dd')
                      UNION
                        SELECT LEAVE_END_TIME TIME, 1 AS FLAG,  0 AS COME_LATE_NUM,0 AS LEAVE_EARLY_NUM
                        FROM ASK_FOR_LEAVE A_F_L
                        WHERE A_F_L.Job_Number = v_job_number
                        AND TRUNC(A_F_L.Leave_start_time,'DD') = TO_DATE(v_ar_day,'yyyy-MM-dd')
                    )  TEMP;
                    */

  end;
  function GET_A_R_Time(v_job_number varchar2,v_ar_day varchar2) return t_cur
  as
     v_cur_result t_cur;
  begin
       open v_cur_result
       FOR
          SELECT to_char(fpt_first_time,'HH24:MI') as fpt_first_time,
                 to_char(fpt_last_time,'HH24:MI') as fpt_last_time,
                 come_late_num,
                 leave_early_num
          FROM Attendance_Record_Briefly
          WHERE job_number = v_job_number
          AND finger_print_date = to_date(v_ar_day,'yyyy-MM-dd');

      return v_cur_result;

  end;

end PKG_ARTime;
/

prompt
prompt Creating package body PKG_AR_DETAIL
prompt ===================================
prompt
create or replace package body dukepu.PKG_AR_Detail is

 procedure get_ar_detail(v_date_str varchar2,v_prefix_job_number varchar2,v_cur_result out cur_t) as
           type t_cur is ref cursor;
           v_cur t_cur ;


           v_other_am_jN varchar2(20);
           v_other_am_name       nvarchar2(20);

           v_jN varchar2(20);
   begin
        --先清除此表
        DELETE FROM AR_Detail;
        INSERT INTO AR_Detail(
                               start_date,
                                end_date,
                                tabulation_time,
                                fingerprint_date,
                                job_number,
                                name,
                                dept,
                                fpt_first_time,
                                fpt_last_time,
                                come_late_num,
                                leave_early_num
                                )
           Select
                  start_date,
                  end_date,
                  tabulation_time,
                  fingerprint_date,
                  job_number,
                  name,
                  dept,
                  fPT_First_Time,
                  fpt_last_time,
                  come_late_num,
                  leave_early_num
            from v_AR_Detail
            WHERE fingerprint_date = TO_DATE(v_date_str,'yyyy-MM-dd')
            and name = any(
                select distinct name
                from v_AR_Detail
                where substr(job_number,1,9) = v_prefix_job_number
                and fingerprint_date = TO_DATE(v_date_str,'yyyy-MM-dd')
            );

            commit;

            open v_cur
            for select distinct job_number,
                       name
                from ar_detail
                where substr(job_number,1,9) != v_prefix_job_number
                order by job_number asc;
            LOOP
                --Dbms_Output.put_line('BEFORE FETCH');

                FETCH v_cur INTO v_other_am_jN,v_other_am_name;
                EXIT WHEN v_cur%notfound;

                --Dbms_Output.put_line('v_other_am_jN: '|| v_other_am_jN);
                --Dbms_Output.put_line('v_other_am_name: '||v_other_am_name);
                --Dbms_Output.put_line('v_prefix_job_number: '||v_prefix_job_number);


                --Dbms_Output.put_line('SELECT DISTINCT JOB_NUMBER INTO v_jN
                --FROM AR_DETAIL
                --WHERE name = v_other_am_name
                --AND SUBSTR(JOB_NUMBER,1,9) = v_prefix_job_number;');


                SELECT DISTINCT JOB_NUMBER INTO v_jN
                FROM AR_DETAIL
                WHERE name = v_other_am_name
                AND SUBSTR(JOB_NUMBER,1,9) = v_prefix_job_number;

                UPDATE AR_DETAIL
                SET JOB_NUMBER = v_JN || '_' || v_other_am_jN
                WHERE Job_NUMBER = v_other_am_jN;
            END LOOP;
            close v_cur;
        open v_cur_result
        FOR
         Select
              TO_CHAR(start_date,'yyyy-MM-dd') AS start_date,
              TO_Char(end_date,'yyyy-MM-dd') as end_date,
              TO_Char(tabulation_time,'yyyy-MM-dd') as tabulation_time,
              to_char(fingerprint_date,'yyyy-MM-dd') as fingerprint_date,
              job_number,
              name,
              dept,
              SUBSTR(to_char(fpt_first_time,'yyyy-MM-dd HH24:MI:SS'),12,5) fPT_First_Time,
              SUBSTR(to_char(fpt_last_time,'yyyy-MM-dd HH24:MI:SS'),12,5) fpt_last_time,
              cast (come_late_num as varchar2(10)) as come_late_num,
              cast(leave_early_num as varchar2(10)) as leave_early_num
        from AR_DETAIL
        order by fingerprint_date asc,
              job_number asc;
   end;
    procedure get_ar_detail(v_date_str varchar2,v_cur_result out cur_t) as
           type t_cur is ref cursor;
           v_cur t_cur ;

           v_name nvarchar2(20);
           v_min_jN varchar2(20);


   begin
        ---删除临时表。
        DELETE FROM AR_Detail;
         INSERT INTO AR_Detail(
                               start_date,
                                end_date,
                                tabulation_time,
                                fingerprint_date,
                                job_number,
                                name,
                                dept,
                                fpt_first_time,
                                fpt_last_time,
                                come_late_num,
                                leave_early_num
                                )
           Select
                  start_date,
                  end_date,
                  tabulation_time,
                  fingerprint_date,
                  job_number,
                  name,
                  dept,
                  fPT_First_Time,
                  fpt_last_time,
                  come_late_num,
                  leave_early_num
            from v_AR_Detail
            WHERE fingerprint_date = TO_DATE(v_date_str,'yyyy-MM-dd');
          ---获取姓名相同，但 工号不同的 记录。
          open v_cur
           for select name,MIN_JOB_NUMBER
               FROM
               (
                      select trunc(a_d.fingerprint_date,'MM') as trunc_fpd,
                             name,
                             MIN(JOB_NUMBER) MIN_JOB_NUMBER,
                             count(1) as count_name
                             from ar_detail a_d
                             group by trunc(a_d.fingerprint_date,'MM'),name
                ) temp
                where count_name >1;
          LOOP
              FETCH v_cur into v_name,v_min_jN;
              Exit WHEN v_cur%NOTFOUND;

              ---获取该姓名 对应 的 最小 job_number
              UPDATE Ar_Detail
              SET JOB_NUMBER = v_min_jN || '_' || JOB_NUMBER
              WHERE NAME = v_name
              AND JOB_Number != v_min_jN;

          END LOOP;
          close v_cur;
        --插入所有 数据。
        open v_cur_result
        FOR
         Select
              TO_CHAR(start_date,'yyyy-MM-dd') AS start_date,
              TO_Char(end_date,'yyyy-MM-dd') as end_date,
              TO_Char(tabulation_time,'yyyy-MM-dd') as tabulation_time,
              to_char(fingerprint_date,'yyyy-MM-dd') as fingerprint_date,
              job_number,
              name,
              dept,
              SUBSTR(to_char(fpt_first_time,'yyyy-MM-dd HH24:MI:SS'),12,5) fPT_First_Time,
              SUBSTR(to_char(fpt_last_time,'yyyy-MM-dd HH24:MI:SS'),12,5) fpt_last_time,
              cast (come_late_num as varchar2(10)) as come_late_num,
              cast(leave_early_num as varchar2(10)) as leave_early_num
        from AR_DETAIL
        order by fingerprint_date asc,
              job_number asc;
   end;
   function GET_OverTime_Of_RestDay(v_ar_jn varchar2,v_year_and_month varchar2) return integer is
            Result integer;
            v_Count INT;
   begin
         select COUNT(1) INTO v_Count
        from attendance_record ar
        where ar.job_number = v_ar_jn
        and trunc(fingerprint_date,'MM') = to_date(v_year_and_month,'yyyy-MM');


        IF(v_COUNT=0)
        THEN
            Result :=0;
            RETURN RESULT;
        END IF;

         select FLOOR((fpt_last_time - (CASE  WHEN FPT_First_TIME <= TO_DATE(TO_CHAR(FPT_FIRST_TIME,'yyyy-MM-dd') || ' 08:00:00','yyyy-MM-dd HH24:MI:SS')
                                    THEN TO_DATE(TO_CHAR(FPT_FIRST_TIME,'yyyy-MM-dd') || ' 08:00:00','yyyy-MM-dd HH24:MI:SS')
                                    ELSE FPT_First_TIME
                                    END))*24*60/30) * 0.5 -1 INTO Result
        from rest_day r_d inner join attendance_record ar
               on (r_d.rest_day = ar.fingerprint_date
                   and not(ar.fpt_first_time is null and ar.fpt_last_time is  null))
        where ar.job_number = v_ar_jn
        and trunc(fingerprint_date,'MM') = to_date(v_year_and_month,'yyyy-MM');
      return(Result);
   end GET_OverTime_Of_RestDay;

function get_ar_detail_by_JN(v_job_number varchar2,v_year_and_month_str varchar2)  return cur_t
as
           v_cur_result cur_t ;


begin

        open v_cur_result
        FOR
         Select
              SUBSTR(to_char(fpt_first_time,'yyyy-MM-dd HH24:MI:SS'),12,5) fPT_First_Time,
              SUBSTR(to_char(fpt_last_time,'yyyy-MM-dd HH24:MI:SS'),12,5) fpt_last_time,
              come_late_num,
              leave_early_num
        from Attendance_Record
        where trunc(fingerprint_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
        and job_number = v_job_number
        order by fingerprint_date asc;

        return v_cur_result;
   end;


   function get_Staffs_Base_Info(v_year_and_month_str varchar2) return cur_t
   as
     v_cur_result cur_t;
   begin
        open v_cur_result
        for
        select distinct dept,job_number,name
        from Attendance_Record
        where trunc(fingerprint_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
        order by job_number asc;
        return v_cur_result;
   end;
    function get_Staffs_BI_by_AMFlag_YMStr(v_attendance_machine_flag varchar2,v_year_and_month_str varchar2) return cur_t
    as
      v_cur_result cur_t;
    begin
          open v_cur_result
        for
        select distinct dept,job_number,name
        from Attendance_Record
        where substr(job_number,1,1) in (v_attendance_machine_flag)
        and trunc(fingerprint_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
        order by job_number asc;
        return v_cur_result;
    end;
end PKG_AR_Detail;
/

prompt
prompt Creating package body PKG_AR_SUMMARY
prompt ====================================
prompt
create or replace package body dukepu.pkg_ar_summary is

 function getARSummary(v_year_and_month_str varchar2) return t_cur
 as
   v_cur_result t_cur;
 begin
      open v_cur_result
      for
      select
             job_number,
              name,
              days_of_real_attendance,
              vacation_total_time,
              not_finger_print,
              overtime_of_workday,
              OVERTIME_OF_WEE_HOURS_OF_WD,
              overtime_of_restday,
              (overtime_of_workday + overtime_of_restday) as total_overtime,
              come_late_num,
              leave_early_num,
              meal_subsidy,
              belong_to_month
      from AR_SUMMARY_FINAL
      WHERE trunc(belong_to_month,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
      order by job_number asc;

      RETURN v_cur_result;
 end;

end pkg_ar_summary;
/

prompt
prompt Creating package body PKG_EMPS
prompt ==============================
prompt
create or replace package body dukepu.pkg_emps is

       procedure proc_getAllEmps(cur_set out cursor_emps_t) as

begin
     open cur_set
     for select name,
                job_number,
                department,
                contact_way,
                position,
                role,
                update_time,
                is_on_the_job,
                random_str,
                seq,
                ar_name,
                ar_job_number,
                report_time
         from employees;
     end;
end;
/

prompt
prompt Creating package body PKG_GET_AR
prompt ================================
prompt
create or replace package body dukepu.PKG_GET_AR is


  -- Public variable declarations

  -- Public function and procedure declarations
  function get_AR_By_Date_Range(v_year_and_month_str varchar2) return t_cur as

      v_cur t_cur;
      v_name nvarchar2(20);
      v_dept nvarchar2(10);

      --考勤记录中的 工号
      v_ar_job_number varchar2(20);
      --考勤姓名
      v_ar_name nvarchar2(20);
      ---本月 最晚 下班时间
      v_max_fpt_last_time date;

      --本月 工作日 加班 时间 总和
      v_overtime_workDay_One_Month number;

       --本月 休息日 加班 时间 总和
      v_overtime_restDay_One_Month number;


      v_Count INT;

      v_remark NVARCHAR2(50);
      v_cur_AR_By_Date_Range t_cur;

      v_COME_LATE_NUM INT;
      v_Leave_early_num int;
      v_AR_Days INT;    --实际出勤天数。
      v_NOT_FingerPrint_Times INT;      --未打卡次数。
      v_should_AR_Days INT;   ---应出勤天数

      PRAGMA AUTONOMOUS_TRANSACTION;

begin

  --获取该月 计件记录和零活
  open v_cur for
  SELECT TEMP.Name,TEMP.Dept
          FROM
          (
          select distinct PR.name,PR.Dept
          from Products_Record PR
          where trunc(REPORT_SPECIFIC_MONTH,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
          UNION
          SELECT distinct SR.name,SR.Dept
          FROM Scattered_Record SR
          where trunc(REPORT_SPECIFIC_MONTH,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
          ) TEMP;

  LOOP

       <<NEXT>>

        --获取姓名
        FETCH v_cur INTO v_name,v_dept;
        EXIT WHEN v_cur%notfound;
        v_remark:='';
        v_ar_job_number:='';
        v_ar_name:='';
        v_max_fpt_last_time:=null;
        v_overtime_workDay_One_Month:=null;
        v_overtime_restDay_One_Month:=null;

        --1.先判断此姓名  在 AttendanceRecord 中  是否 存在。
        select count(1) INTO v_Count
        from Attendance_Record
        where name = v_name
        and fingerprint_date= TO_DATE(v_year_and_month_str|| '-01','yyyy-MM-dd');

        if(v_Count >1)then    ---存在同名用户

            select WM_CONCAT(TO_CHAR(JOB_NUMBER)) INTO v_remark
            from Attendance_Record
            where name = v_name
            and fingerprint_date= TO_DATE(v_year_and_month_str|| '-01','yyyy-MM-dd');

            v_remark:= '在考勤记录中存在'|| v_Count||'个同名用户: ' || v_remark;
            --判断 AR_Summary中 是否 已经存在记录
            SELECT COUNT(1) INTO v_Count
            FROM AR_Summary
            WHERE dept = v_dept
            AND Name = v_name
            AND trunc(belong_to_month,'MM') =  to_date(v_year_and_month_str,'yyyy-MM');

            IF(v_count=0) THEN
                     insert into AR_Summary(
                                   SEQ,
                                   dept,
                                   name,
                                    remark,
                                    Belong_To_Month)
              VALUES(
                     SEQ_AR_SUMMARY.Nextval,
                     v_dept,
                     v_name,
                     v_remark,
                     to_date(v_year_and_month_str,'yyyy-MM')
              );
            ELSE
                 ---update
                 UPDATE AR_Summary
                 SET ar_job_number = '',
                      ar_name = '',
                      latest_off_duty = null ,
                      overtime_workday_one_month = null,
                      overtime_restday_one_month = null,
                      days_of_should_be_attendance = null,
                      days_of_real_attendance = null,
                      not_finger_print = null,
                      come_late_num = null,
                      leave_early_num = null,
                      remark = v_remark
                 WHERE dept = v_dept
                  AND Name = v_name
                  AND trunc(belong_to_month,'MM') =  to_date(v_year_and_month_str,'yyyy-MM');

            END IF;


            commit;

           GOTO NEXT;
        end if;
        --依据计件，零活报表中的 用户信息，在考勤记录中，没有得到 该用户出勤记录。
        IF(v_Count =0) then

             v_remark:= v_year_and_month_str || '考勤记录中：无'|| v_name ;

               SELECT COUNT(1) INTO v_Count
                  FROM AR_Summary
                  WHERE dept = v_dept
                  AND Name = v_name
                  AND trunc(belong_to_month,'MM') =  to_date(v_year_and_month_str,'yyyy-MM');

             IF(v_count=0) then

                 insert into AR_Summary(
                                        SEQ,
                                        dept,
                                        name,
                                       remark,
                                       belong_To_Month)
                VALUES(
                       SEQ_AR_SUMMARY.Nextval,
                       v_dept,
                       v_name,
                       v_remark,
                       to_date(v_year_and_month_str,'yyyy-MM')
                );
            else
                 ---update
                 UPDATE AR_Summary
                 SET ar_job_number = '',
                      ar_name = '',
                      latest_off_duty = null ,
                      overtime_workday_one_month = null,
                      overtime_restday_one_month = null,
                      days_of_should_be_attendance = null,
                      days_of_real_attendance = null,
                      not_finger_print = null,
                      come_late_num = null,
                      leave_early_num = null,
                      remark = v_remark
                 WHERE dept = v_dept
                  AND Name = v_name
                  AND trunc(belong_to_month,'MM') =  to_date(v_year_and_month_str,'yyyy-MM');
            end if;
            commit;

           GOTO NEXT;
        end if;


      -- 在考勤机中，该姓名在该月记录中只有一条。

      select count(1) into v_count
      from Attendance_Record AR
      where AR.name = v_name
      and trunc(ar.FINGERPRINT_DATE,'MM') =to_date(v_year_and_month_str,'yyyy-MM');

      if(v_count!=0) then

            select distinct job_number into v_ar_job_number
            from Attendance_Record AR
            where AR.name = v_name
            and trunc(ar.FINGERPRINT_DATE,'MM') =to_date(v_year_and_month_str,'yyyy-MM');
            --- 计算迟到次数
            get_Come_Late_Num(v_ar_job_number,v_year_and_month_str,v_COME_LATE_NUM );
            ---计算早退次数
            get_leave_early_num(v_ar_job_number,v_year_and_month_str,v_Leave_early_num );
            ---计算考勤天数
            get_Actual_AR_Days(v_ar_job_number,v_year_and_month_str, v_AR_Days);
            ---未打卡次数。
            Get_Not_FingerPrint_Times(v_ar_job_number,v_year_and_month_str,v_NOT_FingerPrint_Times);
            --获取应出勤天数。
            get_Should_AR_Days(v_year_and_month_str,v_should_AR_Days);
      end if;



        --2. 计算最晚下班时间。
      select FPT_LAST_TIME,job_number,name INTO v_max_fpt_last_time,v_ar_job_number,v_ar_name
      from
      (
        select row_number() over(order by (to_char(fpt_last_time,'HH24:MI:SS')) desc) row_ID,job_number,name,fpt_last_time
            from Attendance_Record AR_Condition
            where name = v_name
            and trunc(FINGERPRINT_DATE,'MM') =to_date(v_year_and_month_str,'yyyy-MM')
            and fpt_last_time is not null
       ) TEMP
       where Temp.row_ID =1;

        ---3. 计算 本月 工作日 加班时长
        get_delay_times_ordinary_days(v_ar_job_number,v_Year_And_Month_str,v_overtime_workDay_One_Month);


        /*
        select sum(floor((fpt_last_time - to_date(to_char(fpt_last_time,'yyyy-MM-dd') || ' 17:00:00','yyyy-MM-dd HH24:MI:SS')) * 24 *60 /30) *0.5) INTO v_overtime_workDay_One_Month
        from Attendance_Record AR
        where name = v_name
        and trunc(fingerprint_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
        and fpt_last_time is not null
        and fpt_last_time > to_date(to_char(fpt_last_time,'yyyy-MM-dd') || ' 17:00:00','yyyy-MM-dd HH24:MI:SS')
        and fingerprint_date  in (
            select Rest_Day
            from Rest_Day
            where trunc(Rest_Day,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
        );
        */
        ---4. 计算休息 日  加班 时长
        get_duration_of_overtime_day(v_ar_job_number,v_year_and_month_str,v_overtime_restDay_One_Month);
        /*
        select sum(floor((fpt_last_time - fpt_first_time) * 24 *60 /30) *0.5) INTO v_overtime_restDay_One_Month
        from Attendance_Record AR
        where name = v_name
        and trunc(fingerprint_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
        and fpt_first_time is not null
        and fpt_last_time is not null
        and fingerprint_date in (
            select Rest_Day
            from Rest_Day
            where trunc(Rest_Day,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
        );
        */

        SELECT COUNT(1) INTO v_Count
        FROM AR_Summary
        WHERE dept = v_dept
         AND Name = v_name
        AND trunc(belong_to_month,'MM') =  to_date(v_year_and_month_str,'yyyy-MM');

        if(v_count=0) then


            insert into AR_Summary(
                                      SEQ,
                                      dept,
                                      name,
                                      ar_job_number,
                                      AR_NAME,
                                      latest_off_duty,
                                      overtime_workday_one_month,
                                      overtime_restday_one_month,
                                      days_of_should_be_attendance,
                                      days_of_real_attendance,
                                      not_finger_print,
                                      come_late_num,
                                      leave_early_num,
                                      remark,
                                      belong_To_Month
                                     )
            VALUES(
                   SEQ_AR_Summary.Nextval,
                   v_dept,
                   v_name,
                   v_ar_job_number,
                   v_ar_name,
                   v_max_fpt_last_time,
                   v_overtime_workDay_One_Month,
                   v_overtime_restday_one_month,
                   v_should_AR_Days,
                   v_ar_days,
                   v_NOT_FingerPrint_Times,
                   v_COME_LATE_NUM,
                   v_Leave_early_num,
                   v_remark,
                   to_date(v_year_and_month_str,'yyyy-MM')
            );
        else
                ---update
                 UPDATE AR_Summary
                 SET AR_job_number = v_ar_job_number,
                     ar_name = v_ar_name,
                     latest_off_duty = v_max_fpt_last_time,
                       overtime_workday_one_month = v_overtime_workDay_One_Month,
                        overtime_restday_one_month = v_overtime_restDay_One_Month,
                     days_of_should_be_attendance = v_should_AR_Days,
                     days_of_real_attendance = v_ar_days,
                     not_finger_print = v_not_fingerprint_times,
                     come_late_num = v_COME_LATE_NUM,
                     leave_early_num = v_Leave_early_num,
                     remark =v_remark
                 WHERE dept = v_dept
                  AND Name = v_name
                  AND trunc(belong_to_month,'MM') =  to_date(v_year_and_month_str,'yyyy-MM');
        end if;
        commit;

   END LOOP;
   CLOSE v_cur;


   OPEN v_cur_AR_By_Date_Range
   FOR SELECT
              SEQ,
              dept,
              name,
              AR_Job_Number,
              AR_name,
              to_char(latest_off_duty,'yyyy-MM-dd HH24:MI:SS') latest_off_duty,
              overtime_workday_one_month,
              overtime_restday_one_month,
              days_of_should_be_attendance,
              days_of_real_attendance,
              not_finger_print,
              come_late_num,
              leave_early_num,
              remark
        FROM  AR_Summary
        WHERE  trunc(belong_to_month,'MM') =  to_date(v_year_and_month_str,'yyyy-MM')
        ORDER BY NLSSORT(remark,'NLS_SORT= SCHINESE_PINYIN_M') desc nulls last,
              substr(dept,instr(dept,'组')-1) desc,
              NLSSORT(name,'NLS_SORT= SCHINESE_PINYIN_M') desc;

   return v_cur_AR_By_Date_Range;

end;

  function get_AR_By_Dept_And_DR(v_dept nvarchar2,v_year_and_month_str varchar2) return t_cur
  as

      v_cur t_cur;
      v_name nvarchar2(20);

      --考勤记录中的 工号
      v_ar_job_number varchar2(20);
      --考勤姓名
      v_ar_name nvarchar2(20);
      ---本月 最晚 下班时间
      v_max_fpt_last_time date;

      --本月 工作日 加班 时间 总和
      v_overtime_workDay_One_Month number;

       --本月 休息日 加班 时间 总和
      v_overtime_restDay_One_Month number;


      v_Count INT;

      v_remark NVARCHAR2(50);
      v_cur_AR_By_DR_And_Dept t_cur;

      v_COME_LATE_NUM INT;
      v_Leave_early_num int;
      v_AR_Days INT;    --实际出勤天数。
      v_NOT_FingerPrint_Times INT;      --未打卡次数。
      v_should_AR_Days INT;   ---应出勤天数

      PRAGMA AUTONOMOUS_TRANSACTION;
  begin

          --获取该月 计件记录和零活
          open v_cur for
          SELECT TEMP.Name
                  FROM
                  (
                  select distinct PR.name
                  from Products_Record PR
                  where trunc(REPORT_SPECIFIC_MONTH,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
                  and dept = v_dept
                  UNION
                  SELECT distinct SR.name
                  FROM Scattered_Record SR
                  where trunc(REPORT_SPECIFIC_MONTH,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
                  and dept = v_dept
                  ) TEMP;

          LOOP

               <<NEXT>>

                --获取姓名
                FETCH v_cur INTO v_name;
                EXIT WHEN v_cur%notfound;
                v_remark:='';
                v_ar_job_number:='';
                v_ar_name:='';
                v_max_fpt_last_time:=null;
                v_overtime_workDay_One_Month:=null;
                v_overtime_restDay_One_Month:=null;

                --1.先判断此姓名  在 AttendanceRecord 中  是否 存在。
                select count(1) INTO v_Count
                from Attendance_Record
                where name = v_name
                and fingerprint_date= TO_DATE(v_year_and_month_str|| '-01','yyyy-MM-dd');

                if(v_Count >1)then    ---存在同名用户

                    select WM_CONCAT(TO_CHAR(JOB_NUMBER)) INTO v_remark
                    from Attendance_Record
                    where name = v_name
                    and fingerprint_date= TO_DATE(v_year_and_month_str|| '-01','yyyy-MM-dd');

                    v_remark:= '在考勤记录中存在'|| v_Count||'个同名用户: ' || v_remark;
                    --判断 AR_Summary中 是否 已经存在记录
                    SELECT COUNT(1) INTO v_Count
                    FROM AR_Summary
                    WHERE dept = v_dept
                    AND Name = v_name
                    AND trunc(belong_to_month,'MM') =  to_date(v_year_and_month_str,'yyyy-MM');

                    IF(v_count=0) THEN
                             insert into AR_Summary(
                                           SEQ,
                                           dept,
                                           name,
                                            remark,
                                            Belong_To_Month)
                      VALUES(
                             SEQ_AR_SUMMARY.Nextval,
                             v_dept,
                             v_name,
                             v_remark,
                             to_date(v_year_and_month_str,'yyyy-MM')
                      );
                    ELSE
                         ---update
                         UPDATE AR_Summary
                         SET ar_job_number = '',
                              ar_name = '',
                              latest_off_duty = null ,
                              overtime_workday_one_month = null,
                              overtime_restday_one_month = null,
                              days_of_should_be_attendance = null,
                              days_of_real_attendance = null,
                              not_finger_print = null,
                              come_late_num = null,
                              leave_early_num = null,
                              remark = v_remark
                         WHERE dept = v_dept
                          AND Name = v_name
                          AND trunc(belong_to_month,'MM') =  to_date(v_year_and_month_str,'yyyy-MM');

                    END IF;


                    commit;

                   GOTO NEXT;
                end if;
                --依据计件，零活报表中的 用户信息，在考勤记录中，没有得到 该用户出勤记录。
                IF(v_Count =0) then

                     v_remark:= v_year_and_month_str || '考勤记录中：无'|| v_name ;

                       SELECT COUNT(1) INTO v_Count
                          FROM AR_Summary
                          WHERE dept = v_dept
                          AND Name = v_name
                          AND trunc(belong_to_month,'MM') =  to_date(v_year_and_month_str,'yyyy-MM');

                     IF(v_count=0) then

                         insert into AR_Summary(
                                                SEQ,
                                                dept,
                                                name,
                                               remark,
                                               belong_To_Month)
                        VALUES(
                               SEQ_AR_SUMMARY.Nextval,
                               v_dept,
                               v_name,
                               v_remark,
                               to_date(v_year_and_month_str,'yyyy-MM')
                        );
                    else
                         ---update
                         UPDATE AR_Summary
                         SET ar_job_number = '',
                              ar_name = '',
                              latest_off_duty = null ,
                              overtime_workday_one_month = null,
                              overtime_restday_one_month = null,
                              days_of_should_be_attendance = null,
                              days_of_real_attendance = null,
                              not_finger_print = null,
                              come_late_num = null,
                              leave_early_num = null,
                              remark = v_remark
                         WHERE dept = v_dept
                          AND Name = v_name
                          AND trunc(belong_to_month,'MM') =  to_date(v_year_and_month_str,'yyyy-MM');
                    end if;
                    commit;

                   GOTO NEXT;
                end if;


              -- 在考勤机中，该姓名在该月记录中只有一条。

              select count(1) into v_count
              from Attendance_Record AR
              where AR.name = v_name
              and trunc(ar.FINGERPRINT_DATE,'MM') =to_date(v_year_and_month_str,'yyyy-MM');

              if(v_count!=0) then

                    select distinct job_number into v_ar_job_number
                    from Attendance_Record AR
                    where AR.name = v_name
                    and trunc(ar.FINGERPRINT_DATE,'MM') =to_date(v_year_and_month_str,'yyyy-MM');
                    --- 计算迟到次数
                    get_Come_Late_Num(v_ar_job_number,v_year_and_month_str,v_COME_LATE_NUM );
                    ---计算早退次数
                    get_leave_early_num(v_ar_job_number,v_year_and_month_str,v_Leave_early_num );
                    ---计算考勤天数
                    get_Actual_AR_Days(v_ar_job_number,v_year_and_month_str, v_AR_Days);
                    ---未打卡次数。
                    Get_Not_FingerPrint_Times(v_ar_job_number,v_year_and_month_str,v_NOT_FingerPrint_Times);
                    --获取应出勤天数。
                    get_Should_AR_Days(v_year_and_month_str,v_should_AR_Days);
              end if;



                --2. 计算最晚下班时间。
              select FPT_LAST_TIME,job_number,name INTO v_max_fpt_last_time,v_ar_job_number,v_ar_name
              from
              (
                select row_number() over(order by (to_char(fpt_last_time,'HH24:MI:SS')) desc) row_ID,job_number,name,fpt_last_time
                    from Attendance_Record AR_Condition
                    where name = v_name
                    and trunc(FINGERPRINT_DATE,'MM') =to_date(v_year_and_month_str,'yyyy-MM')
                    and fpt_last_time is not null
               ) TEMP
               where Temp.row_ID =1;

                ---3. 计算 本月 工作日 加班时长
                get_delay_times_ordinary_days(v_ar_job_number,v_Year_And_Month_str,v_overtime_workDay_One_Month);


                /*
                select sum(floor((fpt_last_time - to_date(to_char(fpt_last_time,'yyyy-MM-dd') || ' 17:00:00','yyyy-MM-dd HH24:MI:SS')) * 24 *60 /30) *0.5) INTO v_overtime_workDay_One_Month
                from Attendance_Record AR
                where name = v_name
                and trunc(fingerprint_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
                and fpt_last_time is not null
                and fpt_last_time > to_date(to_char(fpt_last_time,'yyyy-MM-dd') || ' 17:00:00','yyyy-MM-dd HH24:MI:SS')
                and fingerprint_date  in (
                    select Rest_Day
                    from Rest_Day
                    where trunc(Rest_Day,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
                );
                */
                ---4. 计算休息 日  加班 时长
                get_duration_of_overtime_day(v_ar_job_number,v_year_and_month_str,v_overtime_restDay_One_Month);
                /*
                select sum(floor((fpt_last_time - fpt_first_time) * 24 *60 /30) *0.5) INTO v_overtime_restDay_One_Month
                from Attendance_Record AR
                where name = v_name
                and trunc(fingerprint_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
                and fpt_first_time is not null
                and fpt_last_time is not null
                and fingerprint_date in (
                    select Rest_Day
                    from Rest_Day
                    where trunc(Rest_Day,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
                );
                */

                SELECT COUNT(1) INTO v_Count
                FROM AR_Summary
                WHERE dept = v_dept
                 AND Name = v_name
                AND trunc(belong_to_month,'MM') =  to_date(v_year_and_month_str,'yyyy-MM');

                if(v_count=0) then


                    insert into AR_Summary(
                                              SEQ,
                                              dept,
                                              name,
                                              ar_job_number,
                                              AR_NAME,
                                              latest_off_duty,
                                              overtime_workday_one_month,
                                              overtime_restday_one_month,
                                              days_of_should_be_attendance,
                                              days_of_real_attendance,
                                              not_finger_print,
                                              come_late_num,
                                              leave_early_num,
                                              remark,
                                              belong_To_Month
                                             )
                    VALUES(
                           SEQ_AR_Summary.Nextval,
                           v_dept,
                           v_name,
                           v_ar_job_number,
                           v_ar_name,
                           v_max_fpt_last_time,
                           v_overtime_workDay_One_Month,
                           v_overtime_restday_one_month,
                           v_should_AR_Days,
                           v_ar_days,
                           v_NOT_FingerPrint_Times,
                           v_COME_LATE_NUM,
                           v_Leave_early_num,
                           v_remark,
                           to_date(v_year_and_month_str,'yyyy-MM')
                    );
                else
                        ---update
                         UPDATE AR_Summary
                         SET AR_job_number = v_ar_job_number,
                             ar_name = v_ar_name,
                             latest_off_duty = v_max_fpt_last_time,
                               overtime_workday_one_month = v_overtime_workDay_One_Month,
                                overtime_restday_one_month = v_overtime_restDay_One_Month,
                             days_of_should_be_attendance = v_should_AR_Days,
                             days_of_real_attendance = v_ar_days,
                             not_finger_print = v_not_fingerprint_times,
                             come_late_num = v_COME_LATE_NUM,
                             leave_early_num = v_Leave_early_num,
                             remark =v_remark
                         WHERE dept = v_dept
                          AND Name = v_name
                          AND trunc(belong_to_month,'MM') =  to_date(v_year_and_month_str,'yyyy-MM');
                end if;
                commit;

           END LOOP;
           CLOSE v_cur;


           OPEN v_cur_AR_By_DR_And_Dept
           FOR SELECT
                      SEQ,
                      dept,
                      name,
                      AR_Job_Number,
                      AR_name,
                      to_char(latest_off_duty,'yyyy-MM-dd HH24:MI:SS') latest_off_duty,
                      overtime_workday_one_month,
                      overtime_restday_one_month,
                      days_of_should_be_attendance,
                      days_of_real_attendance,
                      not_finger_print,
                      come_late_num,
                      leave_early_num,
                      remark
                FROM  AR_Summary
                WHERE  trunc(belong_to_month,'MM') =  to_date(v_year_and_month_str,'yyyy-MM')
                AND dept = v_dept
                ORDER BY NLSSORT(remark,'NLS_SORT= SCHINESE_PINYIN_M') desc nulls last,
                      substr(dept,instr(dept,'组')-1) desc,
                      NLSSORT(name,'NLS_SORT= SCHINESE_PINYIN_M') desc;

           return v_cur_AR_By_DR_And_Dept;



  end;

--返回 考勤 汇总
function get_AR_By_LN_And_DR(v_lastName nvarchar2,v_year_and_month_str varchar2) return t_cur
is
      v_cur t_cur;
      v_ar_job_number varchar2(20);
      v_ar_name nvarchar2(20);
      ---本月 最晚 下班时间
      v_max_fpt_last_time date;

      --本月 工作日 加班 时间 总和
      v_overtime_workDay_One_Month number;

       --本月 休息日 加班 时间 总和
      v_overtime_restDay_One_Month number;


      v_count int;

      v_remark NVARCHAR2(50);
      v_cur_AR_By_LN_And_DR t_cur;

        v_COME_LATE_NUM INT;
      v_Leave_early_num int;
      v_AR_Days INT;    --实际出勤天数。
      v_NOT_FingerPrint_Times INT;      --未打卡次数。
      v_should_AR_Days INT;   ---应出勤天数

      PRAGMA AUTONOMOUS_TRANSACTION;

begin
--获取该月 计件记录和零活
  open v_cur for
  SELECT job_number,NAME
  FROM Attendance_Record AR
  WHERE NAME LIKE v_lastName || '%'
  AND FingerPrint_DATE = TO_DATE(v_year_and_month_str||'-01','yyyy-MM-dd')
  ORDER BY NLSSORT(Name,'NLS_SORT= SCHINESE_PINYIN_M') ASC;

  DELETE
  FROM AR_Summary_For_LN;

  LOOP

       <<NEXT>>

        --获取姓名
        FETCH v_cur INTO v_ar_job_number,v_ar_name;
        EXIT WHEN v_cur%notfound;
        v_remark:='';
        v_max_fpt_last_time:=null;
        v_overtime_workDay_One_Month:=null;
        v_overtime_restDay_One_Month:=null;



        --2. 计算最晚下班时间。
      select FPT_LAST_TIME INTO v_max_fpt_last_time
      from
      (
        select row_number() over(order by (to_char(fpt_last_time,'HH24:MI:SS')) desc) row_ID,fpt_last_time
            from Attendance_Record AR_Condition
            where job_number = v_ar_job_number
            and trunc(FINGERPRINT_DATE,'MM') =to_date(v_year_and_month_str,'yyyy-MM')
            and fpt_last_time is not null
       ) TEMP
       where Temp.row_ID =1;

        ---3. 计算 本月 工作日 加班时长
        ---
        select sum(floor((fpt_last_time - to_date(to_char(fpt_last_time,'yyyy-MM-dd') || ' 17:00:00','yyyy-MM-dd HH24:MI:SS')) * 24 *60 /30) *0.5) INTO v_overtime_workDay_One_Month
        from Attendance_Record AR
        where job_number = v_ar_job_number
        and trunc(fingerprint_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
        and fpt_last_time is not null
        and fpt_last_time > to_date(to_char(fpt_last_time,'yyyy-MM-dd') || ' 17:00:00','yyyy-MM-dd HH24:MI:SS')
        and fingerprint_date not in (
            select Rest_Day
            from Rest_Day
            where trunc(Rest_Day,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
        );


        SELECT COUNT(1) INTO v_Count
        FROM DUAL
        WHERE  EXISTS(
                         SELECT 1
                         FROM Attendance_Record
                          WHERE job_number = v_ar_job_number
                          and trunc(fingerprint_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
                          and fpt_first_time is not null
                          and fpt_last_time is not null
                          and fingerprint_date in (
                              select Rest_Day
                              from Rest_Day
                              where trunc(Rest_Day,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
        ));

        IF v_Count =0 THEN
           v_overtime_restDay_One_Month:=0;
        ELSE

        ---4. 计算休息 日  加班 时长
          select sum(floor((fpt_last_time - fpt_first_time) * 24 *60 /30) *0.5) INTO v_overtime_restDay_One_Month
          from Attendance_Record AR
          where job_number = v_ar_job_number
          and trunc(fingerprint_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
          and fpt_first_time is not null
          and fpt_last_time is not null
          and fingerprint_date in (
              select Rest_Day
              from Rest_Day
              where trunc(Rest_Day,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
          );

        END IF;

           --- 计算迟到次数
            get_Come_Late_Num(v_ar_job_number,v_year_and_month_str,v_COME_LATE_NUM );
            ---计算早退次数
            get_leave_early_num(v_ar_job_number,v_year_and_month_str,v_Leave_early_num );
            ---计算考勤天数
            get_Actual_AR_Days(v_ar_job_number,v_year_and_month_str, v_AR_Days);
            ---未打卡次数。
            Get_Not_FingerPrint_Times(v_ar_job_number,v_year_and_month_str,v_NOT_FingerPrint_Times);
            --获取应出勤天数。
            get_Should_AR_Days(v_year_and_month_str,v_should_AR_Days);

        insert into AR_Summary_For_LN(
                                  AR_Job_Number,
                                  AR_NAME,
                                  latest_off_duty,
                                  overtime_workday_one_month,
                                  overtime_restday_one_month,
                                   days_of_should_be_attendance,
                                    days_of_real_attendance,
                                    not_finger_print,
                                    come_late_num,
                                    LEAVE_EARLY_NUM,
                                    remark)
        VALUES(
               v_ar_job_number,
               v_ar_name,
               v_max_fpt_last_time,
               v_overtime_workDay_One_Month,
               v_overtime_restday_one_month,
               v_should_AR_Days,
               v_AR_Days,
               v_NOT_FingerPrint_Times,
               v_COME_LATE_NUM,
               v_Leave_early_num,
               v_remark
        );
        commit;

   END LOOP;
   CLOSE v_cur;



   OPEN v_cur_AR_By_LN_And_DR
   FOR SELECT
              ar_job_number,
              AR_name,
              to_char(latest_off_duty,'yyyy-MM-dd HH24:MI:SS') latest_off_duty,
              overtime_workday_one_month,
              overtime_restday_one_month,
              days_of_should_be_attendance,
              days_of_real_attendance,
              not_finger_print,
              come_late_num,
              LEAVE_EARLY_NUM,
              remark
        FROM  AR_Summary_For_LN
        ORDER BY NLSSORT(AR_NAME,'NLS_SORT = SCHINESE_PINYIN_M') ASC ;



   return v_cur_AR_By_LN_And_DR;

end;
   procedure Update_Summary(v_ar_job_number nvarchar2,v_year_and_month_str varchar2) as
             v_latest_off_duty ar_summary.latest_off_duty%type;
             v_overtime_workDay_One_Month ar_summary.overtime_workday_one_month%type;
             v_overtime_restDay_One_Month ar_summary.overtime_restday_one_month%type;

   begin
      --1. 计算最晚下班时间。
      select FPT_LAST_TIME INTO v_latest_off_duty
      from
      (
        select row_number() over(order by (to_char(fpt_last_time,'HH24:MI:SS')) desc) row_ID,
               fpt_last_time
            from Attendance_Record AR_Condition
            where job_number = v_ar_job_number
            and trunc(FINGERPRINT_DATE,'MM') =to_date(v_year_and_month_str,'yyyy-MM')
            and fpt_last_time is not null
       ) TEMP
       where Temp.row_ID =1;

       --2. 计算 本月工作 日 加班时长
         select sum(floor((fpt_last_time - to_date(to_char(fpt_last_time,'yyyy-MM-dd') || ' 17:00:00','yyyy-MM-dd HH24:MI:SS')) * 24 *60 /30) *0.5) INTO v_overtime_workDay_One_Month
        from Attendance_Record AR
        where job_number = v_ar_job_number
        and trunc(fingerprint_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
        and fpt_last_time is not null
        and fpt_last_time > to_date(to_char(fpt_last_time,'yyyy-MM-dd') || ' 17:00:00','yyyy-MM-dd HH24:MI:SS')
        and fingerprint_date not in (
            select Rest_Day
            from Rest_Day
            where trunc(Rest_Day,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
        );

        ---3. 计算休息 日  加班 时长
        select sum(floor((fpt_last_time - fpt_first_time) * 24 *60 /30) *0.5) INTO v_overtime_restDay_One_Month
        from Attendance_Record AR
        where job_number = v_ar_job_number
        and trunc(fingerprint_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
        and fpt_first_time is not null
        and fpt_last_time is not null
        and fingerprint_date in (
            select Rest_Day
            from Rest_Day
            where trunc(Rest_Day,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
        );



       ----更新时 修改一下

       update AR_Summary
       set latest_off_duty = v_latest_off_duty,
            overtime_workday_one_month = v_overtime_workDay_One_Month,
           OVERTIME_RESTDAY_ONE_MONTH = v_overtime_restDay_One_Month,
           remark = '人工关联: ' || to_char(sysdate,'yyyy-MM-dd HH24:MI:SS')
       where AR_JOB_NUMBER = v_ar_job_number;
   end;
end PKG_GET_AR;
/

prompt
prompt Creating package body PKG_GET_SUMMARY_OF_AR
prompt ===========================================
prompt
create or replace package body dukepu.PKG_Get_Summary_Of_AR is
   
  /*
  此函数为 考勤系统： 考勤汇总 函数
  
  */
  function get_summary_of_ar(v_job_number varchar2,v_name nvarchar2,v_year_and_month varchar2) return cur_t
  as
         v_cur_result cur_t;
         v_ar_days INT;
         v_vacation_total_time INT;
         ---假期时间字符串： 
         v_vacation_time_str varchar2(200);
         v_NOT_FingerPrint_Times INT;
         v_Delay_Total_Time NUMBER;
         v_duration_of_overtime_days number;        ---加班日时长;
         v_delay_times_ordinary_days number;       ---平日延时;
         
         v_delay_times_wee_hours number;           --凌晨加班时间获取。
         
         v_COME_LATE_NUM INT;
         v_Leave_Early_Num INT;
         v_Dinner_Subsidy_num INT;
         

         PRAGMA AUTONOMOUS_TRANSACTION;
  begin
  
       --基于月份生成一个考勤汇总!
       --已检查
       
       --已检查      
       get_Actual_AR_Days(v_job_number,v_year_and_month, v_AR_Days);
       Dbms_Output.put_line('v_AR_Days: '||v_ar_days);
       --已检查
       GET_Total_TIME_For_A_F_L(v_job_number, v_year_and_month,v_vacation_total_time);
       Dbms_Output.put_line('v_vacation_total_time: '||v_vacation_total_time);
       --已检查
       Get_lack_FingerPrint_Times(v_Job_Number,v_year_and_month,v_NOT_FingerPrint_Times);
       Dbms_Output.put_line('v_NOT_FingerPrint_Times: '||v_NOT_FingerPrint_Times);

       ---平日延时获取。
       get_delay_times_ordinary_days(v_Job_Number,v_Year_And_Month,v_delay_times_ordinary_days);
       Dbms_Output.put_line('v_delay_times_ordinary_days: '||v_delay_times_ordinary_days);
       
       ---凌晨加班时间获取。
       GET_Delay_t_of_wee_hours_Ordin(v_Job_Number,v_Year_And_Month,v_delay_times_wee_hours);
       Dbms_Output.put_line('v_delay_times_wee_hours: '||v_delay_times_wee_hours);
       --休息日加班时长获取。
       get_duration_of_overtime_day(v_Job_Number,v_year_and_month,v_duration_of_overtime_days);
        Dbms_Output.put_line('v_duration_of_overtime_days: '||v_duration_of_overtime_days);
       --这里要对平日延时和加班日加班时长,凌晨加班时间 进行叠加。
       v_Delay_Total_Time:=v_delay_times_ordinary_days + v_duration_of_overtime_days + v_delay_times_wee_hours;
       Dbms_Output.put_line('v_Delay_Total_Time: '||v_Delay_Total_Time);
       get_Come_Late_Num(v_Job_Number,v_Year_And_Month,v_COME_LATE_NUM);
       Dbms_Output.put_line('v_COME_LATE_NUM: '||v_COME_LATE_NUM);
       get_Leave_Early_Num(v_Job_Number,v_Year_And_Month,v_Leave_Early_Num);
        Dbms_Output.put_line('v_Leave_Early_Num: '||v_Leave_Early_Num);
       Get_Dinner_Subsidy_Num(v_JOB_NUMBER, v_year_and_month, v_Dinner_Subsidy_num);
       Dbms_Output.put_line('v_Dinner_Subsidy_num: '||v_Dinner_Subsidy_num);

       --保存数据到 AR_Summary_Final;

       INSERT INTO AR_Summary_Final(
                                      job_number,
                                      name,
                                      days_of_real_attendance,
                                      not_finger_print,
                                      vacation_total_time,
                                      overtime_of_workday,
                                      OVERTIME_OF_WEE_HOURS_OF_WD,
                                      overtime_of_restday,
                                      come_late_num,
                                      leave_early_num,
                                      meal_subsidy,
                                      belong_to_month
       )VALUES(
               v_job_number,
               v_name,
               v_AR_Days,
               v_NOT_FingerPrint_Times,
               v_vacation_total_time,
               v_delay_times_ordinary_days,
               v_delay_times_wee_hours,
               v_duration_of_overtime_days,
               v_COME_LATE_NUM,
               v_Leave_Early_Num,
               v_Dinner_Subsidy_num,
               to_date(v_year_and_month,'yyyy-MM')
       );
        Dbms_Output.put_line('insert into AR_Summary_Final() values() : finished!');
       OPEN v_cur_result FOR
       SELECT v_ar_days AR_DAYS,
              v_vacation_total_time VACATION_TOTAL_TIME,
              --假期时间字符串。
              v_vacation_time_str   VACATION_TIME_STR,      
              v_NOT_FingerPrint_Times NOT_FINGERPRINT_TIMES,
              v_delay_times_ordinary_days DELAY_TIMES_OF_Ordinary_Days,
              v_delay_times_wee_hours OVERTIME_OF_WEE_HOURS_OF_WD,
              v_duration_of_overtime_days Duration_Of_Overtime_Days,
              v_Delay_Total_Time DELAY_TOTAL_TIME,
              v_COME_LATE_NUM COME_LATE_NUM,
              v_Leave_Early_Num LEAVE_EARLY_NUM,
              v_Dinner_Subsidy_num DINNER_SUBSIDY_NUM
        FROM DUAL;
        
        COMMIT;
         Dbms_Output.put_line('this row is upon the return statement!');    
        return v_cur_result;
  end;
end PKG_Get_Summary_Of_AR;
/

prompt
prompt Creating package body PKG_IMPORT_AR
prompt ===================================
prompt
create or replace package body dukepu.PKG_Import_AR is
  -- Private type declarations
  function import_AR(
                           v_start_date_str varchar2,
                           v_end_date_str varchar2,
                           v_tabulation_time_str varchar2,
                           v_fingerprint_date_str varchar2,
                           v_job_number varchar2,
                           v_name       nvarchar2,
                           v_dept       nvarchar2,
                           v_fpt_first_time_str       varchar2,
                           v_fpt_last_time_str        varchar2,
                           v_file_path                nvarchar2,
                           v_random_str               varchar2
                                   ) return int
   as
       ---现存工号
       v_job_number_existing varchar2(100);
       v_fpt_first_time_existing date;
       v_fpt_last_time_existing date;
       v_fpt_first_time_date date;
       v_fpt_last_time_date date;
       --最终的 比较值。
       v_job_number_final varchar2(100);
       v_fpt_first_time_final date;
       v_fpt_last_time_final  date;
       v_count int;
       v_index_of_jn int;     --现存 工号 索引
   begin
        SELECT COUNT(1) INTO v_count
        FROM Attendance_Record
        WHERE NAME = v_name
        AND Fingerprint_date = TO_DATE(v_fingerprint_date_str,'yyyy-MM-dd');

        IF(0=v_count)
        THEN
            INSERT INTO Attendance_Record(
                                         start_date,
                                         end_date,
                                         tabulation_time,
                                         fingerprint_date,
                                         job_number,
                                         name,
                                         dept,
                                         fpt_first_time,
                                         fpt_last_time,
                                         File_Path,
                                         random_str
            )VALUES(
                    TO_DATE(v_start_date_str,'yyyy-MM-dd'),
                    TO_DATE(v_end_date_str,'yyyy-MM-dd'),
                    TO_DATE(v_tabulation_time_str,'yyyy-MM-dd'),
                    TO_DATE(v_fingerprint_date_str,'yyyy-MM-dd'),
                    v_job_number,
                    v_name,
                    v_dept,
                    TO_DATE(v_fpt_first_time_str,'yyyy-MM-dd HH24:MI:SS'),
                    TO_DATE(v_fpt_last_time_str,'yyyy-MM-dd HH24:MI:SS'),
                    v_file_path,
                    v_random_str
             );
             return 1;
        END IF;

        v_fpt_first_time_date := TO_DATE(v_fpt_first_time_str,'yyyy-MM-dd HH24:MI:SS');
        v_fpt_last_time_date:=TO_DATE(v_fpt_last_time_str,'yyyy-MM-dd HH24:MI:SS');
        ---更新
        SELECT
               job_number,
               fpt_first_time,
               fpt_last_time
               INTO
               v_job_number_existing,
               v_fpt_first_time_existing,
               v_fpt_last_time_existing
        FROM Attendance_Record
        WHERE NAME = v_name
        AND Fingerprint_date = TO_DATE(v_fingerprint_date_str,'yyyy-MM-dd');

        if(v_fpt_first_time_existing is not null) then
               --比较大小.
               if(v_fpt_first_time_date< v_fpt_first_time_existing) then
                  --更新
                  v_fpt_first_time_final:=v_fpt_first_time_date;
               else
                  v_fpt_first_time_final:=v_fpt_first_time_existing;
               end if;
        else
             v_fpt_first_time_final:=v_fpt_first_time_date;
        end if;
        if(v_fpt_last_time_existing is not null) then
               --比较大小.
               if(v_fpt_last_time_date> v_fpt_last_time_existing) then
                  --更新
                  v_fpt_last_time_final:= v_fpt_last_time_date;
               else
                  v_fpt_last_time_final:= v_fpt_last_time_existing;
               end if;
        else
            v_fpt_last_time_final:=v_fpt_last_time_date;
        end if;

        --书写 工号。
        v_index_of_JN:=instr(v_job_number_existing,v_job_number);
        if(0=v_index_of_JN) then
            v_job_number_final:=v_job_number_existing || '_'||v_job_number;
        end if;

        UPDATE Attendance_Record
        SET JOB_NUMBER = v_job_number_final,
            fpt_first_time = v_fpt_first_time_final,
            fpt_last_time  = v_fpt_last_time_final,
            record_time = sysdate
        WHERE NAME = v_name
        AND Fingerprint_date = TO_DATE(v_fingerprint_date_str,'yyyy-MM-dd');

        return 1;
 EXCEPTION
        WHEN OTHERS 
        THEN 
           RAISE;
           RETURN 0;
 END;
end PKG_Import_AR;
/

prompt
prompt Creating package body PKG_REST_DAY
prompt ==================================
prompt
create or replace package body dukepu.PKG_Rest_Day is
function generate_rest_day(v_name nvarchar2,v_year_and_month varchar2) return t_cur
is
  --休息日： 最后 一日 。
       v_LastDay int;
       var_LastDay varchar2(2);
       v_date date;
       v_day nvarchar2(10);
       v_Count INT;
       v_cur t_cur;
       PRAGMA AUTONOMOUS_TRANSACTION;
begin

     SELECT TO_CHAR(LAST_DAY(TO_DATE(v_year_and_month,'yyyy-MM')),'dd') INTO var_LastDay
     FROM DUAL;

     v_LastDay:= CAST(var_LastDay AS INT);
     FOR i IN 1..v_LastDay
     LOOP
        SELECT TO_DATE(v_year_and_month || '-' || CAST(i AS varchar2(2)),'yyyy-MM-dd') INTO v_date
        FROM DUAL;


        SELECT TO_Char(v_date,'day') INTO v_day
        FROM DUAL;


        IF('星期日' =v_day) THEN
           SELECT COUNT(1) INTO v_Count
           FROM Rest_Day
           WHERE name = v_name
           AND Rest_Day =v_date;

           IF(v_Count=0) THEN

                INSERT INTO Rest_Day(name,Rest_Day,Update_Time)
                VALUES(
                       v_Name,
                       v_date,
                       Sysdate
                );

           END IF;

        end IF;

     END LOOP;

     commit;

     open v_cur
     for select name,
                rest_day,
                update_time
         from rest_day
         where trunc(rest_day,'MM') = to_date(v_year_and_month,'yyyy-MM')
         order by update_time desc;


       return v_cur;

  end;
  end Pkg_rest_day;
/

prompt
prompt Creating package body PKG_SALS_REPORT
prompt =====================================
prompt
create or replace package body dukepu.PKG_Sals_Report is
  -- Function and procedure implementations
    function getAR(v_dept nvarchar2,v_year_and_month_str varchar2)  return t_cur as
             v_cur t_cur;
             v_staffs_Info_cur t_cur;
    begin
           /*
             select dept,
                 name,
                 latest_off_duty,
                 overtime_workday_one_month,
                 overtime_restday_one_month,
                 remark,
                 belong_to_month
           from AR_Summary;
         */
         --先判断AR_Summary中，是否有无该月的汇总记录。
         open v_cur
         for
          select AR_Summary.dept,
                AR_Summary.name,
                '实出勤',--<实出勤>
                '未打卡',--<未打卡>
                overtime_workday_one_month,--<延点>
                overtime_restday_one_month,--<周日/加班>
                overtime_workday_one_month + overtime_restday_one_month as total_delay_time,--<总小时>
                (overtime_workday_one_month + overtime_restday_one_month)* 2 as total_overtime_pay--<加班费>
         from AR_Summary  inner join Attendance_Record AR
              ON (AR_Summary.Ar_Job_Number = AR.Job_Number
                 and trunc(ar_summary.belong_to_month,'MM') = trunc(AR.Fingerprint_Date,'MM')
                 )
         where AR_Summary.dept = v_dept
         and trunc(belong_To_month,'MM') = to_date(v_year_and_month_str,'yyyy-MM');


          return v_staffs_Info_cur;
    end;
     function getEarningOfProducts(v_report_dept nvarchar2,v_pn nvarchar2,v_dept nvarchar2,v_name nvarchar2,v_report_specific_month varchar2) return number
     as
       v_aggregate_amount number;
       v_count int;
     begin

          select count(1) into v_count
          from Products_Record
          where Report_Dept = v_report_dept
          and products_name =v_pn
          and dept = v_dept
          and name = v_name
          and trunc(report_specific_month,'MM') = to_date(v_report_specific_month,'yyyy-MM');

          if(v_count=0)
          then

            return 0;
          end if;



         select round(sum(amount_of_money),2) aggregate_amount into v_aggregate_amount
          from Products_Record
          where Report_Dept = v_report_dept
          and products_name =v_pn
          and dept = v_dept
          and name = v_name
          and trunc(report_specific_month,'MM') = to_date(v_report_specific_month,'yyyy-MM')
          and amount_of_money is not null;

          return v_aggregate_amount;
     end;

     function getEarningOfScatteredRecord(v_report_specific_month varchar2,v_dept nvarchar2,v_name nvarchar2) return number
     as
         v_aggregate_amount number;
       v_count int;
     begin
           select count(1) into v_count
            from Scattered_record
            where dept = v_dept
            and name = v_name
            and trunc(report_specific_month,'MM') = to_date(v_report_specific_month,'yyyy-MM');

           if(v_count=0)
           then
               return 0;

           end if;

            select sum(Aggregate_amount) into v_aggregate_amount
            from Scattered_record
            where dept = v_dept
            and name = v_name
            and trunc(report_specific_month,'MM') = to_date(v_report_specific_month,'yyyy-MM');

            return v_aggregate_amount;
     end;

end PKG_Sals_Report;
/

prompt
prompt Creating package body PKG_TO_EXPORT_AR_SUMMARY
prompt ==============================================
prompt
create or replace package body dukepu.PKG_TO_Export_AR_Summary is

   ---保存 AR至  Attendance_Record_Summary,异机同名 汇总 。
  procedure Save_AR_To_Summary_Table(v_year_and_month_str varchar2)
  as
  begin
       INSERT INTO Attendance_Record_Summary(
                              Start_date,
                              End_Date,
                              Tabulation_time,
                              fingerprint_date,
                              dept,
                              job_number,
                              name,
                              fpt_first_time,
                              fpt_last_time
                        )
                        select   T.Start_date,
                                 T.end_date,
                                 T.tabulation_time,
                                 T.fingerprint_date,
                                 replace(wm_concat(to_char(T.dept)),',','_') as dept,
                                 replace(wm_concat(T.job_number),',','_')  AS job_number,
                                 T.name,
                                 min(T.fpt_first_time) fpt_first_time,
                                 max(T.fpt_last_time)  fpt_last_time
                        from (
                               select   Start_date,
                                   end_date,
                                   tabulation_time,
                                   fingerprint_date,
                                   dept,
                                   cast (job_number as varchar2(20)) as job_number,
                                   name,
                                   fpt_first_time,
                                   fpt_last_time
                               from attendance_record ar
                               where trunc(fingerprint_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
                               order by job_number
                          ) T
                          where trunc(fingerprint_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
                          group by name,
                                   Start_date,
                                   end_date,
                                   tabulation_time,
                                   fingerprint_date
                          ORDER BY Job_number,
                                   fingerprint_date;

       end;

end PKG_TO_Export_AR_Summary;
/

prompt
prompt Creating package body PKG_TO_EXPORT_FROM_A_R_SUMMARY
prompt ====================================================
prompt
create or replace package body dukepu.PKG_TO_Export_From_A_R_Summary is

   ---保存 AR至  Attendance_Record_Summary,异机同名 汇总 。
  procedure Save_AR_To_Summary_Table(v_year_and_month_str varchar2)
  as
  begin
       INSERT INTO Attendance_Record_Summary(
                              Start_date,
                              End_Date,
                              Tabulation_time,
                              fingerprint_date,
                              dept,
                              job_number,
                              name,
                              fpt_first_time,
                              fpt_last_time
                        )
                        select   T.Start_date,
                                 T.end_date,
                                 T.tabulation_time,
                                 T.fingerprint_date,
                                 replace(wm_concat(to_char(T.dept)),',','_') as dept,
                                 replace(wm_concat(T.job_number),',','_')  AS job_number,
                                 T.name,
                                 min(T.fpt_first_time) fpt_first_time,
                                 max(T.fpt_last_time)  fpt_last_time
                        from (
                               select   Start_date,
                                   end_date,
                                   tabulation_time,
                                   fingerprint_date,
                                   dept,
                                   cast (job_number as varchar2(20)) as job_number,
                                   name,
                                   fpt_first_time,
                                   fpt_last_time
                               from attendance_record ar
                               where trunc(fingerprint_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
                               order by job_number
                          ) T
                          where trunc(fingerprint_date,'MM') = to_date(v_year_and_month_str,'yyyy-MM')
                          group by name,
                                   Start_date,
                                   end_date,
                                   tabulation_time,
                                   fingerprint_date
                          ORDER BY Job_number,
                                   fingerprint_date;

       end;
function get_summary_of_A_R_Summary(v_job_number varchar2,v_year_and_month varchar2) return t_cur
as
         v_cur_result t_cur;
         v_ar_days INT;
         v_vacation_total_time INT:=0;
         v_NOT_FingerPrint_Times INT;
         v_Delay_Total_Time NUMBER;
         v_duration_of_overtime_days number;        ---加班日时长;
         v_delay_times_ordinary_days number;       ---平日延时;
         v_COME_LATE_NUM INT;
         v_Leave_Early_Num INT;
         v_Dinner_Subsidy_num INT;

         PRAGMA AUTONOMOUS_TRANSACTION;
  begin

       get_Actual_AR_Days_Of_A_R_S(v_job_number,v_year_and_month, v_AR_Days);
       --GET_Total_TIME_For_A_F_L(v_job_number, v_year_and_month,v_vacation_total_time);
       Get_Not_FP_Times_Of_A_R_S(v_Job_Number,v_year_and_month,v_NOT_FingerPrint_Times);

       ---平日延时获取。
       get_d_t_ordinary_days_of_A_R_S(v_Job_Number,v_Year_And_Month,v_delay_times_ordinary_days);
       --休息日加班时长获取。
       get_duration_overtime_day_ARS(v_Job_Number,v_year_and_month,v_duration_of_overtime_days);
       --这里要对平日延时和加班日加班时长 进行叠加。
       v_Delay_Total_Time:=v_delay_times_ordinary_days + v_duration_of_overtime_days;
       get_Come_Late_Num_Of_ARS(v_Job_Number,v_Year_And_Month,v_COME_LATE_NUM);
       get_Leave_Early_Num_Of_ARS(v_Job_Number,v_Year_And_Month,v_Leave_Early_Num);
       Get_Dinner_Subsidy_Num_Of_ARS(v_JOB_NUMBER, v_year_and_month, v_Dinner_Subsidy_num);

       OPEN v_cur_result FOR
       SELECT v_ar_days AR_DAYS,
              v_vacation_total_time VACATION_TOTAL_TIME,
              v_NOT_FingerPrint_Times NOT_FINGERPRINT_TIMES,
              v_delay_times_ordinary_days DELAY_TIMES_OF_Ordinary_Days,
              v_duration_of_overtime_days Duration_Of_Overtime_Days,
              v_Delay_Total_Time DELAY_TOTAL_TIME,
              v_COME_LATE_NUM COME_LATE_NUM,
              v_Leave_Early_Num LEAVE_EARLY_NUM,
              v_Dinner_Subsidy_num DINNER_SUBSIDY_NUM
        FROM DUAL;

        COMMIT;

        return v_cur_result;
  end;
   procedure GET_A_R_Time(v_job_number varchar2,v_ar_day varchar2, v_cur_result out t_cur) as
  begin
       open v_cur_result
       FOR
          SELECT to_char(fpt_first_time,'HH24:MI') as fpt_first_time,
                 to_char(fpt_last_time,'HH24:MI') as fpt_last_time,
                 come_late_num,
                 leave_early_num
          FROM Attendance_Record_Summary
          WHERE job_number = v_job_number
          AND fingerprint_date = to_date(v_ar_day,'yyyy-MM-dd');

  end;
end PKG_TO_Export_From_A_R_Summary;
/

prompt
prompt Creating package body SHOW_PRODUCTS_COST
prompt ========================================
prompt
create or replace package body dukepu.Show_Products_Cost is

  -- Private type declarations
     --type cur_t is ref cursor;

  -- Private constant declarations
     --<ConstantName> constant <Datatype> := <Value>;

  -- Private variable declarations
  --<VariableName> <Datatype>;

  -- Function and procedure implementations
   function getProductsCostDetail(v_PN nvarchar2) return cur_t is
            v_cur cur_t;
   begin

        OPEN v_cur
        FOR

              select rownum as  "序号",
                       成衣名称,
                       概要工序,
                       具体工序,
                       工时,
                       单价,
                     提供者,
                     更新时间
              from
              (
               select
                    product_name AS "成衣名称",
                    summary_process AS "概要工序",
                    specific_process AS "具体工序",
                    man_hours AS "工时",
                    labour_cost AS "单价",
                    supplier AS "提供者",
                    update_time AS "更新时间"
              from Products_Cost
              where product_name = v_PN
              order by seq_p_c_record asc
              ) temp;


        return v_cur;

   end;
/*
    function getAllProductsCostSummary return cur_t is
             v_cur cur_t;
    begin

        OPEN v_cur
        FOR   select *
        from V_Products_Cost_Summary;

        return v_cur;
    end;
    */
        function getAllProductsCostSummary return cur_t is
             v_cur cur_t;
    begin

        OPEN v_cur
        FOR   select     V_Products_Cost_Summary.Product_Name,
                        total_man_hours,
                        total_labour_cost,
                        supplier,
                        latest_update_time,
                      products_picture.picture AS picture
        from V_Products_Cost_Summary inner join products_picture
             on V_Products_Cost_Summary.product_name = products_picture.product_name;

        return v_cur;

    end;
     function get_P_C_Summary_To_Export(v_PN nvarchar2) return cur_t is
              v_cur cur_t;
     begin
          OPEN v_cur
          FOR
            SELECT
            SEQ AS "序号",
               (CASE
                         WHEN Product_Name IS NULL THEN N'合计'
                         ELSE PRODUCT_NAME
                       END) AS "成衣名称",
                      summary_process AS "概要工序",
                      specific_process AS "具体工序",
                      man_hours AS "工时",
                      sum(labour_cost) as "工价",
                      supplier AS "提供者",
                      update_time AS "更新时间"
            FROM
            (
               SELECT SEQ_P_C_Record AS SEQ,
                          Product_Name,
                          summary_process,
                          specific_process,
                          man_hours,
                          labour_cost,
                          supplier,
                          update_time
               FROM Products_Cost
               WHERE Product_NAME = v_PN
              ) TEMP
       group by rollup (SEQ,Product_Name,summary_process,specific_process,man_hours,labour_cost,supplier,update_time)
        having (summary_process is not null and specific_process is not null and man_hours is not null and update_time is not null)
       OR (SEQ IS NULL AND Product_Name is null and Summary_Process is null and specific_process is  null and man_hours is  null and labour_cost is  null and update_time is  null);

        return v_cur;
     end;
     function get_P_C_Info_To_Piecework(v_PN nvarchar2) return cur_t
     is
              v_cur cur_t;
     begin
        OPEN v_cur
        FOR
            select
                  rownum as row_num,
                  product_name,
                  summary_process,
                  specific_process
            from
            (
                     select
                              product_name,
                          summary_process,
                          specific_process
                    from Products_Cost
                    where product_name = v_PN
                    order by SEQ_P_C_Record asc
            )temp;

        return v_cur;


     end;
     
     function get_P_C_Summary_By_Each_Part(v_PN nvarchar2)return cur_t
     as
       v_cur cur_t;
     begin
            
            open v_cur 
            for       
                select seq_p_C_Record,
                 product_name,
                 summary_process,
                 specific_Process,
                 specific_each_process,
                 man_hours,
                 amount,
                 each_cost,
                 labour_cost,
                 null as final_labour_cost
          from Products_Cost
          where product_name = v_PN
          order by seq_p_c_record asc;
          
          return v_cur;
     end;
     
end Show_Products_Cost;
/

prompt
prompt Creating package body SHOW_SALARY_EMPS
prompt ======================================
prompt
create or replace package body dukepu.Show_Salary_Emps is

  -- Private type declarations

  -- Private constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Private variable declarations
  --<VariableName> <Datatype>;

  -- Function and procedure implementations
 --从  计件 报表 中  获取  上个 月 所有 员工 信息。
  function getAllEmpsOfLastMonth return cur_t is
      v_cur cur_t  ;
  begin
       open v_cur
       for
      SELECT 工号,
              姓名,
              报表部门,
              考勤工号,
              考勤姓名,
              部门,
              报表月份
      FROM V_Salary_Emps;

      return v_cur;

  end;

end Show_Salary_Emps;
/

prompt
prompt Creating trigger TRIGGER_AFTER_DELETE_P_C
prompt =========================================
prompt
create or replace trigger DUKEPU.trigger_after_delete_P_C
 after delete on Products_Cost
 for each row


declare

 begin
      INSERT INTO Products_Cost_History(
          seq,
          summary_process,
          specific_process,
          man_hours,
          labour_cost,
          supplier,
          insert_time,
          Create_Time_Of_P_C,
          product_name,
          Seq_p_c_Record
      )
      VALUES(
             seq_products_cost_history.nextval,
             :old.Summary_Process,
             :old.specific_process,
             :old.man_hours,
             :old.labour_cost,
             :old.supplier,
             sysdate,
             :old.update_time,
             :old.product_name,
             :old.seq_p_c_record
            );


 end trigger_after_insert_P_C;
/

prompt
prompt Creating trigger TRIGGER_AFTER_INSERT_D_C
prompt =========================================
prompt
create or replace trigger DUKEPU.trigger_after_insert_D_C
  after insert on daily_capacity
  for each row
declare
  -- local variables here
begin

  INSERT INTO DAILY_CAPACITY_HISTORY(
         SEQ,
         JOB_NUMBER,
         NAME,
         PRODUCTS_NAME,
         SUMMARY_PROCESS,
         SPECIFIC_PROCESS,
         MANUFACTURE_QUANTITIES,
         YIELDS_TIME,
         SUBMIT_PERSON,
         UPDATE_TIME,
         SAVED_HISTORY_TIME
  )
  VALUES(
         :new.SEQ,
         :new.job_number,
         :new.name,
         :new.products_name,
         NVL(:new.summary_process,'NULL'),
         :new.specific_process,
         :new.manufacture_quantities,
         :new.yields_time,
         :new.submit_person,
         :new.update_time,
         SYSDATE
  );
end trigger_after_insert_D_C;
/

prompt
prompt Creating trigger TRIGGER_AFTER_INSERT_EMPS
prompt ==========================================
prompt
CREATE OR REPLACE TRIGGER DUKEPU.trigger_AFTER_INSERT_EMPS
  after insert on employees
  for each row
declare
  -- local variables here
begin
      if(:new.IS_ON_THE_JOB =1) THEN
         INSERT INTO USER_INFO(
                USER_NAME,
                DEPARTMENT,
                ACTION
         )VALUES(
                :new.JOB_NUMBER,    ---这里获取工号作为用户名。
                :new.department,
                'query'
         );
       END IF;
end trigger_AFTER_INSERT_EMPS;
/

prompt
prompt Creating trigger TRIGGER_AFTER_UPDATE_D_C
prompt =========================================
prompt
create or replace trigger DUKEPU.trigger_after_update_D_C
  after update on daily_capacity
  for each row
declare
  -- local variables here
begin

    INSERT INTO DAILY_CAPACITY_HISTORY(
         SEQ,
         JOB_NUMBER,
         NAME,
         PRODUCTS_NAME,
         SUMMARY_PROCESS,
         SPECIFIC_PROCESS,
         MANUFACTURE_QUANTITIES,
         YIELDS_TIME,
         SUBMIT_PERSON,
         UPDATE_TIME,
         SAVED_HISTORY_TIME
  )
  VALUES(
         :new.SEQ,
         :new.job_number,
         :new.name,
         :new.products_name,
         NVL(:new.summary_process,'NULL'),
         :new.specific_process,
         :new.manufacture_quantities,
         :new.yields_time,
         :new.submit_person,
         :new.update_time,
         SYSDATE
  );
end trigger_after_update_D_C;
/

prompt
prompt Creating trigger TRIGGER_AFTER_UPDATE_EMPLOYEES
prompt ===============================================
prompt
CREATE OR REPLACE TRIGGER DUKEPU.TRIGGER_AFTER_UPDATE_EMPLOYEES
  after update on employees
  for each row
declare
  -- local variables here
begin
  IF(:NEW.IS_ON_THE_JOB = 0) THEN
     DELETE FROM USER_INFO
     WHERE USER_NAME = (:NEW.JOB_NUMBER);
   ELSIF(:NEW.IS_ON_THE_JOB = 1) THEN
         UPDATE USER_INFO
         SET USER_NAME = :new.JOB_NUMBER,
             DEPARTMENT = :new.department
         WHERE USER_NAME = :OLD.JOB_NUMBER;
   END IF;
   EXCEPTION
              WHEN DUP_VAL_ON_INDEX THEN
                   DBMS_OUTPUT.put_line('工号重复，未能插入值到USER_INFO中！');
end;
/

prompt
prompt Creating trigger TRI_BEFORE_INSERT_ARBRIEFLY
prompt ============================================
prompt
create or replace trigger DUKEPU.tri_before_insert_ARBriefly
       before insert on Attendance_Record_Briefly
       for each row

       
declare 
       nextseq number;
begin
       if :New.seq = 0 or :new.seq is null then
          select Seq_Attendance_Record_Briefly.Nextval into nextseq
          from dual;
          :new.seq := nextseq;
       end if;
end;
/

prompt
prompt Creating trigger TRI_P_C_BAK_SEQ
prompt ================================
prompt
create or replace trigger DUKEPU.tri_P_C_bak_SEQ
  before insert on Products_Cost_bak
  for each row
declare
       nextseq number;
begin

     IF :new.SEQ IS NULL OR :new.SEQ = 0 THEN

        SELECT seq_p_c_bak.Nextval INTO nextseq
        FROM SYS.DUAL;

        :new.SEQ:= nextseq;

     END IF;


end;
/

prompt
prompt Creating trigger TRI_P_C_SEQ
prompt ============================
prompt
create or replace trigger DUKEPU.tri_P_C_SEQ
  before insert on Products_Cost
  for each row
declare
       nextseq number;
begin

     IF :new.SEQ IS NULL OR :new.SEQ = 0 THEN

        SELECT SEQ_PRODUCTS_COST.Nextval INTO nextseq
        FROM SYS.DUAL;

        :new.SEQ:= nextseq;

     END IF;


end;
/

prompt
prompt Creating trigger TRI_SET_SEQ_OF_A_R_DETAIL
prompt ==========================================
prompt
create or replace trigger DUKEPU.tri_set_seq_of_a_r_detail
       before insert on Attendance_Record_Detail
       for each row
declare
       nextseq number;
begin
       if :new.seq is null or :new.seq = 0 then
          select seq_attendance_record_detail.nextval into nextseq
          from dual;

          :new.seq:= nextseq;

       end if;
end;
/

prompt
prompt Creating trigger TRI_UPDATE_JN_AFT_INS_EMPS
prompt ===========================================
prompt
create or replace trigger DUKEPU.TRI_UPDATE_JN_AFT_INS_Emps
  after insert on employees
  for each row
declare
  V_JOB_NUMBER Employees.Job_Number%TYPE;
begin
     SELeCT get_job_number_f INTO V_JOB_NUMBER
     FROM DUAL;

     UPDATE EMPLOYEES
     SET JOB_NUMBER = V_JOB_NUMBER
     WHERE Rowid = :new.rowID;
end TRIGGER_AFTER_INSERT_Emps_T;
/


spool off
