class CreateThumbnail < ActiveRecord::Migration
  def self.up
    sql = "CREATE TABLE thumbnails (
             id           integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
             file_name    varchar(50) NOT NULL,
             file_path    varchar(100) NOT NULL,
             created_at   timestamp default '0000-00-00 00:00:00',
             updated_at   timestamp default now() on update now())"
    execute sql
  end

  def self.down
    drop :thumbnail
  end
end
