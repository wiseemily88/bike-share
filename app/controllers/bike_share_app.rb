require 'pry'
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
    Station.create(params[:station])
    
    redirect "/stations"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :'/station/show'
  end

  get '/stations/:id/edit' do
    @stations = Station.find(params[:id])
    erb :'/station/edit'
  end

  put '/stations/:id' do
    @stations = Station.update(params[:station])

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

  get '/trips' do
    @trips = Trip.all
    erb :'/trip/index'
  end

  get '/trips/new' do
    erb :'/trip/new'
  end

  post '/trips' do
    @trips = Trip.create(params[:trip])
    redirect "/trips/#{@trips.id}"
  end

  get '/trips/:id' do
    @trips = Trip.find(params[:id])
    erb :'/trip/show'
  end

  get '/trips/:id/edit' do
    @trips = Trip.find(params[:id])
    erb :'/trip/edit'
  end

  put '/trips/:id' do
    @trip = Trip.update(params[:trip])
    redirect "/trips/#{params[:id]}"
  end

  delete '/trips/:id' do
    Trip.destroy(params[:id])
    redirect '/trips'
  end

  get '/trips-dashboard' do
    @trips = Trip.all
    erb :'/trip/dashboard'
  end

  get '/conditions' do
    @conditions = Condition.all
    erb :'/condition/index'
  end

  get '/conditions/new' do
    erb :'/condition/new'
  end

  post '/conditions' do
    @conditions = Condition.create(params[:condition])
    redirect "/conditions/#{@conditions.id}"
  end

  get '/conditions/:id' do
    @conditions = Condition.find(params[:id])
    erb :'/condition/show'
  end

  get '/conditions/:id/edit' do
    @conditions = Condition.find(params[:id])
    erb :'/condition/edit'
  end

  put '/conditions/:id' do
    @condition = Condition.update(params[:condition])
    redirect "/conditions/#{params[:id]}"
  end

  delete '/conditions/:id' do
    Condition.destroy(params[:id])
    redirect '/conditions'
  end

  get '/condition-dashboard' do
    @conditions = Condition.all
    erb :'/condition/dashboard'
  end

end
