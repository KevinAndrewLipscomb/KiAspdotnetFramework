create user if not exists 'ki-kiaspdotnetframework'@'127.0.0.1' identified by '~ki-kiaspdotnetframework-password~';
grant select
 , insert
 , update
 , delete
 , create
 , create routine
 , alter routine
  on kiaspdotnetframeworkdb.*
  to 'ki-kiaspdotnetframework'@'127.0.0.1'
;
--
-- Must grant PROCESS priv to primary user to include SHOW ENGINE INNODB
-- STATUS output in MySQL-related exception reports.
--
;
grant process
  on *.*
  to 'ki-kiaspdotnetframework'@'127.0.0.1'