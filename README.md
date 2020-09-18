# [tasky](http://github.com/sandienunez/tasky)

### __tasky__ is a web app that easily helps adults and children with ADD organize their tasks, priorities, deadlines and master their daily lives. It was designed as a portfolio project at the Flatiron School. __tasky__ is written in Ruby on Rails, using the Devise gem, ActiveStorage and Github omniauth.

<img width="639" alt="taskylogo" src="https://user-images.githubusercontent.com/61069416/93532739-94882f00-f90f-11ea-91a3-932ca8595d23.png">

<img width="766" alt="tasky2" src="https://user-images.githubusercontent.com/61069416/93535003-1e39fb80-f914-11ea-8e65-522a3f3fd8f9.png">


## Restful Routes and CRUD Actions

REST => Representation State Transfer => set of conventions for structuring our ROUTES and mapping them to CRUD actions (Create, Read, Update, Delete).

  | METHOD | ROUTE | CONTROLLER ACTION   | Description |
| ------------- |-------------| ----------- | ------------------- |
| GET  |  /tasks | #index | Show all tasks | 
| POST | /tasks | #create | Create a new task|
| GET  | /tasks/new | #new | Render form for creating a new task |
| GET  | /tasks/:id/edit | #edit | Render form for editing a task  |
| GET  | /tasks/:id | #show | Show a single task |
| PATCH | /tasks/:id | #update | Update a task |
| DELETE | /tasks/:id | #destroy | DELETE a task |

### Tasks Routes
<img width="1202" alt="Screen Shot 2020-09-17 at 7 19 14 PM" src="https://user-images.githubusercontent.com/61069416/93537882-b9ce6a80-f91a-11ea-968f-0951c146dc8b.png">

### Comments Routes

<img width="1205" alt="Screen Shot 2020-09-17 at 7 21 22 PM" src="https://user-images.githubusercontent.com/61069416/93538003-02862380-f91b-11ea-831c-56d02cf9937a.png">


### Journal Routes
<img width="1200" alt="Screen Shot 2020-09-17 at 6 34 30 PM" src="https://user-images.githubusercontent.com/61069416/93535261-97d1e980-f914-11ea-9855-9a1951abd32b.png">


### Daily Routine Routes
<img width="1196" alt="Screen Shot 2020-09-17 at 6 34 40 PM" src="https://user-images.githubusercontent.com/61069416/93535254-943e6280-f914-11ea-83e0-77d7da0a3e5c.png">


### Nested Routes
<img width="1255" alt="Screen Shot 2020-09-17 at 6 35 04 PM" src="https://user-images.githubusercontent.com/61069416/93535232-8ab4fa80-f914-11ea-9f8b-f3c3044463cb.png">



## Motivation

This app was created to help people with ADD and ADHD (Attention-deficit/hyperactivity disorder) that struggle with managing their time and responsibilities. Tasky helps you thrive everyday of your life! The goal of this app was to make a task management system that easily helps people organize their priorities and find a calm balance in their daily lives. This is the first ever online ADD Task Management system that not only helps you keep track of your task deadlines but helps you track your ADD symptoms, medications, supplements and more in your Daily Journal. The Daily Journal feature also helps you plan your spiritual, psychological, biological and social long-term goals. The user also has the ability to seamlessly create custom Daily Routines that give you a visual flow and timeline of what you need to accomplish each day.

## Tasky Penguins Community

 Tasky strives to help users build a supportive and friendly community of tasky penguins through our commenting feature. All users have the ability to comment on anyone's tasks to uplift, motivate and inspire other tasky penguins worldwide!  

<img width="951" alt="Screen Shot 2020-09-17 at 9 35 03 PM" src="https://user-images.githubusercontent.com/61069416/93545433-5ea67300-f92e-11ea-934d-298db1d1d7bd.png">


## Create Tasks

Map out your Daily tasks by clicking the Create Task button.

