class StandBenefit < ActiveRecord::Base
	attr_accessible :title, :content, :stand_type_id

	validates :title, presence: true
	validates :content, presence: true

	belongs_to :stand_type

	accepts_nested_attributes_for :stand_type, :allow_destroy => true, :reject_if => :all_blank

end
