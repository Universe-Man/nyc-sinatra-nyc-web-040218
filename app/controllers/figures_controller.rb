require 'pry'
class FiguresController < ApplicationController

  get '/' do
    erb :index
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:name].empty? && !params[:year_completed].empty?
      @figure.landmarks << Landmark.create(name: params[:name], year_completed: params[:year_completed])
    end
    # if !params[]

    erb :'/figures/index'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    @figure.save
    redirect to "/figures/#{params[:id]}"
  end

  get '/figures' do
      erb :'/figures/index'
    end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end



end
