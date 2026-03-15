CREATE USER 'emr_test'@'%' IDENTIFIED BY 'LuckyBY.#dev*0128';

GRANT CREATE ON emr_arima_test.* TO 'emr_test'@'%';
GRANT ALTER ON emr_arima_test.* TO 'emr_test'@'%';
GRANT DROP ON emr_arima_test.* TO 'emr_test'@'%';
GRANT SELECT ON emr_arima_test.* TO 'emr_test'@'%';
GRANT UPDATE ON emr_arima_test.* TO 'emr_test'@'%';
GRANT INSERT ON emr_arima_test.* TO 'emr_test'@'%';
GRANT DELETE ON emr_arima_test.* TO 'emr_test'@'%';
GRANT PROCESS ON *.* TO 'emr_test'@'%';
GRANT LOCK TABLES ON emr_arima_test.* TO 'emr_test'@'%';