class CreateCollaborators < ActiveRecord::Migration[5.2]
  def change
    create_table :collaborators do |t|
      t.integer :wiki_id
      #t.user :reference
      #t.wiki :reference

      t.timestamps
    end
  end
end
