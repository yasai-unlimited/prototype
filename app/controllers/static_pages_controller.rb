class StaticPagesController < ApplicationController
  def home
    logged_in_user
  end
end
