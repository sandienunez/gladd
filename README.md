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

# Specifications

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup
- [x] Include login
- [x] Include logout
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate

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
