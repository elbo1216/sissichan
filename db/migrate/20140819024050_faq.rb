class Faq < ActiveRecord::Migration
  def self.up
    sql = "CREATE TABLE faqs (
              id              integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
              question        text NOT NULL,
              answer          text NOT NULL,
              deleted_at      datetime,
              created_at      timestamp default '0000-00-00 00:00:00',
              updated_at      timestamp default now() on update now())"

    execute sql
    sql = """
      INSERT INTO faqs (question, answer) VALUES
      ('Are you willing to travel to my home or venue the day of the wedding?', 'Yes. I always travel to my clients on the day of the wedding, whether the venue is a hotel, a reception hall, or a home. However, as I normally only work within the boroughs of New York City, an additional travel fee is applied should you require me to travel outside city limits.'),
      ('How long does it take to get my whole bridal party ready?', 'It normally takes me about 1.5 hours for a bridesmaid and about 2 hours for a bride to do both hair and makeup. If it is necessary to meet before 7am there is an additional early morning fee. I do not work with an assistant.'),
      ('Would it be okay if I hired other stylists independently from you?', 'Yes. I have happily worked alongside other stylists on many occasions. It is a great option if you have an early start time or a very large party in need of beauty services. It would be up to you to hire them independently from me.'),
      ('Where does the trial take place?', 'I always travel to my prospective clients, meaning that trials take place in the comfort of their own home. However, as I normally only work within the boroughs of New York City, an additional travel fee is applied should you require me to travel outside city limits.'),
      ('What should I bring to the trial?', 'I recommend that you find a photo of the hairstyle you would like to see so that we can work off of a visual reference. In addition, if you plan on wearing anything in your hair on the day of the wedding such as a veil, flowers, or accessories, it is suggested that you have that available so you can preview the complete look.'),
      ('Should I have my eyebrows shaped for the trial?', 'It is a good Idea to have clean and shaped eyebrows for the trial so that you can preview the complete makeup look, but it is not a requirement. However, I highly recommend having your eyebrows clean and shaped for the day of the wedding.'),
      ('Should I have a facial before the wedding?', 'If you normally get facials and you know how your skin will react it is fine to have a facial a few days before the wedding so you can relax and have a clean glow to the skin. If you do not normally get facials then it’s best to have the facial about 3 to 6 weeks in advance, just in case your skin breaks out from the facial.'),
      ('What should I bring on the day of the wedding?', 'I recommend that you provide your own lipstick so that you can take it with you to touch up the rest of the day. Other items that will be helpful for touch ups are cotton swabs, blot papers, pressed powder, bobby pins, and hairspray. These items are helpful for the whole bridal party. I also suggest wearing a button down shirt or zippered jersey for an easy wardrobe change.'),
      ('What should my bridal party bring?', 'Each bridesmaid or woman having her hair styled should bring a photo of the hairstyle they would like as this helps stay on schedule by avoiding last minute decision making. I recommend that they also provide their own lipstick so that you can take it with them to touch up the rest of the day.'),
      ('Should I wash my hair the night before the wedding rather than the day of?', 'I suggest that you wash your hair the night before rather than the morning of the wedding, but it is not a requirement. It is much more important to make sure that your hair is completely dry and product free when we begin on the day of the wedding. The only time this does not apply is if you have curly hair and we plan to blow your hair out straight on the wedding day.'),
      ('What is airbrush makeup and how is it different from traditional makeup?', 'Airbrush makeup is a technique of applying makeup through an airbrush sprayer, which finely mists on foundation giving you a natural and long lasting look with practically no touchup necessary. My method of applying traditional makeup is also quite long lasting so it''s up to you as to what you prefer. Some women prefer airbrush makeup because they like how long it lasts (particularly good for women with oily skin or events on humid days) and others like that it sprays on so evenly without any type of smudges.'),
      ('What type of hair extensions do you offer?', 'I only offer a full set of human hair clip-in extensions. They are temporarily clipped in for the day of the event and when they are removed they are yours to keep and reuse. I recommend using them when you are looking for a full and long length down hairstyle for the occasion. You are also welcome to provide your own hair extensions and in that case there would be no extra cost in addition to the cost of the hairstyling.');
    """
    execute sql
  end

  def self.down
    drop :faqs
  end
end
