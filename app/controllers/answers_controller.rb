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


