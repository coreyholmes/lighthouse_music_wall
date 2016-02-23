# Homepage (Root path)
get '/' do
  @songs = Songs.all
  if session[:vote]
      session[:vote] += 1
    else
      session[:vote] = 0
  end
  erb :index
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

