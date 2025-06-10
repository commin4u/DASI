CREATE SEQUENCE seq_token
    INCREMENT BY 1
    MINVALUE 1
    NO CYCLE;

CREATE TABLE t_firebase_tokens
(
    id           BIGINT DEFAULT nextval('seq_token') PRIMARY KEY,
    user_id      BIGINT NOT NULL,
    token        TEXT NOT NULL,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, token)
);