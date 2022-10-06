insert into T_GROUP(GRP_ID_C, GRP_NAME_C, GRP_IDROLE_C) values('CMU Admissions', 'CMU Admissions', 'user');

/* Create Dean 1 */
insert into T_USER(USE_ID_C, USE_IDROLE_C, USE_USERNAME_C, USE_PASSWORD_C, USE_EMAIL_C, USE_CREATEDATE_D, USE_PRIVATEKEY_C) values('dean1', 'user', 'dean1', '', 'dean1@localhost', NOW(), 'Dean1Pk');
insert into T_USER_GROUP(UGP_ID_C, UGP_IDUSER_C, UGP_IDGROUP_C) values('dean1-CMU Admissions', 'dean1', 'CMU Admissions');

/* Create Dean 2 */
insert into T_USER(USE_ID_C, USE_IDROLE_C, USE_USERNAME_C, USE_PASSWORD_C, USE_EMAIL_C, USE_CREATEDATE_D, USE_PRIVATEKEY_C) values('dean2', 'user', 'dean2', '', 'dean2@localhost', NOW(), 'Dean2Pk');
insert into T_USER_GROUP(UGP_ID_C, UGP_IDUSER_C, UGP_IDGROUP_C) values('dean2-CMU Admissions', 'dean2', 'CMU Admissions');

/* Create Dean 3 */
insert into T_USER(USE_ID_C, USE_IDROLE_C, USE_USERNAME_C, USE_PASSWORD_C, USE_EMAIL_C, USE_CREATEDATE_D, USE_PRIVATEKEY_C) values('dean3', 'user', 'dean3', '', 'dean3@localhost', NOW(), 'Dean3Pk');
insert into T_USER_GROUP(UGP_ID_C, UGP_IDUSER_C, UGP_IDGROUP_C) values('dean3-CMU Admissions', 'dean3', 'CMU Admissions');

/* Create Dean 4 */
insert into T_USER(USE_ID_C, USE_IDROLE_C, USE_USERNAME_C, USE_PASSWORD_C, USE_EMAIL_C, USE_CREATEDATE_D, USE_PRIVATEKEY_C) values('dean4', 'user', 'dean4', '', 'dean4@localhost', NOW(), 'Dean4Pk');
insert into T_USER_GROUP(UGP_ID_C, UGP_IDUSER_C, UGP_IDGROUP_C) values('dean4-CMU Admissions', 'dean4', 'CMU Admissions');

/* Create Dean 5 */
insert into T_USER(USE_ID_C, USE_IDROLE_C, USE_USERNAME_C, USE_PASSWORD_C, USE_EMAIL_C, USE_CREATEDATE_D, USE_PRIVATEKEY_C) values('dean5', 'user', 'dean5', '', 'dean5@localhost', NOW(), 'Dean5Pk');
insert into T_USER_GROUP(UGP_ID_C, UGP_IDUSER_C, UGP_IDGROUP_C) values('dean5-CMU Admissions', 'dean5', 'CMU Admissions');

update T_CONFIG set CFG_VALUE_C = '28' where CFG_ID_C = 'DB_VERSION';