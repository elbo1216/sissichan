class Social < ActiveRecord::Migration
  def self.up
    sql = "CREATE TABLE social_medias (
              id              integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
              media_key       text NOT NULL,
              url             text NOT NULL,
              created_at      timestamp default '0000-00-00 00:00:00',
              updated_at      timestamp default now() on update now())"
    execute sql

    sql = "INSERT INTO social_medias (media_key, url) VALUES ('facebook', 'https://www.facebook.com/pages/Sissi-Chan-Hair-Makeup/217398949118?ref=hl&ref_type=bookmark');"
    execute sql
    sql = "INSERT INTO social_medias (media_key, url) VALUES ('twitter', 'https://twitter.com/sissi_chan_yu');"
    execute sql
    sql = "INSERT INTO social_medias (media_key, url) VALUES ('pinterest', 'http://www.pinterest.com/sissichanyu/');"
    execute sql
    sql = "INSERT INTO social_medias (media_key, url) VALUES ('instagram', 'http://instagram.com/sissichanyu');"
    execute sql
  end

  def self.down
    drop :social_medias
  end
end
