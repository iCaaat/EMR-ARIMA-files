CREATE TABLE IF NOT EXISTS `doctor_schedule` (
	`schedule_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`doctor_id` INTEGER NOT NULL COMMENT '医生id',
	`department_id` INTEGER NOT NULL COMMENT '科室id',
	`work_date` DATE NOT NULL COMMENT '排班日期',
	`status` INTEGER NOT NULL DEFAULT 0 COMMENT '是否出诊',
	`create_time` DATETIME NOT NULL DEFAULT 'CURRENTTIME_STAMP' COMMENT '创建时间',
	PRIMARY KEY(`schedule_id`)
);