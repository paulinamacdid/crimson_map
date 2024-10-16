class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    Facility.near('London, NE, UK')
    # add line of code that only pulls facilities that are a rating 4 and above
  end
end
