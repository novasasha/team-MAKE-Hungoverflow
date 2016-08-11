post '/questions/:id/comment' do
  puts params.inspect
  question = Question.find(params[:id])
  comment = question.comments.new(user_id: session[:user_id], body: params[:body])
  if comment.save
    redirect "/questions/#{question.id}"
  else
    puts comment.errors.full_messages
    redirect "/questions"
  end
end

post '/answers/:id/comment' do
  puts params.inspect
  answer = Answer.find(params[:id])
  comment = answer.comments.new(user_id: session[:user_id], body: params[:body])
  if comment.save
    redirect "/questions/#{answer.question.id}"
  else
    puts comment.errors.full_messages
    redirect "/answers"
  end
end
