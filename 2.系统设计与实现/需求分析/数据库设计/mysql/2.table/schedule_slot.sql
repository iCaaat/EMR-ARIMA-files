CREATE TABLE IF NOT EXISTS `schedule_slot` (
	`slot_id` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`schedule_id` INTEGER NOT NULL COMMENT '排班id',
	`period` VARCHAR(64) NOT NULL COMMENT '时段',
	`max_number` INTEGER NOT NULL COMMENT '最大号源',
	`remain_number` INTEGER NOT NULL COMMENT '剩余号源',
	`fee` INTEGER NOT NULL COMMENT '挂号费',
	`create_time` DATETIME NOT NULL COMMENT '创建时间',
	PRIMARY KEY(`slot_id`)
) COMMENT='排班表';