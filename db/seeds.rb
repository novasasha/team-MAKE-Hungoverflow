require 'faker'
#
# 20.times do
#   asker = User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "password")
# end
#
# 20.times do
#   q = Question.create( title: Faker::Hipster.sentence, body: Faker::Hipster.sentence, author_id: rand(1..21))
# end
#
# 30.times do
#   a = Answer.create(body: Faker::Hipster.sentence, question_id: rand(1..21), user_id: rand(1..21))
# end
#
# 20.times do
#   type = ["Answer", "Question"].sample
#   vote = Vote.create(voteable_type: type , voteable_id: rand(1..21), user_id: rand(1..21), points: 1)
# end

60.times do
  type = ["Answer", "Question"].sample
  a = Comment.create(body: Faker::Hipster.sentence, commentable_type: type , commentable_id: rand(1..21), user_id: rand(1..21))
end
