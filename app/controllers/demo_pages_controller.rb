class DemoPagesController < ApplicationController
  def home
  	if logged_in?
    @entry = current_user.entries.build
    @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 15)
    else
    @entries = Entry.all.paginate(page: params[:page], :per_page => 15)
    end
  end

  def help
  end
end
