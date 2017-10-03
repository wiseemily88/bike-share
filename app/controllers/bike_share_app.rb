class BikeShareApp < Sinatra::Base

  get '/' do
    "hello"
  end

  get '/station' do
    @stations = stations.all
    erb :station_index
  end

  get '/station-dashboard' do
    erb :station_dashboard
  end
end
