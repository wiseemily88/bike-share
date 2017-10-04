class BikeShareApp < Sinatra::Base

  get '/' do
    "hello"
  end

  get '/stations' do
    @stations = Station.all
    erb :'/station/index'
  end

  get '/stations/new' do
    erb :'/station/new'
  end

  post '/stations' do
    @stations = Station.create(params[:station])
    redirect '/'
  end

  get '/stations/:id' do
    @stations = Station.find(params[:id])
    erb :'/station/show'
  end

  get '/stations/:id/edit' do
    @stations = Station.find(params[:id])
    erb :'/station/edit'
  end



  put '/stations/:name' do
    @station = Station.update()
    redirect "/stations/#{name}"
  end

  get '/station-dashboard' do
    erb :'/station/dashboard'
  end
end
