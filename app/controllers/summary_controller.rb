class SummaryController < ApplicationController

  def show
    @summary = Summary.new(params[:start], params[:stop], params[:mpg], params[:fuel_type])
  end

end
