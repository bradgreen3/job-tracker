class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :contacts

  #sorts all companies by location
  def self.sort_by_city
    order(:city)
  end

end
