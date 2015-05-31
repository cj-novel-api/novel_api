class SummaryController < ApplicationController

  def show
    @summary = Summary.new(params[:start], params[:stop], params[:mpg],
        params[:fuel_type], params[:start_code], params[:end_code], params[:date])
  end

end
