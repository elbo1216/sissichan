class PressReleaseData < ActiveRecord::Migration
  def self.up
    sql = "INSERT INTO press_releases (image_file_name, image_file_path, url, position) VALUES
           ('wedding_wire_2011.jpg', '/images/press', 'http://www.weddingwire.com/reviews/sissi-chan-new-york/c50063ce785a6334.html', 1),
           ('bride_choice.jpg', '/images/press', 'http://www.weddingwire.com/reviews/sissi-chan-new-york/c50063ce785a6334.html', 2),
           ('wedding_wire_2012.jpg', '/images/press', 'http://www.weddingwire.com/reviews/sissi-chan-new-york/c50063ce785a6334.html', 3),
           ('new_york_mag.png', '/images/press', 'http://nymag.com/urr/listings/beauty/sissi-chan/?sort=recent', 4),
           ('brooklyn_bride.png', '/images/press', 'http://bklynbrideonline.com/?x=0&y=0&s=sissi+chan', 5),
           ('style_me_pretty.png', '/images/press', 'http://www.stylemepretty.com/?s=sissi+chan&x=0&y=0', 6),
           ('elizabeth_anne_designs.png', '/images/press', 'http://www.elizabethannedesigns.com/blog/?s=%22sissi+chan%22', 7),
           ('merci.png', '/images/press', 'http://mercinewyork.blogspot.com/search?q=%22sissi+chan%22&x=0&y=0', 8),
           ('intimate_weddings.png', '/images/press', 'http://www.intimateweddings.com/blog/real-weddings-elysia-kris-tribeca-apartment-wedding/', 9)
          "  
    execute sql
  end

  def self.down
   sql = "TRUNCATE TABLE press_releases"
   execute sql
  end
end
