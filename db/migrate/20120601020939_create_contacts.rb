class Contacts < ActiveRecord::Migration
  def self.up
    sql = "CREATE TABLE contacts (
             id           integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
             name         varchar(100) not null,
             phone        varchar(11),
             email        varchar(50) not null,
             event_date   date not null,
             subject      varchar(255) not null,
             message      text not null,
             unique_id    varchar(255),
             created_at   timestamp default '0000-00-00 00:00:00',
             updated_at   timestamp default now() on update now())"

    execute sql
  end

  def self.down
    drop :contact
  end
end
