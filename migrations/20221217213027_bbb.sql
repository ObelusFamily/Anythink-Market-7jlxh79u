update users set nickname='' where nickname is null;
alter table users alter column  nickname set not null;

