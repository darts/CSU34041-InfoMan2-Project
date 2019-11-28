-- Senán d'Art
-- 17329580

CREATE TABLE user(
    user_name VARCHAR(25) not null,
    display_name VARCHAR(50),
    email VARCHAR(254) not null,
    u_description VARCHAR(500),
    join_date TIMESTAMP not null,
    PRIMARY KEY(user_name)
);

CREATE TABLE repo(
    unique_ID INTEGER not null,
    repo_name VARCHAR(100) not null,
    user_name VARCHAR(25) not null,
    start_date TIMESTAMP not null,
    public BOOLEAN not null,
    PRIMARY KEY(unique_ID)
);

CREATE TABLE branch(
    ID INTEGER not null,
    create_date TIMESTAMP not null,
    branch_name VARCHAR(50) not null,
    repo INTEGER not null,
    b_description VARCHAR(500),
    latest_commit INTEGER,
    PRIMARY KEY(ID)
);

CREATE TABLE bcommit(
    ID INTEGER not null,
    branch INTEGER not null,
    commit_comment VARCHAR(500),
    commit_title VARCHAR(100) not null,
    date_time TIMESTAMP not null,
    PRIMARY KEY(ID)
);

CREATE TABLE cchange(
    change_ID INTEGER not null,
    file_name VARCHAR(100) not null,
    f_old BLOB not null,
    f_new BLOB not null,
    commit_ID INTEGER not null,
    PRIMARY KEY(change_ID)
);

CREATE TABLE ccomment(
    commit_ID INTEGER not null,
    user_name VARCHAR(25) not null,
    change_ID INTEGER not null,
    comment_text VARCHAR(1000) not null,
    PRIMARY KEY(commit_ID)
);
