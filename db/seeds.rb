User.create(username: "jay", password: "abc", password_confirmation: "abc")
Post.create(title: "Homer Simpson", photo_url: "http://img4.wikia.nocookie.net/__cb20130920142351/simpsons/images/e/e9/Pic_1187696292_8.jpg", user_id: 1)
Comment.create(content: "What a dud", post_id: 1, user_id: 1)


