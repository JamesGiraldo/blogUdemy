class AddColumnAttachmentToCategory < ActiveRecord::Migration[5.1]
  def change
    add_attachment :categories, :img_cat
  end
end
