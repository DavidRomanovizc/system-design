CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "description" varchar,
  "photo_url" varchar,
  "interests" jsonb,
  "city" varchar
);

CREATE TABLE "posts" (
  "id" integer PRIMARY KEY,
  "description" text,
  "author_id" integer,
  "views" integer DEFAULT 0,
  "likes" integer DEFAULT 0
);

CREATE TABLE "likes" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "post_id" integer
);

CREATE TABLE "hashtags" (
  "id" integer PRIMARY KEY,
  "title" varchar,
  "post_id" integer
);

CREATE TABLE "medias" (
  "id" integer PRIMARY KEY,
  "post_id" integer,
  "media_url" varchar,
  "media_type" varchar
);

CREATE TABLE "comments" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "post_id" integer,
  "content" text
);

CREATE TABLE "messages" (
  "id" integer PRIMARY KEY,
  "sender_id" integer,
  receiver_id integer,
  "content" text,
  "seen" boolean
);

CREATE TABLE "friends" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "friend_id" integer,
  "status" varchar
);

CREATE TABLE "followers" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "follower_id" integer
);

CREATE TABLE "love_relationships" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "partner_id" integer,
  "status" varchar
);

ALTER TABLE "posts" ADD FOREIGN KEY ("author_id") REFERENCES "users" ("id");

ALTER TABLE "medias" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "hashtags" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "messages" ADD FOREIGN KEY (receiver_id) REFERENCES "users" ("id");

ALTER TABLE "messages" ADD FOREIGN KEY ("sender_id") REFERENCES "users" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "friends" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "friends" ADD FOREIGN KEY ("friend_id") REFERENCES "users" ("id");

ALTER TABLE "followers" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "followers" ADD FOREIGN KEY ("follower_id") REFERENCES "users" ("id");

ALTER TABLE "love_relationships" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "love_relationships" ADD FOREIGN KEY ("partner_id") REFERENCES "users" ("id");

