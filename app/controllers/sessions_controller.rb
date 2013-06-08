class SessionsController < ApplicationController

  # GET /comparisons/new
  # GET /comparisons/new.json
  def new
    @session = Session.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @session = Session.new(params[:session])

    if @session.save
      @session.create_comparison_set!
      redirect_to :action => 'index', notice: "Let's start." and return
    else
      render action: "new"
    end

  end

  def index
    @comparisons = Comparison.paginate(:page => params[:page],:per_page => 1)

    respond_to do |format|
      format.html
      format.json { render json: @comparisons }
    end
  end
end
