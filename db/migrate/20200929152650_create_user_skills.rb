class CreateUserSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :user_skills do |t|
      t.references :user, index: true
      t.references :skill, index: true, foreign_key: true
      t.integer :skill_level
      t.timestamps
    end
  end
end
