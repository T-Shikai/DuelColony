class HomesController < ApplicationController
  def top
  end

  def about
    @admin = Admin.find_by(email: "admin@com")
  end
end
