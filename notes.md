Plan GLADD app


GET /signup
    present sign up form
    users have an email (also add name)
    

POST /users
    create user in db, maybe validation 

GET /login 
    present login form

POST /login 
    create their session and redirect 

GET /tasks/new
show a form to make a request for a task (to create a task)
enter the topic 

POST /tasks
take the task request data and save it to DB

GET /tasks
    show list of all open tasks created 

GET /tasks/:id 
    show details of task request created 
    some BUTTON?

PATCH /tasks/:id
    show details of task created

Heart of app: ppl with add can create and visually see tasks layed out (add calendar feature weekly, monthly, yearly)
-some how add a due date feature?
-add Admin feature (for Doctors, counselors, therapists, life coaches, spiritual directors, trusted family/friends) to monitor progress
-add Medication Form that tracks your dosage, type of medication, how it makes you feel, adverse symptoms, appetite decreased/increased, mood, anxious, dehydrated, stomach pain other symptoms, was it helpful, any progress or specific ways you think medicine helped you?, foggy brain, less forgetful
-Add 3 Things you're grateful for 
-Write down 3 "I can statements" for any feelings of guilt or sadness 
-Add 3 ways you can Relax and take a break to recharge 
-Daily check in attributes (add date): focus (1-5), Organization, self-control, worry, mood, memory, sleep, other/list, Hours slept 
-change daily check in name to daily journal, my day, 

User signup → appconcepts.com/users/new:

As a guest
I want to sign up
So I can submit a concept
Create concept → appconcepts.com/concepts/new

As a user
I want to submit a concept
So that others can gain inspiration
Section index → appconcepts.com/sections/rails/concepts

As a user
I want to view all concepts for a section
So that others can gain inspiration from my project


<p>
    <%= link_to "Login", login_path %>
    <%= link_to "Signup", register_path %>

</p>



-------
<h1> Sign up to join the GLADD family today.</h1>

<!-- <form action="/users" method ="POST">
<input type="submit" value ="Register" />
</form> 
or
<%= form_tag("/users") do %>
    <%= submit_tag %>
<% end %>

-->

<%= form_for(@user) do |f| %>

  <%= f.label :full_name %>
    <%= f.text_field :full_name %>

    <%= f.label :email %>
    <%= f.text_field :email %>

    <%= f.label :password %>
     <%= f.password_field :password %> <!-- password overrides and converts to password_digest-->

<%= f.submit "Sign Up" %>
<% end %>


------------------------

<nav>
    <ul>
    <div style="text-align: right;">
      <%= link_to "Home", root_path %></li>
        <% if !user_signed_in? %>
           <%= link_to "Add a Task", new_task_path %>
           <%= link_to "Signup", new_user_registration_path %> 
                  <!--new_user_registration_path= devise route = get request to signup form -->
            <%= link_to "Login", new_user_session_path %>
               <!--new_user_session_path= devise route = get request to login form -->
        <% else %>
            <%= link_to "Logout", destroy_user_session_path, method: "delete" %>
            <!--destroy_user_session_path= devise route = deletes request to sign out user 
            -don't forget to send method as well -->
            <p><%= current_user.full_name %></p>


 ----           

 class ApplicationController < ActionController::Base
    
    # helper_method :current_user, :logged_in?
    # #gives access to methods in the views 

    # private
    #     def current_user
    #         @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    #     end

    #     def loggin_in?
    #         !!session[:user_id]
    #     end

    #     def redirect_of_not_logged_in 
    #         redirect_to '/' if !loggged_in?
    #     end


end

-----

<%= form_for(@user) do |f| %>
    <%= f.label :email %>
    <%= f.text_field :email %>

    <%= f.label :password %>
     <%= f.password_field :password %> <!-- password overrides and converts to password_digest-->

<%= f.submit "Login" %>
<% end %>


----

def new
        @task = Task.new
    end 

    def index 
        @tasks = Task.priority_order
        # @tasks = Task.all 
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to task_path(@task)
        else 
            render :new
        end 
    end 
        
    

    def show 
        @task = Task.find_by_id(params[:id])
    end

    def edit
        @task = Task.find_by_id(params[:id])
    end

    def update
        @task = Task.find_by_id(params[:id])

        if @task.update(task_params)
            redirect_to task_path(@task)
        end
    end

    private
    #strong params = needed when you are mass assigning data 

    def task_params
        params.require(:task).permit(:task_name, :prayer, :exercise, :supplements, :daily_plan, :stretch, :diet, :user_id)
    end

    #add destroy for delete button link_to

