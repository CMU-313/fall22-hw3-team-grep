update T_USER set USE_PASSWORD_C = '$2y$10$xg0EEKVUehutDI1m6qQhVeFz7SMQMl1jQzjf2KkVsR2c7aV2vyyjK' where USE_ID_C = 'dean1'
update T_USER set USE_PASSWORD_C = '$2y$10$xg0EEKVUehutDI1m6qQhVeFz7SMQMl1jQzjf2KkVsR2c7aV2vyyjK' where USE_ID_C = 'dean2'
update T_USER set USE_PASSWORD_C = '$2y$10$xg0EEKVUehutDI1m6qQhVeFz7SMQMl1jQzjf2KkVsR2c7aV2vyyjK' where USE_ID_C = 'dean3'
update T_USER set USE_PASSWORD_C = '$2y$10$xg0EEKVUehutDI1m6qQhVeFz7SMQMl1jQzjf2KkVsR2c7aV2vyyjK' where USE_ID_C = 'dean4'
update T_USER set USE_PASSWORD_C = '$2y$10$xg0EEKVUehutDI1m6qQhVeFz7SMQMl1jQzjf2KkVsR2c7aV2vyyjK' where USE_ID_C = 'dean5'

alter table T_DOCUMENT add column DOC_GPA_C  int;
alter table T_DOCUMENT add column DOC_SKILLS_C  int;
alter table T_DOCUMENT add column DOC_EXP_C  int;
alter table T_DOCUMENT add column DOC_RESUME_C text;

update T_CONFIG set CFG_VALUE_C = '29' where CFG_ID_C = 'DB_VERSION';