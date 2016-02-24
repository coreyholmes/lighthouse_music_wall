
# Current User Helper Method
helpers do 
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end
end

# -------------------------------------
# Home / Index Page
# -------------------------------------

# Homepage (Root path)
get '/' do
  if current_user
    @reviews = Review.all
    @songs = Song.all
    @add_music = "display"
    # session[:vote] = 0
    # if session[:vote]
    #     session[:vote] += 1
    #   else
    #     session[:vote] = 0
    # end
    erb :index
  else
    redirect '/login'
  end
end

# -------------------------------------
# Song Voting
# -------------------------------------

# Song Voting
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

# -------------------------------------
# Register Page
# -------------------------------------

# Register Page
get '/register' do
  @login_btn = "display"
  erb :'users/register'
end

# Submit Register Form
post '/new-user' do
  @user = User.new(
    first_name:   params[:first_name],
    last_name: params[:last_name],
    email:  params[:email],
    password:  params[:password]
  )
  if @user.save
    redirect '/'
  else
    erb :'users/register'
  end
end

# -------------------------------------
# Login
# -------------------------------------

# Login Page
get '/login' do
  @register_btn = "display"
  erb :'users/login'
end

# Submit Login Form
post '/login' do
  @email = params[:email]
  @password = params[:password]
  @user = User.where(email: @email, password: @password).first
  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'users/login'
  end
end

# -------------------------------------
# Logout
# -------------------------------------

# Logout User
get '/logout' do
  session.clear
  redirect '/login'
end

# -------------------------------------
# Add New Song
# -------------------------------------

# Add New Song Page
get '/new' do
  erb :new
end

# Submit New Song Form
post '/new' do
  @song = Song.new(
    name: params[:name],
    artist: params[:artist],
    url: params[:url],
    user_id: params[:url]
  )
  if @song.save
    redirect '/'
  else
    erb :new
  end
end

# -------------------------------------
# Delete Review
# -------------------------------------

delete '/review/delete/:id' do
  review = Review.find(params[:review])
  if review.destroy
    redirect '/'
  else
    redirect '/new'
  end
end

# -------------------------------------
# Song Reviews
# -------------------------------------

# Add a Review
post '/new_review' do
  @review = Review.new(
    title: params[:title],
    content: params[:content],
    song_id: params[:song_id],
    user_id: params[:user_id]
    )
  if @review.save
    redirect '/'
  else
    erb :new
  end
end



