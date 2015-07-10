require 'alchemyAPI/alchemyapi'
require 'json'

class AlchemyController < ApplicationController
  
  def index
    @documents = Document.all
  end

  def create
    alchemyapi = AlchemyAPI.new()
    response = alchemyapi.combined('url', params[:q],  {'extract'=>'page-image, title, author, concept' })
    puts JSON.pretty_generate(response)
      
    if 
      Document.create(result: response)
      flash[:notice] = "Input was successfully analyzed and persisted."
      redirect_to action: 'index'
    else
      flash[:notice] = "Input was successfully analyzed and persisted."
      redirect_to action: 'index'
    end
  end

  def destroy
    @document.destroy
    respond_to do |format|
      format.html {redirect_to action: 'index'}
      format.json {head :no_content}
    end
  end
end