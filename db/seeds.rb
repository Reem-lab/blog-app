first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

# Posts
first_post = Post.create(author_id: first_user.id, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author_id: first_user.id, title: 'Hello 2', text: 'This is my second post')
third_post = Post.create(author_id: first_user.id, title: 'Hello 3', text: 'This is my third post')
fourth_post = Post.create(author_id: first_user.id, title: 'Hello 4', text: 'This is my fourth post')

# Comments
first_comment = Comment.create(posts_id: first_post.id, author_id: second_user.id, text: 'Hi Tom!' )
second_comment = Comment.create(posts_id: first_post.id, author_id: second_user.id, text: 'Hello Tom!' )
third_comment = Comment.create(posts_id: first_post.id, author_id: second_user.id, text: 'Nice Post Tom!' )
fourth_comment = Comment.create(posts_id: first_post.id, author_id: second_user.id, text: 'Hola Tom!' )
fifth_comment = Comment.create(posts_id: first_post.id, author_id: second_user.id, text: 'Ciao Tom!' )
sixth_comment = Comment.create(posts_id: first_post.id, author_id: second_user.id, text: 'Hallo Tom!' )