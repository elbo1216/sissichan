class AddOrderColumns < ActiveRecord::Migration
  def self.up
    sql = 'ALTER TABLE galleries add column position integer'
    execute sql
    sql = 'ALTER TABLE reviews add column position integer'
    execute sql

    add_index :galleries, :position
    add_index :reviews, :position
  end

  def self.down
    sql = 'ALTER TABLE galleries drop column position'
    execute sql
    sql = 'ALTER TABLE reviews add column position integer'
    execute sql
  end
end
