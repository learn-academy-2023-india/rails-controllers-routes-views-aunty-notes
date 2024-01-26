## Rails Controllers, Routes, Views 1/25/24 India

## Process of creating an empty github repo
- One team member clicks the github classroom link
- Create team name
- Accept assignment
- Refresh screen 
- Click on the github repo
- Stop...you need to maintain an empty repo

## Process to allow that github repo track a local rails app
- One team member follow the instructions in the syllabus
- After the initial commit is made, all other team members will do the following:
    - click the github classroom link
    - join the team
    - clone the repo
    - $ bundle
    - $ rails db:create
    - $ rails db:migrate
    - $ rails s
    - Check the browser to see if the application built correctly

## Vocabulary
- controller: a class that contains applicable methods to respond with a view or data based on the request made to the web application
- routes: contains the mapping between the url requested and the controller method that will respond
- view: visual display of that data that is requested, visual response
- erb: embedded ruby
- route alias: a variable to represent a url path
- root: the default path or url to the webpage, landing page

## Goal
- Game Night app that has 3 static pages: landing page, game, prize

## Steps
1. Generate a controller  
`$ rails g controller GameNight`
***NOTE: This command will create a controller and view for GameNight***

2. Add a method to the controller class for each page
- Name of the method will be the same as the page
```rb
# class generated from the generator terminal command
class GameNightController < ApplicationController
  # method for the landing page
  def landing
    # using render html to send a response to the user's browser
    render html: 'Get ready for family game night!'
  end
end
```

3. Invoke the controller method by creating a route on config/routes.rb
- structure of a route
    - http verb: `get`
    - url: `'/landing'` 
    - controller: `'game_night'`
    - action method: `'#landing'`
`get '/landing', to: 'game_night#landing'`

4. Verify the response by typing the url in the browser  
`http://localhost:3000/landing`  

5. Create a view file for each method on app/views/game_night
- Will have the same name as the method
- Use extension `.html.erb`  
`landing.html.erb`

6. Modify the controller method so the views file is rendered
```rb
# remove the render code from the method
class GameNightController < ApplicationController
  def landing
  end
end
```
***NOTE: Because of the naming conventions of the views file having the same name as the method, the code within the views file will be rendered to the user's browser.***

7. Refresh the browser to see the changes

8. Repeat the process starting at step 2 for each page

9. Add navigation to the pages
  - Modify routes with a route alias  
  `get '/landing', to: 'game_night#landing', as: 'landing'`  
  - Add links to each page
    - erb code to add ruby code to the views file: `<%= %>`
    - link_to: helper method that takes in a string and the file path as arguments
    - reference the route alias using _path: `game_path`  
`<%= link_to 'Check out the games', game_path %>`

10. Create a root path
- the page you want your application to default to aka landing page
- structure
    - `root` uses the `get` http verb
    - controller with method: `'game_night#landing'`  
`root 'game_night#landing'`

11. Add styling to the app on app/assets/stylesheets/application.css

## Rails Params 1/26/24 

## Goal
- greeting: Pass information to the view so we can greet multiple users
- square: Square the data

## Process
1. Create a controller  
`$ rails g controller Main`

2. Add a method to the controller class for each page
  - Add instance variable to store the applicable param
  ```rb
    # if just using the params key word, the hash will be sent to the user
    @user_name = params
    # output: {"controller"=>"main", "action"=>"greeting", "user_name"=>"jimmy"}
  ```
  - Use bracket notation to abstract the value from the symbol in the params hash
```rb
class MainController < ApplicationController
  def greeting
    @user_name = params[:user_name]
  end
end
```

3. Invoke the controller method by creating a route on config/routes.rb

4. Create a view file for each method on app/views/main
- Use ERB to reference the instance variable
`<h1>Aloha <%= @user_name %></h1>`

5. Verify the response by typing the url in the browser  

6. Two ways to receive a value for the instance variable
- Pass a query string into the URL
`http://localhost:3000/greeting?user_name=india23`
- Modify the route to require a param on the url and make sure the url is reflecting that structure

7. Repeat steps 2-6 for the next page

8. When performing arithmetic operations, make sure to change param to an integer
```html
<h3>Let's be a Square</h3>
<h3>Your number is now <%= @number.to_i * @number.to_i%></h3>
```

- Refactor
```rb
# place calculation in the method (app/controllers/main_controller.rb)
  def square
    @number = params[:number].to_i * params[:number].to_i 
  end
# reference the instance variable on the views file (app/views/main/square.html.erb)
`<h3>Your number is now <%= @number %></h3>`
```