class StandType < ActiveRecord::Base
  attr_accessible :stand_benefits_attributes, :stand_options_attributes, :slug, :hidden,
                  :name, :position, :content, :image, :stand_id, :complect_info

  validates :complect_info, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :name, presence: true
  validates :position, presence: true

  has_attached_file :image

  acts_as_list

  validates_attachment_content_type :image,:content_type => ['image/jpeg', 'image/jpg', 'image/png']
  validates_attachment_size :image,:less_than => 5.megabytes

  belongs_to :stand
  has_many :stand_benefits, dependent: :destroy
  has_many :stand_options, dependent: :destroy

  accepts_nested_attributes_for :stand_benefits, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :stand_options, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :stand, :allow_destroy => true, :reject_if => :all_blank

  extend FriendlyId
  friendly_id :slug

  default_scope order('position')
  scope :visible, -> { where(hidden: false) }
  scope :invisible, -> { where(hidden: true) }
  scope :without, (lambda do |field, values|
    raise "Unknown field :#{field} in Page model" unless field.to_s.in? attribute_names
    values = [values] unless values.is_a? Array
    where("#{field} NOT IN (?)", values)
  end)
 end