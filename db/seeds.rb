# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{username: 'cmho', display_name: 'Carly Ho', email: 'carlymho@gmail.com', password: '123abc'}, {username: 'steve', display_name: 'Steve', email: 'steve@example.com', password: '123abc'}, {username: 'charlotte', display_name: 'Charlotte', email: 'charlotte@example.com', password: '123abc'}])

follows = Follow.create([{user_id: 1, following_id: 2}, {user_id: 2, following_id: 1}, {user_id: 1, following_id: 3}, {user_id: 3, following_id: 2}])

posts = Post.create([{user_id: 1, content: "hey guys what's up"}, {user_id: 2, content: "ugh ready for the weekend!!"}, {user_id: 1, content: "anyone doing anything tonight? lmk, looking to make plans"}, {user_id: 3, content: "hi! just joined, not really sure what I'm doing here"}, {user_id: 1, content: "it's really easy once you figure it out, don't worry"}, {user_id: 2, content: "ah, coffee. day definitely better."}])