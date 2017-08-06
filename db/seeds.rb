# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(first_name: "Gwen", last_name: "Jorgensen", email: "gwen@email.com", bio: "Gwen Rosemary Jorgensen (born April 25, 1986 in Waukesha, Wisconsin) is an American professional triathlete. She is the 2014 and 2015 ITU World Triathlon Series Champion. She has been named USA Triathlon's 2013 and 2014 Olympic/ITU Female Athlete of the Year. She was a member of the 2012 Olympic Team and again represented the United States in triathlon at the 2016 Summer Olympics, where she won the USA's first ever triathlon gold medal with a time of 1 hour, 56 minutes, and 16 seconds", password: "password", avatar: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Gwen_Jorgensen_winner_in_Stockholm_2013_-4.jpg/480px-Gwen_Jorgensen_winner_in_Stockholm_2013_-4.jpg")
User.create(first_name: "Andy", last_name: "Potts", email: "andy@email.com", bio: "Andrew Robert Potts (born December 28, 1976) is a triathlete from the United States. He competed in triathlon at the 2004 Summer Olympics and is the 2007 Ironman 70.3 World Champion. Prior to triathlon, Potts was a swimmer where he won the bronze medal in the men's 400m individual medley at the 1995 Summer Universiade and earned a spot on the USA Swimming national team where he would place fourth at the 1996 Olympic Trials in the 400 IM.", password: "password", avatar: "https://en.wikipedia.org/wiki/File:Andy_Potts_at_70.3_Eagleman.png")
User.create(first_name: "Scott", last_name: "Jurek", email: "scott@email.com", bio: "Scott Gordon Jurek (born October 26, 1973) is an American ultramarathoner, New York Times bestselling author of Eat & Run, and public speaker. Throughout his career, Jurek has been one of the most dominant ultramarathon runners in the world, winning many of the sport's most prestigious races multiple times, including the Hardrock Hundred (2007), the Badwater Ultramarathon (2005, 2006), the Spartathlon (2006, 2007, 2008), and the Western States 100 Mile Endurance Run (1999–2005). In 2010, at the 24-Hour World Championships in Brive-la-Gaillarde, France, Jurek won a silver medal behind Shingo Inoue and set a new US record for distance run in 24 hours with 165.7 miles (an average pace of 8 minutes and 42 seconds per mile)", password: "password", avatar: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Scott_Jurek%2C_Ultramarathon_Champion.jpg/440px-Scott_Jurek%2C_Ultramarathon_Champion.jpg")
User.create(first_name: "Sarah", last_name: "True", email: "sarah@email.com", bio: "Sarah True (née Groff, born November 27, 1981) is an American athlete who competes in triathlon. She represented the United States in triathlon in 2012, finishing in fourth place, and at the 2016 Summer Olympics. True is the winner of the 2007 ITU Aquathlon World Championships and finished in second place in the 2014 ITU World Triathlon Series.", password: "password", avatar: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Sarah_Groff%2C_winner_in_Stockholm_2014..jpg/480px-Sarah_Groff%2C_winner_in_Stockholm_2014..jpg")


Sport.create(name: "Triathlon")
Sport.create(name: "Running")
Sport.create(name: "Cycling")
Sport.create(name: "Swimming")
Sport.create(name: "Duathlon")
Sport.create(name: "Aquabike")


Location.create(name: "Monroe Harbor", street_address: "400 E Monroe St", city: "Chicago", state: "IL")
Location.create(name: "Grant Park", street_address: "337 E Randolph St", city: "Chicago", state: "IL", zip: "60601")
Location.create(name: "North Avenue Chess Pavilion", street_address: "1600 N Lake Shore Dr", city: "Chicago", state: "IL")
Location.create(name: "Pizzeria Serio", street_address: "1708 W Belmont Ave", city: "Chicago", state: "IL")
Location.create(name: "Murphy County Park", street_address:"7119 Bay Shore Dr", city: "Egg Harbor", state: "WI", zip: 54209)


Event.create(name: "2017 Chicago Tri - Sprint", datetime: "2017-08-26 06:00:00 ", description: "800m open water swim with wave start, 12 mile bike ride on Lake Shore Drive, and 3.1 mile run on the lakefront path, ending on Columbus Drive.", event_type: "Race", distance: "Sprint", sport_id: 1, location_id: 1)
Event.create(name: "2017 Chicago Tri - Olympic", datetime: "2017-08-26 09:00:00 ", description: "1500m open water swim with wave start, 25 mile bike ride on Lake Shore Drive, and 6.2 mile run on the lakefront path, ending on Columbus Drive.", event_type: "Race", distance: "Olympic", sport_id: 1, location_id: 1)
Event.create(name: "2017 Chicago Tri - Aquabike", datetime: "2017-08-26 11:00:00 ", description: "1500m open water swim with wave start, 25 mile bike ride on Lake Shore Drive, then go directly to the finish line on Columbus Drive.", event_type: "Race", distance: "Olympic", sport_id: 6, location_id: 1)
Event.create(name: "2017 Chicago Marathon", datetime: "2017-10-07 07:00:00 ", description: "26.2 miles run through the streets of Chicago.  Seeded corral start.", event_type: "Race", distance: "Marathon", sport_id: 2, location_id: 2)
Event.create(name: "20-mile run", datetime: "2017-09-17 06:30:00 ", description: "I'm planning on doing a 20-mile run at 10 min/mile pace to prepare for the Chicago Marathon.  Anyone want to join me?", event_type: "Workout", distance: "20 miles", sport_id: 2, location_id: 3)
Event.create(name: "CTC Monthly Meeting: Sports Nutrition for Endurance Athletes", datetime: "2017-10-03 18:00:00 ", description: "Join the Chicago Tri Club for an evening of Tri Talk!  Come early at 6pm for happy hour and mingle with other triathletes.  Stay for the talk at 7 and listen to well-known author Monique Ryan speak on the topic of Sports Nutrition for Endurance Athletes.", event_type: "Clinic", location_id: 4)
Event.create(name: "2017 Door County Triathlon - Sprint", datetime: "2017-07-15 09:00:00", description: "Swim in the clear waters of Lake Michigan, bike through the rolling hills of Door County, and run through Egg Harbor and surrounding towns.  Start and Finish at Murphy County Park.  All race participants receive a free pig roast lunch and two beer tickets to the post-race party!", event_type: "Triathlon", location_id: 5)
Event.create(name: "2017 Door County Triathlon - Half Ironman", datetime: "2017-07-16 09:00:00", description: "Swim in the clear waters of Lake Michigan, bike through the rolling hills of Door County, and run through Egg Harbor and surrounding towns.  Start and Finish at Murphy County Park.  All race participants receive a free pig roast lunch and two beer tickets to the post-race party!", event_type: "Triathlon", location_id: 5)

Registration.create(user_id: 1, event_id: 2, status: "Registered")
Registration.create(user_id: 1, event_id: 6, status: "Interested", comment: "I will try to make it if I get off work early.")
Registration.create(user_id: 2, event_id: 1, status: "Registered")
Registration.create(user_id: 2, event_id: 3, status: "Registered")
Registration.create(user_id: 2, event_id: 4, status: "Cancelled", comment: "I'm doing a different race instead.")
Registration.create(user_id: 3, event_id: 4, status: "Volunteering", comment: "I'm pacing the 8-minute/mile group.  Join me!")
Registration.create(user_id: 3, event_id: 5, status: "I'm coming!")
Registration.create(user_id: 4, event_id: 7, status: "Registered")
Registration.create(user_id: 2, event_id: 8, status: "Registered")

Report.create(user_id: 4, event_id: 7, title: "Fast and Fun Race!", body: "What a cute little race!  The transition area was well-organized, and each racer had an assigned rack position.  Everything was clearly marked, so it was quite easy to find your place.  The race start was also well done-- there were plenty of porta-potties near the start and the announcements could be clearly heard.  I was in the first wave, so didn't have to wait too long for my race to start.  The swim course was very well marked with huge orange buoys, so it was nearly impossible to go off course.  They also had kayakers stationed frequently throughout the course, ready to react in case of emergency.  The bike course was super fun-- lots of hills and very well marked.  The aid stations we were marked and volunteers were clearly knowledgeable in how to do the bike hand-offs.  The run course was also very hilly and not very well shaded, so it got quite hot.  But since I was in the first place, I was done well before the sun got super hot.  They had BBQ pulled pork and beer and the post-race party, which was a bit of a disappointment since I thought there would be a pig roast.  But I guess they're doing the roast tomorrow for the Half Ironman.  All in all, great experience!", overall_rating: "5", swag_rating: 4, post_party_rating: 4, packet_pickup_rating: 5, race_support_rating: 5)
Report.create(user_id: 2, event_id: 8, title: "Nice Half Ironman!  Will definitely do again!", body: "What a cute little race!  The transition area was well-organized, and each racer had an assigned rack position.  Everything was clearly marked, so it was quite easy to find your place.  The race start was also well done-- there were plenty of porta-potties near the start and the announcements could be clearly heard.  I was in the first wave, so didn't have to wait too long for my race to start.  The swim course was very well marked with huge orange buoys, so it was nearly impossible to go off course.  They also had kayakers stationed frequently throughout the course, ready to react in case of emergency.  The bike course was super fun-- lots of hills and very well marked.  The aid stations we were marked and volunteers were clearly knowledgeable in how to do the bike hand-offs.  The run course was also very hilly and not very well shaded, so it got quite hot.  But since I was in the first place, I was done well before the sun got super hot.  The post race party was tons of fun and included a pig roast and beer.  It was nice to have stuff going on at the finish line so my friends and family had something to do while I was still racing.  All in all, great experience!", overall_rating: "5", swag_rating: 4, post_party_rating: 5, packet_pickup_rating: 4, race_support_rating: 5)




