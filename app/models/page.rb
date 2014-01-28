class Page < ActiveRecord::Base
  attr_accessible :slug, :position, :name, :content


  validates :slug, presence: true, uniqueness: true
  validates :name, presence: true

  acts_as_list
  
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