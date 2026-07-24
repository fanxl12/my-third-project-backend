CREATE TABLE conversations (
    id          BIGINT       NOT NULL PRIMARY KEY COMMENT 'Snowflake ID',
    user_id     BIGINT       NOT NULL        COMMENT '所属用户 ID',
    title       VARCHAR(200) NOT NULL        COMMENT '对话标题',
    summary     TEXT         NULL            COMMENT 'AI 对话摘要',
    status      VARCHAR(20)  NOT NULL DEFAULT 'ACTIVE'
                                           COMMENT 'ACTIVE/ARCHIVED',
    created_at  DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    updated_at  DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    version     INT          NOT NULL DEFAULT 0,
    deleted     TINYINT(1)   NOT NULL DEFAULT 0,

    INDEX idx_user_id_created (user_id, created_at),
    INDEX idx_status_created (status, created_at),
    INDEX idx_created_at (created_at),
    INDEX idx_deleted (deleted)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
