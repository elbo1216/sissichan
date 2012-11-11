class CreateImage < ActiveRecord::Migration
  def self.up
    sql = "CREATE TABLE images (
             id              integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
             file_name       varchar(50) NOT NULL,
             file_path       varchar(100) NOT NULL,
             thumb_file_path varchar(100) NOT NULL,
             thumb_file_name varchar(100) NOT NULL,
             caption         varchar(255),
             caption_url     varchar(255),
             caption2         varchar(255),
             caption2_url     varchar(255),
             created_at      timestamp default '0000-00-00 00:00:00',
             updated_at      timestamp default now() on update now())"
    execute sql
  end

  def self.down
    drop :image
  end
end
