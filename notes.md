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


         


 

    