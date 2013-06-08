class AdminController < ApplicationController

  def index

    @comparison = Comparison.all

    respond_to do |format|
      format.html
      format.csv { render text: @comparison.to_csv}
    end
  end
end

