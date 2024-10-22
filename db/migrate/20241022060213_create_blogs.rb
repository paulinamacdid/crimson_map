class CreateBlogs < ActiveRecord::Migration[7.2]
  def change
    create_table :blogs do |t|
      t.text :title
      t.text :content
      t.string :author
      t.string :url

      t.timestamps
    end
  end
end
