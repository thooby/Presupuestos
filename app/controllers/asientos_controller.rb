class AsientosController < ApplicationController
  # GET /asientos
  # GET /asientos.xml
  def index
    @asientos = Asiento.all.paginate :page => params[:page], :per_page => 20

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asientos }
    end
  end

  # GET /asientos/1
  # GET /asientos/1.xml
  def show
    @asiento = Asiento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @asiento }
    end
  end

  # GET /asientos/new
  # GET /asientos/new.xml
  def new
    @asiento = Asiento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @asiento }
    end
  end

  # GET /asientos/1/edit
  def edit
    @asiento = Asiento.find(params[:id])
  end

  # POST /asientos
  # POST /asientos.xml
  def create
    @asiento = Asiento.new(params[:asiento])

    respond_to do |format|
      if @asiento.save
        format.html { redirect_to(@asiento, :notice => 'Asiento was successfully created.') }
        format.xml  { render :xml => @asiento, :status => :created, :location => @asiento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @asiento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /asientos/1
  # PUT /asientos/1.xml
  def update
    @asiento = Asiento.find(params[:id])

    respond_to do |format|
      if @asiento.update_attributes(params[:asiento])
        format.html { redirect_to(@asiento, :notice => 'Asiento was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @asiento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /asientos/1
  # DELETE /asientos/1.xml
  def destroy
    @asiento = Asiento.find(params[:id])
    @asiento.destroy

    respond_to do |format|
      format.html { redirect_to(asientos_url) }
      format.xml  { head :ok }
    end
  end
end
