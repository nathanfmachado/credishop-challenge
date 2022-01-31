class ReportsController < ApplicationController
  before_action :set_proponent, only: %i[ show edit update destroy ]

  def index
  end

  def proponent_by_salary
    salary_ranges_arr = [
      {label:"R$ 0,00 - R$ 1045,00", min: 0, max: 1045},
      {label:"R$ 1045,01 - R$ 2089,60", min: 1045, max: 2089.6},
      {label:"R$ 2089,61 - R$ 3134,40", min: 2089.6, max: 3134.4},
      {label:"R$ 3134,41 - R$ 6101,06", min: 3134.4, max: 6101.06},
      {label:"R$ 6101,06 ~", min: 6101.06, max: 999999},
    ]

    min = nil
    max = nil
    cases = salary_ranges_arr.map do |r|
        min = [r[:min], min || r[:min]].min
        max = [r[:max], max || r[:max]].max
        "when salary between #{r[:min]} and #{r[:max]} then '#{r[:min]} - #{r[:max]}'"
    end

    @salary_ranges = Proponent.select("count(*) as n, case #{cases.join(' ')} end as salary_range")
                      .where(:salary => min .. max)
                      .group('salary_range')
                      .all

    @salary_ranges = Hash[@salary_ranges.map { |r| [r.salary_range, r.n] }]
  end
end
