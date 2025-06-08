ALTER TABLE t_video_game
    ADD COLUMN image_data BYTEA;

ALTER TABLE t_video_game
    ADD COLUMN image_content_type CHAR(10);

ALTER TABLE t_video_game
    ADD CONSTRAINT check_valid_content_type
        CHECK (image_content_type IN ('image/jpeg', 'image/png'));