end 

----

<% if @task %>
  <h1>Comments for <%= @task.task_name%></h1>
<% else %>
  <h1>Comment Feed</h1>
<% end %>

<ul>
<% @comments.each do |t|%>
  <li><%= current_user.full_name %>  commented "<%= t.message%>" for Task: <strong><%= link_to t.task.task_name, task_path(t.task_id) %></strong></li>
  <%= button_to "Edit Comment", edit_comment_path(t), method: :get %>
<br>  
<br>  
<%= button_to "Delete Comment", comment_path(t), method: :delete %>
<br>  
<% end %>
</ul>


----

 <label>Date</label>
   <label for="date"></label>
     <input type="date" id="myDate" name="date">    
     <p id="demo"></p>

     <script>
     function myFunction() {
       var x = document.getElementById("myDate").value;
       document.getElementById("demo").innerHTML = x;
     }
     </script>

     ----

     <%= f.label :priority_ranking %>
<%= f.select(:priority_ranking, options_for_select((1..6), :selected => @task.priority_ranking, :include_blank => true)) %>
<!--<%= f.select :priority_ranking, options_for_select(1..5), { prompt: "Please Choose between 1-5, where 1 = not urgent and 5 = super important!" } %> -->
 <br>
  <br>

  -----

<p><%= current_user.full_name %></p>

---

<div class="media">
    <div class="media-body">
        <table class="table table-hover">
        <thead>
        <th><strong>Priority Ranking</strong></th>
            <th>Actions</th>
            <th>Made</th>
            <th>Deadline</th>
            <th>Time it will take to finish</th>
        </thead>
        <tbody>
          <tr>   
            <td><h4><%= @task.priority_ranking %></h4></td>
            <td><h4><%= @task.action_one %></h4></td>
            <td><h4><%= @task.action_two %></h4></td>
            <td><h4><%= @task.action_three %></h4></td>
           </tr>
        </tbody>
</table>
</div>
</div>

<strong>Action 2:</strong>
<%=  @task.action_two %></p>

<strong>Action 3:</strong>
<%=  @task.action_three %></p>

<strong>Priority Ranking:</strong>
 <%=  @task.priority_ranking %>
<strong>Deadline for Task: </strong>
<strong>How long will it take to finish this task? </strong>
<strong>Date task was created:</strong>
<%=  @task.date %>

<br>      
<%= button_to "Edit Task", edit_task_path, method: :get %> 
<br>  
<%= button_to "Delete Task", task_path(@task), method: :delete, data: {confirm: "Are you sure you want to delete this task?"} %>
<br>  
<%= button_to "Add Comment", new_comment_path, method: :get %>
<br>  

<h1>Comments: </h1>
<p> <%= current_user.full_name %> says </p>
       
                <td><h4><%= @comment.message %></h4></td>
--------------


<strong>Action 1:</strong>  <%= @task.action_one %>
<br>
<br>
  <strong>Action 2:</strong>  <%= @task.action_two %>
<br>
<br>
<strong>Action 3:</strong>  <%= @task.action_three %>
<br>
<br>
<strong>Date task was created:</strong>  <%=  @task.date %>
<br>
<br>
 <strong>Deadline: </strong>
  <br>
<br>
 <strong> Time it will take to finish: </strong>
<br>
<br>
<br>  
 <% if @task.user == current_user %>    
<%= button_to "Edit Task", edit_task_path, method: :get %> 
<br>  
<%= button_to "Delete Task", task_path(@task), method: :delete, data: {confirm: "Are you sure you want to delete this task?"} %>
<br> 
<% end %> 
<%= button_to "Add Comment", new_comment_path, method: :get %>

<br>  
</div>

<h2>Comments: </h2>
    <% @task.comments.each do |comment| %>
     <br>   
     <strong><%= current_user.full_name  %>  </strong><%= comment.message %>  
                <br>   
    <% if comment.user == current_user %>
    <%= button_to "Edit Comment", edit_comment_path(comment), method: :get %>
    <%= button_to "Delete Comment", comment_path(comment), data: {confirm: "Are you sure you want to delete this task?"}, method: :delete  %>

<% end %> 
 <% end %>
</ul>


--------------------------------------
<br>
  <br>
  </div>
  <h2> A.D.D Journal. </h2>
<h4>Instructions: Next to each row, fill out each part in the space provided.</h4>

     <%= f.label :emotional_scale %>
      <br>
    <%= f.text_field :emotional_scale %>
