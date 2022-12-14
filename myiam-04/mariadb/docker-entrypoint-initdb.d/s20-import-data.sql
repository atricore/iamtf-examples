USE idm_db;

INSERT INTO JOSSO_ROLE VALUES ('role1', 'Role One');
INSERT INTO JOSSO_ROLE VALUES ('role2', 'Role Two');

INSERT INTO JOSSO_USER VALUES ('user1','kcYHS7U9D513NrGq0ZcaJWNTiJepe71NVsoO4/hVuuE=', 'j.doe@josso.org', 'Jhon', 'Doe', '+15550987', 'secret1');
INSERT INTO JOSSO_USER VALUES ('user2','PisMAHvaZR8ja5hgsAUq7Og3p09o+yiZqEnlSoSOxgg=', 'j.smith@josso.org', 'Jane', 'Smitgh', '+16667890', 'secret2');

INSERT INTO JOSSO_USER_ROLE VALUES ('user1', 'role1');
INSERT INTO JOSSO_USER_ROLE VALUES ('user1', 'role2');
INSERT INTO JOSSO_USER_ROLE VALUES ('user2', 'role2');

COMMIT;