class Quality < ActiveRecord::Base
  has_many :requirements, :dependent => :destroy
  has_many :stats, :dependent => :destroy
  has_many :levels, :dependent => :destroy
  accepts_nested_attributes_for :levels,
                                reject_if: :all_blank,
                                allow_destroy: true
  delegate :name, to: :requirements, prefix: true # Not entirely sure this is necessary anymore. Maybe delete.
  validates :name,
            presence: true,
            length: { minimum: 3}
  validates :description,
            presence: true,
            length: { minimum: 5}
  validates :image_path,
            allow_blank: true,
            length: { minimum: 3}
  validates :category,
            presence: true

  def find_by_name(quality_name)
    Quality.where(name: quality_name).first
  end

end

