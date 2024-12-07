
Table users {
  id integer [primary key]
  name varchar
  description varchar
  photo_url varchar
  interests jsonb
  city varchar
}

Table posts {
  id integer [primary key]
  description text
  author_id integer
  views integer [default: 0]
  likes integer [default: 0]
}

Table likes {
  id integer [primary key]
  user_id integer
  post_id integer
}

Table hashtags {
  id integer [primary key]
  title varchar
  post_id integer
}

Table medias {
  id integer [primary key]
  post_id integer
  media_url varchar
  media_type varchar
}

Table comments {
  id integer [primary key]
  user_id integer
  post_id integer
  content text
}

Table messages {
  id integer [primary key]
  sender_id integer
  receiver_id integer
  content text
  seen boolean
}

Table friends {
  id integer [primary key]
  user_id integer
  friend_id integer
  status varchar
}

Table followers {
  id integer [primary key]
  user_id integer
  follower_id integer
}

Table love_relationships {
  id integer [primary key]
  user_id integer
  partner_id integer
  status varchar
}


Ref: posts.author_id > users.id
Ref: medias.post_id > posts.id
Ref: hashtags.post_id > posts.id
Ref: comments.post_id > posts.id
Ref: comments.user_id > users.id
Ref: messages.receiver_id > users.id
Ref: messages.sender_id > users.id
Ref: likes.user_id > users.id
Ref: likes.post_id > posts.id
Ref: friends.user_id > users.id
Ref: friends.friend_id > users.id
Ref: followers.user_id > users.id
Ref: followers.follower_id > users.id
Ref: love_relationships.user_id > users.id
Ref: love_relationships.partner_id > users.id