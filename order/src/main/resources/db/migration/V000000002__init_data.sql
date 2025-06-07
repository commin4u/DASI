ALTER TABLE t_order
    ADD COLUMN requested_by_user_id BIGINT;

INSERT INTO public.t_order (video_game_id, rental_price, order_status, start_date, end_date, requested_by_user_id)
VALUES (1, 900, 'CREATED', '2025-05-30 00:00:00.000000', '2025-06-29 00:00:00.000000', 2);

