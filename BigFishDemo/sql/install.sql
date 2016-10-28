create schema bigfish;
create user 'bigfish'@'localhost' identified by 'bigfish';
grant all privileges on bigfish.* to 'bigfish'@'localhost' with grant option;