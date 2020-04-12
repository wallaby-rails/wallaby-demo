class CreateBlogs < ActiveRecord::Migration[4.2][5.2]
  def change
    create_table :blogs do |t|
      t.string :subject
      t.text :content
      t.timestamp :published_at
      t.timestamps
    end
  end
end
