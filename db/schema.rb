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

ActiveRecord::Schema.define(:version => 20111031140140) do

  create_table "_pgmdd_backup_blog_comments_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",                     :limit => 8
    t.integer "parent_blog_comment_id", :limit => 8
    t.integer "blog_entry_id",          :limit => 8
    t.integer "user_id",                :limit => 8
  end

  create_table "_pgmdd_backup_blog_comments_2011-17-07_11:26", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "parent_blog_comment_id"
    t.integer "blog_entry_id"
    t.integer "user_id"
  end

  create_table "_pgmdd_backup_blog_entries_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",      :limit => 8
    t.integer "blog_id", :limit => 8
  end

  create_table "_pgmdd_backup_blog_images_2011-15-09_21:41", :id => false, :force => true do |t|
    t.integer  "id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "blog_post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "_pgmdd_backup_blog_post_images_2011-15-09_23:55", :id => false, :force => true do |t|
    t.integer "blog_post_image_id"
    t.integer "blog_post_id"
    t.integer "image_id"
  end

  create_table "_pgmdd_backup_blog_posts_2011-17-07_11:50", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "blog_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
    t.datetime "published_at"
  end

  create_table "_pgmdd_backup_blogs_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",      :limit => 8
    t.integer "user_id", :limit => 8
  end

  create_table "_pgmdd_backup_blogs_2011-17-07_11:26", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "user_id"
  end

  create_table "_pgmdd_backup_circoscriziones_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",        :limit => 8
    t.integer "comune_id", :limit => 8
  end

  create_table "_pgmdd_backup_circoscrizioni_groups_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",                :limit => 8
    t.string  "name",              :limit => 200
    t.string  "description",       :limit => 2000
    t.integer "circoscrizione_id", :limit => 8
  end

  create_table "_pgmdd_backup_comunali_groups_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",          :limit => 8
    t.string  "name",        :limit => 200
    t.string  "description", :limit => 2000
    t.integer "comune_id",   :limit => 8
  end

  create_table "_pgmdd_backup_comunes_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",           :limit => 8
    t.integer "provincia_id", :limit => 8
  end

  create_table "_pgmdd_backup_events_2011-08-10_17:15", :id => false, :force => true do |t|
    t.integer  "id"
    t.string   "title"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "all_day"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "event_series_id"
  end

  create_table "_pgmdd_backup_group_partecipation_requests_2011-13-09_21:02", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "user_id"
    t.integer "group_id"
    t.integer "group_partecipation_request_status_id"
  end

  create_table "_pgmdd_backup_group_partecipations_2010-16-08_19:45", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "user_id"
    t.integer "group_id"
    t.integer "partecipation_role_id"
  end

  create_table "_pgmdd_backup_groups_2010-04-09_18:45", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",        :limit => 200
    t.string  "description", :limit => 2000
  end

  create_table "_pgmdd_backup_groups_2010-04-09_18:54", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.string  "accept_requests", :limit => 1
  end

  create_table "_pgmdd_backup_groups_2010-04-09_18:55", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.string  "accept_requests", :limit => 1
  end

  create_table "_pgmdd_backup_groups_2011-08-10_17:15", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.string  "accept_requests", :limit => 1
  end

  create_table "_pgmdd_backup_groups_2011-08-10_17:16", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.string  "accept_requests", :limit => 1
  end

  create_table "_pgmdd_backup_groups_2011-08-10_20:00", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.string  "accept_requests", :limit => 1
  end

  create_table "_pgmdd_backup_groups_2011-09-10_18:17", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.string  "accept_requests", :limit => 1
  end

  create_table "_pgmdd_backup_groups_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",          :limit => 8
    t.string  "name",        :limit => 200
    t.string  "description", :limit => 2000
  end

  create_table "_pgmdd_backup_groups_2011-13-09_21:02", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.string  "accept_requests", :limit => 1
  end

  create_table "_pgmdd_backup_groups_2011-14-09_19:32", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.string  "accept_requests", :limit => 1
  end

  create_table "_pgmdd_backup_groups_2011-15-09_21:41", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.string  "accept_requests", :limit => 1
  end

  create_table "_pgmdd_backup_groups_2011-19-09_19:51", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.string  "accept_requests", :limit => 1
  end

  create_table "_pgmdd_backup_groups_2011-19-09_19:53", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.string  "accept_requests", :limit => 1
  end

  create_table "_pgmdd_backup_groups_2011-21-09_23:11", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.string  "accept_requests", :limit => 1
  end

  create_table "_pgmdd_backup_groups_2011-22-09_20:53", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.string  "accept_requests", :limit => 1
  end

  create_table "_pgmdd_backup_groups_2011-22-09_20:56", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.string  "accept_requests", :limit => 1
  end

  create_table "_pgmdd_backup_groups_2011-22-09_21:02", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.string  "accept_requests", :limit => 1
  end

  create_table "_pgmdd_backup_groups_2011-26-10_14:21", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.string  "accept_requests", :limit => 1
  end

  create_table "_pgmdd_backup_groups_partecipations_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",                    :limit => 8
    t.integer "user_id",               :limit => 8
    t.integer "group_id",              :limit => 8
    t.integer "partecipation_role_id", :limit => 8
  end

  create_table "_pgmdd_backup_groups_partecipations_2011-18-07_21:31", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "user_id"
    t.integer "group_id"
    t.integer "partecipation_role_id"
  end

  create_table "_pgmdd_backup_images_2011-15-09_23:36", :id => false, :force => true do |t|
    t.integer  "id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "blog_post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "_pgmdd_backup_meetings_2011-09-10_18:17", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "place_id"
    t.string  "title",    :limit => 200
    t.binary  "content"
  end

  create_table "_pgmdd_backup_meetings_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",       :limit => 8
    t.integer "place_id", :limit => 8
  end

  create_table "_pgmdd_backup_meetings_2011-11-07_18:51", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "place_id"
  end

  create_table "_pgmdd_backup_meetings_2011-26-10_14:21", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "place_id"
    t.integer "event_id"
  end

  create_table "_pgmdd_backup_meetings_organizations_2011-09-10_18:17", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "group_id"
    t.integer "meeting_id"
  end

  create_table "_pgmdd_backup_meetings_organizations_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",         :limit => 8
    t.integer "group_id",   :limit => 8
    t.integer "meeting_id", :limit => 8
  end

  create_table "_pgmdd_backup_meetings_partecipations_2011-09-10_18:17", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "user_id"
    t.integer "meeting_id"
  end

  create_table "_pgmdd_backup_meetings_partecipations_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",         :limit => 8
    t.integer "user_id",    :limit => 8
    t.integer "meeting_id", :limit => 8
  end

  create_table "_pgmdd_backup_partecipation_roles_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",                           :limit => 8
    t.integer "parent_partecipation_role_id", :limit => 8
    t.integer "group_id",                     :limit => 8
    t.string  "name",                         :limit => 200
    t.string  "description",                  :limit => 2000
  end

  create_table "_pgmdd_backup_places_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",                   :limit => 8
    t.integer "comune_id",            :limit => 8
    t.string  "frazione",             :limit => 200
    t.string  "address",              :limit => 200
    t.string  "civic_number",         :limit => 10
    t.string  "cap",                  :limit => 5
    t.float   "latitude_original"
    t.float   "longitude_original"
    t.float   "latitude_calculated"
    t.float   "longitude_calculated"
  end

  create_table "_pgmdd_backup_proposal_categories_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",                          :limit => 8
    t.integer "parent_proposal_category_id", :limit => 8
    t.string  "description",                 :limit => 200
  end

  create_table "_pgmdd_backup_proposal_comment_rankings_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",                  :limit => 8
    t.integer "proposal_comment_id", :limit => 8
    t.integer "user_id",             :limit => 8
    t.integer "ranking_type_id",     :limit => 8
  end

  create_table "_pgmdd_backup_proposal_comment_rankings_2011-11-07_18:51", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "proposal_comment_id"
    t.integer "user_id"
    t.integer "ranking_type_id"
  end

  create_table "_pgmdd_backup_proposal_comment_rankings_2011-26-07_21:31", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "proposal_comment_id"
    t.integer "user_id"
    t.integer "ranking_type_id"
    t.string  "contents",            :limit => 2000
  end

  create_table "_pgmdd_backup_proposal_comments_2010-16-08_19:45", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "parent_proposal_comment_id"
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.string   "contents",                   :limit => 2000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_ip"
    t.string   "user_agent"
    t.string   "referrer"
  end

  create_table "_pgmdd_backup_proposal_comments_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",                         :limit => 8
    t.integer "parent_proposal_comment_id", :limit => 8
    t.integer "user_id"
    t.integer "proposal_id"
    t.string  "contents",                   :limit => 2000
  end

  create_table "_pgmdd_backup_proposal_comments_2011-11-07_18:51", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "parent_proposal_comment_id"
    t.integer "user_id"
    t.integer "proposal_id"
    t.string  "contents",                   :limit => 2000
  end

  create_table "_pgmdd_backup_proposal_comments_2011-11-07_19:56", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "parent_proposal_comment_id"
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.string   "contents",                   :limit => 2000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "_pgmdd_backup_proposal_comments_2011-20-07_19:35", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "parent_proposal_comment_id"
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.string   "contents",                   :limit => 2000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "_pgmdd_backup_proposal_comments_2011-21-09_23:11", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "parent_proposal_comment_id"
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.string   "content",                    :limit => 4000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_ip"
    t.string   "user_agent"
    t.string   "referrer"
    t.boolean  "deleted"
    t.integer  "deleted_user_id"
    t.datetime "deleted_at"
  end

  create_table "_pgmdd_backup_proposal_comments_2011-22-09_20:53", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "parent_proposal_comment_id"
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_ip"
    t.string   "user_agent"
    t.string   "referrer"
    t.boolean  "deleted"
    t.integer  "deleted_user_id"
    t.datetime "deleted_at"
  end

  create_table "_pgmdd_backup_proposal_presentations_2010-16-08_19:45", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "proposal_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "_pgmdd_backup_proposal_presentations_2010-16-08_19:47", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "proposal_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "_pgmdd_backup_proposal_presentations_2011-17-07_11:26", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "proposal_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "_pgmdd_backup_proposal_rankings_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",              :limit => 8
    t.integer "proposal_id",     :limit => 8
    t.integer "user_id",         :limit => 8
    t.integer "ranking_type_id", :limit => 8
  end

  create_table "_pgmdd_backup_proposal_rankings_2011-25-07_23:43", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "proposal_id"
    t.integer "user_id"
    t.integer "ranking_type_id"
  end

  create_table "_pgmdd_backup_proposal_rankings_2011-25-07_23:57", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "proposal_id"
    t.integer  "user_id"
    t.integer  "ranking_type_id"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "_pgmdd_backup_proposal_states_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",          :limit => 8
    t.string  "description", :limit => 200
  end

  create_table "_pgmdd_backup_proposal_votes_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",          :limit => 8
    t.integer "proposal_id", :limit => 8
    t.integer "positive"
    t.integer "negative"
    t.integer "neutral"
  end

  create_table "_pgmdd_backup_proposal_votes_2011-11-07_18:51", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "proposal_id", :limit => 8
    t.integer "positive"
    t.integer "negative"
    t.integer "neutral"
  end

  create_table "_pgmdd_backup_proposal_watches_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",          :limit => 8
    t.integer "user_id",     :limit => 8
    t.integer "proposal_id", :limit => 8
  end

  create_table "_pgmdd_backup_proposal_watches_2011-11-07_18:51", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "user_id"
    t.integer "proposal_id"
  end

  create_table "_pgmdd_backup_proposal_watches_2011-11-07_19:56", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "_pgmdd_backup_proposals_2011-08-10_17:15", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "proposal_state_id"
    t.integer  "proposal_category_id"
    t.string   "title",                   :limit => 200
    t.string   "content",                 :limit => 20000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "proposal_rankings_count"
  end

  create_table "_pgmdd_backup_proposals_2011-08-10_17:16", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "proposal_state_id"
    t.integer  "proposal_category_id"
    t.string   "title",                   :limit => 200
    t.string   "content",                 :limit => 20000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "proposal_rankings_count"
    t.integer  "vote_period_id"
  end

  create_table "_pgmdd_backup_proposals_2011-10-07_18:57", :id => false, :force => true do |t|
    t.integer "id",                   :limit => 8
    t.integer "proposal_state_id",    :limit => 8
    t.integer "proposal_category_id", :limit => 8
  end

  create_table "_pgmdd_backup_proposals_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",                   :limit => 8
    t.integer "proposal_state_id",    :limit => 8
    t.integer "proposal_category_id", :limit => 8
    t.string  "title",                :limit => 200
    t.string  "content",              :limit => 20000
  end

  create_table "_pgmdd_backup_proposals_2011-11-07_18:51", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "proposal_state_id"
    t.integer "proposal_category_id"
    t.string  "title",                :limit => 200
    t.string  "content",              :limit => 20000
  end

  create_table "_pgmdd_backup_proposals_2011-11-07_19:56", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "proposal_state_id"
    t.integer  "proposal_category_id"
    t.string   "title",                :limit => 200
    t.string   "content",              :limit => 20000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "_pgmdd_backup_proposals_2011-14-09_19:32", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "proposal_state_id"
    t.integer  "proposal_category_id"
    t.string   "title",                :limit => 200
    t.string   "content",              :limit => 20000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "_pgmdd_backup_proposals_2011-21-09_23:11", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "proposal_state_id"
    t.integer  "proposal_category_id"
    t.string   "title",                   :limit => 200
    t.string   "content",                 :limit => 20000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "proposal_rankings_count"
  end

  create_table "_pgmdd_backup_proposals_presentations_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",          :limit => 8
    t.integer "proposal_id", :limit => 8
    t.integer "user_id",     :limit => 8
  end

  create_table "_pgmdd_backup_proposals_presentations_2011-11-07_18:51", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "proposal_id"
    t.integer "user_id"
  end

  create_table "_pgmdd_backup_proposals_presentations_2011-11-07_19:56", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "proposal_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "_pgmdd_backup_proposals_presentations_2011-17-07_11:43", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "proposal_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "_pgmdd_backup_provinciali_groups_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",           :limit => 8
    t.string  "name",         :limit => 200
    t.string  "description",  :limit => 2000
    t.integer "provincia_id", :limit => 8
  end

  create_table "_pgmdd_backup_provincias_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",         :limit => 8
    t.integer "regione_id", :limit => 8
  end

  create_table "_pgmdd_backup_ranking_types_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",          :limit => 8
    t.string  "description", :limit => 200
  end

  create_table "_pgmdd_backup_regionali_groups_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",          :limit => 8
    t.string  "name",        :limit => 200
    t.string  "description", :limit => 2000
    t.integer "regione_id",  :limit => 8
  end

  create_table "_pgmdd_backup_regiones_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id", :limit => 8
  end

  create_table "_pgmdd_backup_user_types_2010-16-08_19:45", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "description", :limit => 200
  end

  create_table "_pgmdd_backup_user_types_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",          :limit => 8
    t.string  "description", :limit => 200
  end

  create_table "_pgmdd_backup_user_votes_2011-08-10_17:15", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "proposal_id"
    t.integer "user_id"
    t.date    "created_on"
  end

  create_table "_pgmdd_backup_user_votes_2011-08-10_17:16", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "proposal_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "_pgmdd_backup_user_votes_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",          :limit => 8
    t.integer "proposal_id", :limit => 8
    t.integer "user_id",     :limit => 8
  end

  create_table "_pgmdd_backup_user_votes_2011-11-07_18:51", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "proposal_id"
    t.integer "user_id"
  end

  create_table "_pgmdd_backup_user_votes_2011-11-07_19:56", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "proposal_id"
    t.integer "user_id"
    t.date    "created_on"
  end

  create_table "_pgmdd_backup_user_votes_2011-26-10_14:21", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "proposal_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "_pgmdd_backup_users_2010-16-08_19:45", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "user_type_id"
    t.integer  "residenza_id"
    t.integer  "nascita_id"
    t.string   "name",                      :limit => 100
    t.string   "surname",                   :limit => 100
    t.string   "email",                     :limit => 100
    t.string   "sex",                       :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                     :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.datetime "deleted_at"
    t.string   "state",                     :limit => nil
    t.string   "password_reset_code",       :limit => 40
    t.string   "crypted_password",          :limit => 100
  end

  create_table "_pgmdd_backup_users_2011-11-07_00:11", :id => false, :force => true do |t|
    t.integer "id",           :limit => 8
    t.integer "user_type_id", :limit => 8
    t.integer "residenza_id", :limit => 8
    t.integer "nascita_id",   :limit => 8
    t.string  "name",         :limit => 100
    t.string  "surname",      :limit => 100
    t.string  "email",        :limit => 100
    t.string  "username",     :limit => 100
    t.string  "password",     :limit => 100
    t.string  "sex",          :limit => 1
  end

  create_table "_pgmdd_backup_users_2011-11-07_18:51", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "user_type_id"
    t.integer "residenza_id"
    t.integer "nascita_id"
    t.string  "name",         :limit => 100
    t.string  "surname",      :limit => 100
    t.string  "email",        :limit => 100
    t.string  "username",     :limit => 100
    t.string  "password",     :limit => 100
    t.string  "sex",          :limit => 1
  end

  create_table "_pgmdd_backup_users_2011-11-07_19:56", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "user_type_id"
    t.integer  "residenza_id"
    t.integer  "nascita_id"
    t.string   "name",         :limit => 100
    t.string   "surname",      :limit => 100
    t.string   "email",        :limit => 100
    t.string   "username",     :limit => 100
    t.string   "password",     :limit => 100
    t.string   "sex",          :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "_pgmdd_backup_users_2011-11-07_19:58", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "user_type_id"
    t.integer  "residenza_id"
    t.integer  "nascita_id"
    t.string   "name",                      :limit => 100
    t.string   "surname",                   :limit => 100
    t.string   "email",                     :limit => 100
    t.string   "sex",                       :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                     :limit => 40
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.datetime "deleted_at"
  end

  create_table "_pgmdd_backup_users_2011-11-07_20:06", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "user_type_id"
    t.integer  "residenza_id"
    t.integer  "nascita_id"
    t.string   "name",                      :limit => 100
    t.string   "surname",                   :limit => 100
    t.string   "email",                     :limit => 100
    t.string   "sex",                       :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                     :limit => 40
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.datetime "deleted_at"
    t.string   "state",                     :limit => nil
  end

  create_table "_pgmdd_backup_users_2011-15-09_21:41", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "user_type_id"
    t.integer  "residenza_id"
    t.integer  "nascita_id"
    t.string   "name",                      :limit => 100
    t.string   "surname",                   :limit => 100
    t.string   "email",                     :limit => 100
    t.string   "sex",                       :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                     :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.datetime "deleted_at"
    t.string   "state",                     :limit => nil
    t.string   "password_reset_code",       :limit => 40
    t.string   "crypted_password",          :limit => 100
    t.boolean  "activist"
    t.boolean  "elected"
    t.string   "blog_image_url",            :limit => 1000
  end

  create_table "_pgmdd_backup_users_2011-17-07_11:26", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "user_type_id"
    t.integer  "residenza_id"
    t.integer  "nascita_id"
    t.string   "name",                      :limit => 100
    t.string   "surname",                   :limit => 100
    t.string   "email",                     :limit => 100
    t.string   "sex",                       :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                     :limit => 40
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.datetime "deleted_at"
    t.string   "state",                     :limit => nil
    t.string   "password_reset_code",       :limit => 40
  end

  create_table "_pgmdd_backup_users_2011-17-07_11:35", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "user_type_id"
    t.integer  "residenza_id"
    t.integer  "nascita_id"
    t.string   "name",         :limit => 100
    t.string   "surname",      :limit => 100
    t.string   "email",        :limit => 100
    t.string   "sex",          :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",     :limit => 100
  end

  create_table "_pgmdd_backup_users_2011-17-07_11:41", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "user_type_id"
    t.integer  "residenza_id"
    t.integer  "nascita_id"
    t.string   "name",                      :limit => 100
    t.string   "surname",                   :limit => 100
    t.string   "email",                     :limit => 100
    t.string   "sex",                       :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                     :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.datetime "deleted_at"
    t.string   "state",                     :limit => nil
    t.string   "password_reset_code",       :limit => 40
    t.string   "crypted_password",          :limit => 100
  end

  create_table "_pgmdd_backup_users_2011-19-09_19:51", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "user_type_id"
    t.integer  "residenza_id"
    t.integer  "nascita_id"
    t.string   "name",                      :limit => 100
    t.string   "surname",                   :limit => 100
    t.string   "email",                     :limit => 100
    t.string   "sex",                       :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                     :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.datetime "deleted_at"
    t.string   "state",                     :limit => nil
    t.string   "password_reset_code",       :limit => 40
    t.string   "crypted_password",          :limit => 100
    t.boolean  "activist"
    t.boolean  "elected"
    t.string   "blog_image_url",            :limit => 1000
    t.integer  "image_id"
  end

  create_table "_pgmdd_backup_users_2011-22-09_20:53", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "user_type_id"
    t.integer  "residenza_id"
    t.integer  "nascita_id"
    t.string   "name",                      :limit => 100
    t.string   "surname",                   :limit => 100
    t.string   "email",                     :limit => 100
    t.string   "sex",                       :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                     :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.datetime "deleted_at"
    t.string   "state",                     :limit => nil
    t.string   "password_reset_code",       :limit => 40
    t.string   "crypted_password",          :limit => 100
    t.boolean  "activist"
    t.boolean  "elected"
    t.string   "blog_image_url",            :limit => 1000
    t.integer  "image_id"
  end

  create_table "_pgmdd_backup_users_2011-22-09_20:56", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "user_type_id"
    t.integer  "residenza_id"
    t.integer  "nascita_id"
    t.string   "name",                      :limit => 100
    t.string   "surname",                   :limit => 100
    t.string   "email",                     :limit => 100
    t.string   "sex",                       :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                     :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.datetime "deleted_at"
    t.string   "state",                     :limit => nil
    t.string   "password_reset_code",       :limit => 40
    t.string   "crypted_password",          :limit => 100
    t.boolean  "activist"
    t.boolean  "elected"
    t.string   "blog_image_url",            :limit => 1000
    t.integer  "image_id"
    t.integer  "rank"
  end

  create_table "associations", :force => true do |t|
    t.integer "user_id"
    t.string  "provider"
    t.string  "token"
  end

  create_table "blog_comments", :force => true do |t|
    t.integer  "parent_blog_comment_id"
    t.integer  "blog_post_id"
    t.integer  "user_id"
    t.string   "user_ip"
    t.string   "user_agent"
    t.string   "referrer"
    t.string   "name"
    t.string   "site_url"
    t.string   "email"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_entries", :force => true do |t|
    t.integer "blog_id"
  end

  create_table "blog_post_images", :force => true do |t|
    t.integer "blog_post_id", :null => false
    t.integer "image_id",     :null => false
  end

  add_index "blog_post_images", ["blog_post_id", "image_id"], :name => "Constraint0", :unique => true

  create_table "blog_post_tags", :force => true do |t|
    t.integer "blog_post_id"
    t.string  "tag"
  end

  create_table "blog_posts", :force => true do |t|
    t.integer  "blog_id"
    t.string   "title",                           :null => false
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published",    :default => false, :null => false
    t.datetime "published_at"
    t.integer  "user_id"
  end

  create_table "blog_tags", :force => true do |t|
    t.integer "blog_id"
    t.string  "tag"
  end

  create_table "blogs", :force => true do |t|
    t.integer "user_id"
    t.string  "title"
  end

  create_table "circoscriziones", :force => true do |t|
    t.integer "comune_id"
  end

  create_table "circoscrizioni_groups", :id => false, :force => true do |t|
    t.integer "id",                                                 :null => false
    t.string  "name",              :limit => 200
    t.string  "description",       :limit => 2000
    t.integer "circoscrizione_id"
    t.string  "accept_requests",   :limit => 1,    :default => "v", :null => false
  end

  create_table "comunali_groups", :id => false, :force => true do |t|
    t.integer "id",                                               :null => false
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.integer "comune_id"
    t.string  "accept_requests", :limit => 1,    :default => "v", :null => false
  end

  create_table "comunes", :force => true do |t|
    t.integer "provincia_id"
  end

  create_table "event_series", :force => true do |t|
    t.integer  "frequency",  :default => 1
    t.string   "period",     :default => "months"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "all_day",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_types", :force => true do |t|
    t.string "description", :limit => 200
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "all_day",         :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "event_series_id"
    t.integer  "event_type_id"
  end

  add_index "events", ["event_series_id"], :name => "index_events_on_event_series_id"

  create_table "group_follows", :force => true do |t|
    t.integer "user_id",  :null => false
    t.integer "group_id", :null => false
  end

  create_table "group_partecipation_request_statuses", :force => true do |t|
    t.string "description", :limit => 200, :null => false
  end

  create_table "group_partecipation_requests", :force => true do |t|
    t.integer "user_id",                                              :null => false
    t.integer "group_id",                                             :null => false
    t.integer "group_partecipation_request_status_id", :default => 1, :null => false
  end

  add_index "group_partecipation_requests", ["user_id", "group_id"], :name => "unique", :unique => true

  create_table "group_partecipations", :force => true do |t|
    t.integer "user_id",                              :null => false
    t.integer "group_id",                             :null => false
    t.integer "partecipation_role_id", :default => 1, :null => false
  end

  add_index "group_partecipations", ["user_id", "group_id"], :name => "only_once_per_group", :unique => true

  create_table "groups", :force => true do |t|
    t.string "name",            :limit => 200
    t.string "description",     :limit => 2000
    t.string "accept_requests", :limit => 1,    :default => "v", :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meetings", :force => true do |t|
    t.integer "place_id"
    t.integer "event_id"
  end

  create_table "meetings_organizations", :force => true do |t|
    t.integer "group_id"
    t.integer "event_id"
  end

  create_table "meetings_partecipations", :force => true do |t|
    t.integer "user_id"
    t.integer "meeting_id"
  end

  create_table "partecipation_roles", :force => true do |t|
    t.integer "parent_partecipation_role_id"
    t.integer "group_id"
    t.string  "name",                         :limit => 200
    t.string  "description",                  :limit => 2000
  end

  create_table "periods", :force => true do |t|
    t.datetime "from", :null => false
    t.datetime "to",   :null => false
  end

  add_index "periods", ["from", "to"], :name => "from_to_unique", :unique => true

  create_table "places", :force => true do |t|
    t.integer "comune_id"
    t.string  "frazione",             :limit => 200
    t.string  "address",              :limit => 200
    t.string  "civic_number",         :limit => 10
    t.string  "cap",                  :limit => 5
    t.float   "latitude_original"
    t.float   "longitude_original"
    t.float   "latitude_calculated"
    t.float   "longitude_calculated"
  end

  create_table "post_publishings", :force => true do |t|
    t.integer "blog_post_id"
    t.integer "group_id"
  end

  create_table "proposal_categories", :force => true do |t|
    t.integer "parent_proposal_category_id"
    t.string  "description",                 :limit => 200
  end

  create_table "proposal_comment_rankings", :force => true do |t|
    t.integer  "proposal_comment_id", :null => false
    t.integer  "user_id",             :null => false
    t.integer  "ranking_type_id",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proposal_comment_rankings", ["proposal_comment_id", "user_id"], :name => "user_comment", :unique => true

  create_table "proposal_comments", :force => true do |t|
    t.integer  "parent_proposal_comment_id"
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_ip"
    t.string   "user_agent"
    t.string   "referrer"
    t.boolean  "deleted",                                    :default => false, :null => false
    t.integer  "deleted_user_id"
    t.datetime "deleted_at"
    t.string   "content",                    :limit => 2000
  end

  create_table "proposal_presentations", :force => true do |t|
    t.integer  "proposal_id", :null => false
    t.integer  "user_id",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposal_rankings", :force => true do |t|
    t.integer  "proposal_id"
    t.integer  "user_id"
    t.integer  "ranking_type_id"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "proposal_rankings", ["proposal_id", "user_id"], :name => "proposal_user", :unique => true

  create_table "proposal_states", :force => true do |t|
    t.string "description", :limit => 200
  end

  create_table "proposal_votes", :force => true do |t|
    t.integer  "proposal_id", :limit => 8
    t.integer  "positive"
    t.integer  "negative"
    t.integer  "neutral"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposal_watches", :force => true do |t|
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposals", :force => true do |t|
    t.integer  "proposal_state_id"
    t.integer  "proposal_category_id",                     :default => 5, :null => false
    t.string   "title",                   :limit => 200,                  :null => false
    t.string   "content",                 :limit => 20000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "proposal_rankings_count"
    t.integer  "vote_period_id"
  end

  create_table "provas", :force => true do |t|
    t.string   "testo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provinciali_groups", :id => false, :force => true do |t|
    t.integer "id",                                               :null => false
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.integer "provincia_id"
    t.string  "accept_requests", :limit => 1,    :default => "v", :null => false
  end

  create_table "provincias", :force => true do |t|
    t.integer "regione_id"
  end

  create_table "ranking_types", :force => true do |t|
    t.string "description", :limit => 200, :null => false
  end

  create_table "regionali_groups", :id => false, :force => true do |t|
    t.integer "id",                                               :null => false
    t.string  "name",            :limit => 200
    t.string  "description",     :limit => 2000
    t.integer "regione_id"
    t.string  "accept_requests", :limit => 1,    :default => "v", :null => false
  end

  create_table "regiones", :force => true do |t|
  end

  create_table "request_vote_types", :force => true do |t|
    t.string "description", :limit => 10, :null => false
  end

  create_table "request_votes", :force => true do |t|
    t.integer "group_partecipation_request_id",                :null => false
    t.integer "user_id",                                       :null => false
    t.integer "request_vote_type_id",                          :null => false
    t.string  "comment",                        :limit => 200
  end

  create_table "user_follows", :force => true do |t|
    t.integer  "follower_id", :null => false
    t.integer  "followed_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "user_follows", ["follower_id", "followed_id"], :name => "user_follows_unique", :unique => true

  create_table "user_types", :force => true do |t|
    t.string "description", :limit => 200
    t.string "short_name",  :limit => nil
  end

  add_index "user_types", ["short_name"], :name => "srt_name_unq", :unique => true

  create_table "user_votes", :force => true do |t|
    t.integer  "proposal_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_votes", ["proposal_id", "user_id"], :name => "onlyvoteuser", :unique => true

  create_table "users", :force => true do |t|
    t.integer  "user_type_id",                              :default => 3,     :null => false
    t.integer  "residenza_id"
    t.integer  "nascita_id"
    t.string   "name",                      :limit => 100
    t.string   "surname",                   :limit => 100
    t.string   "email",                     :limit => 100
    t.string   "sex",                       :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                     :limit => 40
    t.string   "password_salt",                             :default => "",    :null => false
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "deleted_at"
    t.string   "state",                     :limit => nil
    t.string   "reset_password_token",      :limit => 40
    t.string   "encrypted_password",        :limit => 128,  :default => "",    :null => false
    t.boolean  "activist",                                  :default => false, :null => false
    t.boolean  "elected",                                   :default => false, :null => false
    t.string   "blog_image_url",            :limit => 1000
    t.integer  "image_id"
    t.integer  "rank",                                      :default => 0,     :null => false
    t.integer  "fb_user_id"
    t.string   "email_hash"
    t.datetime "confirmation_sent_at"
    t.datetime "remember_created_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count",                             :default => 0,     :null => false
    t.string   "account_type"
  end

  add_index "users", ["email"], :name => "uniqueemail", :unique => true
  add_index "users", ["login"], :name => "uniquelogin", :unique => true

end