<br>
  <br>

     <%= f.label :tasks_completed %>
      <br>
    <%= f.text_area :tasks_completed %>
<br>
  <br>
     <%= f.label :went_well_tips %>
      <br>
    <%= f.text_area :went_well_tips %>
<br>
  <br>

     <%= f.label :bad_tips %>
      <br>
    <%= f.text_area :bad_tips %>
 <br>
  <br>

    <%= f.hidden_field :user_id, :value => current_user.id %>

    <%= f.submit %>
   
    <% end %>
  
    </ul>


         

---------------------------------new comment view

<head>
<style>
body {background-color: khaki;}

h2 {
  color: #619ce0;
  font-family: arial;
  font-size: 300%;

}
</style>
</head>
<body>

<h2> Create a Comment. </h2>

<%= render partial: "layouts/errors", locals: {object: @comment} %>

<%= form_for @comment do |f| %>

     <% if !@comment.task %>
    <%= f.label :task_name %>
     <%= f.collection_select :task_id, Task.all, :id, :task_name %>
     <% else %>
    <%= f.hidden_field :task_id %>
    <% end %>
<br>
<br>
     <% if !@comment.daily_routine %>
    <%= f.label :daily_plan %>:
     <%= f.collection_select :daily_routine_id, DailyRoutine.all, :id, :daily_plan %>
     <% else %>
    <%= f.hidden_field :daily_routine_id %>
    <% end %>
    <br>
<br>
     <% if !@comment.journal %>
    <%= f.label :date %>:
     <%= f.collection_select :journal_id, Journal.all, :id, :date %>
     <% else %>
    <%= f.hidden_field :journal_id %>
    <% end %>
    <br>
    <br>
     <%= f.label :message %>
     <%= f.text_area :message %>
<br>
<br>
    <%= f.submit %>

    <% end %>
 
 ----------------------------index comment view

 <head>
<style>
body {background-color: khaki;}

h2 {
  color: #619ce0;
  font-family: arial;
  font-size: 300%;

}
</style>
</head>
<body>

<h2>Comment Feed. </h2>

<ul>
    <% @comments.each do |comment| %>
<br>

  <li><%= comment.user.full_name %>  commented "<%= link_to comment.message, comment_path(comment) %>" for this Task: <%= link_to comment.task.task_name, task_path(comment.task_id) if comment.task %></li>
    <li><%= comment.user.full_name %>  commented "<%= link_to comment.message, comment_path(comment) %>" for this Daily Routine: <%= link_to comment.daily_routine.daily_plan, daily_routine_path(comment.daily_routine_id) if comment.daily_routine %></li>
      <li><%= comment.user.full_name %>  commented "<%= link_to comment.message, comment_path(comment) %>" for this Daily Journal: <%= link_to comment.journal.date, journal_path(comment.journal_id) if comment.journal %></li>


<br>
<% if current_user == comment.user %> 
    <%= button_to "Edit Comment", edit_comment_path(comment), method: :get  %> 
    <%= button_to "Delete Comment", comment_path(comment), data: {confirm: "Are you sure you want to delete this task?"}, method: :delete  %>
<br> 
  <% end %>
<% end %>
</ul>

-----------------show comment view

<head>
<style>
body {background-color: khaki;}

h2 {
  color: #619ce0;
  font-family: arial;
  font-size: 300%;

}
</style>
</head>
<body>


<h2>Comment:  </h2>

<h2><%= @comment.message %></h2>
 
 <li> Created by: <%= current_user.full_name %></li>
 <br>
<p>For this task: <%= link_to @comment.task.task_name, task_path(@comment.task_id) if @comment.task %></p>
 <br>
 <p>For this daily routine: <%= link_to @comment.daily_routine.daily_plan, daily_routine_path(@comment.daily_routine_id) if @comment.daily_routine %></p>
<br>
<p>For this daily journal: <%= link_to @comment.journal.date, journal_path(@comment.journal_id) if @comment.journal %></p>
<br>
<% if @comment.user == current_user %>
    <%= button_to "Edit Comment", edit_comment_path(@comment), method: :get %>
<% end %> 


------edit comment view

<head>
<style>
body {background-color: khaki;}

h2 {
  color: #619ce0;
  font-family: arial;
  font-size: 300%;

}
</style>
</head>
<body>

<h2> Edit Comment. </h2>

<%= render partial: "layouts/errors", locals: {object: @comment} %>

<%= form_for(@comment) do |f| %>

    <%= f.label :task %>
     <%= f.collection_select :task_id, Task.all, :user_id, :task_name %>
