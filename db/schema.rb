ActiveRecord::Schema.define(version: 20170811081450) do
  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end
end
