class Stand < ActiveRecord::Base
  attr_accessible :slug, :hidden, :name, :position, :content, 
                  :stand_benefits_attributes, :stand_types_attributes,
                  :stand_options_attributes, :image

  validates :slug, presence: true, uniqueness: true
  validates :name, presence: true
  validates :content, presence: true
  validates :position, presence: true

  acts_as_list

  has_attached_file :image

  validates_attachment_presence :image
  validates_attachment_content_type :image,:content_type => ['image/jpeg', 'image/jpg', 'image/png']
  validates_attachment_size :image,:less_than => 5.megabytes

  has_many :stand_types, dependent: :destroy
  has_many :stand_benefits, :through => :stand_types, dependent: :destroy
  has_many :stand_options, :through => :stand_types, dependent: :destroy

  accepts_nested_attributes_for :stand_types, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :stand_benefits, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :stand_options, :allow_destroy => true, :reject_if => :all_blank

  extend FriendlyId
  friendly_id :slug

  default_scope order('position')
  scope :visible, -> { where(hidden: false) }
  scope :invisible, -> { where(hidden: true) }
end