<br>
<br>
     <%= f.label :daily_plan %>:
     <%= f.collection_select :daily_routine_id, DailyRoutine.all, :id, :daily_plan %>
     <br>
     <br>
     <%= f.label :date %>:
     <%= f.collection_select :journal_id, Journal.all, :id, :date %>
     <br>
     <br>
     <%= f.label :message %>
     <%= f.text_area :message %>
<br>
<br>

    <%= f.submit 'Save Changes'%>

    <% end %>

    <% if current_user == @comment.user %> 
    <%= button_to "Delete Comment", comment_path(@comment), method: :delete  %>
<br> 
  <% end %>


-------------------show daily routine

<%= render 'layouts/nav' %>
<head>
<style>
body {background-color: khaki;}

h2 {
  color: #619ce0;
  font-family: arial;
  font-size: 300%;

}
</style>
</head>
<body>


<h2> Daily Routine.  </h2>

<h2>------------------------> <%= @daily_routine.daily_plan %> <----------------------------</h2>
<div style="text-align: left;">
<h3>Date Daily Routine was made:</h3>  <%=  @daily_routine.date %>
<br>
<br>
<h3>Prayer or Meditations:</h3><%= @daily_routine.prayer_or_meditations %>


 <h3>Exercise Plan: <%=  @daily_routine.exercise_plan %>
  <br>
<br>
 <h3> Stretch Plan: </h3> <%=  @daily_routine.stretch_plan %>
<br>
<br>
 <h3> 3 Superfoods to add to my Meals: </h3> <%=  @daily_routine.three_superfoods_to_add_to_my_meals %>



 <% if @daily_routine.user == current_user %>    
<%= button_to "Edit Daily Routine", edit_daily_routine_path, method: :get %> 
<br>  
<%= button_to "Delete Daily Routine", daily_routine_path(@daily_routine), method: :delete, data: {confirm: "Are you sure you want to delete this daily routine?"} %>
<br> 
<% end %> 
<%= button_to "Add Comment", new_comment_path, method: :get %>

<br>  

<h2>Comments. </h2>

    <% @daily_routine.comments.each do |comment| %>
     <br>   
     <strong><%= current_user.full_name  %>  </strong><%= comment.message %>  
                <br>   
    <% if comment.user == current_user %>
    <br>
    <%= button_to "Edit Comment", edit_comment_path(comment), method: :get %>
    <br>
    <%= button_to "Delete Comment", comment_path(comment), data: {confirm: "Are you sure you want to delete this daily routine?"}, method: :delete  %>

<% end %> 
 <% end %>
</ul>
------------------show journal


<head>
<style>
body {background-color: khaki;}

h2 {
  color: #619ce0;
  font-family: arial;
  font-size: 300%;

}
</style>
</head>
<body>


<h2> Daily Journal.  </h2>
<h2>------------------------> <%= @journal.word_of_day %> <----------------------------</h2>
<div style="text-align: left;">
<h3>Date Journal was made:</h3>  <%=  @journal.date %>
<br>
<br>
<h3>Bible verse of the day:</h3><%= @journal.bible_verse_of_day %>
<h3>Focus:</h3><%= @journal.focus %>
<h3>Organization:</h3><%= @journal.organization %>
<h3>Impulse Control:</h3><%= @journal.impulse_control %>
<h3>Worry:</h3><%= @journal.worry %>
<h3>Mood:</h3><%= @journal.mood %>
<h3>Temper Control:</h3><%= @journal.temper_control %>
<h3>Memory:</h3><%= @journal.memory %>
<h3>Anxiety:</h3><%= @journal.anxiety %>
<h3>Sleep</h3><%= @journal.sleep %>
<h3>Other:</h3><%= @journal.other %>


<h3>Write down any notes for the day :</h3><%= @journal.notes %>
<h3>Write down any reminders for the day:</h3><%= @journal.reminders %>
<h3>3 Things I am Grateful for today:</h3><%= @journal.three_things_i_am_grateful_for %>
<h3>Write down any negative thoughts that are not true :</h3>
<h3>Negative thoughts:</h3><%= @journal.negative_thoughts %>
<h3>Write down any challenges you faced today and how you overcame them:</h3>

<h3>Challenges</h3><%= @journal.challenges %>
<br>
<h3>Write down what you ate for each meal and how it made you feel:</h3>

