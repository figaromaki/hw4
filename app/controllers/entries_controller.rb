class EntriesController < ApplicationController

  def new
  end

  def create
    @entry = Entry.new
    @user = User.find_by({ "id" => session["user_id"]})
    @entry["user_id"] = @user["id"]
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