On this form, you can create a new daily task by filling out the task name and three actions to ensure the task is completed. A user is also asked to select the date the task was created as well as the deadline date. Lastly, you can choose the level of priority for that specific task.

<img width="1205" alt="Screen Shot 2020-09-17 at 8 01 52 PM" src="https://user-images.githubusercontent.com/61069416/93544374-f22a7480-f92b-11ea-96f3-2cae66a4d591.png">
<img width="1292" alt="Screen Shot 2020-09-17 at 8 00 30 PM" src="https://user-images.githubusercontent.com/61069416/93544416-09696200-f92c-11ea-86ea-ccb2bf8b57cb.png">
<img width="1279" alt="Screen Shot 2020-09-17 at 8 00 42 PM" src="https://user-images.githubusercontent.com/61069416/93544399-02daea80-f92c-11ea-9e20-bf6414a83067.png">
<img width="1198" alt="Screen Shot 2020-09-17 at 8 00 55 PM" src="https://user-images.githubusercontent.com/61069416/93544390-fd7da000-f92b-11ea-9880-94938232f094.png">
<img width="1062" alt="Screen Shot 2020-09-17 at 9 37 16 PM" src="https://user-images.githubusercontent.com/61069416/93545257-f8215500-f92d-11ea-9529-4b9c7761d33e.png">
<img width="1147" alt="Screen Shot 2020-09-17 at 8 10 01 PM" src="https://user-images.githubusercontent.com/61069416/93544287-b394ba00-f92b-11ea-8521-d6518d55a81a.png">
<img width="1147" alt="Screen Shot 2020-09-17 at 8 06 15 PM" src="https://user-images.githubusercontent.com/61069416/93544326-c7402080-f92b-11ea-936c-7bb6a4fd3645.png">



## Create your Daily Routine

Plan your Daily Routine by clicking the Create Daily Routine button.

On this form, you can create a new daily routine based on what you want to accomplish by filling out all the sections listed.

<img width="1160" alt="Screen Shot 2020-09-17 at 7 43 02 PM" src="https://user-images.githubusercontent.com/61069416/93539258-37e04080-f91e-11ea-8c5e-e382b694f6e6.png">
<img width="1218" alt="Screen Shot 2020-09-17 at 7 43 39 PM" src="https://user-images.githubusercontent.com/61069416/93539246-31ea5f80-f91e-11ea-9ab1-de039a6ac882.png">
<img width="1271" alt="Screen Shot 2020-09-17 at 7 48 31 PM" src="https://user-images.githubusercontent.com/61069416/93539429-c9e84900-f91e-11ea-8a54-746110f7b152.png">

## Create your Daily Journal

<img width="1285" alt="Screen Shot 2020-09-17 at 8 10 30 PM" src="https://user-images.githubusercontent.com/61069416/93543973-e12d3380-f92a-11ea-96a8-d54faae819fb.png">
<img width="1287" alt="Screen Shot 2020-09-17 at 8 10 39 PM" src="https://user-images.githubusercontent.com/61069416/93543954-d70b3500-f92a-11ea-8769-1e3153392d24.png">
<img width="1280" alt="Screen Shot 2020-09-17 at 8 10 56 PM" src="https://user-images.githubusercontent.com/61069416/93543940-cd81cd00-f92a-11ea-9590-39fbe681de08.png">
<img width="1253" alt="Screen Shot 2020-09-17 at 8 11 10 PM" src="https://user-images.githubusercontent.com/61069416/93543919-bf33b100-f92a-11ea-9038-07c06465a04f.png">
<img width="1146" alt="Screen Shot 2020-09-17 at 8 11 23 PM" src="https://user-images.githubusercontent.com/61069416/93543907-b7740c80-f92a-11ea-867d-0f9d8a37568f.png">
<img width="1274" alt="Screen Shot 2020-09-17 at 8 11 34 PM" src="https://user-images.githubusercontent.com/61069416/93543885-af1bd180-f92a-11ea-9ebc-e987fd201852.png">
<img width="1193" alt="Screen Shot 2020-09-17 at 8 11 47 PM" src="https://user-images.githubusercontent.com/61069416/93543869-a62b0000-f92a-11ea-9ed3-ad0dd4e8c484.png">
<img width="1240" alt="Screen Shot 2020-09-17 at 8 11 55 PM" src="https://user-images.githubusercontent.com/61069416/93543853-9dd2c500-f92a-11ea-9ed0-25120a69994f.png">
<img width="1254" alt="Screen Shot 2020-09-17 at 8 12 02 PM" src="https://user-images.githubusercontent.com/61069416/93543831-93183000-f92a-11ea-95d5-02af46e01bef.png">
<img width="1261" alt="Screen Shot 2020-09-17 at 8 12 09 PM" src="https://user-images.githubusercontent.com/61069416/93543822-8a275e80-f92a-11ea-92e1-28dbd0013e44.png">


