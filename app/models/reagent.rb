class Reagent < ActiveRecord::Base
  has_and_belongs_to_many :isoforms
  has_and_belongs_to_many :reagent_groups
  belongs_to :source, :inverse_of => :reagents
  belongs_to :reagent_type, :inverse_of => :reagents
  has_many :attempts, :order => "updated_at DESC", :inverse_of => :reagent
  has_many :reagent_attributes, :through => :reagent_type
  has_many :reagent_values, :dependent => :destroy, :order => :reagent_attribute_id, :inverse_of => :reagent
  accepts_nested_attributes_for :reagent_values, :reject_if => lambda { |a| (a[:reagent_attribute_id].blank? || a[:value].blank?) }, :allow_destroy => true
  accepts_nested_attributes_for :reagent_type, :reject_if => lambda { |a| a[:name].blank? }
  attr_accessible :description, :name, :tag_id, :source_id, :reagent_type_id, :isoform_ids, :reagent_values_attributes, :reagent_values, :reagent_groups, :reagent_group_ids, :reagent_type, :reagent_type_attributes, :isoforms

  validates :name, :presence => true,
                    :uniqueness => {:case_sensitive => false}
  validates :source_id, :presence => true
  validates :reagent_type_id, :presence => true

  def last_status
    most_recent_attempt = attempts.max_by do |attempt|
      attempt.last_status.nil? ? nil : attempt.last_status.updated_at
    end
    most_recent_attempt.nil? ? nil : most_recent_attempt.last_status
  end
  def reagent_values=(hash)
    hash.each do |key, reagent_value|
      unless reagent_value.nil? or (reagent_value[:reagent_attribute_id].nil? and reagent_value[:reagent_attribute_attributes][:name].blank?)
        if reagent_value[:reagent_attribute_id].nil?
          reagent_attribute = ReagentAttribute.find_or_create_by_name_and_reagent_type_id(reagent_value[:reagent_attribute_attributes][:name], self[:reagent_type_id])
          reagent_attribute.save!
          attribute_id = reagent_attribute.id
        else
          attribute_id = reagent_value[:reagent_attribute_id]
        end
        # destroy all blank reagent values.
        if reagent_value[:value].blank?
          existing_values = ReagentValue.where(:reagent_attribute_id => attribute_id, :reagent_id => id).all
          existing_values.each do |value|
            value.destroy
          end
        else
          # create or update non-blank reagent values.
          new_value = ReagentValue.find_or_initialize_by_reagent_attribute_id_and_reagent_id(attribute_id, id)
          new_value.value = reagent_value[:value]
          new_value.save!
        end
      end
    end
  end
end
