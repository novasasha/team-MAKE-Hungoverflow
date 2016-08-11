post '/questions/:id/answers' do
  @answer = Answer.new(
          body: params['answer'][:body],
          question_id: params['answer'][:question_id],
          user_id: current_user.id)

  if @answer.save
    redirect "/questions/#{@answer.question_id}"
  else
    erb :"/questions/#{@answer.question_id}"
  end
end

post '/answers/:id/vote' do
  puts "messages"
  puts "\n\n\n\n"
  puts session.inspect
  answer = Answer.find(params[:id])
  vote = answer.votes.new(user_id: session[:user_id], points: params[:points])
  if vote.save
    redirect "/questions/#{answer.question.id}"
  else
    puts vote.errors.full_messages
    redirect "/questions"
  end
end

