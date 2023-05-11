# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a user
first_user = User.create(name: 'Lillian', photo: 'https://media.gettyimages.com/id/1278139568/nl/foto/studioportret-van-20-jaar-oude-vrouw.jpg?s=612x612&w=0&k=20&c=3Bd4Ot79Z1ZKoCwAl0qFQ9hoBrQTar4SqtPefHOBEkg=', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Bobby', photo: 'https://media.gettyimages.com/id/1250238624/nl/foto/handsome-young-adult-businessman-with-stubble.jpg?s=612x612&w=0&k=20&c=Ahojmst5H08S3yL7kaEj5mN3V8Weguk1V2pWDf4aH2Q=', bio: 'Teacher from Brazil.')
third_user = User.create(name: 'John', photo: 'https://media.gettyimages.com/id/1092658864/nl/foto/confident-young-man-wearing-purple-t-shirt.jpg?s=612x612&w=0&k=20&c=Y8u4zM33AhjJczqOhQI5SM6-D3XzmZue8N1VIYPlmSA=', bio: 'Teacher from USA.')

# Create a Post
first_post = Post.create(user: first_user, title: 'Hello Microverse', text: 'This is my first post')
second_post = Post.create(user: first_user, title: 'My best friend', text: 'This is my second post')
third_post = Post.create(user: first_user, title: 'Enjoying all day long', text: 'This is my third post')
fourth_post = Post.create(user: first_user, title: 'God is good', text: 'This is my fourth post')

first_second_post = Post.create(user: second_user, title: 'Enjoying here', text: 'This is my first post by second user')
second_second_post = Post.create(user: second_user, title: 'Having Fun', text: 'This is my second post by second user')
third_second_post = Post.create(user: second_user, title: 'Thank God its weekend', text: 'This is my third post by second user')

first_third_post = Post.create(user: third_user, title: 'My Exams', text: 'This is my first post by third user')
second_third_post = Post.create(user: third_user, title: 'Swimming all day', text: 'This is my second post by third user')

# Comments
Comment.create(post: first_post, user: second_user, text: 'Hi Lillian!')
Comment.create(post: first_post, user: second_user, text: 'How are you')
Comment.create(post: first_post, user: second_user, text: 'Very nice')
Comment.create(post: first_post, user: second_user, text: 'Good job dear')

Comment.create(post: first_second_post, user: third_user, text: 'Hi Bobby')
Comment.create(post: first_second_post, user: third_user, text: 'Keep being you')
Comment.create(post: first_second_post, user: third_user, text: 'Nice one')

Comment.create(post: first_third_post, user: first_user, text: 'Hi John!')
Comment.create(post: first_third_post, user: first_user, text: 'Success in your exams')