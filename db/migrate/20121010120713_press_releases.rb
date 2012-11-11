class PressReleases < ActiveRecord::Migration
  def self.up
    sql = "CREATE TABLE press_releases (
             id              integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
             image_file_name varchar(50) NOT NULL,
             image_file_path varchar(100) NOT NULL,
             url             varchar(255) NOT NULL,
             position        integer,
             created_at      timestamp default '0000-00-00 00:00:00',
             updated_at      timestamp default now() on update now())"
    execute sql

    add_index :press_releases, :position
  end

  def self.down
    drop_table :press_releases
  end
end
