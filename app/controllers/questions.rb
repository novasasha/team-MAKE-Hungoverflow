# Select all questions
get '/questions' do
  @questions = Question.order(updated_at: :desc)

  erb :"/questions/index"
end

# Directs to form for creating a new question
get '/questions/new' do
  authorize!

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

# insert a new question
post '/questions' do
  authorize!

end

post '/questions/:id/vote' do
  puts "\n\n\n\n"
  puts "did this work"

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
