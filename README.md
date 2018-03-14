## **Solar Calculator Application**

## Purpose
A simple application that allows users to search for a property and upon selection allow them to draw a polygon, within the bounds of the property, that represents the an installation of solar panels.

## Features

 - Uses a map using the Leaflet library and  Carto provides the tile layer.
 - Has a property search(Not implemented on front end yet) using onboard-apis. (Docs [here](https://developer.onboard-apis.com/docs))
 - Allows users to create a solar installation(via draw layer on map, not implemented) and upon drawing.(Not implemented)
 -  Upon drawing the UI will display the Nominal Power of the installation based on the area of the polygon.(Not Implemented)
 -  The user can also save the configuration and add additional details to it including the orientation and tilt angles to calculate the projection and the height to draw the polygon in 3D(Not Implemented)

## Development Specifications

 - Ubuntu 16.04 LTS
 - Rails v. 5.1.5
 - Ruby v. 2.4.2p198 (2017-09-14 revision 59899) [x86_64-linux]
 - Rbenv v. 1.1.1-6-g2d7cefe
 - NPM v. 3.8.6
 - NVM v. 0.25.0
 - Node v. 6.0.0
 - Ember-CLI v. 3.0.0
 - Ember v. 3.0.0
 - Ember-Data v. 3.0.2
 - JQuery v.3.3.1
 - Postgresql v.9.6.8

**Gems**

 - rspec-rails ~> 3.7
 - puma ~> 3.7
 - ember-cli-rails
 - active_model_serializers ~> 0.10.0
 - dotenv-rails
 - pg >= 0.18, < 2.0
 - rails ~> 5.1.5
 - faraday
 - byebug
 - listen >= 3.0.5 < 3.2
 - awesome_print

**Packages**
 - ember-cli-rails-addon: ^0.10.0
 - ember-leaflet: ^3.0.13

## Installation

 - Ensure you installed and have the matching versions of NVM, Node, NPM, Ember-CLI and Ruby(get via Rbenv or RVM), and Postgresql on your machine.
 - Clone the project locally and navigate to the folder in a terminal.
 - Run bundle install(or just bundle)
 - Once the gems are installed run rake ember:install(this invokes npm install for the package list)
 - Run rake db:create(Ensure you have the Method set to trust in the local row in the pg_hba.conf file)
 - Add a .env file to the root of the project with the following key ONBOARD_API_KEY=[I will provide this or you can register for one via this [link
 ](https://developer.onboard-apis.com/home)
 - Finally run rails s and it will run both ember and rails at the same time and you can access the page via localhost:3000

## TODO
 - Finish writing unit and integration tests for the back end components.
 - Implement a property search via a container component that requires a street address, city, state/zip
 - Upon selecting a property add a button that says create installation have the user fill out a name for the configuration.
 - After clicking the button enable the draw layer but only allow users to draw within the bounds of the property.  Highlight the bounds
 - Once the polygon is created allow the user to save it via a button.
 - Upon save another container should display at the bottom with the specs of the current configuration and display the calculated nominal power value
 - Also within that container should be inputs for the tilt and orientation angles with the projection value displayed and the height value that will effect how the polygon is drawn on the map.
 - Create another container with a list of the users configuration history so they can go back and edit them.
