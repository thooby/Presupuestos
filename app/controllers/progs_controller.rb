class ProgsController < ApplicationController
  # GET /progs
  # GET /progs.xml
  def index
    @progs = Prog.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @progs }
    end
  end

  # GET /progs/1
  # GET /progs/1.xml
  def show
    @prog = Prog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prog }
    end
  end

  # GET /progs/new
  # GET /progs/new.xml
  def new
    @prog = Prog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prog }
    end
  end

  # GET /progs/1/edit
  def edit
    @prog = Prog.find(params[:id])
  end

  # POST /progs
  # POST /progs.xml
  def create
    @prog = Prog.new(params[:prog])

    respond_to do |format|
      if @prog.save
        format.html { redirect_to(@prog, :notice => 'Prog was successfully created.') }
        format.xml  { render :xml => @prog, :status => :created, :location => @prog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /progs/1
  # PUT /progs/1.xml
  def update
    @prog = Prog.find(params[:id])

    respond_to do |format|
      if @prog.update_attributes(params[:prog])
        format.html { redirect_to(@prog, :notice => 'Prog was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /progs/1
  # DELETE /progs/1.xml
  def destroy
    @prog = Prog.find(params[:id])
    @prog.destroy

    respond_to do |format|
      format.html { redirect_to(progs_url) }
      format.xml  { head :ok }
    end
  end
end
