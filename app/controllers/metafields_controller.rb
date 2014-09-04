class MetafieldsController < ApplicationController
  before_action :set_metafield, only: [:show, :edit, :update, :destroy]

  # GET /metafields
  # GET /metafields.json
  def index
  	@product_types = Metafield.find(:all).map(&:product_type).uniq
    @metafields = Metafield.all
  end

  # GET /metafields/1
  # GET /metafields/1.json
  def show
  end

  # GET /metafields/new
  def new
    @metafield = Metafield.new
    @product_types = ShopifyAPI.throttle { ShopifyAPI::Product.find(:all).map(&:product_type).uniq }
  end

  # GET /metafields/1/edit
  def edit
    @product_types = ShopifyAPI.throttle { ShopifyAPI::Product.find(:all).map(&:product_type).uniq }
  end

  # POST /metafields
  # POST /metafields.json
  def create
    @metafield = Metafield.new(metafield_params)

    respond_to do |format|
      if @metafield.save
        format.html { redirect_to @metafield, notice: 'Metafield was successfully created.' }
        format.json { render action: 'show', status: :created, location: @metafield }
      else
        format.html { render action: 'new' }
        format.json { render json: @metafield.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metafields/1
  # PATCH/PUT /metafields/1.json
  def update
    respond_to do |format|
      if @metafield.update(metafield_params)
        format.html { redirect_to @metafield, notice: 'Metafield was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @metafield.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metafields/1
  # DELETE /metafields/1.json
  def destroy
    @metafield.destroy
    respond_to do |format|
      format.html { redirect_to metafields_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metafield
      @metafield = Metafield.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def metafield_params
      params.require(:metafield).permit(:product_type, :description, :key, :namespace, :value, :value_type)
    end
end
