class CreateForms < ActiveRecord::Migration[5.0]
  def change
    create_table :forms do |t|
      t.string :department
      t.string :catogery
      t.date :date_started
      t.date :date_completed
      t.text :summary

      t.timestamps
    end
  end
end
