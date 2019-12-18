-- Senán d'Art
-- 17329580

CREATE TABLE user(
    user_name VARCHAR(25) not null,
    display_name VARCHAR(50),
    email VARCHAR(254) not null unique,
    u_description VARCHAR(500),
    join_date TIMESTAMP not null,
    PRIMARY KEY(user_name)
);

CREATE TABLE repo(
    unique_ID INTEGER not null AUTO_INCREMENT,
    repo_name VARCHAR(100) not null,
    user_name VARCHAR(25) not null,
    start_date TIMESTAMP not null,
    public BOOLEAN not null,
    PRIMARY KEY(unique_ID),
    FOREIGN KEY (user_name) REFERENCES user(user_name)
); 



CREATE TABLE bcommit(
    ID INTEGER not null AUTO_INCREMENT,
    branch INTEGER not null,
    commit_comment VARCHAR(500),
    commit_title VARCHAR(100) not null,
    date_time TIMESTAMP not null,
    PRIMARY KEY(ID)
);

CREATE TABLE branch(
    ID INTEGER not null AUTO_INCREMENT,
    create_date TIMESTAMP not null,
    branch_name VARCHAR(50) not null,
    repo INTEGER not null,
    b_description VARCHAR(500),
    latest_commit INTEGER,
    PRIMARY KEY(ID),
    FOREIGN KEY (repo) REFERENCES repo(unique_ID),
    FOREIGN KEY (latest_commit) REFERENCES bcommit(ID)
);

ALTER TABLE bcommit 
ADD FOREIGN KEY (branch) REFERENCES branch(ID);

CREATE TABLE cchange(
    change_ID INTEGER not null AUTO_INCREMENT,
    file_name VARCHAR(100) not null,
    f_old BLOB,
    f_new BLOB not null,
    commit_ID INTEGER not null,
    PRIMARY KEY(change_ID),
    FOREIGN KEY (commit_ID) REFERENCES bcommit(ID)
);

CREATE TABLE ccomment(
    comment_ID INTEGER not null AUTO_INCREMENT,
    user_name VARCHAR(25) not null,
    change_ID INTEGER not null,
    comment_text VARCHAR(1000) not null,
    date_time TIMESTAMP not null,
    PRIMARY KEY(comment_ID),
    FOREIGN KEY (change_ID) REFERENCES cchange(change_ID),
    FOREIGN KEY (user_name) REFERENCES user(user_name)
);
