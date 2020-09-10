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
