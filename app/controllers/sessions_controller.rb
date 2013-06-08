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
      session[:experiment_session_id]=@session.id
      redirect_to :action => 'index', notice: "Let's start." and return
    else
      render action: "new"
    end

  end

  def index

    @comparisons = Comparison.paginate(:page => params[:page],
                                       :per_page => 1,
                                       :order => 'id',
                                       :conditions => {:session_id => session[:experiment_session_id]})
    @session = Session.find(session[:experiment_session_id])
    tester_response = params[:tester_response]

    if tester_response
      Comparison.find_by_session_id(@session).update_attribute('tester_response', tester_response)
    end

    respond_to do |format|
      format.html
      format.json { render json: @comparisons }
    end
  end
end
