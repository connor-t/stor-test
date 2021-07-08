class HomeController < ApplicationController
  def index
    @data = BinanceService.get_klines(params[:symbol], params[:interval])
  end

  def create
    @object = Object.new(params[:object])
    if @object.save
      flash[:success] = "Object successfully created"
      redirect_to @object
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def search
    puts params
  end
  
end
