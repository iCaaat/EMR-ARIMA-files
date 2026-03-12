CREATE TABLE IF NOT EXISTS `department` (
	`department_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(128) NOT NULL COMMENT '科室名称',
	`parent_id` INTEGER NOT NULL COMMENT '父级科室id',
	`sort` INTEGER COMMENT '排序字段',
	`description` VARCHAR(4000) COMMENT '描述',
	`create_time` DATETIME NOT NULL COMMENT '创建时间',
	PRIMARY KEY(`department_id`)
) COMMENT='科室';