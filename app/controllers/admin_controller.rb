class AdminController < ApplicationController

  def index

    respond_to do |format|
      format.html
      format.csv { render text: Comparison.to_csv}
    end
  end
end

