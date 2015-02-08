User.create(username: "jay", password: "abc", password_confirmation: "abc")
User.create(username: "david", password: "abc", password_confirmation: "abc")
User.create(username: "remy", password: "abc", password_confirmation: "abc")
User.create(username: "kenn", password: "abc", password_confirmation: "abc")

Post.create(title: "Doge", photo_url: "https://upload.wikimedia.org/wikipedia/en/thumb/5/5f/Original_Doge_meme.jpg/300px-Original_Doge_meme.jpg", user_id: 1)
Post.create(title: "Doge Soldier", photo_url: "http://weknowmemes.com/wp-content/uploads/2013/11/doge-meme-111.jpg", user_id: 1)
Post.create(title: "Doge Twinkie", photo_url: "http://i1.kym-cdn.com/photos/images/newsfeed/000/581/567/bab.jpg", user_id: 2)
Post.create(title: "Doge Forecast", photo_url: "http://cdn.trendhunterstatic.com/thumbs/doge-meme.jpeg", user_id: 2)
Post.create(title: "Doge Charger", photo_url: "http://weknowmemes.com/wp-content/uploads/2013/11/doge-charger.jpg", user_id: 3)
Post.create(title: "Doge Landscape", photo_url: "http://weknowmemes.com/wp-content/uploads/2013/11/doge-meme-10.jpg", user_id: 3)
Post.create(title: "Doge donut", photo_url: "http://julianatoledodefaria.com.br/blog/wp-includes/Text/doge-meme-original-6511.jpg", user_id: 4)
Post.create(title: "Homer Simpson", photo_url: "http://img4.wikia.nocookie.net/__cb20130920142351/simpsons/images/e/e9/Pic_1187696292_8.jpg", user_id: 5)


Comment.create(content: "What a dud", post_id: 1, user_id: 1)


