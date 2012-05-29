class CreateGallery < ActiveRecord::Migration
  def self.up
    sql = "CREATE TABLE galleries (
             id           integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
             gallery_type varchar(20) NOT NULL,
             image_id     integer NOT NULL,
             created_at   timestamp default '0000-00-00 00:00:00',
             updated_at   timestamp default now() on update now())"
    execute sql
  end

  def self.down
    drop :gallery
  end
end
