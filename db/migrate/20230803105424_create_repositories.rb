class CreateRepositories < ActiveRecord::Migration[7.0]
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :url
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
