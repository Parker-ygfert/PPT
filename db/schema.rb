# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< Updated upstream
ActiveRecord::Schema.define(version: 2020_07_23_060910) do
=======
ActiveRecord::Schema.define(version: 2020_07_25_014511) do
>>>>>>> Stashed changes

  create_table "boards", force: :cascade do |t|
    t.string "title"
    t.text "intro"
    t.datetime "deleted_at"
    t.string "state", default: "normal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_boards_on_deleted_at"
  end

<<<<<<< Updated upstream
=======
  create_table "users", force: :cascade do |t|
    t.string "account"
    t.string "password"
    t.string "name"
    t.string "address"
    t.string "email"
    t.integer "age"
    t.boolean "is_visible", default: true
    t.boolean "is_deleted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "born_date"
  end

>>>>>>> Stashed changes
end
