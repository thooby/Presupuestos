class ComparasController < ApplicationController
  # GET /comparas
  # GET /comparas.xml
  def index
    @comparas = Compara.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comparas }
    end
  end

  # GET /comparas/1
  # GET /comparas/1.xml
  def show
    @compara = Compara.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @compara }
    end
  end

  # GET /comparas/new
  # GET /comparas/new.xml
  def new
    @compara = Compara.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @compara }
    end
  end

  # GET /comparas/1/edit
  def edit
    @compara = Compara.find(params[:id])
  end

  # POST /comparas
  # POST /comparas.xml
  def create
    @compara = Compara.new(params[:compara])

    respond_to do |format|
      if @compara.save
        format.html { redirect_to(@compara, :notice => 'Compara was successfully created.') }
        format.xml  { render :xml => @compara, :status => :created, :location => @compara }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @compara.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comparas/1
  # PUT /comparas/1.xml
  def update
    @compara = Compara.find(params[:id])

    respond_to do |format|
      if @compara.update_attributes(params[:compara])
        format.html { redirect_to(@compara, :notice => 'Compara was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @compara.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comparas/1
  # DELETE /comparas/1.xml
  def destroy
    @compara = Compara.find(params[:id])
    @compara.destroy

    respond_to do |format|
      format.html { redirect_to(comparas_url) }
      format.xml  { head :ok }
    end
  end
end
