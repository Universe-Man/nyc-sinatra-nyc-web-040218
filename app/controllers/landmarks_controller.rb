class LandmarksController < ApplicationController

#SENDS US FORM TO CREATE A NEW LANDMARK
  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params)
    erb :'/landmarks/index'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params[:name], year_completed: params[:year_completed])
    @landmark.save
    redirect to "/landmarks/#{params[:id]}"
  end

  get '/landmarks' do
      erb :'/landmarks/index'
    end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end


end
