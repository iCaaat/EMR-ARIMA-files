CREATE USER 'emr_dev'@'%' IDENTIFIED BY 'LuckyBY.#dev*0128';

GRANT CREATE ON emr_arima_dev.* TO 'emr_dev'@'%';
GRANT ALTER ON emr_arima_dev.* TO 'emr_dev'@'%';
GRANT DROP ON emr_arima_dev.* TO 'emr_dev'@'%';
GRANT SELECT ON emr_arima_dev.* TO 'emr_dev'@'%';
GRANT UPDATE ON emr_arima_dev.* TO 'emr_dev'@'%';
GRANT INSERT ON emr_arima_dev.* TO 'emr_dev'@'%';
GRANT DELETE ON emr_arima_dev.* TO 'emr_dev'@'%';
GRANT PROCESS ON *.* TO 'emr_dev'@'%';
GRANT LOCK TABLES ON emr_arima_dev.* TO 'emr_dev'@'%';