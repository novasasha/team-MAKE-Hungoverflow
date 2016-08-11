post '/questions/:id/vote' do
  puts session.inspect
  question = Question.find(params[:id])
  vote = question.votes.new(user_id: session[:user_id], points: params[:points])
  if vote.save
    if request.xhr?
      status 200
      question.votes.sum(:points).to_s
    else
      redirect "/questions/#{question.id}"
    end
  else
    puts vote.errors.full_messages
    if request.xhr?
      status 422
      "Sober up buddy, you've had too many drinks and too many votes."
    else
      redirect "/questions"
    end
  end
end

post '/answers/:id/vote' do
  puts session.inspect
  answer = Answer.find(params[:id])
  vote = answer.votes.new(user_id: session[:user_id], points: params[:points])
  if vote.save
    if request.xhr?
      status 200
      answer.votes.sum(:points).to_s
    else
      redirect "/questions/#{answer.question.id}"
    end
  else
    if request.xhr?
      status 422
      "Sober up buddy, you've had too many drinks and too many votes."
    else
      redirect "/questions"
      puts vote.errors.full_messages
    end
  end
end

