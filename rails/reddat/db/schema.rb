ActiveRecord::Schema[7.0].define(version: 2023_09_01_151613) do
  create_table "links", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "upvote", default: 0
    t.integer "downvote", default: 0
  end

end
