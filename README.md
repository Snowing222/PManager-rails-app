1. What is it
It's an app to help production managers to automate workflow, manage sample life cycles and partners

2. Why this app
Pain points of Production manager:
- liaison between manufacture and internal production/design team
- Manage sampls from multiple manufacture
- Manage samples in differet development stage 
- Manage samples with different deadline and make sure to work with all parties to meet the deadline.

3. Background/Industry knowledge
- Product life cycle <-> responsible by different parties

4. Some obstacles when planning the project
- how to set approperiate properties to each model? What should be a stand alone model, what should be a property(ENUM)
- how to wire model relationship propertly
- A product belongs to a production partner, a manufacture partner and a design partner
- Work flow. How to display the right UI and send the right information with each click?

5. deploy to heroku
- how to seed data properly with postgres
- how to deploy omniauth to heroku



--------------------
WORKFLOW
1.CREATE A PRODUCT => product show page link_to sample new form=> use form_for @sample (product.samples.build in controller)=> collect sample_type,comment from user, and get @sample.product value through hidden_field.
use field_for @statuses(@sample.statuses.build in controller) assign current_state, owner_id value, collect date from user.
When submit sample request=> pass sample_params to samples#create
sample_params = 
{"sample"=>{"sample_type"=>"PROTO", "comment"=>"",  "product_id"=>"3", 
           "statuses_attributes"=>{"0"=>{"current_state"=>"PENDING_SAMPLE_FROM_MANUFACTURE_PARTNER", "owner_id"=>"12", "deadline"=>""}}}

create @sample and @status at the same time (accept nested data, custom statuses_attributes= method)
*If I click that button. As long as I select sample type. there should be no bad data.
redirect_to sample show page.




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
