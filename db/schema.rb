# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110930003330) do

  create_table "likes", :force => true do |t|
    t.string   "Unity_ID"
    t.integer  "Post_ID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likesforreplies", :force => true do |t|
    t.integer  "post_id"
    t.integer  "reply_id"
    t.string   "liked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logins", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "Unity_ID"
    t.string   "Subject"
    t.string   "Content"
    t.integer  "Votes",      :default => 0
    t.integer  "No_Replies", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "replies", :force => true do |t|
    t.integer  "Post_ID"
    t.integer  "Reply_number",                 :default => 0
    t.string   "Unity_ID"
    t.string   "Subject"
    t.string   "Reply",        :limit => 1096
    t.integer  "No_of_likes",                  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "Unity_ID"
    t.string   "Name"
    t.string   "Password"
    t.string   "Role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
