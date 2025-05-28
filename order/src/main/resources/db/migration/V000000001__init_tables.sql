CREATE SEQUENCE seq_order
    INCREMENT BY 1
    MINVALUE 1
    NO CYCLE;

CREATE TABLE t_order
(
    id BIGINT DEFAULT nextval('seq_order') PRIMARY KEY,
    video_game_id BIGINT NOT NULL,
    rental_price DOUBLE PRECISION NOT NULL,
    order_status VARCHAR(10) NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL
);