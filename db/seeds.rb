# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or newd alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.new([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.new(name: 'Luke', movie: movies.first)
User.delete_all
Company.delete_all
Product.delete_all
Sample.delete_all
Status.delete_all

Company.create([{name:"Fall Fashion company",address:"China",zipcode:"11112"},{name:"Alice Fashion company",address:"China",zipcode:"11113"},{name:"LA Fashion company",address:"LA",zipcode:"11110"}])
Company.create(name:"My company")

xue = User.new(name:"xue",phone:"11111111111",email:"xue@gmail.com", role:1, password:"pw")
stella = User.new(name:"stella",phone:"11111111112",email:"stella@gmail.com",role:1, password:"pw")
alice = User.new(name:"alice",phone:"11111111113",email:"alice@gmail.com",role:1, password:"pw")
xue.company = Company.last
stella.company = Company.last
alice.company = Company.last

anj = User.new(name:"anj",phone:"21111111111",email:"anj@gmail.com", role:0, password:"pw")
elsa = User.new(name:"elsa",phone:"21111111111",email:"elsa@gmail.com", role:0, password:"pw")
anj.company = Company.last
elsa.company = Company.last

jane = User.new(name:"jane",phone:"21111111111",email:"jane@gmail.com", role:2, password:"pw")
hellen = User.new(name:"hellen",phone:"21111111111",email:"hellen@gmail.com", role:2, password:"pw")
jane.company = Company.first
hellen.company = Company.first

xue.save
stella.save
alice.save
anj.save

elsa.save
jane.save
hellen.save


