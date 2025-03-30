class CreateLgtms < ActiveRecord::Migration[7.2]
  def change
    create_table :lgtms do |t|
      t.string :content

      t.timestamps
    end
  end
end
