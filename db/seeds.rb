# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(first_name: "Gwen", last_name: "Jorgensen", email: "gwen@email.com", bio: "Gwen Rosemary Jorgensen (born April 25, 1986 in Waukesha, Wisconsin) is an American professional triathlete. She is the 2014 and 2015 ITU World Triathlon Series Champion. She has been named USA Triathlon's 2013 and 2014 Olympic/ITU Female Athlete of the Year. She was a member of the 2012 Olympic Team and again represented the United States in triathlon at the 2016 Summer Olympics, where she won the USA's first ever triathlon gold medal with a time of 1 hour, 56 minutes, and 16 seconds", password: "password", avatar: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Gwen_Jorgensen_winner_in_Stockholm_2013_-4.jpg/480px-Gwen_Jorgensen_winner_in_Stockholm_2013_-4.jpg", itu_athlete_id: 40887)
User.create(first_name: "Andy", last_name: "Potts", email: "andy@email.com", bio: "Andrew Robert Potts (born December 28, 1976) is a triathlete from the United States. He competed in triathlon at the 2004 Summer Olympics and is the 2007 Ironman 70.3 World Champion. Prior to triathlon, Potts was a swimmer where he won the bronze medal in the men's 400m individual medley at the 1995 Summer Universiade and earned a spot on the USA Swimming national team where he would place fourth at the 1996 Olympic Trials in the 400 IM.", password: "password", avatar: "https://static1.squarespace.com/static/57a9f9df197aea52732a68a2/t/57dee497e6f2e1bd883ce1e7/1475332828524/Andy+Potts+Biking?format=2500w", itu_athlete_id: 5300)
User.create(first_name: "Scott", last_name: "Jurek", email: "scott@email.com", bio: "Scott Gordon Jurek (born October 26, 1973) is an American ultramarathoner, New York Times bestselling author of Eat & Run, and public speaker. Throughout his career, Jurek has been one of the most dominant ultramarathon runners in the world, winning many of the sport's most prestigious races multiple times, including the Hardrock Hundred (2007), the Badwater Ultramarathon (2005, 2006), the Spartathlon (2006, 2007, 2008), and the Western States 100 Mile Endurance Run (1999–2005). In 2010, at the 24-Hour World Championships in Brive-la-Gaillarde, France, Jurek won a silver medal behind Shingo Inoue and set a new US record for distance run in 24 hours with 165.7 miles (an average pace of 8 minutes and 42 seconds per mile)", password: "password", avatar: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Scott_Jurek%2C_Ultramarathon_Champion.jpg/440px-Scott_Jurek%2C_Ultramarathon_Champion.jpg")
User.create(first_name: "Sarah", last_name: "True", email: "sarah@email.com", bio: "Sarah True (née Groff, born November 27, 1981) is an American athlete who competes in triathlon. She represented the United States in triathlon in 2012, finishing in fourth place, and at the 2016 Summer Olympics. True is the winner of the 2007 ITU Aquathlon World Championships and finished in second place in the 2014 ITU World Triathlon Series.", password: "password", avatar: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Sarah_Groff%2C_winner_in_Stockholm_2014..jpg/480px-Sarah_Groff%2C_winner_in_Stockholm_2014..jpg", itu_athlete_id: 6246)
User.create(first_name: "Hunter", last_name: "Kemper", email: "hunter@email.com", password: "password", avatar: "http://3wiresports.files.wordpress.com/2011/04/dsc_2825.jpg", bio: "Hunter Craig Kemper (born May 4, 1976 in Charlotte, North Carolina) is a triathlete from the United States. He won the silver medal at the 1999 Pan American Games, behind Venezuela's Gilberto González, followed by the gold four years later in Santo Domingo. He attended Wake Forest University in Winston-Salem, North Carolina, where he was a 4-year member of the Men's Cross Country and Track & Field teams. Hunter graduated in 1998 with a degree in Business Administration. Kemper competed at the first Olympic triathlon at the 2000 Summer Olympics. He took seventeenth place with a total time of 1:50:05.56. Four years later, at the 2004 Summer Olympics, Kemper competed again. He moved up to ninth place with a time of 1:52:46.33 on the more rigorous course. At the 2008 Summer Olympics in Beijing, he finished in seventh place with a time of 1:49:48.75. At the ITU San Diego Triathlon in 2012, he placed 5th with a time of 1:49:18 qualifying him for the London 2012 USA Olympic team. He placed fourteenth in those games to lead the U.S. triathlon team.[1] Kemper is one of only two American male triathletes to ever be ranked world #1 by the International Triathlon Union (ITU) (American Mark Fretta also held the world #1 rank for 4 months in 2006). In July 2006, he won the Life Time Fitness Triathlon in Minneapolis, MN, winning what was at the time the largest purse in professional triathlon competition.", itu_athlete_id: 5325)
User.create(first_name: "Melissa", last_name: "Gonzalez", email: "melissa@email.com", password: "password", avatar: "/img/dashboard/profile-pic.jpg", bio: "Melissa is a research professional at the Northwestern Feinberg School of Medicine with non-profit management experience with the Chicago Triathlon Club.  Her interest in web development was piqued when the Tri Club website's content management broke system shortly before she became President.  She quickly learned as much as possible about web development in order to make informed decisions in choosing & setting up a new CMS.  She eventually decided she enjoyed web development more than medical research, and sought out Actualize to switch careers into development.")
50.times do
  first_name =  Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@email.com",
    bio: Faker::Lorem.paragraph,
    password: "password",
    avatar: Faker::Avatar.image
    )
end



Sport.create(name: "Triathlon")
Sport.create(name: "Running")
Sport.create(name: "Cycling")
Sport.create(name: "Swimming")
Sport.create(name: "Duathlon")
Sport.create(name: "Aquabike")


Location.create(name: "Monroe Harbor", street_address: "400 E Monroe St", city: "Chicago", state: "IL", country: "United States", latitude: 41.8803241, longitude: -87.618865)
Location.create(name: "Grant Park", street_address: "337 E Randolph St", city: "Chicago", state: "IL", zip: "60601", country: "United States", latitude: 41.8827891, longitude: -87.6211116)
Location.create(name: "North Avenue Chess Pavilion", street_address: "1600 N Lake Shore Dr", city: "Chicago", state: "IL", country: "United States", latitude: 41.911304, longitude: -87.6271757)
Location.create(name: "Pizzeria Serio", street_address: "1708 W Belmont Ave", city: "Chicago", state: "IL", country: "United States", latitude: 41.9397599, longitude: -87.6736965)
Location.create(name: "Murphy County Park", street_address:"7119 Bay Shore Dr", city: "Egg Harbor", state: "WI", zip: 54209, country: "United States", latitude: 45.0142679, longitude: -87.3344475)
Location.create(name: "Bigfoot Beach State Park", country: "United States", latitude: 42.566641, longitude: -88.4362937)


Event.create(name: "2017 Chicago Tri - Sprint", datetime: "2017-08-26 06:00:00 GMT-0500", description: "800m open water swim with wave start, 12 mile bike ride on Lake Shore Drive, and 3.1 mile run on the lakefront path, ending on Columbus Drive.", event_type: "Race", distance: "Sprint", sport_id: 1, location_id: 1, main_image: "https://i.ytimg.com/vi/eJ2xQDr21f8/maxresdefault.jpg", image2: "http://www.chicagonow.com/blogs/show-me-chicago/assets_c/2010/08/triathlonSwim1-thumb-640xauto-204907.jpg", image3: "http://cdn.triathlete.com/wp-content/uploads/2011/08/259.jpg", image4: "https://www.bizbash.com/content/editorial/storyimg/big/chicago-triathlon.jpg")
Event.create(name: "2017 Chicago Tri - Olympic", datetime: "2017-08-26 09:00:00 GMT-0500", description: "1500m open water swim with wave start, 25 mile bike ride on Lake Shore Drive, and 6.2 mile run on the lakefront path, ending on Columbus Drive.", event_type: "Race", distance: "Olympic", sport_id: 1, location_id: 1, main_image: "https://i.ytimg.com/vi/eJ2xQDr21f8/maxresdefault.jpg", image2: "http://www.chicagonow.com/blogs/show-me-chicago/assets_c/2010/08/triathlonSwim1-thumb-640xauto-204907.jpg", image3: "http://cdn.triathlete.com/wp-content/uploads/2011/08/259.jpg", image4: "https://www.bizbash.com/content/editorial/storyimg/big/chicago-triathlon.jpg")
Event.create(name: "2017 Chicago Tri - Aquabike", datetime: "2017-08-26 11:00:00 GMT-0500", description: "1500m open water swim with wave start, 25 mile bike ride on Lake Shore Drive, then go directly to the finish line on Columbus Drive.", event_type: "Race", distance: "Olympic", sport_id: 6, location_id: 1, main_image: "https://i.ytimg.com/vi/eJ2xQDr21f8/maxresdefault.jpg", image2: "http://www.chicagonow.com/blogs/show-me-chicago/assets_c/2010/08/triathlonSwim1-thumb-640xauto-204907.jpg", image3: "http://cdn.triathlete.com/wp-content/uploads/2011/08/259.jpg", image4: "https://www.bizbash.com/content/editorial/storyimg/big/chicago-triathlon.jpg")
Event.create(name: "2017 Chicago Marathon", datetime: "2017-10-07 07:00:00 GMT-0500", description: 'The 40th anniversary of the iconic race, once called the “people’s race anyone can come and enjoy,” will take place on Sunday, October 8, 2017. Running the Bank of America Chicago Marathon is the pinnacle of achievement for elite athletes and everyday runners alike. On race day, runners from all 50 states and more than 100 countries will set out to accomplish a personal dream by reaching the finish line in Grant Park.', event_type: "Race", distance: "Marathon", sport_id: 2, location_id: 2, main_image: "http://www.summit4angelman.com/wp-content/uploads/2015/07/Chicago-Marathon.jpg", image2: "http://running.competitor.com/files/2016/10/Chicago-Marathon-2016.jpg", image3: "http://4.bp.blogspot.com/-m2r4-1d-d-E/Vh60iBIsimI/AAAAAAAABkA/VV-qj2Qabbk/s1600/chicago.jpg", image4: "http://www.chicagonow.com/show-me-chicago/files/2015/10/CMCourse-Map_FINAL.jpg")
Event.create(name: "20-mile run", datetime: "2017-09-17 06:30:00 GMT-0500", description: "I'm planning on doing a 20-mile run at 10 min/mile pace to prepare for the Chicago Marathon.  Anyone want to join me?", event_type: "Workout", distance: "20 miles", sport_id: 2, location_id: 3, image2: "https://cpi.studiod.com/traveltips_usatoday_com/photos.demandstudios.com/google_maps/hotels-near-chicago-air-water-show-20541.png", main_image: "http://www.extreme-workout.com/wp-content/uploads/2013/10/Marathon-Quote.jpg", image3: "https://lh3.googleusercontent.com/-kV5sn4C89Vs/Vf9swmi4fLI/AAAAAAAAJ2U/-5W_7AMGlNs/s640/blogger-image-235566847.jpg", image4: "http://daysoffuturepassed.com/wp-content/uploads/2012/09/Chess-Pavilion-small1.jpg")
Event.create(name: "CTC Monthly Meeting: Sports Nutrition for Endurance Athletes", datetime: "2017-10-03 18:00:00 GMT-0500", description: "Join the Chicago Tri Club for an evening of Tri Talk!  Come early at 6pm for happy hour and mingle with other triathletes.  Stay for the talk at 7 and listen to well-known author Monique Ryan speak on the topic of Sports Nutrition for Endurance Athletes.", event_type: "Clinic", location_id: 4, main_image: "http://www.elite-athletic-performance.com/images/Healthy-nutritional-foods2.jpg", image2: "https://images-na.ssl-images-amazon.com/images/I/616znValQuL._SX258_BO1,204,203,200_.jpg", image3: "http://blog.mioglobal.com/wp-content/uploads/2015/02/Screen-Shot-2015-02-03-at-3.54.31-PM.png", image4: "https://www.hammernutrition.com.au/wp-content/uploads/2013/11/Chocolate.jpg")
Event.create(name: "2017 Door County Triathlon - Sprint", datetime: "2017-07-15 09:00:00GMT-0500", description: "Swim in the clear waters of Lake Michigan, bike through the rolling hills of Door County, and run through Egg Harbor and surrounding towns.  Start and Finish at Murphy County Park.  All race participants receive a free pig roast lunch and two beer tickets to the post-race party!", event_type: "Race", sport_id: 1, distance: "Sprint", location_id: 5, main_image: "http://photos.capturedoorcounty.com/photos/sVSyztDdbke7gPPqlGf8kA/showcase.jpg", image2: "http://www.doorcountytriathlon.com/wp-content/uploads/2015/01/6358-DC-Tri-2013-768x512.jpg", image3: "http://www.doorcountytriathlon.com/wp-content/uploads/2015/04/7422-DC-Tri-2013-768x512.jpg", image4: "http://www.chicagotriclub.com/resources/Pictures/Slideshow/1%20CTC%20Door%20County%202016.jpg")
Event.create(name: "2017 Door County Triathlon - Half Ironman", datetime: "2017-07-16 09:00:00GMT-0500", description: "Swim in the clear waters of Lake Michigan, bike through the rolling hills of Door County, and run through Egg Harbor and surrounding towns.  Start and Finish at Murphy County Park.  All race participants receive a free pig roast lunch and two beer tickets to the post-race party!", event_type: "Race", sport_id: 1, distance: "Half Ironman", location_id: 5, main_image: "http://photos.capturedoorcounty.com/photos/sVSyztDdbke7gPPqlGf8kA/showcase.jpg", image2: "http://www.doorcountytriathlon.com/wp-content/uploads/2015/01/6358-DC-Tri-2013-768x512.jpg", image3: "http://www.doorcountytriathlon.com/wp-content/uploads/2015/04/7422-DC-Tri-2013-768x512.jpg", image4: "http://www.chicagotriclub.com/resources/Pictures/Slideshow/1%20CTC%20Door%20County%202016.jpg")

Event.create(name: "2016 Chicago Tri - Sprint", datetime: "2016-08-27 06:00:00 GMT-0500", description: "800m open water swim with wave start, 12 mile bike ride on Lake Shore Drive, and 3.1 mile run on the lakefront path, ending on Columbus Drive.", event_type: "Race", distance: "Sprint", sport_id: 1, location_id: 1, main_image: "https://i.ytimg.com/vi/eJ2xQDr21f8/maxresdefault.jpg", image2: "http://www.chicagonow.com/blogs/show-me-chicago/assets_c/2010/08/triathlonSwim1-thumb-640xauto-204907.jpg", image3: "http://cdn.triathlete.com/wp-content/uploads/2011/08/259.jpg", image4: "https://www.bizbash.com/content/editorial/storyimg/big/chicago-triathlon.jpg")
Event.create(name: "2016 Chicago Tri - Olympic", datetime: "2016-08-27 09:00:00 GMT-0500", description: "1500m open water swim with wave start, 25 mile bike ride on Lake Shore Drive, and 6.2 mile run on the lakefront path, ending on Columbus Drive.", event_type: "Race", distance: "Olympic", sport_id: 1, location_id: 1, main_image: "https://i.ytimg.com/vi/eJ2xQDr21f8/maxresdefault.jpg", image2: "http://www.chicagonow.com/blogs/show-me-chicago/assets_c/2010/08/triathlonSwim1-thumb-640xauto-204907.jpg", image3: "http://cdn.triathlete.com/wp-content/uploads/2011/08/259.jpg", image4: "https://www.bizbash.com/content/editorial/storyimg/big/chicago-triathlon.jpg")
Event.create(name: "2016 Chicago Tri - Aquabike", datetime: "2016-08-27 11:00:00 GMT-0500", description: "1500m open water swim with wave start, 25 mile bike ride on Lake Shore Drive, then go directly to the finish line on Columbus Drive.", event_type: "Race", distance: "Olympic", sport_id: 6, location_id: 1, main_image: "https://i.ytimg.com/vi/eJ2xQDr21f8/maxresdefault.jpg", image2: "http://www.chicagonow.com/blogs/show-me-chicago/assets_c/2010/08/triathlonSwim1-thumb-640xauto-204907.jpg", image3: "http://cdn.triathlete.com/wp-content/uploads/2011/08/259.jpg", image4: "https://www.bizbash.com/content/editorial/storyimg/big/chicago-triathlon.jpg")
Event.create(name: "2016 Chicago Marathon", datetime: "2016-10-09 07:00:00 GMT-0500 GMT-0500", description: "Running the Bank of America Chicago Marathon is the pinnacle of achievement for elite athletes and everyday runners alike. On race day, runners from all 50 states and more than 100 countries will set out to accomplish a personal dream by reaching the finish line in Grant Park.", event_type: "Race", distance: "Marathon", sport_id: 2, location_id: 2, main_image: "http://www.summit4angelman.com/wp-content/uploads/2015/07/Chicago-Marathon.jpg", image2: "http://running.competitor.com/files/2016/10/Chicago-Marathon-2016.jpg", image3: "http://4.bp.blogspot.com/-m2r4-1d-d-E/Vh60iBIsimI/AAAAAAAABkA/VV-qj2Qabbk/s1600/chicago.jpg", image4: "http://www.chicagonow.com/show-me-chicago/files/2015/10/CMCourse-Map_FINAL.jpg")
Event.create(name: "2016 Door County Triathlon - Sprint", datetime: "2016-07-16 09:00:00 GMT-0500", description: "Swim in the clear waters of Lake Michigan, bike through the rolling hills of Door County, and run through Egg Harbor and surrounding towns.  Start and Finish at Murphy County Park.  All race participants receive a free pig roast lunch and two beer tickets to the post-race party!", event_type: "Race", sport_id: 1, distance: "Sprint", location_id: 5, main_image: "http://photos.capturedoorcounty.com/photos/sVSyztDdbke7gPPqlGf8kA/showcase.jpg", image2: "http://www.doorcountytriathlon.com/wp-content/uploads/2015/01/6358-DC-Tri-2013-768x512.jpg", image3: "http://www.doorcountytriathlon.com/wp-content/uploads/2015/04/7422-DC-Tri-2013-768x512.jpg", image4: "http://www.chicagotriclub.com/resources/Pictures/Slideshow/1%20CTC%20Door%20County%202016.jpg")
Event.create(name: "2016 Door County Triathlon - Half Ironman", datetime: "2016-07-17 09:00:00 GMT-0500", description: "Swim in the clear waters of Lake Michigan, bike through the rolling hills of Door County, and run through Egg Harbor and surrounding towns.  Start and Finish at Murphy County Park.  All race participants receive a free pig roast lunch and two beer tickets to the post-race party!", event_type: "Race", sport_id: 1, distance: "Half Ironman", location_id: 5, main_image: "http://photos.capturedoorcounty.com/photos/sVSyztDdbke7gPPqlGf8kA/showcase.jpg", image2: "http://www.doorcountytriathlon.com/wp-content/uploads/2015/01/6358-DC-Tri-2013-768x512.jpg", image3: "http://www.doorcountytriathlon.com/wp-content/uploads/2015/04/7422-DC-Tri-2013-768x512.jpg", image4: "http://www.chicagotriclub.com/resources/Pictures/Slideshow/1%20CTC%20Door%20County%202016.jpg")

Event.create(name: "2018 Chicago Tri - Sprint", datetime: "2018-08-25 06:00:00 GMT-0500", description: "800m open water swim with wave start, 12 mile bike ride on Lake Shore Drive, and 3.1 mile run on the lakefront path, ending on Columbus Drive.", event_type: "Race", distance: "Sprint", sport_id: 1, location_id: 1, main_image: "https://i.ytimg.com/vi/eJ2xQDr21f8/maxresdefault.jpg", image2: "http://www.chicagonow.com/blogs/show-me-chicago/assets_c/2010/08/triathlonSwim1-thumb-640xauto-204907.jpg", image3: "http://cdn.triathlete.com/wp-content/uploads/2011/08/259.jpg", image4: "https://www.bizbash.com/content/editorial/storyimg/big/chicago-triathlon.jpg")
Event.create(name: "2018 Chicago Tri - Olympic", datetime: "2018-08-25 09:00:00 GMT-0500", description: "1500m open water swim with wave start, 25 mile bike ride on Lake Shore Drive, and 6.2 mile run on the lakefront path, ending on Columbus Drive.", event_type: "Race", distance: "Olympic", sport_id: 1, location_id: 1, main_image: "https://i.ytimg.com/vi/eJ2xQDr21f8/maxresdefault.jpg", image2: "http://www.chicagonow.com/blogs/show-me-chicago/assets_c/2010/08/triathlonSwim1-thumb-640xauto-204907.jpg", image3: "http://cdn.triathlete.com/wp-content/uploads/2011/08/259.jpg", image4: "https://www.bizbash.com/content/editorial/storyimg/big/chicago-triathlon.jpg")
Event.create(name: "2018 Chicago Tri - Aquabike", datetime: "2018-08-25 11:00:00 GMT-0500", description: "1500m open water swim with wave start, 25 mile bike ride on Lake Shore Drive, then go directly to the finish line on Columbus Drive.", event_type: "Race", distance: "Olympic", sport_id: 6, location_id: 1, main_image: "https://i.ytimg.com/vi/eJ2xQDr21f8/maxresdefault.jpg", image2: "http://www.chicagonow.com/blogs/show-me-chicago/assets_c/2010/08/triathlonSwim1-thumb-640xauto-204907.jpg", image3: "http://cdn.triathlete.com/wp-content/uploads/2011/08/259.jpg", image4: "https://www.bizbash.com/content/editorial/storyimg/big/chicago-triathlon.jpg")
Event.create(name: "2018 Chicago Marathon", datetime: "2018-10-06 07:00:00 GMT-0500", description: "Running the Bank of America Chicago Marathon is the pinnacle of achievement for elite athletes and everyday runners alike. On race day, runners from all 50 states and more than 100 countries will set out to accomplish a personal dream by reaching the finish line in Grant Park.", event_type: "Race", distance: "Marathon", sport_id: 2, location_id: 2, main_image: "http://www.summit4angelman.com/wp-content/uploads/2015/07/Chicago-Marathon.jpg", image2: "http://running.competitor.com/files/2016/10/Chicago-Marathon-2016.jpg", image3: "http://4.bp.blogspot.com/-m2r4-1d-d-E/Vh60iBIsimI/AAAAAAAABkA/VV-qj2Qabbk/s1600/chicago.jpg", image4: "http://www.chicagonow.com/show-me-chicago/files/2015/10/CMCourse-Map_FINAL.jpg")
Event.create(name: "2018 Door County Triathlon - Sprint", datetime: "2018-07-21 09:00:00 GMT-0500", description: "Swim in the clear waters of Lake Michigan, bike through the rolling hills of Door County, and run through Egg Harbor and surrounding towns.  Start and Finish at Murphy County Park.  All race participants receive a free pig roast lunch and two beer tickets to the post-race party!", event_type: "Race", sport_id: 1, distance: "Sprint", location_id: 5, main_image: "http://photos.capturedoorcounty.com/photos/sVSyztDdbke7gPPqlGf8kA/showcase.jpg", image2: "http://www.doorcountytriathlon.com/wp-content/uploads/2015/01/6358-DC-Tri-2013-768x512.jpg", image3: "http://www.doorcountytriathlon.com/wp-content/uploads/2015/04/7422-DC-Tri-2013-768x512.jpg", image4: "http://www.chicagotriclub.com/resources/Pictures/Slideshow/1%20CTC%20Door%20County%202016.jpg")
Event.create(name: "2018 Door County Triathlon - Half Ironman", datetime: "2018-07-22 09:00:00 GMT-0500", description: "Swim in the clear waters of Lake Michigan, bike through the rolling hills of Door County, and run through Egg Harbor and surrounding towns.  Start and Finish at Murphy County Park.  All race participants receive a free pig roast lunch and two beer tickets to the post-race party!", event_type: "Race", sport_id: 1, distance: "Half Ironman", location_id: 5, main_image: "http://photos.capturedoorcounty.com/photos/sVSyztDdbke7gPPqlGf8kA/showcase.jpg", image2: "http://www.doorcountytriathlon.com/wp-content/uploads/2015/01/6358-DC-Tri-2013-768x512.jpg", image3: "http://www.doorcountytriathlon.com/wp-content/uploads/2015/04/7422-DC-Tri-2013-768x512.jpg", image4: "http://www.chicagotriclub.com/resources/Pictures/Slideshow/1%20CTC%20Door%20County%202016.jpg")
Event.create(name: "2016 Bigfoot Triathlon", datetime: "2016-06-26 06:30:00 GMT-0500", description: "The Bigfoot Triathlon and Trail Run are brought to you by RAM Racing. We're passionate about creating races that give our participants an unforgettable emotional experience from start to finish. Join the movement by running with RAM Racing.\n\n The Bigfoot Series features a 5k and 10k trail race, and an Olympic, Sprint and Relay triathlon, and all runners are encouraged to join the fun! Participants receive an award winning goodie bag, which they collect at packet pickup along with their race packet.", image2: "https://s3.amazonaws.com/assets.ramraces.com/public/www.bigfoottriathlon.com/generated/_c88a36d2a0b60671dc304ca962ba2fb8.jpg?1493672264", image3: "https://s3.amazonaws.com/assets.ramraces.com/public/www.bigfoottriathlon.com/generated/_86b5a4145d87b301c90d23934af0031a.jpg?1493672601", image4: "https://s3.amazonaws.com/assets.ramraces.com/public/www.bigfoottriathlon.com/generated/_68cf4e66ec5a9d4ccda95310d210fa67.jpg?1493672619", main_image: "https://s3.amazonaws.com/assets.ramraces.com/public/www.bigfoottriathlon.com/generated/_bd3267d818a4ebcb3c7193ae27c3ea2d.jpg?1493672302", event_type: "Race", sport_id: 1, distance: "Olympic", location_id: 6)
Event.create(name: "2017 Bigfoot Triathlon", datetime: "2017-06-25 06:30:00 GMT-0500", description: "The Bigfoot Triathlon and Trail Run are brought to you by RAM Racing. We're passionate about creating races that give our participants an unforgettable emotional experience from start to finish. Join the movement by running with RAM Racing.\n\n The Bigfoot Series features a 5k and 10k trail race, and an Olympic, Sprint and Relay triathlon, and all runners are encouraged to join the fun! Participants receive an award winning goodie bag, which they collect at packet pickup along with their race packet.", image2: "https://s3.amazonaws.com/assets.ramraces.com/public/www.bigfoottriathlon.com/generated/_c88a36d2a0b60671dc304ca962ba2fb8.jpg?1493672264", image3: "https://s3.amazonaws.com/assets.ramraces.com/public/www.bigfoottriathlon.com/generated/_86b5a4145d87b301c90d23934af0031a.jpg?1493672601", image4: "https://s3.amazonaws.com/assets.ramraces.com/public/www.bigfoottriathlon.com/generated/_68cf4e66ec5a9d4ccda95310d210fa67.jpg?1493672619", main_image: "https://s3.amazonaws.com/assets.ramraces.com/public/www.bigfoottriathlon.com/generated/_bd3267d818a4ebcb3c7193ae27c3ea2d.jpg?1493672302", event_type: "Race", sport_id: 1, distance: "Olympic", location_id: 6)
Event.create(name: "2018 Bigfoot Triathlon", datetime: "2018-06-24 06:30:00 GMT-0500", description: "The Bigfoot Triathlon and Trail Run are brought to you by RAM Racing. We're passionate about creating races that give our participants an unforgettable emotional experience from start to finish. Join the movement by running with RAM Racing.\n\n The Bigfoot Series features a 5k and 10k trail race, and an Olympic, Sprint and Relay triathlon, and all runners are encouraged to join the fun! Participants receive an award winning goodie bag, which they collect at packet pickup along with their race packet.", image2: "https://s3.amazonaws.com/assets.ramraces.com/public/www.bigfoottriathlon.com/generated/_c88a36d2a0b60671dc304ca962ba2fb8.jpg?1493672264", image3: "https://s3.amazonaws.com/assets.ramraces.com/public/www.bigfoottriathlon.com/generated/_86b5a4145d87b301c90d23934af0031a.jpg?1493672601", image4: "https://s3.amazonaws.com/assets.ramraces.com/public/www.bigfoottriathlon.com/generated/_68cf4e66ec5a9d4ccda95310d210fa67.jpg?1493672619", main_image: "https://s3.amazonaws.com/assets.ramraces.com/public/www.bigfoottriathlon.com/generated/_bd3267d818a4ebcb3c7193ae27c3ea2d.jpg?1493672302", event_type: "Race", sport_id: 1, distance: "Olympic", location_id: 6)

itu_api_events = Unirest.get("https://api.triathlon.org/v1/events?per_page=600&start_date=2015-09-14&end_date=2019-09-14&region_id=11", headers:{ "apikey" => ENV["TRIATHLON_ORG_API_KEY"] }).body["data"]

itu_api_events.each do |itu_api_event|
  event_id = itu_api_event["event_id"]
  date_time = (itu_api_event["event_date"] + " 06:00:00").to_datetime
  event_lat = itu_api_event["event_latitude"]
  event_long = itu_api_event["event_longitude"]

  if Location.where("latitude = ? AND longitude = ?", event_lat, event_long) != []
    new_event_location_id = Location.where("latitude = ? AND longitude = ?", event_lat, event_long).first.id
  else
    new_location = Location.create(city: itu_api_event["event_venue"], country: itu_api_event["event_country"], latitude: event_lat, longitude: event_long)
    new_event_location_id = new_location.id
  end

  event_specifications = itu_api_event["event_specifications"]
  sport = event_specifications[0]["cat_name"]
  if Sport.where("name = ?", sport) != []
    new_event_sport_id = Sport.where("name = ?", sport).first.id
  else
    new_sport = Sport.create(name: sport)
    new_event_sport_id = new_sport.id
  end

  if event_specifications.count > 1
    distance = event_specifications[1]["cat_name"]
    if distance == "Standard"
      new_event_distance = "Olympic"
    else
      new_event_distance = distance
    end
  else
    new_event_distance = "Olympic"
  end
  
  images = Unirest.get(
    "https://api.triathlon.org/v1/events/#{event_id}/images?per_page=4", 
    headers:{ "apikey" => ENV["TRIATHLON_ORG_API_KEY"] }
    ).body["data"]
  if images.length < 4
    chi_images = Unirest.get("https://api.triathlon.org/v1/events/90168/hr_images?per_page=500", 
    headers:{ "apikey" => ENV["TRIATHLON_ORG_API_KEY"] }
    ).body["data"]
    images = [ 
      {"thumbnail" => chi_images[rand(0..496)]["thumbnail"]}, 
      {"thumbnail" => chi_images[rand(0..496)]["thumbnail"]}, 
      {"thumbnail" => chi_images[rand(0..496)]["thumbnail"]}, 
      {"thumbnail" => chi_images[rand(0..496)]["thumbnail"]} 
    ]
  end


  new_event = Event.create(
    name: itu_api_event["event_title"], 
    datetime: date_time, 
    description: Faker::Lorem.paragraph(20),
    event_type: "Race", 
    sport_id: new_event_sport_id, 
    distance: new_event_distance, 
    location_id: new_event_location_id, 
    main_image: images[0]["thumbnail"],
    image2: images[1]["thumbnail"],
    image3: images[2]["thumbnail"],
    image4: images[3]["thumbnail"],
    itu_event_id: event_id
  )
end


Registration.create(user_id: 1, event_id: 2, status: "Registered")
Registration.create(user_id: 1, event_id: 6, status: "Interested", comment: "I will try to make it if I get off work early.")
Registration.create(user_id: 2, event_id: 1, status: "Registered")
Registration.create(user_id: 2, event_id: 3, status: "Registered")
Registration.create(user_id: 2, event_id: 4, status: "Cancelled", comment: "I'm doing a different race instead.")
Registration.create(user_id: 3, event_id: 4, status: "Volunteering", comment: "I'm pacing the 8-minute/mile group.  Join me!")
Registration.create(user_id: 3, event_id: 5, status: "I'm coming!")
Registration.create(user_id: 4, event_id: 7, status: "Registered")
Registration.create(user_id: 2, event_id: 8, status: "Registered")
Registration.create(user_id: 6, event_id: 21, status: "Registered")
Registration.create(user_id: 6, event_id: 20, status: "Registered")
Registration.create(user_id: 6, event_id: 14, status: "Registered")
Registration.create(user_id: 6, event_id: 12, status: "Registered")
Registration.create(user_id: 6, event_id: 22, status: "Volunteering")

1000.times do
  user = User.find_by(id: rand(7..55))
  event_id = rand(1..Event.count)

  while user.registrations.find_by(event_id: event_id)
    event_id = rand(1..Event.count)
  end

  Registration.create(
    user_id: user.id,
    event_id: event_id,
    status: "Registered"
    )
end


Report.create(user_id: 4, registration_id: 8, title: "Fast and Fun Race!", body: "What a cute little race!  The transition area was well-organized, and each racer had an assigned rack position.  Everything was clearly marked, so it was quite easy to find your place.  The race start was also well done-- there were plenty of porta-potties near the start and the announcements could be clearly heard.  I was in the first wave, so didn't have to wait too long for my race to start.  The swim course was very well marked with huge orange buoys, so it was nearly impossible to go off course.  They also had kayakers stationed frequently throughout the course, ready to react in case of emergency.  The bike course was super fun-- lots of hills and very well marked.  The aid stations we were marked and volunteers were clearly knowledgeable in how to do the bike hand-offs.  The run course was also very hilly and not very well shaded, so it got quite hot.  But since I was in the first place, I was done well before the sun got super hot.  They had BBQ pulled pork and beer and the post-race party, which was a bit of a disappointment since I thought there would be a pig roast.  But I guess they're doing the roast tomorrow for the Half Ironman.  All in all, great experience!", bib_number: 3, overall_rating: 5, swag_rating: 4, post_party_rating: 4, packet_pickup_rating: 5, race_support_rating: 5)
Report.create(user_id: 2, registration_id: 9, title: "Nice Half Ironman!  Will definitely do again!", body: "What a cute little race!  The transition area was well-organized, and each racer had an assigned rack position.  Everything was clearly marked, so it was quite easy to find your place.  The race start was also well done-- there were plenty of porta-potties near the start and the announcements could be clearly heard.  I was in the first wave, so didn't have to wait too long for my race to start.  The swim course was very well marked with huge orange buoys, so it was nearly impossible to go off course.  They also had kayakers stationed frequently throughout the course, ready to react in case of emergency.  The bike course was super fun-- lots of hills and very well marked.  The aid stations we were marked and volunteers were clearly knowledgeable in how to do the bike hand-offs.  The run course was also very hilly and not very well shaded, so it got quite hot.  But since I was in the first place, I was done well before the sun got super hot.  The post race party was tons of fun and included a pig roast and beer.  It was nice to have stuff going on at the finish line so my friends and family had something to do while I was still racing.  All in all, great experience!", bib_number: 6, overall_rating: 5, swag_rating: 4, post_party_rating: 5, packet_pickup_rating: 4, race_support_rating: 5)
Report.create(user_id: 6, registration_id: 10, title: "Cute Race!", body: "Lake Geneva is a beautiful venue, and I loved the trail run!  I was worried about getting lost since the course wasn't marked all that well and I didn't see too many volunteers especially on the bike.  But luckily I was able to stay with a group of other racers so didn't have to worry about getting lost.", bib_number: 256, overall_rating: 4, swag_rating: 4, post_party_rating: 3, packet_pickup_rating: 4, race_support_rating: 3)
Report.create(user_id: 6, registration_id: 12, title: "The Best Race Ever!", body: "What a cute little race!  The transition area was well-organized, and each racer had an assigned rack position.  Everything was clearly marked, so it was quite easy to find your place.  The race start was also well done-- there were plenty of porta-potties near the start and the announcements could be clearly heard.  I was in the first wave, so didn't have to wait too long for my race to start.  The swim course was very well marked with huge orange buoys, so it was nearly impossible to go off course.  They also had kayakers stationed frequently throughout the course, ready to react in case of emergency.  The bike course was super fun-- lots of hills and very well marked.  The aid stations we were marked and volunteers were clearly knowledgeable in how to do the bike hand-offs.  The run course was also very hilly and not very well shaded, so it got quite hot.  But since I was in the first place, I was done well before the sun got super hot.  The post race party was tons of fun and included a pig roast and beer.  It was nice to have stuff going on at the finish line so my friends and family had something to do while I was still racing.  All in all, great experience!", bib_number: 351, overall_rating: 5, swag_rating: 4, post_party_rating: 5, packet_pickup_rating: 4, race_support_rating: 5)
Report.create(user_id: 6, registration_id: 13, title: "Nice Hometown Race!", body: "This is definitely a must-do race if you're from Chicago!  You get to run through the various neighborhoods, and there's so much energy along the way.  I had friends and family cheering for me every few miles.  Since the course loops around the various neighborhoods, people can come and see me pass by multiple times at various stages in the race.  It's definitely motivating and uplifting to see loved ones so many times!  Race support was very organized including at the start line, aid stations, and finish area.  I'd definitely do this race again!", bib_number: 10479, overall_rating: 5, swag_rating: 4, post_party_rating: 5, packet_pickup_rating: 4, race_support_rating: 5)
Report.create(user_id: 6, registration_id: 14, title: "Terrible & Dangerous Race", body: "This is the worst race I've ever witnessed.  I saw 3 bike crashes due to poor signage, and there weren't even enough porta potties at the start line.", bib_number: 'volunteer', overall_rating: 1)


registrations = Registration.joins(:event).where('events.datetime < ?', Time.now)

registrations.each do |registration|
  if !Report.find_by(registration_id: registration.id)
    Report.create(
      user_id: registration.user_id,
      registration_id: registration.id,
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph(10), 
      bib_number: rand(1..1000),
      overall_rating: rand(3..5), 
      swag_rating: rand(3..5), 
      post_party_rating: rand(2..5), 
      packet_pickup_rating: rand(2..5), 
      race_support_rating: rand(1..5)
      )
  end
end




