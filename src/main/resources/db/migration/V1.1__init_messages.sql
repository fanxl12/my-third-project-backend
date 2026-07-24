CREATE TABLE messages (
    id                   BIGINT       NOT NULL PRIMARY KEY COMMENT 'Snowflake ID',
    conversation_id      BIGINT       NOT NULL        COMMENT '所属会话',
    role                 VARCHAR(20)  NOT NULL        COMMENT 'user/assistant/system',
    content              MEDIUMTEXT   NOT NULL        COMMENT '消息内容',
    content_type         VARCHAR(20)  NOT NULL DEFAULT 'text' COMMENT 'text/markdown/tool_call',
    token_count          INT          NOT NULL DEFAULT 0  COMMENT 'Token 数',
    model_name           VARCHAR(100) NULL            COMMENT 'AI 模型名（仅 assistant）',
    model_response_time_ms INT        NULL            COMMENT '响应耗时（仅 assistant）',
    metadata_json        JSON         NULL            COMMENT '扩展元数据',
    parent_message_id    BIGINT       NULL            COMMENT '分支对话父消息',
    created_at  DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    updated_at  DATETIME(3)  NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    version     INT          NOT NULL DEFAULT 0,
    deleted     TINYINT(1)   NOT NULL DEFAULT 0,

    INDEX idx_conversation_created (conversation_id, created_at),
    INDEX idx_created_at (created_at),
    INDEX idx_deleted (deleted),
    CONSTRAINT fk_conversation FOREIGN KEY (conversation_id) REFERENCES conversations(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
