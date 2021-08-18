-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE TABLE connecteds(
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  created_at DATETIME, 
  updated_at DATETIME, 
  user_id VARCHAR NOT NULL,
  device_id INT NOT NULL,
  host_id INT NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(username)
  FOREIGN KEY(device_id) REFERENCES devices(id)
  FOREIGN KEY(host_id) REFERENCES hosts(id)
);

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE connecteds;