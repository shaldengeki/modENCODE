class RenameIsoformsTypeToIsoformType < ActiveRecord::Migration
  def change
    change_table :isoforms do |t|
      t.rename :type, :isoform_type
    end
  end
end
