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