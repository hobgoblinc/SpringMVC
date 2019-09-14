drop table if exists `USERS`;
create table `USERS`(
    `id` varchar(32) not null,
    `name` varchar(255),
    `user_id` varchar(32),
    primary key (`id`)
);
drop table if exists `ROLE`;
create table `ROLE`(
    `id` varchar(32) not null,
    `name` varchar(255),
    `role_id` varchar(32),
    primary key (`id`)
);

drop table if exists `USERS_ROLE`;
create table `USERS_ROLE`(
    `user_id` varchar(32),
    `role_id` varchar(32)
);