# enable :sessions
set :protection, except: :session_hijacking

post '/signup' do
  User.create(
    email: params[:email],
    password: params[:password]
  )
  @message = "Welcome, now we just need you to login below"
  erb :index
end

post '/login' do
  user = User.authenticate(params[:email],params[:password])

  if !user
    @message = "Wrong email/password"
    erb :index
  else
    session[:email] = user.email
    @rounds = Round.where(user_id: user.id)
    erb :main
  end
end

get '/logout' do
  session[:email] = nil
  erb :index
end