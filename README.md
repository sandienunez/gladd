# tasky

![unnamed](https://user-images.githubusercontent.com/61069416/91679593-cbd89c80-eb16-11ea-916a-0893d4e279f5.png)

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

# Motivation

With how fast paced social media, the news outlets, techonology and more is evolving, it can be hard to not be distracted and make time to finally check off those books that have been on your booklist for ages. Let us help you take away the stress of planning when to start and end your books and help you find suitable times in your daily schedule to fit 5 minutes of reading. Everyone has 5 minutes to spare! Many studies have shown how reading can decrease stress levels, help you have more empathy, leave you feeling inspired and spark creativity or understanding in other projects you are working on! Use BookGenie during this COVID-19 crisis to unleash your inner bookworm and read (as Lionel Richie would say) all night long! All night long!!!

## Installation
Eventually, BookGenie will be a fully-fledged website. Currently, installation of the project can be performed locally with the following steps:

    1. Navigate to the repo on GitHub at https://github.com/sandienunez/BookGenie
    2. Fork and clone repo to your local machine.
    3. Click the green Clone or Download button and copy the remote URL.
    4. Type git clone then paste the copied URL into your terminal.
    5. Type 'bundle install' to install dependencies. 

## Usage

    1. Run 'rake db:migrate' from your command line.
    2. Run 'shotgun' from your command line. Then you can go to your browser and view the application.
    3. Visit localhost:[port-number] (the port number will be specified after running shotgun).

From there, you can create your personal BookGenie reading lists, add books, edit books and delete books! Make sure to listen to our bomb reading playlist to jam along to while you get your inner reading book worm on!

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






























Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
