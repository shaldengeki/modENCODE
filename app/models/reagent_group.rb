class ReagentGroup < ActiveRecord::Base
  has_and_belongs_to_many :reagents
  # TODO: Make this a has_many :through in order to add a "display on homepage" field in the join table.
  has_and_belongs_to_many :users
  accepts_nested_attributes_for :reagents
  attr_accessible :name, :reagents, :reagents_attributes, :reagent_ids, :users, :user_ids, :users_attributes, :user_tokens, :gene_type_id, :gene_type, :reagent_type_id, :reagent_type, :input_method, :total_reagents, :sort_by, :sort_order, :spreadsheet_file
  attr_reader :user_tokens, :reagent_names
  attr_reader :gene_type_id, :reagent_type_id
  attr_accessor :gene_type, :reagent_type, :input_method, :total_reagents, :sort_by, :sort_order, :spreadsheet_file

  validates :name, :presence => true,
                    :allow_blank => false,
                    :uniqueness => {:case_sensitive => false}
  def reagent_type_id
    nil if self.reagent_type.nil?
    self.reagent_type.id
  end
  def reagent_type_id=(reagent_type_id)
    self.reagent_type = ReagentType.find(reagent_type_id)
  end
  def gene_type_id
    nil if self.gene_type.nil?
    self.gene_type.id
  end
  def gene_type_id=(gene_type_id)
    self.gene_type = GeneType.find(gene_type_id)
  end

  def reagent_names=(reagents)
    i = 1
    reagents.split.each do |reagent|
      gene = TranscriptionFactor.find_or_create_by_name(reagent)
      new_number = ("%0" + Math.log10(reagents.split.length.to_i).ceil.to_s + "d") % i
      reagent_name = self.name + "-" + gene.name + "-" + new_number.to_s
      self.reagents << Reagent.find_or_create_by_name_and_transcription_factor_id(reagent_name, gene.id)
      i += 1
    end
  end

  def user_tokens
    self.users.map{|user| user.name}.join(", ")
  end
  def user_tokens=(ids)
    self.user_ids = ids.split(",") unless ids.blank?
  end
end
