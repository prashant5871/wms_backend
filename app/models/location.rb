class Location < ApplicationRecord
  belongs_to :parent, class_name: 'Location', optional:true
  has_many :children, class_name: 'Location', foreign_key: 'parent_id', dependent: :destroy

  validates :name, presence: true
  validates :locaiton_type, presence: true, inclusion: { in: %w[warehouse zone rack bin]}

  scope :storable, -> { where(locaiton_type: 'bin')}

  # function to get full path of the locaiton like warehouse > zone > rack > bin
  def full_path
    [parent&.full_path,name].compact.join(' > ')
  end
end
