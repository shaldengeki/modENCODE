class AddExternalIdsToIsoforms < ActiveRecord::Migration
  def change
    change_table :isoforms do |t|
      t.string :flybase_id
      t.string :refseq_id
    end
  end
end
