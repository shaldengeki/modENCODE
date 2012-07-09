class Attempt < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :reagent
  belongs_to :pipeline
  has_many :attempt_attributes, :through => :attempt_values
  has_many :attempt_values, :dependent => :destroy

  has_many :statuses, :dependent => :destroy
  has_many :steps, :through => :pipeline, :order => 'position ASC'
  accepts_nested_attributes_for :attempt_values, :reject_if => lambda { |a| (a[:attempt_attribute_id].blank? || a[:value].blank?) }, :allow_destroy => true
  accepts_nested_attributes_for :statuses, :reject_if => lambda { |a| a[:step_id].blank? }, :allow_destroy => true

  attr_accessible :reagent_id, :pipeline_id, :statuses, :created_at, :started_at, :statuses_attributes, :attempt_values_attributes, :user_ids, :attempt_values

  validates :reagent_id, :presence => true
  validates :pipeline_id, :presence => true

  def updated_at_localized
    I18n.localize(updated_at, :format=>:short)
  end

  def last_step
    if statuses.empty?
      nil
    else
      statuses.order("position DESC").first.step_id
    end
  end
  def next_step_position
    if last_step.nil?
      1
    else
      last_step.position + 1
    end
  end
  def last_position
    if statuses.empty?
      nil
    else
      statuses.order("position DESC").first.position
    end
  end
  def next_position
    last_position.to_i + 1
  end
  def first_status
    if statuses.empty?
      nil
    else
      statuses.order("position ASC").first
    end
  end
  def last_status
    if statuses.empty?
      nil
    else
      statuses.order("position DESC").first
    end
  end
  def attempt_values=(hash)
    hash.each do |sequence,attempt_value|
      unless attempt_value[:value].blank?
        if attempt_value[:attempt_attribute_id].nil?
          attribute_id = AttemptAttribute.find_or_create_by_name(attempt_value[:attempt_attribute_attributes][:name]).id
        else
          attribute_id = attempt_value[:attempt_attribute_id]
        end
        new_value = AttemptValue.find_or_initialize_by_attempt_attribute_id_and_attempt_id(attribute_id, id)
        new_value.value = attempt_value[:value]
        new_value.save!
      end
    end
  end
end
