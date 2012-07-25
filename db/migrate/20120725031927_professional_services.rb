class ProfessionalServices < ActiveRecord::Migration
  def self.up
    sql = "CREATE TABLE professional_services (
             id           integer primary key not null auto_increment,
             service_name varchar(255) not null,
             service_type varchar(255) not null,
             service_rate varchar(255) not null,
             is_live      boolean not null default false,
             position     integer,
             created_at   timestamp default '0000-00-00 00:00:00',
             updated_at   timestamp default now() on update now())"
    execute sql
  end

  def self.down
    drop_table :professional_services
  end
end
