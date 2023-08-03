class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :full_name
      t.string :location
      t.string :email
      t.integer :followers_count
      t.integer :following_count
      t.string :bio
      t.string :avatar_url

      t.timestamps
    end
  end
end
