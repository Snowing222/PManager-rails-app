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

Company.create!([{id:"1",name:"Fall Fashion company",address: "GuanZhou CHINA",zipcode:"11112"},
                {id:"2",name:"Alice Fashion company",address: "ShenZhen CHINA",zipcode:"11113"},
                {id:"3",name:"LA Fashion company",address: "Deli INDIA",zipcode:"11110"},
                {id:"4",name:"XUE DESIGN STUDIO",address: "NewYork USA",zipcode:"010101"}])

              
5.times do |index|
    User.create!(id: Faker::Number.unique.within(range: 1..5),
                 name: Faker::Name.name,
                 phone: Faker::PhoneNumber.phone_number,
                 email: Faker::Internet.email,
                 role: 0,
                 password: Faker::Internet.password,
                 company_id: 4
                )
end

5.times do |index|
    User.create!(id: Faker::Number.unique.within(range: 6..10),
                 name: Faker::Name.name,
                 phone: Faker::PhoneNumber.phone_number,
                 email: Faker::Internet.email,
                 role: 1,
                 password: Faker::Internet.password,
                 company_id: 4
                )
end

5.times do |index|
    User.create!(id: Faker::Number.unique.within(range: 11..15),
                 name: Faker::Name.name,
                 phone: Faker::PhoneNumber.phone_number,
                 email: Faker::Internet.email,
                 role: 2,
                 password: Faker::Internet.password,
                 company_id: Faker::Number.within(range: 1..3)
                )
end

20.times do |index|
    Product.create!(id: Faker::Number.unique.within(range: 1..20),
                    season: Faker::Number.within(range: 0..3),
                    style_number: Faker::Number.number(digits: 5),
                    description: Faker::Lorem.paragraph,
                    product_status: 1,
                    deadline: Faker::Date.between(from: '2020-12-5', to: '2021-12-5'),
                    production_partner_id: Faker::Number.within(range: 1..5),
                    design_partner_id: Faker::Number.within(range: 6..10),
                    manufacture_partner_id: Faker::Number.within(range: 11..15)
    )
end

# 20.times do |index|
#     Sample.create!(id: Faker::Number.unique.within(range: 1..20),
#                     comment: Faker::Lorem.paragraph,
#                     sample_type: 0,
#                     product_id: Faker::Number.unique.within(range: 1..20)
#     )
# end








