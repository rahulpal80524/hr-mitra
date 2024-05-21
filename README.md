# README

This README would normally document whatever steps are necessary to get the
application up and running.

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

rails g controller pages about_us contact_us privacy_policy terms_conditions


rails g model employee first_name:string last_name:string email city state country pincode:integer phone_number address_line_1 address_line_2

rails db:migrate

comments if turbo not using in rails 7
// import "@hotwired/turbo-rails"
// import "controllers"


if destroy is not working or open show page if clicked on destroy method add this line in head selection
   file path - > hr-mitra/app/views/layouts/application.html.erb
    <%= javascript_include_tag 'rails-ujs' %>

file path - > /hr-mitra/app/assets/config/manifest.js add this line 
//= link rails-ujs.js


#for using active storage
gem "image_processing", "~> 1.2"
rails active_storage:install