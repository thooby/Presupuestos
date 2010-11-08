class DepsController < ApplicationController
  # GET /deps
  # GET /deps.xml
  def index
    @deps = Dep.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @deps }
    end
  end

  # GET /deps/1
  # GET /deps/1.xml
  def show
    @dep = Dep.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dep }
    end
  end

  # GET /deps/new
  # GET /deps/new.xml
  def new
    @dep = Dep.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dep }
    end
  end

  # GET /deps/1/edit
  def edit
    @dep = Dep.find(params[:id])
  end

  # POST /deps
  # POST /deps.xml
  def create
    @dep = Dep.new(params[:dep])

    respond_to do |format|
      if @dep.save
        format.html { redirect_to(@dep, :notice => 'Dep was successfully created.') }
        format.xml  { render :xml => @dep, :status => :created, :location => @dep }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dep.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /deps/1
  # PUT /deps/1.xml
  def update
    @dep = Dep.find(params[:id])

    respond_to do |format|
      if @dep.update_attributes(params[:dep])
        format.html { redirect_to(@dep, :notice => 'Dep was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dep.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /deps/1
  # DELETE /deps/1.xml
  def destroy
    @dep = Dep.find(params[:id])
    @dep.destroy

    respond_to do |format|
      format.html { redirect_to(deps_url) }
      format.xml  { head :ok }
    end
  end
end
