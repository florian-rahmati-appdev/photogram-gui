class UsersController < ApplicationController

 def index
  matching_users = User.all
  
  @list_of_users = matching_users.order({ :username => :asc })

  render({ :template => "user_templates/index.html.erb"})
 end

 def show
  url_username = params.fetch("path_username")

  matching_usernames = User.where({ :username => url_username})
  @the_user = matching_usernames.at(0)

  #if @the_user == nil
    #redirect_to("/")
  #else 
  render({ :template => "user_templates/show.html.erb" })
  #end
 end

 def create
  #name="input_username"

  new_username = params.fetch("input_username")

  a_new_user = User.new
  a_new_user.username = new_username

  a_new_user.save

  #render({ :template => "user_templates/create.html.erb" })
  redirect_to("/users/" + a_new_user.username)
 end

 def update
  #name="input_username"
  user_name = params.fetch("modify_name")
  matching_user = User.where({ :id => user_name})
  the_user = matching_user.at(0)

  new_username = params.fetch("input_username")

  the_user.username = new_username
  the_user.save
  #the_new_user = matching_user.at(0)
  #the_new_user.username = user_name

  #the_new_user.save

  #render({ :template => "user_templates/update.html.erb" })
  redirect_to("/users/" + the_user.username)
 end
end 