# Select all questions
get '/questions' do
  @questions = Question.order(updated_at: :desc)

  erb :"/questions/index"
end

# Directs to form for creating a new question
get '/questions/new' do
  erb :"/questions/new"
end

# insert a new question
post '/questions' do
  @question = Question.new(params['question'])
  @question.author_id = current_user.id
  if @question.save
    redirect "/"
  else
    @errors = @question.errors.full_messages
     erb :"/questions/new"
  end
end

# Select a specific question
get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :"/questions/show"
end

# Directs to form for editing a specific question
get '/questions/:id/edit' do
  # ###authorize!
  #validate user ownership of model
end

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


# Updates a question
put '/questions/:id' do
  authorize!
  #validate user ownership of model


end

# Deletes a question
delete '/questions/:id' do
  authorize!
  #validate user ownership of model

end
