# encoding: utf-8
class ReviewsData < ActiveRecord::Migration
  def self.up
    sql=<<SQL 
      insert into reviews (name, message) VALUES
      ('Alex', 'Sissi was amazing for my May 1st wedding. She was extremely responsive in the planning process. Our trial went great, and even though it was 6 months prior to the wedding, when the wedding day came she did everything perfect all over again. She also was always early - not just on time - a huge plus in my book. She was very easy to talk to and made my whole wedding party feel at ease. She was also calm as can be as my grandma stared at her for hours on end as she did everyone''s hair & make-up. She made my bridesmaids & my mom look absolutely beautiful. And I was so pleased with what she did for me. We took all of our pictures outside in 85 degree weather prior to the ceremony & I was so nervous all of our faces were going to melt off - somehow, they did not.');
SQL
    execute sql
    sql=<<SQL 
      insert into reviews (name, message) VALUES
      ('Lily', 'Sissi did an astonishingly fabulous job on my wedding day. She was calm, efficient, warm and gracious about any changes you wanted. My family loved her: my sister adored her sense of humor and her willingness to do their makeup according to their specifications. My mother was blown away when Sissi was done with her makeup. My makeup was light, natural and polished; it looked as fresh at 3am as it did when she first applied it, and it lasted through tons of crying and sweaty dancing! My hair was incredible. It was truly a work of art, and the best part was that it was secure and light - making it''s way through an entire day''s pictures, dancing, hugging completely unscathed! I would highly recommend her for anyone''s wedding day. You should be so lucky! Especially for those Asian brides - my hair was so voluminous I couldn''t believe it.');
SQL
    execute sql
    sql=<<SQL 
      insert into reviews (name, message) VALUES
      ('Erika','Sissi Chan was awesome! I would highly recommend her to do your hair & makeup on your wedding day or any occasion. She did my hair & makeup for my wedding and did an amazing job! She was extremely patient and professional during my trial and put a great deal of effort in understanding my style and preference. She was friendly and worked very efficiently the day of. Ultimately I felt like a princess because my hair and makeup was flawless and so well received. All thanks to the talented Sissi Chan. It was such a pleasure to work with her.');
SQL
    execute sql
    sql=<<SQL 
      insert into reviews (name, message) VALUES
      ('Zaina','Sissi is so sweet and was wonderful to work with. I actually had Sissi do my hair and makeup for a smaller event I had and then a few months later do my hair for my wedding and all my bridesmaids. She did a fantastic job on both events. She was so professional and helped me get the exact look I wanted. She also did a great job with all six of my bridesmaids and accommodated all the different looks the girls wanted. I was also so impressed by how calm Sissi was with all the chaos that was going on on my wedding day with everyone getting ready and with my family members asking her a million questions. I highly recommend working with Sissi. Her hair and makeup lasted all night and she really does make you look your best on your special day!');
SQL
    execute sql
    sql=<<SQL 
      insert into reviews (name, message) VALUES
      ('Leslie', 'Sissi was a dream to work with...very talented but easy going. She showed up bright and early and had a great attitude. I love that she made my bridesmaids look uniquely gorgeous!! Everyone had stunning makeup and different hair...I couldn''t help staring :) Would definitely recommend her to anyone!');
SQL
    execute sql
    sql=<<SQL 
      insert into reviews (name, message) VALUES
      ('Ella', 'I''ll start by saying I have a lot of thick, long hair. And I wanted to wear it half up, half down with a lot of thick curls. I was so nervous that the curls would fall after some movement, but Sissi worked her magic and they stayed through dancing and hugs. She is an absolute pleasure to be around (that is something to consider - who wants to deal with unpleasant people on their wedding day!?), and she is a true pro. Her price can''t be beat! If she can conquer my hair, she can handle any bride''s ''do. I highly recommend her - don''t delay, she books up fast!');
SQL
    execute sql
    sql=<<SQL 
      insert into reviews (name, message) VALUES
      ('Liz', 'I booked Sissi to do my hair and makeup for myself and my maid of honor, and my mother. She did an excellent job! She was on time and completed all our hair and makeup quickly. She is sweet, down to earth and very knowledgeable about hair and makeup products. If I had to get my makeup or hair done again, I would recommend her highly.');
SQL
    execute sql
    sql=<<SQL 
      insert into reviews (name, message) VALUES
      ('Suela', 'I would hire Sissi again and again in a heartbeat. Sissi is talented, down to earth, attentive to detail and will make you look gorgeous on your wedding day. I recommend her above any other make up artist in New York. She made me shine on my wedding day! My guests could not stop talking about and admiring my hair. My makeup was flawless and it stayed that way until the end of the night. She is a gem. Stop looking, you have found your makeup artist!');
SQL
    execute sql
    sql=<<SQL 
      insert into reviews (name, message) VALUES
      ('Lorin', 'Sissi Chan is an incredibly talented artist, who will make you look and feel gorgeous on your big day. She has an eye for highlighting your best features, while accommodating your needs and making you feel comfortable in your own skin. This was important to me as I normally don''t wear a lot of make-up, but of course on my wedding day I wanted something much more special. Sissi gave me some great suggestions, and we tried 2 looks before I decided which way to go. She is totally professional, on time, responsive and reliable. She is super fast too! She did all 6 of my bridesmaids as well and we were ahead of schedule! Plus she will travel to you! I got so many compliments at my wedding and was so happy with my pictures, I couldn''t have done it without Sissi''s help.');
SQL
    execute sql
    sql=<<SQL 
      insert into reviews (name, message) VALUES
      ('Anli', 'Sissi did the makeup and hair for me and my bridesmaids for my recent spring wedding. I chose her because she had experience with makeup for Asian brides. She was extremely responsive to my preferences (which happens to trend toward natural and romantic). The makeup and hair she did for my actual wedding day was simply flawless. She created a look for me that met and exceeded what I had originally imagined, and inspired so many sincere compliments from both guests and non-guests alike! My makeup stayed fresh through the whole ceremony. Besides her obvious skill, Sissi has the qualities any soon to be bride needs in her makeup artist; she was calm, efficient, easygoing, and professional. Finally her rates are *extremely* affordable compared to other wedding stylists at her level!');
SQL
    execute sql
  end

  def self.down
  end
end
