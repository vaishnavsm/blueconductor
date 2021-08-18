-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE TABLE users(username VARCHAR PRIMARY KEY, name VARCHAR NOT NULL, token CHAR(32) NOT NULL, created_at DATETIME, updated_at DATETIME);

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE users;