class CalculateInssDiscountJob < ApplicationJob
  queue_as :default

  def perform(*args)
    return calculate_inss_discount(args[0])
  end

  private

  def calculate_inss_discount(salary)
    aliquots = [0.14, 0.12, 0.09, 0.075]
    max_limit = 6101.06
    min_limits = [3134.40, 2089.60, 1045, 0]
    current_salary = salary > max_limit ? max_limit : salary
    inss_discount = 0

    aliquots.each_with_index do |aliquot, index|
      if current_salary > min_limits[index]
        diff = current_salary - min_limits[index]
        inss_discount += diff * aliquot
        current_salary = min_limits[index]
      end
    end
    return inss_discount.round(2)
  end
end
