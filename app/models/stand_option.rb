class StandOption < ActiveRecord::Base
	attr_accessible :stand_price, :print_price, :size, :stand_type_id

	validates :stand_price, presence: true
	validates :print_price, presence: true
	validates :size, presence: true

	belongs_to :stand_type

	accepts_nested_attributes_for :stand_type, :allow_destroy => true, :reject_if => :all_blank

end
