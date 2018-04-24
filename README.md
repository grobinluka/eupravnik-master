<b>CREATE NEW PROJECT</b>

Created new Rails project named evidence, with
```
rails new eupravnik-workspace
```

Created new scaffold "discussions" where all the discussions then shown.
```
rails g scaffold Discussion title:string content:text image:string
```

Edited that discussion controller where output will be date DESC in controller
```
@discussions = Discussion.all.order('created_at desc')
```

Installed bulma-rails, simple_form, rolify, cancancan, redcarpet, coderay, browser-timezone-rails, activerecord-reputation-system, omniauth (facebook), devise, carrierwave.
```
# bootstrap gem
gem 'bulma-rails', '~> 0.6.2'

#simplier forms
gem 'simple_form', '~> 4.0'

# authentication gem
gem 'devise', '~> 4.4', '>= 4.4.3'

# better administator gems
gem 'rolify', '~> 5.2'
gem 'cancancan', '~> 2.1', '>= 2.1.4'

# html editing 
gem 'redcarpet', '~> 3.4'
gem 'coderay', '~> 1.1', '>= 1.1.2'

# sets all the times in project to your browser timezone
gem 'browser-timezone-rails'

# reputation system - voting
gem 'activerecord-reputation-system', '~> 3.0', '>= 3.0.1', require: 'reputation_system'

# omniauth gem for authorized login though facebook
gem 'omniauth-oauth2', '~> 1.5'
gem 'omniauth-facebook', '~> 5.0'

# file upload gem
gem 'carrierwave', '~> 0.10.0'

```
Then we run bundle install
```
bundle install
```
---------------------------------------------------------
<b>GENERATING USERS</b>

Generated Users
```
rails g devise:install
rails g devise user
```

Cause it created a table in database we need to migrate the database
```
rake db:migrate
```

Created devise views
```
rails g devise:views
```

Set priority to login before you have option to do anything in application_controller.rb
```
  before_action :authenticate_user!
```

On devise sign-up I added 2 new inputs "name" and "lastname" besides that also adding in database "admin" so we can check who admin is, migration code:
```
rails g migration add_name_lastname_admin_to_user name:string lastname:string admin:boolean
```

Implementing Facebook.
https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview

---------------------------------------------------------
<b>CREATING SCAFFOLDS</b>

Created 2 more scaffolds "replies" where all the replies on discussion will be projected and "channels" where discussions will be shown basec on channel/topic
```
rails g scaffold Reply reply_post:text
rails g scaffold Channels channel:string
```

Then we connect all of the scaffolds together though migrations and models with belongs_to and has_many
```
rails g migration addUserIdToDiscussion user_id:integer
rails g migration addChannelIdToDiscussion channel_id:integer
rails g migration addDiscussionIdToChannel discussion_id:integer
rails g migration addDiscussionIdToReplies discussion_id:integer
rails g migration addUserIdToReplies user_id:integer
```

---------------------------------------------------------
<b>DISPLAYING DISCUSSIONS</b>

To display all the discussions I firstly defined discussions in controller
```
def show
    @discussions = Discussion.all.order('created_at desc')
  end
```

Then just output all of them
```
<% @discussions.each do |discussion| %>
```

I also added, so all the channels will be displayed on discussions show
So in controller you add this
```
@discussions = Discussion.where('channel_id = ?', @channel.id)
@channels = Channel.all.order("created_at DESC")
```

And outputed this in partial _sidebar.html.erb
```
<%= link_to c.channel, c %>
```

For replies on discussions you need to add in controller
```
def create
     @reply = @discussion.replies.create(params[:reply].permit(:reply_post, :discussion_id))
     @reply.user_id = current_user.id

     respond_to do |format|
      if @reply.save
        format.html { redirect_to discussion_path(@discussion) }
      else
        format.html { redirect_to discussion_path(@discussion), alert: "Reply did not save. Please try again."}
      end
     end
end
```

To display them on discussions show page
```
<%= render @discussion.replies %>
```


---------------------------------------------------------

<b>Created User Profile which would display user info and all discussions he posted</b>

First we created a controller for users with action show
```
rails g controller users show
```

Defined user in controller and defined user.discussions
```
@user = User.find_by_id(params[:id])
@user.discussions = @user.discussions
```

Added resources and routes in routes.rb
```
get 'users/show'
resources :users
```

Added link to profiles so users can view any profile
```
<%= link_to discussion.user.name, user_path(discussion.user) %>
```

Created display for only users posts
```
<% @user.discussions.each do |discussions| %>
```

Created index page so admin can view all the users
```
def index
     @users = User.all
end
```

---------------------------------------------------------
To discussions we added image upload with carrierwave gem. To do that follow this tutorial
https://code.tutsplus.com/tutorials/rails-image-upload-using-carrierwave-in-a-rails-app--cms-25183

---------------------------------------------------------
<b>To create votes I used activerecord-reputation-system gem.</b>

In console you generate
```
rails g reputation_system
```

In discussion model you set
```
has_reputation :votes, source: :user, aggregated_by: :sum 
```

In routes.rb we add resource
```
resources :discussions do
     member { post :vote }
end
```

Add few lines of code in discussion_controller.rb
```
def vote
    value = params[:type] == "up" ? 1 : -1
    @discussion = Discussion.find(params[:id])
    @discussion.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting"
end
```

To display voting on discussions you add link_to
```
<%= link_to vote_discussion_path(discussion, type: "up"), method: "post" do %>
<%= link_to vote_discussion_path(discussion, type: "down"), method: "post" do %>
```

To display how many votes discussion has
```
<%= pluralize discussion.reputation_for(:votes).to_i, "vote" %>
```

---------------------------------------------------------
<b>HEROKU</b>
<<<<<<< HEAD
=======

>>>>>>> 9768c44a79bdd3eda08305c1171553fa4da17b16
To push on HEROKU, type in terminal
```
heroku login
(your credentials of heroku)

heroku create
```

Push your files on git, and then
```
git push heroku (your branch name)
```

To change database information use heroku console
```
heroku run rails c
```

---------------------------------------------------------

For everything to look great I used bulma-rails gem better looks and dynamics of the page
https://bulma.io/documentation/
