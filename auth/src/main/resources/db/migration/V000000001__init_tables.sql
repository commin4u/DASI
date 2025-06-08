CREATE SEQUENCE seq_rental_user_id
    INCREMENT BY 1
    MINVALUE 1
    NO CYCLE;

CREATE TABLE t_user
(
    id       BIGINT DEFAULT nextval('seq_rental_user_id') PRIMARY KEY,
    email    VARCHAR NOT NULL UNIQUE,
    password VARCHAR NOT NULL
);
