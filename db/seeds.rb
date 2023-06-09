# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a user
first_user = User.create(name: 'Lillian', photo: 'https://media.gettyimages.com/id/1278139568/nl/foto/studioportret-van-20-jaar-oude-vrouw.jpg?s=612x612&w=0&k=20&c=3Bd4Ot79Z1ZKoCwAl0qFQ9hoBrQTar4SqtPefHOBEkg=', bio: 'Teacher from Mexico.', posts_counter: 0)

second_user = User.create(name: 'Bobby', photo: 'https://media.gettyimages.com/id/1250238624/nl/foto/handsome-young-adult-businessman-with-stubble.jpg?s=612x612&w=0&k=20&c=Ahojmst5H08S3yL7kaEj5mN3V8Weguk1V2pWDf4aH2Q=', bio: 'Teacher from Brazil.', posts_counter: 0)

third_user = User.create(name: 'John', photo: 'https://media.gettyimages.com/id/1092658864/nl/foto/confident-young-man-wearing-purple-t-shirt.jpg?s=612x612&w=0&k=20&c=Y8u4zM33AhjJczqOhQI5SM6-D3XzmZue8N1VIYPlmSA=', bio: 'Teacher from USA.', posts_counter: 0)


first_post = Post.create(user_id: first_user.id, title: 'Hello there', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
second_post = Post.create(user_id: first_user.id, title: 'Hello microverse', text: 'This is my second post', comments_counter: 0, likes_counter: 0)
third_post = Post.create(user_id: first_user.id, title: 'Hello Rails', text: 'This is my third post', comments_counter: 0, likes_counter: 0)
fourth_post = Post.create(user_id: first_user.id, title: 'Hello Ruby', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0)

Comment.create(post: first_post, user_id: second_user.id, text: 'Hi Lillian!')
Comment.create(post: first_post, user_id: second_user.id, text: 'How are you?')
Comment.create(post: first_post, user_id: second_user.id, text: 'You know Rails')


first_second_post = Post.create(user_id: second_user.id, title: 'Hello there', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
second_second_post = Post.create(user_id: second_user.id, title: 'Hello microverse', text: 'This is my second post', comments_counter: 0, likes_counter: 0)

first_third_post = Post.create(user_id: third_user.id, title: 'Hello Rails', text: 'This is my third post', comments_counter: 0, likes_counter: 0)
second_tird_post = Post.create(user_id: third_user.id, title: 'Hello Ruby', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0)

Comment.create(post: first_second_post, user_id: third_user.id, text: 'Hi Bobby!')
Comment.create(post: first_third_post, user_id: first_user.id, text: 'Hi John!')