insert into T_GROUP(GRP_ID_C, GRP_NAME_C, GRP_IDROLE_C) values('CMUAdmissions', 'CMUAdmissions', 'user');

/* Create Dean 1 */
insert into T_USER(USE_ID_C, USE_IDROLE_C, USE_USERNAME_C, USE_PASSWORD_C, USE_EMAIL_C, USE_CREATEDATE_D, USE_PRIVATEKEY_C) values('dean1', 'user', 'dean1', 'password', 'dean1@localhost', NOW(), 'Dean1Pk');
insert into T_USER_GROUP(UGP_ID_C, UGP_IDUSER_C, UGP_IDGROUP_C) values('dean1CMUAdmissions', 'dean1', 'CMUAdmissions');

/* Create Dean 2 */
insert into T_USER(USE_ID_C, USE_IDROLE_C, USE_USERNAME_C, USE_PASSWORD_C, USE_EMAIL_C, USE_CREATEDATE_D, USE_PRIVATEKEY_C) values('dean2', 'user', 'dean2', 'password', 'dean2@localhost', NOW(), 'Dean2Pk');
insert into T_USER_GROUP(UGP_ID_C, UGP_IDUSER_C, UGP_IDGROUP_C) values('dean2CMUAdmissions', 'dean2', 'CMUAdmissions');

/* Create Dean 3 */
insert into T_USER(USE_ID_C, USE_IDROLE_C, USE_USERNAME_C, USE_PASSWORD_C, USE_EMAIL_C, USE_CREATEDATE_D, USE_PRIVATEKEY_C) values('dean3', 'user', 'dean3', 'password', 'dean3@localhost', NOW(), 'Dean3Pk');
insert into T_USER_GROUP(UGP_ID_C, UGP_IDUSER_C, UGP_IDGROUP_C) values('dean3CMUAdmissions', 'dean3', 'CMUAdmissions');

/* Create Dean 4 */
insert into T_USER(USE_ID_C, USE_IDROLE_C, USE_USERNAME_C, USE_PASSWORD_C, USE_EMAIL_C, USE_CREATEDATE_D, USE_PRIVATEKEY_C) values('dean4', 'user', 'dean4', 'password', 'dean4@localhost', NOW(), 'Dean4Pk');
insert into T_USER_GROUP(UGP_ID_C, UGP_IDUSER_C, UGP_IDGROUP_C) values('dean4CMUAdmissions', 'dean4', 'CMUAdmissions');

/* Create Dean 5 */
insert into T_USER(USE_ID_C, USE_IDROLE_C, USE_USERNAME_C, USE_PASSWORD_C, USE_EMAIL_C, USE_CREATEDATE_D, USE_PRIVATEKEY_C) values('dean5', 'user', 'dean5', 'password', 'dean5@localhost', NOW(), 'Dean5Pk');
insert into T_USER_GROUP(UGP_ID_C, UGP_IDUSER_C, UGP_IDGROUP_C) values('dean5CMUAdmissions', 'dean5', 'CMUAdmissions');

update T_CONFIG set CFG_VALUE_C = '28' where CFG_ID_C = 'DB_VERSION';
