class WelcomeController < ApplicationController

  def index
    render json: {response: "Hello world"}
  end

end
