CREATE SEQUENCE seq_video_game
    INCREMENT BY 1
    MINVALUE 1
    NO CYCLE;

CREATE TABLE t_video_game
(
    id BIGINT DEFAULT nextval('seq_video_game') PRIMARY KEY,
    title VARCHAR NOT NULL,
    type VARCHAR(7) NOT NULL,
    platform VARCHAR(13) NOT NULL
);