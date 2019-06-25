# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(name:  "Example Super Admin",
             age: 30,
             country: "India",
             gender: 0,
             email: "examplesuperadmin@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar")

user.remove_role :admin
user.add_role :superadmin

user_admin = User.create!(name:  "Example Admin",
             email: "exampleadmin@gmail.com",
             age: 25,
             country: "India",
             gender: 1,
             password:              "foobar",
             password_confirmation: "foobar")

user_admin.add_role :admin
