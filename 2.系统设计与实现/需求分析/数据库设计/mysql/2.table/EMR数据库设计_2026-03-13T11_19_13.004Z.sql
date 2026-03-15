CREATE TABLE IF NOT EXISTS `user_base` (
	`uid` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`username` VARCHAR(64) NOT NULL UNIQUE COMMENT '登录用户名',
	`password` VARCHAR(128) NOT NULL COMMENT '登录密码',
	`phone` VARCHAR(32) COMMENT '联系电话',
	`email` VARCHAR(128) COMMENT '邮箱',
	`real_name` VARCHAR(32) COMMENT '账号真实姓名',
	`id_card` VARCHAR(32) COMMENT '账号身份证',
	`create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
	PRIMARY KEY(`uid`)
) COMMENT='用户基本字段表';


CREATE TABLE IF NOT EXISTS `role` (
	`role_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`role_name` VARCHAR(64) NOT NULL COMMENT '角色名称',
	`role_code` VARCHAR(64) NOT NULL UNIQUE COMMENT '角色编码',
	`description` VARCHAR(256) NOT NULL COMMENT '角色描述',
	`create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	PRIMARY KEY(`role_id`)
) COMMENT='角色表';


CREATE TABLE IF NOT EXISTS `user_role` (
	`id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`uid` INTEGER NOT NULL COMMENT '用户id',
	`role_id` INTEGER NOT NULL COMMENT '角色id',
	PRIMARY KEY(`id`)
) COMMENT='用户-角色关联表';


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
	`avatar` VARCHAR(512) COMMENT '医生头像',
	`status` INTEGER NOT NULL DEFAULT 0 COMMENT '是否可预约',
	`create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
	PRIMARY KEY(`doctor_id`)
) COMMENT='医生扩展信息';


CREATE TABLE IF NOT EXISTS `patient_exp` (
	`patient_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`belonging_uid` INTEGER NOT NULL COMMENT '所属账号',
	`real_name` VARCHAR(32) NOT NULL COMMENT '真实姓名',
	`id_card` VARCHAR(32) NOT NULL COMMENT '身份证号',
	`gender` VARCHAR(1) NOT NULL COMMENT '性别',
	`birthday` DATE COMMENT '出生日期',
	`address` VARCHAR(128) COMMENT '地址',
	`nationality` VARCHAR(32) COMMENT '民族',
	`occupation` VARCHAR(32) COMMENT '职业',
	`marital_status` INTEGER COMMENT '婚姻状况',
	`emergency_phone` VARCHAR(32) COMMENT '紧急联系人',
	`emergency_contact` VARCHAR(32) COMMENT '紧急联系电话',
	`insurance_number` VARCHAR(255) COMMENT '医疗保险号',
	`medical_history` TEXT(65535) COMMENT '医疗史',
	`allergies` TEXT(65535) COMMENT '过敏信息',
	`relation` VARCHAR(32) NOT NULL DEFAULT 'self' COMMENT '与账号关系',
	`create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
	PRIMARY KEY(`patient_id`)
) COMMENT='患者扩展信息';


CREATE TABLE IF NOT EXISTS `admin_exp` (
	`admin_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`uid` INTEGER NOT NULL UNIQUE,
	`department` VARCHAR(255) NOT NULL COMMENT '所属部门',
	`create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
	PRIMARY KEY(`admin_id`)
) COMMENT='管理员扩展信息';


CREATE TABLE IF NOT EXISTS `department` (
	`department_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(128) NOT NULL COMMENT '科室名称',
	`parent_id` INTEGER NOT NULL COMMENT '父级科室id',
	`sort` INTEGER COMMENT '排序字段',
	`description` VARCHAR(4000) COMMENT '描述',
	`create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	PRIMARY KEY(`department_id`)
) COMMENT='科室';


CREATE TABLE IF NOT EXISTS `schedule_slot` (
	`slot_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`schedule_id` INTEGER NOT NULL COMMENT '排班id',
	`period` VARCHAR(64) NOT NULL COMMENT '时段',
	`max_number` INTEGER NOT NULL COMMENT '最大号源',
	`remain_number` INTEGER NOT NULL COMMENT '剩余号源',
	`fee` INTEGER NOT NULL COMMENT '挂号费',
	`create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	PRIMARY KEY(`slot_id`)
) COMMENT='排班表';


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
	`create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(`appointment_id`)
) COMMENT='挂号记录表';


CREATE TABLE IF NOT EXISTS `doctor_schedule` (
	`schedule_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`doctor_id` INTEGER NOT NULL COMMENT '医生id',
	`department_id` INTEGER NOT NULL COMMENT '科室id',
	`work_date` DATE NOT NULL COMMENT '排班日期',
	`status` INTEGER NOT NULL DEFAULT 0 COMMENT '是否出诊',
	`create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	PRIMARY KEY(`schedule_id`)
);


CREATE TABLE IF NOT EXISTS `file_info` (
	`id` BIGINT NOT NULL AUTO_INCREMENT UNIQUE,
	`original_name` VARCHAR(256) NOT NULL COMMENT '原始文件名',
	`file_name` VARCHAR(256) NOT NULL COMMENT '系统生成文件名',
	`file_path` VARCHAR(512) NOT NULL COMMENT '相对路径',
	`file_size` BIGINT NOT NULL COMMENT '文件大小',
	`file_type` VARCHAR(64) NOT NULL COMMENT '文件类型',
	`create_time` DATETIME NOT NULL,
	PRIMARY KEY(`id`)
);


ALTER TABLE `user_role`
ADD FOREIGN KEY(`uid`) REFERENCES `user_base`(`uid`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `user_role`
ADD FOREIGN KEY(`role_id`) REFERENCES `role`(`role_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `user_base`
ADD FOREIGN KEY(`uid`) REFERENCES `doctor_exp`(`uid`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `user_base`
ADD FOREIGN KEY(`uid`) REFERENCES `patient_exp`(`belonging_uid`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `user_base`
ADD FOREIGN KEY(`uid`) REFERENCES `admin_exp`(`uid`)
ON UPDATE NO ACTION ON DELETE NO ACTION;