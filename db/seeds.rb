# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.destroy_all
# Category.destroy_all
# Language.destroy_all

# User.create([{username: "yiivan", first_name: "Yii Van", last_name: "Tay",
#               email: "yiivan@gmail.com", password: "abc",
#               password_confirmation: "abc", admin: true},
#              {username: "evan", first_name: "Evan", last_name: "Tay",
#               email: "evan@gmail.com", password: "abc",
#               password_confirmation: "abc"},
User.create(username: "guest", first_name: "Guest", last_name: "Tay",
              email: "guest@gmail.com", password: "abc",
              password_confirmation: "abc")

# Category.create([{name: "Arts"},
#                  {name: "Biography & True Stories"},
#                  {name: "Language"},
#                  {name: "Literature & Literary Studies"},
#                  {name: "English Language Teaching"},
#                  {name: "Fiction & Related Items"},
#                  {name: "Reference, Information & Interdisciplinary Studies"},
#                  {name: "Humanities"},
#                  {name: "Society & Social Sciences"},
#                  {name: "Economics, Finance, Business & Management"},
#                  {name: "Law"},
#                  {name: "Medicine"},
#                  {name: "Mathematics & Science"},
#                  {name: "Earth Sciences, Geography, Environment, Planning"},
#                  {name: "Technology, Engineering, Agriculture"},
#                  {name: "Computing & Information Technology"},
#                  {name: "Health & Personal Development"},
#                  {name: "Lifestyle, Sport & Leisure"},
#                  {name: "Children’s, Teenage & Educational"},
#                  {name: "Other"}])
#
# Language.create([{name: "Chinese"},
#                  {name: "Dutch"},
#                  {name: "English"},
#                  {name: "French"},
#                  {name: "German"},
#                  {name: "Italian"},
#                  {name: "Japanese"},
#                  {name: "Korean"},
#                  {name: "Portuguese"},
#                  {name: "Spanish"},
#                  {name: "Other"}])
