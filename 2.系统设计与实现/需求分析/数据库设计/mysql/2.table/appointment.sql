CREATE TABLE IF NOT EXISTS `appointment` (
	`appointment_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`patient_id` INTEGER NOT NULL COMMENT '就诊人id',
	`doctor_id` INTEGER NOT NULL COMMENT '医生',
	`department_id` INTEGER NOT NULL COMMENT '科室',
	`slot_id` INTEGER NOT NULL COMMENT '号源',
	`visit_date` DATE NOT NULL COMMENT '就诊日期',
	`period` VARCHAR(64) NOT NULL,
	`queue_number` INTEGER NOT NULL COMMENT '就诊序号',
	`fee` INTEGER NOT NULL COMMENT '挂号费',
	`status` INTEGER NOT NULL DEFAULT 0 COMMENT '状态',
	`create_time` DATETIME NOT NULL,
	PRIMARY KEY(`appointment_id`)
) COMMENT='挂号记录表';