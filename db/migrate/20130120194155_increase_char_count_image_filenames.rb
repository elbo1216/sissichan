class IncreaseCharCountImageFilenames < ActiveRecord::Migration
  def self.up
    sql = 'ALTER TABLE images MODIFY file_name varchar(255);'
    execute sql
    sql = 'ALTER TABLE images MODIFY file_path varchar(255);'
    execute sql
    sql = 'ALTER TABLE images MODIFY thumb_file_name varchar(255);'
    execute sql
    sql = 'ALTER TABLE images MODIFY thumb_file_path varchar(255);'
    execute sql
    
  end

  def self.down
    sql = 'ALTER TABLE images MODIFY file_name varchar(50);'
    execute sql
    sql = 'ALTER TABLE images MODIFY file_path varchar(100);'
    execute sql
    sql = 'ALTER TABLE images MODIFY thumb_file_name varchar(100);'
    execute sql
    sql = 'ALTER TABLE images MODIFY thumb_file_path varchar(100);'
    execute sql
  end
end
