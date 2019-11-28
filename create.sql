CREATE TABLE User(
    UserName VARCHAR(25) not null,
    DisplayName VARCHAR(50),
    Email VARCHAR(254) not null, --limited by email specs
    Description VARCHAR(500),
    JoinDate TIMESTAMP not null,
    PRIMARY KEY(UserName)
);

CREATE TABLE Repo(
    RepoName VARCHAR(100) not null,
    UserName VARCHAR(25) not null,
    UniqueID INTEGER not null,
    StartDate TIMESTAMP not null,
    PRIMARY KEY(UniqueID)
);

CREATE TABLE Branch(
    ID INTEGER not null,
    CreateDate TIMESTAMP not null,
    BranchName VARCHAR(50) not null,
    Repo INTEGER not null,
    Description VARCHAR(500),
    LatestCommit INTEGER not null,
    PRIMARY KEY(ID)
);

CREATE TABLE BranchCommit(
    ID INTEGER not null,
    Branch INTEGER not null,
    CommitComment VARCHAR(500),
    CommitTitle VARCHAR(100) not null,
    DateTime TIMESTAMP not null,
    PRIMARY KEY(ID)
);

CREATE TABLE CommitChange(
    ChangeID INTEGER not null,
    FileName VARCHAR(100) not null,
    Old BLOB not null,
    New BLOB not null,
    PRIMARY KEY(ChangeID)
);

CREATE TABLE CommitComment(
    CommitID INTEGER not null,
    UserName VARCHAR(25) not null,
    ChangeID INTEGER not null,
    Text VARCHAR(1000) not null,
    PRIMARY KEY(CommitID)
);
