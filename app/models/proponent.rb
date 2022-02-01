class Proponent < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :contacts, dependent: :destroy

  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :contacts, allow_destroy: true

  validates :name, :birth_date, :salary, :inss_discount, presence: true

  paginates_per 5

  def self.proponent_by_salary
    min = max = nil
    cases = SALARY_RANGES.map do |r|
      min = [r[:min], min || r[:min]].min
      max = [r[:max], max || r[:max]].max
      "when salary between #{r[:min]} and #{r[:max]} then 'De R$ #{r[:min]} à R$ #{r[:max]}'"
    end

    salary_ranges = Proponent.select("count(*) as n, case #{cases.join(' ')} end as salary_range")
                             .where(salary: min..max).group("salary_range").all

    Hash[salary_ranges.map { |r| [r.salary_range, r.n] }]
  end

  SALARY_RANGES = [
    { min: 0, max: 1045 },
    { min: 1045.001, max: 2089.6 },
    { min: 2089.601, max: 3134.4 },
    { min: 3134.401, max: 6101.06 },
    { min: 6101.061, max: 999_999 }
  ].freeze
end
