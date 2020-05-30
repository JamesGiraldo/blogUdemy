class WelcomeController < ApplicationController
  def index
    @articles = Article.all
  end
  def contactos
    @email = "Jamesgiiraldo@gmail.com"
  end
end
