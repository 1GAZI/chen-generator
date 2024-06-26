CREATE database if NOT EXISTS `xxl-job` default character set utf8 collate utf8_general_ci;
use `xxl-job`;



CREATE TABLE XXL_JOB_QRTZ_JOB_DETAILS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    JOB_NAME  VARCHAR(200) NOT NULL,
    JOB_GROUP VARCHAR(200) NOT NULL,
    DESCRIPTION VARCHAR(250) NULL,
    JOB_CLASS_NAME   VARCHAR(250) NOT NULL,
    IS_DURABLE VARCHAR(1) NOT NULL,
    IS_NONCONCURRENT VARCHAR(1) NOT NULL,
    IS_UPDATE_DATA VARCHAR(1) NOT NULL,
    REQUESTS_RECOVERY VARCHAR(1) NOT NULL,
    JOB_DATA BLOB NULL,
    PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
);

CREATE TABLE XXL_JOB_QRTZ_TRIGGERS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    JOB_NAME  VARCHAR(200) NOT NULL,
    JOB_GROUP VARCHAR(200) NOT NULL,
    DESCRIPTION VARCHAR(250) NULL,
    NEXT_FIRE_TIME BIGINT(13) NULL,
    PREV_FIRE_TIME BIGINT(13) NULL,
    PRIORITY INTEGER NULL,
    TRIGGER_STATE VARCHAR(16) NOT NULL,
    TRIGGER_TYPE VARCHAR(8) NOT NULL,
    START_TIME BIGINT(13) NOT NULL,
    END_TIME BIGINT(13) NULL,
    CALENDAR_NAME VARCHAR(200) NULL,
    MISFIRE_INSTR SMALLINT(2) NULL,
    JOB_DATA BLOB NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
        REFERENCES XXL_JOB_QRTZ_JOB_DETAILS(SCHED_NAME,JOB_NAME,JOB_GROUP)
);

CREATE TABLE XXL_JOB_QRTZ_SIMPLE_TRIGGERS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    REPEAT_COUNT BIGINT(7) NOT NULL,
    REPEAT_INTERVAL BIGINT(12) NOT NULL,
    TIMES_TRIGGERED BIGINT(10) NOT NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES XXL_JOB_QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE XXL_JOB_QRTZ_CRON_TRIGGERS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    CRON_EXPRESSION VARCHAR(200) NOT NULL,
    TIME_ZONE_ID VARCHAR(80),
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES XXL_JOB_QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE XXL_JOB_QRTZ_SIMPROP_TRIGGERS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    STR_PROP_1 VARCHAR(512) NULL,
    STR_PROP_2 VARCHAR(512) NULL,
    STR_PROP_3 VARCHAR(512) NULL,
    INT_PROP_1 INT NULL,
    INT_PROP_2 INT NULL,
    LONG_PROP_1 BIGINT NULL,
    LONG_PROP_2 BIGINT NULL,
    DEC_PROP_1 NUMERIC(13,4) NULL,
    DEC_PROP_2 NUMERIC(13,4) NULL,
    BOOL_PROP_1 VARCHAR(1) NULL,
    BOOL_PROP_2 VARCHAR(1) NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES XXL_JOB_QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE XXL_JOB_QRTZ_BLOB_TRIGGERS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    BLOB_DATA BLOB NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES XXL_JOB_QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE XXL_JOB_QRTZ_CALENDARS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    CALENDAR_NAME  VARCHAR(200) NOT NULL,
    CALENDAR BLOB NOT NULL,
    PRIMARY KEY (SCHED_NAME,CALENDAR_NAME)
);

CREATE TABLE XXL_JOB_QRTZ_PAUSED_TRIGGER_GRPS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_GROUP  VARCHAR(200) NOT NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP)
);

CREATE TABLE XXL_JOB_QRTZ_FIRED_TRIGGERS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    ENTRY_ID VARCHAR(95) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    INSTANCE_NAME VARCHAR(200) NOT NULL,
    FIRED_TIME BIGINT(13) NOT NULL,
    SCHED_TIME BIGINT(13) NOT NULL,
    PRIORITY INTEGER NOT NULL,
    STATE VARCHAR(16) NOT NULL,
    JOB_NAME VARCHAR(200) NULL,
    JOB_GROUP VARCHAR(200) NULL,
    IS_NONCONCURRENT VARCHAR(1) NULL,
    REQUESTS_RECOVERY VARCHAR(1) NULL,
    PRIMARY KEY (SCHED_NAME,ENTRY_ID)
);

CREATE TABLE XXL_JOB_QRTZ_SCHEDULER_STATE
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    INSTANCE_NAME VARCHAR(200) NOT NULL,
    LAST_CHECKIN_TIME BIGINT(13) NOT NULL,
    CHECKIN_INTERVAL BIGINT(13) NOT NULL,
    PRIMARY KEY (SCHED_NAME,INSTANCE_NAME)
);

