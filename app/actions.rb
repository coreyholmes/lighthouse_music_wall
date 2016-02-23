helpers do 
  def current_user
    if session[:user_id]
      Users.find(session[:user_id])
    end
  end
end

# Homepage (Root path)
get '/' do
  @songs = Songs.all
  @add_music = "display"
  session[:vote] = 0
  # if session[:vote]
  #     session[:vote] += 1
  #   else
  #     session[:vote] = 0
  # end
  erb :index
end

# Voting
get '/upvote' do
@upvoted = false
  if @upvoted == false
    session[:vote] += 1
    @upvoted = true
    erb :index
  else
    erb :index
  end
end

# Register User
get '/register' do
  @login_btn = "display"
  erb :'users/register'
end

post '/new-user' do
  @users = Users.new(
    first_name:   params[:first_name],
    last_name: params[:last_name],
    email:  params[:email],
    password:  params[:password]
  )
  if @users.save
    redirect '/'
  else
    erb :'users/register'
  end
end

# Login User
get '/login' do
  erb :'users/login'
end

post '/login' do
  @email = params[:email]
  @password = params[:password]
  @user = Users.where(email: @email, password: @password).first
  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'users/login'
  end
end

# Logout User
get '/logout' do
  session.clear
  redirect '/register'
end

# Adding new songs to the wall
get '/new' do
  erb :new
end

post '/new' do
  @songs = Songs.new(
    name:   params[:name],
    artist: params[:artist],
    url:  params[:url]
  )
  if @songs.save
    redirect '/'
  else
    erb :new
  end
end

