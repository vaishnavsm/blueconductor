-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE TABLE devices(
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  name VARCHAR, 
  mac_id VARCHAR, 
  created_at DATETIME, 
  updated_at DATETIME, 
  user_id VARCHAR NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(username)
);

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE devices;