<h3>Breakfast:</h3><%= @journal.breakfast %>
<h3>Snack one:</h3><%= @journal.snack_one %>
<h3>Lunch:</h3><%= @journal.lunch %>
<h3>Snack two:</h3><%= @journal.snack_two%>
<h3>Dinner:</h3><%= @journal.dinner %>
<h3>Was this a healthy meal? </h3><%= @journal.healthy %>
<h3>How did I feel after I ate this meal:</h3><%= @journal.how_did_i_feel_after %>
<h3>What time was this meal eaten:</h3><%= @journal.time_eaten %>

<h3> Below, fill out what is most important to you in these areas. Write what you want for each goal and what you do not want for each goal.</h3>
<br>
<h2>Biological Goals:</h2>
<h3>Brain Health:</h3><%= @journal.brain_health %>
<h3>Physical Health: </h3><%= @journal.physical_health %>
<br>
<h2>Psychological Goals:</h2>

<h3>Emotional Health: </h3><%= @journal.emotional_health%>
<h3>Thinking Patterns: </h3><%= @journal.thinking_patterns %>
<br>
<h2>Social Goals:</h2>

<h3>Spouse/Partner: </h3><%= @journal.spouse %>
<h3>Children:</h3><%= @journal.children %>
<h3>Family & Friends:</h3><%= @journal.family_and_friends %>
<h3>Work:</h3><%= @journal.work%>
<h3>School:</h3><%= @journal.school %>
<h3>Money:</h3><%= @journal.money %>
<br>

<h2>Spiritual Goals:</h2>

<h3>Spiritual Life:</h3><%= @journal.spiritual_life %>
<h3>Character:</h3><%= @journal.character %>
<h3>Passions:</h3><%= @journal.passions %>
<h3>Community Service:</h3><%= @journal.community_service %>
<h3>Giving to Charity:</h3><%= @journal.giving_to_charity %>

<% if @journal.user == current_user %>    
<%= button_to "Edit Journal", edit_journal_path, method: :get %> 
<br>  
<%= button_to "Delete Journal", journal_path(@journal), method: :delete, data: {confirm: "Are you sure you want to delete this journal?"} %>
<br> 
<% end %> 
<%= button_to "Add Comment", new_comment_path, method: :get %>


<h2>Comments. </h2>
    <% @journal.comments.each do |comment| %>
     <br>   
     <strong><%= current_user.full_name  %>  </strong><%= comment.message %>  
                <br>   

    <% if comment.user == current_user %>
  
    <br>
    <%= button_to "Edit Comment", edit_comment_path(comment), method: :get %>
    <br>
    <%= button_to "Delete Comment", comment_path(comment), data: {confirm: "Are you sure you want to delete this journal?"}, method: :delete  %>

<% end %> 
 <% end %>
</ul>

-----------------old user model --------------------
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :comments
  has_many :commented_tasks, through: :comments, source: :tasks  #do i still need this if these are nested?
  #rename relationship and still have access to them 
  has_many :tasks #that user has created 
  has_many :daily_routines, through: :tasks #check about this 
  has_many :journals 
  validates :email, uniqueness: true, presence: true  
  validates_presence_of :full_name
  #has_secure_password not needed bc of devise 

-----------------old task model --------------------
class Task < ApplicationRecord
   scope :priority_order, -> { order(priority_ranking: :desc)}
                            #attribute

   #when we call scope we get = ActiveRecord::Relation object
   belongs_to :user, optional: true 
   belongs_to :daily_routine, optional: true #check this
   has_many :comments, dependent: :destroy
   has_many :users, through: :comments #ppl who have commented on it
   validates :task_name, :action_one, :action_two, :action_three, :date, :priority_ranking, presence: true 
   validate :limit_number_of_tasks

-----------------old comment model --------------------
class Comment < ApplicationRecord
    belongs_to :user, optional: true 
    belongs_to :task, optional: true 
    # belongs_to :daily_routine, optional: true 
    # belongs_to :journal, optional: true 
validates :message, presence: true 
# validates :task, uniqueness: { scope: :user_id,
# message: "error: Sorry! You can only comment once for each task." }
end
-----------------old daily_routine model --------------------
class DailyRoutine < ApplicationRecord
    belongs_to :user, optional: true 
    belongs_to :task, optional: true 
    # has_many :comments, dependent: :destroy
    has_many :users
    validates :daily_plan, :date, presence: true  
end
-----------------old journal model --------------------
class Journal < ApplicationRecord
    belongs_to :user, optional: true 
    # has_many :comments, dependent: :destroy
    has_many :users
    validates :date, :word_of_day, presence: true  
end
         


 

    
         


 

    

    