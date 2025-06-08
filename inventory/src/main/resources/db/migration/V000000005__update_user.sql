ALTER TABLE t_video_game
    ADD COLUMN added_by_user_id BIGINT;


UPDATE public.t_video_game
SET added_by_user_id = 1 WHERE id IN (1, 3, 5);

UPDATE public.t_video_game
    SET added_by_user_id = 2 WHERE id IN (2, 4);
