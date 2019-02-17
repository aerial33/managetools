class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if current_user
      redirect_to tasks_path
    end
  end

  def about
  end

  def test

  end
end
