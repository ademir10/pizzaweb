#encoding: utf-8
class DescrVendasController < ApplicationController
  
  # GET /descr_vendas
  # GET /descr_vendas.json
  
  
  def index
   
    @descr_vendas = DescrVenda.where(["tipo_prod = ? and pizza_pronta != ? and categ_prod = ?", "NÃO AVALIADO", "SIM", "PIZZA"]).order(:id_venda)
    
    
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @descr_vendas }
    end
  end

  # GET /descr_vendas/1
  # GET /descr_vendas/1.json
  def show
    @descr_venda = DescrVenda.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @descr_venda }
    end
  end

  # GET /descr_vendas/new
  # GET /descr_vendas/new.json
  def new
    @descr_venda = DescrVenda.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @descr_venda }
    end
  end

  # GET /descr_vendas/1/edit
  def edit
    @descr_venda = DescrVenda.find(params[:id])
  end

  # POST /descr_vendas
  # POST /descr_vendas.json
  def create
    @descr_venda = DescrVenda.new(params[:descr_venda])

    respond_to do |format|
      if @descr_venda.save
        format.html { redirect_to @descr_venda, notice: 'Descr venda was successfully created.' }
        format.json { render json: @descr_venda, status: :created, location: @descr_venda }
      else
        format.html { render action: "new" }
        format.json { render json: @descr_venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /descr_vendas/1
  # PUT /descr_vendas/1.json
  def update
    @descr_venda = DescrVenda.find(params[:id])

    respond_to do |format|
      if @descr_venda.update_attributes(params[:descr_venda])
        format.html { redirect_to @descr_venda, notice: 'Descr venda was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @descr_venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /descr_vendas/1
  # DELETE /descr_vendas/1.json
 
  def destroy
    @descr_venda = DescrVenda.find(params[:id])
    DescrVenda.update(@descr_venda.id, :pizza_pronta => 'SIM')
    
    #CONTA E COMPARA A QUANTIDADE DE PIZZAS DO MESMO PEDIDO
    @total_ID = DescrVenda.where(:id_venda => @descr_venda.id_venda, :categ_prod => "PIZZA").count
    @total_PRONTO = DescrVenda.where(["pizza_pronta = ? and id_venda = ?", "SIM", @descr_venda.id_venda]).count
    
    #ATUALIZA A TABELA DADOS VENDA SOMENTE SE NÃO TIVER MAIS NENHUMA PIZZA Á FAZER DO MESMO PEDIDO
    if @total_PRONTO == @total_ID
    DadosVenda.where(:id => @descr_venda.id_venda).update_all(:status => 'PRONTO')
    #render :text => "fez o UPDATE"    
    else
    # render :text => "NÃO fez o UPDATE"
    end
        
      respond_to do |format|
      format.html { redirect_to descr_vendas_url}
      format.json { head :no_content }
    end
  end
   
end
