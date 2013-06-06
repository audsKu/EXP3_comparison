class SessionController < ApplicationController

  # GET /comparisons/new
  # GET /comparisons/new.json
  def new
    @session = Session.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @session }
    end
  end

  def edit
    @comparisons = Session.create_comparison_set

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comparisons }
    end

  end

  def update
    @comparison = Comparison.find(params[:id])

    respond_to do |format|
      if @comparison.update_attributes(params[:comparison])
        format.html { redirect_to @comparison, notice: 'Comparison was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comparison.errors, status: :unprocessable_entity }
      end
    end
  end



  # POST /comparisons
  # POST /comparisons.json
  def create
    @comparison = Comparison.new(params[:comparison])

    respond_to do |format|
      if @comparison.save
        format.html { redirect_to @comparison, notice: 'Comparison was successfully created.' }
        format.json { render json: @comparison, status: :created, location: @comparison }
      else
        format.html { render action: "new" }
        format.json { render json: @comparison.errors, status: :unprocessable_entity }
      end
    end
  end

end