## Ranking Tasks

Rank your Daily Tasks from Highest to Lowest Priority based on a scale from 1-6. Where 6 is the highest priority and 1 is the lowest priority. This was achieved using an Active Record custom Scope method. 

<img width="1042" alt="Screen Shot 2020-09-17 at 8 43 11 PM" src="https://user-images.githubusercontent.com/61069416/93543713-4a607700-f92a-11ea-9d1c-781c22985df8.png">

## Create Comments

A user can create, edit and delete comments they make on tasks they made or tasks from other tasky penguins in the community. 

<img width="1172" alt="Screen Shot 2020-09-17 at 9 35 39 PM" src="https://user-images.githubusercontent.com/61069416/93545416-52221a80-f92e-11ea-80b8-cffd86423803.png">

<img width="1108" alt="Screen Shot 2020-09-17 at 9 42 40 PM" src="https://user-images.githubusercontent.com/61069416/93545589-c8bf1800-f92e-11ea-955d-5f1f3e9e75bd.png">


## Prerequisites
Other than the gems listed in this app's Gemfile, you will need to have [Ruby](https://www.ruby-lang.org/en/downloads/) and [Rails](https://guides.rubyonrails.org/v5.0/getting_started.html) installed on your local machine as well as the ability to install Ruby gems.

## Local Installation Instructions

Eventually, tasky will be a fully-fledged website. Currently, installation of the project can be performed locally with the following steps:

    1. Navigate to the repo on GitHub at https://github.com/sandienunez/tasky
    2. Fork and clone the [GitHub repo](https://github.com/sandienunez/tasky) to your local machine. 
    3. Click the green Clone or Download button and copy the remote URL.
``` 
git@github.com:sandienunez/tasky.git
```
    4. Type git clone then paste the copied URL into your terminal.
    5. Type 'bundle install' to install dependencies. 

## Installing

Change directories into the repo directory. After running bundle install, run rails db:migrate and rails db:seed to create and seed the database. 
```
$ cd tasky 
$ bundle install
$ rails db:migrate
$ rails db:seed
```

## Usage

    1. Run 'rails s' from your command line to start a web server and view app in the web browser.
    2. Use your favorite browser to visit the route displayed in the terminal. (E.g. http://localhost:3000) 

From there, you can create, edit, update and delete your Daily tasks, Daily routines and Daily journals. You can also add comments to all your tasks and rank your task based on high priority from 1-6 utilizing our custom scope method! Let tasky take your day to infinity and beyond!

## Built With

* Ruby on Rails
* SQLite3
* HTML, CSS
* Github Omniauth
* Devise 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sandienunez/tasky. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
MIT © https://github.com/sandienunez 

## Code of Conduct

Everyone interacting in Tasky’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the https://github.com/sandienunez/tasky/blob/master/app/CODE_OF_CONDUCT.md






























