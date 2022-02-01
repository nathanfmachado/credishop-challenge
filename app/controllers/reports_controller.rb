class ReportsController < ApplicationController
  def index; end

  def proponent_by_salary
    @salary_ranges = Proponent.proponent_by_salary
  end
end
