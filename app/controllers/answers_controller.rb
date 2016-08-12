post '/questions/:id/answers' do
  @answer = Answer.new(
          body: params['answer'][:body],
          question_id: params['answer'][:question_id],
          user_id: current_user.id)

  if @answer.save
    if request.xhr?
      erb :"answers/_show", :layout => false,
      :locals => { answer: @answer }
    else
      redirect"/questions/#{@answer.question_id}"
    end
  else
    @errors = @answer.errors.full_messages
    erb :"/questions/show"
  end
end


