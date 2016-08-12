require 'faker'

# Users

20.times do
  asker = User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "password")
end

# Questions

q2 = Question.create( title:"I can hear light right now. Help", body: "I have never been so hungover in my life. I can literally hear light, my head hurts that bad. Hiding under the covers isnt working.", author_id: rand(1..21))

q3 = Question.create( title:"***SOS! SOS! I HAVE A JOB INTERVIEW IN 3 HOURS! SOS! SOS!***", body: "PLEASE help me! I have an interview for my dream job in 3 hours and I cannot stop throwing up! I have tried coffee, a cold shower, alka seltzer, ramen noodles, and gatorade! Nothing is working! I will try ANYTHING!!!", author_id: rand(1..21))

q4 = Question.create( title:"How do I un-send drunk texts?", body: "I sent my crush 50 text messages last night. Is it possible to remove them from her phone? Please help!!!!!!", author_id: 5)

q5 = Question.create( title: "Stil waiting...How do I un-send drunk texts?", body: "I sent my crush 50 text messages last night. Is it possible to remove them from her phone? Please help!!!!!!", author_id: 5)

q6 = Question.create( title: "Thinke im stipl drunkol/ tryuong to avoid a hangover/", body: "any suggestions???>>", author_id: rand(1..21))

q7 = Question.create( title: "Seeing double. Help stop my trouble.", body: "I cant see straight, im seeing double. Too much tequila. Any ideas?", author_id: rand(1..21))

q1 = Question.create( title:"Can you die from a hangover?", body: "Asking for a friend.", author_id: rand(1..21))

# Answers 

a1 = Answer.create(body: "You need Stinson's hangover fixer eliquer! It contains tantrum, grease, bananas, ginger, funyuns, and a secret ingredient...that I dont remeber...but it really works!" , question_id: 3 , user_id: rand(1..21))

a2 = Answer.create(body: "have you tried ginger ale and saltines? Always works for me. Good luck!" , question_id: 3 , user_id: rand(1..21))

a3 = Answer.create(body: "yes." , question_id: 7 , user_id: rand(1..21))

a4 = Answer.create(body: "I guess you'll find out." , question_id: 7 , user_id: rand(1..21))

a5 = Answer.create(body: " According to Google: YES, a hangover can kill you. It's a depressant and it can be deadly. But rather than die directly from a hangover, what will ransack you is the poisoning, dehydration and/or severe CNS (central nervous system) depression of over consumption...Good luck, buddy" , question_id: 7 , user_id: rand(1..21))

a6 = Answer.create(body: "Thats rough..." , question_id: 4 , user_id: rand(1..21))

a7 = Answer.create(body: "Youre fucked" , question_id: 4 , user_id: rand(1..21))

a8 = Answer.create(body: "Pray she broke her phone last night" , question_id: 4 , user_id: rand(1..21))

a9 = Answer.create(body: "Dont stop drinking and avoid the hangover forever!" , question_id: 5 , user_id: rand(1..21))

a10 = Answer.create(body: "Eat something greasy and take a nap before it sets in" , question_id: 5 , user_id: rand(1..21))


a11 = Answer.create(body: "Don't drink so much tequila next time?" , question_id: 6 , user_id: rand(1..21))

# Votes
20.times do
  type = ["Answer", "Question"].sample
  vote = Vote.create(voteable_type: type , voteable_id: rand(1..21), user_id: rand(1..21), points: 1)
end

# Comments

	

60.times do
  type = ["Answer", "Question"].sample
  a = Comment.create(body: Faker::Hipster.sentence, commentable_type: type , commentable_id: rand(1..21), user_id: rand(1..21))
end
