class AddColoumnsToBlog < ActiveRecord::Migration[7.2]
  def change
    add_column :blogs, :image, :string
    add_column :blogs, :content_preview, :text
  end
end
