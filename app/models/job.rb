class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.jobs_by_interest
    all.group_by(&:level_of_interest)
  end

end
