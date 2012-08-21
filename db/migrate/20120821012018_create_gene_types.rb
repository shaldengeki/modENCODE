class CreateGeneTypes < ActiveRecord::Migration
  def change
    create_table :gene_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
