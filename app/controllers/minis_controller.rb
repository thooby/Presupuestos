class MinisController < ApplicationController
  # GET /minis
  # GET /minis.xml
  def index
    @minis = Mini.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @minis }
    end
  end

  # GET /minis/1
  # GET /minis/1.xml
  def show
    @mini = Mini.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mini }
    end
  end

  # GET /minis/new
  # GET /minis/new.xml
  def new
    @mini = Mini.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mini }
    end
  end

  # GET /minis/1/edit
  def edit
    @mini = Mini.find(params[:id])
  end

  # POST /minis
  # POST /minis.xml
  def create
    @mini = Mini.new(params[:mini])

    respond_to do |format|
      if @mini.save
        format.html { redirect_to(@mini, :notice => 'Mini was successfully created.') }
        format.xml  { render :xml => @mini, :status => :created, :location => @mini }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mini.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /minis/1
  # PUT /minis/1.xml
  def update
    @mini = Mini.find(params[:id])

    respond_to do |format|
      if @mini.update_attributes(params[:mini])
        format.html { redirect_to(@mini, :notice => 'Mini was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mini.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /minis/1
  # DELETE /minis/1.xml
  def destroy
    @mini = Mini.find(params[:id])
    @mini.destroy

    respond_to do |format|
      format.html { redirect_to(minis_url) }
      format.xml  { head :ok }
    end
  end
end
