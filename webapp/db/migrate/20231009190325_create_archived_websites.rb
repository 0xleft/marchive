class CreateArchivedWebsites < ActiveRecord::Migration[7.0]
  def change
    create_table :archived_websites do |t|
      t.string :url
      t.string :content
      t.date :archived

      t.timestamps
    end
  end
end
