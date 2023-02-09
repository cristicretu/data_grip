create table users
(
    id serial primary key,
    first_name varchar(255) not null,
    last_name  text,
    age int,
    email text unique not null
);

drop table users;

insert into users (first_name, last_name, age, email) VALUES ('Bob', 'jr.', 23, 'bob@bob3.com');

select first_name, last_name, age, email from users;
select * from users;

alter table users drop column age;
alter table users add column age int not null default 0;

select * from users where id = 1 and first_name = 'Bob';
select * from users where id in (1, 4, 2);

update users
set age = 24
where id = 2;

create table blogs (
    id serial primary key,
    title text not null,
    body text default '...',
    creator_id int references users(id) not null
);

drop database posts;


insert into blogs (title, body, creator_id) values ('hello', 'a', 1);

select * from blogs ;

select users.id, users.first_name, title, p.id from users
left join blogs p on users.id = p.creator_id;

create table comments (
    id serial primary key,
    message text not null,
    creator_id int references users(id),
    blog_id int references blogs(id)
);

insert into comments (message, creator_id, blog_id) VALUES ('great blog', 5, 10);
select c.message, b.title, u.id first_name_for_post, u2.id last_name_for_comment from comments c
inner join blogs b on c.blog_id = b.id
inner join users u on b.creator_id = u.id
inner join users u2 on c.creator_id = u2.id;
-- 53:31
