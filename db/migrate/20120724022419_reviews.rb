class Reviews < ActiveRecord::Migration
  def self.up
    sql = "CREATE TABLE reviews (
             id              integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
             name            varchar(50) NOT NULL,
             message         text,
             is_live         boolean not null default true,
             created_at      timestamp default '0000-00-00 00:00:00',
             updated_at      timestamp default now() on update now())"
    execute sql
  end

  def self.down
    drop_table :reviews
  end
end
