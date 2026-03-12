CREATE TABLE IF NOT EXISTS `doctor_exp` (
	`doctor_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE COMMENT '医生id',
	`department_id` INTEGER NOT NULL COMMENT '科室id',
	`uid` INTEGER NOT NULL UNIQUE COMMENT '用户唯一id',
	`real_name` VARCHAR(32) NOT NULL COMMENT '真实姓名',
	`id_card` VARCHAR(32) NOT NULL COMMENT '身份证号',
	`gender` VARCHAR(1) NOT NULL COMMENT '性别',
	`specialty` VARCHAR(128) NOT NULL COMMENT '专长',
	`description` VARCHAR(4000) COMMENT '简介',
	`qualification` VARCHAR(255) NOT NULL COMMENT '资格证书',
	`experience_years` INTEGER DEFAULT 0 COMMENT '工作年限',
	`doctor_title` VARCHAR(16) COMMENT '敬称',
	`fee` INTEGER NOT NULL COMMENT '挂号费',
	`avatar` BLOB COMMENT '医生头像',
	`status` INTEGER NOT NULL DEFAULT 0 COMMENT '是否可预约',
	`create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
	PRIMARY KEY(`doctor_id`)
) COMMENT='医生扩展信息';