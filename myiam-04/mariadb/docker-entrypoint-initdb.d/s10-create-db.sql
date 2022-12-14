CREATE DATABASE idm_db;
CREATE USER 'josso'@'%' IDENTIFIED BY 'secret';
GRANT ALL PRIVILEGES ON idm_db.* TO 'josso'@'%';
FLUSH PRIVILEGES;
USE idm_db;

CREATE TABLE JOSSO_ROLE (
                            ROLE                 VARCHAR(16) NOT NULL,
                            DESCRIPTION          VARCHAR(64) NULL
);

ALTER TABLE JOSSO_ROLE
    ADD PRIMARY KEY (ROLE);

CREATE TABLE JOSSO_USER (
                            LOGIN                VARCHAR(16) NOT NULL,
                            PASSWORD             VARCHAR(64) NOT NULL,
                            E_MAIL               VARCHAR(64) NOT NULL,
                            FIRST_NAME           VARCHAR(64) NOT NULL,
                            LAST_NAME            VARCHAR(64) NOT NULL,
                            PHONE                VARCHAR(64) NOT NULL,
                            SECRET			    VARCHAR(64) NULL

);


ALTER TABLE JOSSO_USER
    ADD PRIMARY KEY (LOGIN);

ALTER TABLE JOSSO_USER
    ADD UNIQUE (E_MAIL);

CREATE TABLE JOSSO_USER_ROLE (
                                 LOGIN                VARCHAR(16) NOT NULL,
                                 ROLE                 VARCHAR(16) NOT NULL
);

ALTER TABLE JOSSO_USER_ROLE
    ADD PRIMARY KEY (LOGIN, ROLE);

ALTER TABLE JOSSO_USER_ROLE
    ADD FOREIGN KEY (ROLE) REFERENCES JOSSO_ROLE (ROLE);

ALTER TABLE JOSSO_USER_ROLE
    ADD FOREIGN KEY (LOGIN) REFERENCES JOSSO_USER (LOGIN);