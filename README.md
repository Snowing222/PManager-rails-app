1.request a sample
=>link to "new form"=> can only pass extra information like product_id through url? 
   products/7/samples/new
=>create a form w/get method=>
   /samples/new?product_id=7&commit=REQUEST+A+NEW+SAMPLE

2.4 statuses instance
{current_status: pending from factory, owner_id:factory_id, sample_id}
{current_status: pending from design, owner_id:design_id, sample_id}
{current_status: approved, owner_id:nil, sample_id}
{current_status: reject, owner_id:nil, sample_id}

3.image

4.css

5.polymophic

6.how to publish

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
