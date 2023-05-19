# frozen_string_literal: true

class DoctorQuery
  def initialize(params)
    @params = params
  end

  def collection
    Doctor.where(category_id: category_ids)
  end

  private

  def category_ids
    @params[:category_id].presence || Category.all
  end
end
