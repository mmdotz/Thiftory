#Thriftory
Welcome to Thriftory, the thrifter's inventory app.
Have the thrill of the find and peace of mind.

- A website for thrifters who need to track inventory, sales, vendors and upload
photos. Thriftory is the first app made with the hobby thrift reseller in mind.
- Users can create a new account to access the app, upload their own inventory and
start tracking inventory activity.
Check out the live site at [Thriftory](thriftory.herokuapp.com)

##Libraries, software and other tools used
- Rails (4.2.4)
- Bootstrap for styling and javascript
- Web hosting by Heroku
- Image hosting by Amazon Web Services
- Refile for image upload
- Postgresql Database
- Sass
- React for dynamic item search
- Bcrypt for password encryption
- CSV for exporting data
- Chartkick for graphing
- Geocoder for distance measurement

More information in the Gemfile

##Installation Steps
- Fork this Repo
- Clone this Repo
- Run `bundle install`
- Run `rake db:create`
- Create an account with Amazon Web Services/S3
- Setup Figaro with your AWS api keys.  ! Remember not to push keys to Github.
- `rails s` to start server

##More information
- original [UMLs](/InventoryUMLupdate.jpg)
- current [Trello scrum board](https://trello.com/b/BvRjL9bK/thriftory)

##Credits and Acknowledgements
- logo assistance [Corey Elliot Design](https://www.linkedin.com/in/coreyaelliott)
