get '/sessions/new' do
  erb :"/sessions/new"
end

post '/sessions' do
  @user = User.find_by(username: params["user"]["username"])
  if @user && @user.authenticate(params["user"]["password"])
    session[:user_id] = @user.id
    redirect "/"
  else
    @errors = ["Something went wrong. Are you still drunk?"]
    erb :"sessions/new"
  end
end

delete '/sessions' do
  session[:user_id] = nil
  redirect "/"
end