CREATE TABLE XXL_JOB_QRTZ_LOCKS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    LOCK_NAME  VARCHAR(40) NOT NULL,
    PRIMARY KEY (SCHED_NAME,LOCK_NAME)
);



CREATE TABLE `XXL_JOB_QRTZ_TRIGGER_INFO` (
                                             `id` int(11) NOT NULL AUTO_INCREMENT,
                                             `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
                                             `job_cron` varchar(128) NOT NULL COMMENT '任务执行CRON',
                                             `job_desc` varchar(255) NOT NULL,
                                             `add_time` datetime DEFAULT NULL,
                                             `update_time` datetime DEFAULT NULL,
                                             `author` varchar(64) DEFAULT NULL COMMENT '作者',
                                             `alarm_email` varchar(255) DEFAULT NULL COMMENT '报警邮件',
                                             `executor_route_strategy` varchar(50) DEFAULT NULL COMMENT '执行器路由策略',
                                             `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
                                             `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
                                             `executor_block_strategy` varchar(50) DEFAULT NULL COMMENT '阻塞处理策略',
                                             `executor_timeout` int(11) NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
                                             `executor_fail_retry_count` int(11) NOT NULL DEFAULT '0' COMMENT '失败重试次数',
                                             `glue_type` varchar(50) NOT NULL COMMENT 'GLUE类型',
                                             `glue_source` mediumtext COMMENT 'GLUE源代码',
                                             `glue_remark` varchar(128) DEFAULT NULL COMMENT 'GLUE备注',
                                             `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
                                             `child_jobid` varchar(255) DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
                                             PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `XXL_JOB_QRTZ_TRIGGER_LOG` (
                                            `id` int(11) NOT NULL AUTO_INCREMENT,
                                            `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
                                            `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
                                            `executor_address` varchar(255) DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
                                            `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
                                            `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
                                            `executor_sharding_param` varchar(20) DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
                                            `executor_fail_retry_count` int(11) NOT NULL DEFAULT '0' COMMENT '失败重试次数',
                                            `trigger_time` datetime DEFAULT NULL COMMENT '调度-时间',
                                            `trigger_code` int(11) NOT NULL COMMENT '调度-结果',
                                            `trigger_msg` text COMMENT '调度-日志',
                                            `handle_time` datetime DEFAULT NULL COMMENT '执行-时间',
                                            `handle_code` int(11) NOT NULL COMMENT '执行-状态',
                                            `handle_msg` text COMMENT '执行-日志',
                                            `alarm_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
                                            PRIMARY KEY (`id`),
                                            KEY `I_trigger_time` (`trigger_time`),
                                            KEY `I_handle_code` (`handle_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `XXL_JOB_QRTZ_TRIGGER_LOGGLUE` (
                                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                                `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
                                                `glue_type` varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
                                                `glue_source` mediumtext COMMENT 'GLUE源代码',
                                                `glue_remark` varchar(128) NOT NULL COMMENT 'GLUE备注',
                                                `add_time` timestamp NULL DEFAULT NULL,
                                                `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
                                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE XXL_JOB_QRTZ_TRIGGER_REGISTRY (
                                               `id` int(11) NOT NULL AUTO_INCREMENT,
                                               `registry_group` varchar(255) NOT NULL,
                                               `registry_key` varchar(255) NOT NULL,
                                               `registry_value` varchar(255) NOT NULL,
                                               `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                               PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `XXL_JOB_QRTZ_TRIGGER_GROUP` (
                                              `id` int(11) NOT NULL AUTO_INCREMENT,
                                              `app_name` varchar(64) NOT NULL COMMENT '执行器AppName',
                                              `title` varchar(12) NOT NULL COMMENT '执行器名称',
                                              `order` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
                                              `address_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
                                              `address_list` varchar(512) DEFAULT NULL COMMENT '执行器地址列表，多地址逗号分隔',
                                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO `XXL_JOB_QRTZ_TRIGGER_GROUP`(`id`, `app_name`, `title`, `order`, `address_type`, `address_list`) VALUES (1, 'xxl-job-executor-sample', '示例执行器', 1, 0, NULL);
INSERT INTO `XXL_JOB_QRTZ_TRIGGER_INFO`(`id`, `job_group`, `job_cron`, `job_desc`, `add_time`, `update_time`, `author`, `alarm_email`, `executor_route_strategy`, `executor_handler`, `executor_param`, `executor_block_strategy`, `executor_timeout`, `executor_fail_retry_count`, `glue_type`, `glue_source`, `glue_remark`, `glue_updatetime`, `child_jobid`) VALUES (1, 1, '0 0 0 * * ? *', '测试任务1', '2018-11-03 22:21:31', '2018-11-03 22:21:31', 'XXL', '', 'FIRST', 'demoJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2018-11-03 22:21:31', '');

commit;


