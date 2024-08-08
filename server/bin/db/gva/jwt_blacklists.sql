create table jwt_blacklists
(
    id         bigint unsigned auto_increment
        primary key,
    created_at datetime(3) null,
    updated_at datetime(3) null,
    deleted_at datetime(3) null,
    jwt        text        null comment 'jwt'
);

create index idx_jwt_blacklists_deleted_at
    on jwt_blacklists (deleted_at);

INSERT INTO gva.jwt_blacklists (id, created_at, updated_at, deleted_at, jwt) VALUES (1, '2024-08-06 13:42:04.659', '2024-08-06 13:42:04.659', null, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiNTI1MTc3NTktM2Q0Yi00MWQ3LWFmNTItYTY3YTIxMDQ4NTQyIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Ik1yLuWlh-a3vCIsIkF1dGhvcml0eUlkIjo4ODgsIkJ1ZmZlclRpbWUiOjg2NDAwLCJpc3MiOiJxbVBsdXMiLCJhdWQiOlsiR1ZBIl0sImV4cCI6MTcyMzA5Nzg1NiwibmJmIjoxNzIyNDkzMDU2fQ.XNQ9k2XekMgspJWWrGI3FQPXnT_Ub0zOHBWp35DNYj8');
INSERT INTO gva.jwt_blacklists (id, created_at, updated_at, deleted_at, jwt) VALUES (2, '2024-08-06 14:09:38.257', '2024-08-06 14:09:38.257', null, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiNTI1MTc3NTktM2Q0Yi00MWQ3LWFmNTItYTY3YTIxMDQ4NTQyIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2heeuoSIsIkF1dGhvcml0eUlkIjo4ODgsIkJ1ZmZlclRpbWUiOjg2NDAwLCJpc3MiOiJxbVBsdXMiLCJhdWQiOlsiR1ZBIl0sImV4cCI6MTcyMzUyOTIxMSwibmJmIjoxNzIyOTI0NDExfQ.zhblad8ZhNt0FOpL8cyonzyix_xYWWblyYfVYqpwZd4');
INSERT INTO gva.jwt_blacklists (id, created_at, updated_at, deleted_at, jwt) VALUES (3, '2024-08-06 14:23:29.143', '2024-08-06 14:23:29.143', null, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiNTI1MTc3NTktM2Q0Yi00MWQ3LWFmNTItYTY3YTIxMDQ4NTQyIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2heeuoSIsIkF1dGhvcml0eUlkIjo4ODgsIkJ1ZmZlclRpbWUiOjg2NDAwLCJpc3MiOiJxbVBsdXMiLCJhdWQiOlsiR1ZBIl0sImV4cCI6MTcyMzUyOTg1NSwibmJmIjoxNzIyOTI1MDU1fQ.HOlOHOTm9ztfDUc9tK60M34yNmZFmtQLeJYWRDhIIJE');
INSERT INTO gva.jwt_blacklists (id, created_at, updated_at, deleted_at, jwt) VALUES (4, '2024-08-07 20:19:31.072', '2024-08-07 20:19:31.072', null, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiNTI1MTc3NTktM2Q0Yi00MWQ3LWFmNTItYTY3YTIxMDQ4NTQyIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Iui2heeuoSIsIkF1dGhvcml0eUlkIjo4ODgsIkJ1ZmZlclRpbWUiOjg2NDAwLCJpc3MiOiJxbVBsdXMiLCJhdWQiOlsiR1ZBIl0sImV4cCI6MTcyMzUzMDI2OCwibmJmIjoxNzIyOTI1NDY4fQ.HF2WH37n2qhzCIkzCQvvHZ6Ne-FJp0gAn6aG2VbxmRY');
