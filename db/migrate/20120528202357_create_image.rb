class CreateImage < ActiveRecord::Migration
  def self.up
    sql = "CREATE TABLE images (
             id           integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
             file_name    varchar(50) NOT NULL,
             file_path    varchar(100) NOT NULL,
             thumbnail_id integer NOT NULL,
             created_at   timestamp default '0000-00-00 00:00:00',
             updated_at   timestamp default now() on update now())"
    execute sql
  end

  def self.down
    drop :image
  end
end
