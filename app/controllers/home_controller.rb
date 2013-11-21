class HomeController < ApplicationController
  include Calendrier::EventExtension

  def index
    arr = Meeting.all
    arr << Event.all
    @events_by_date = sort_events(arr)
  end
end