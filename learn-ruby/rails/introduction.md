# Model, View, Controller

- Separation of presentation of laywer(what the user of the application sees in the browser/mobile device) and the business-logic or back-end(invisiable layer).

## General flow

- Request mad at browser
- Request received at routher of rails application
- Request routed to appropricate action in a controller
- Controller#action either renders a view template or communicates with model
- Model communicates with database
- Model sends back information to controller
- Controller renders view

## Model

- resources of the application.
- database tables

## View

- visible lay of the app.
- what users see in the browser/mobile device.
- ```xxx.html.erb```

## Controller

- business-logic codes
- ```xxx_controller.rb```
