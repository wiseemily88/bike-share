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


  put '/stations/:name' do
    @station = Station.update()
    redirect "/stations/#{name}"
  end

  get '/station-dashboard' do
    erb :'/station/dashboard'
  end
end
