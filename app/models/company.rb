class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :contacts

  #sorts all companies by location
  def self.sort_by_city
    order(:city)
  end

  def self.top_three_companies_by_interest
    sorted = []
    all.each do |company|
      sorted << [company.jobs.average(:level_of_interest), company]
    end
    sorted.sort_by{|interest, company| interest}[0..2].reverse
  end


  def self.jobs_by_location
    final = []

    all.group_by(&:city).each do |city, array|
      total = 0
      array.each do |company|
        total += company.jobs.count
      end
      final << [city, total]
    end
    final
  end
end
