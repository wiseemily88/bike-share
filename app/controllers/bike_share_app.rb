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
    redirect "/stations/#{@stations.id}"
  end

  get '/stations/:id' do
    @stations = Station.find(params[:id])
    erb :'/station/show'
  end

  get '/stations/:id/edit' do
    @stations = Station.find(params[:id])
    erb :'/station/edit'
  end

  put '/stations/:id' do
    @station = Station.update(params[:station])
    redirect "/stations/#{params[:id]}"
  end

  delete '/stations/:id' do
    Station.destroy(params[:id])
    redirect '/stations'
  end

  get '/station-dashboard' do
    @stations = Station.all
    erb :'/station/dashboard'
  end
end
