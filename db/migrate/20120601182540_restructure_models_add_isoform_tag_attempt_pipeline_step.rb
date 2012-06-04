class RestructureModelsAddIsoformTagAttemptPipelineStep < ActiveRecord::Migration
  def change
    change_table :isoforms do |t|
      t.references :transcription_factor
    end
    add_index :isoforms, :transcription_factor_id
    remove_index :reagents, :transcription_factor_id
    remove_column :reagents, :transcription_factor_id
    change_table :reagents do |t|
      t.references :tag
    end
    add_index :reagents, :tag_id
    remove_index :statuses, :reagent_id
    remove_column :statuses, :reagent_id
    change_table :statuses do |t|
      t.references :user
      t.references :attempt
      t.references :step
    end
    add_index :statuses, :user_id
    add_index :statuses, :attempt_id
    add_index :statuses, :step_id
  end
end
