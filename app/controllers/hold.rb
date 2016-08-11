post '/questions/:id/vote' do
  puts session.inspect
  question = Question.find(params[:id])
  vote = question.votes.new(user_id: session[:user_id], points: params[:points])
  if vote.save
    redirect "/questions/#{question.id}"
  else
    puts "\n\n\n\n"
    puts "and also wtf"
    puts vote.errors.full_messages
    redirect "/questions"
  end
end
