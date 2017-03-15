# frozen_string_literal: true
class CreateRedirects < ActiveRecord::Migration[5.0]
  def change
    create_table :redirects do |t|
      t.string :src, null: false, index: true
      t.string :dst, null: false
      t.integer :site, null: false, default: 0
    end
  end
end
