class CreateSkillsTags < ActiveRecord::Migration
  def change
    create_table :skills_tags do |t|
      t.references :skill, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
