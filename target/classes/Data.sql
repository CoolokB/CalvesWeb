insert into usr (id, username, password, active)
    values (1, 'admin', '$2y$08$ROnMAVBo/mfAUnP3AeeYkOJ4rp4YDNvQreO32m0HFuidUN5nSmWmG', true);

insert into user_role (user_id, roles)
    values (1, 'USER'), (1, 'ADMIN');
