class SizesController < ApplicationController
  before_action :set_size, only: [:show, :edit, :update, :destroy]

  # GET /sizes
  # GET /sizes.json
  def index
    @sizes = Size.where(category_id: params[:category_id])
  end

  # GET /sizes/1
  # GET /sizes/1.json
  def show
  end

  # GET /sizes/new
  def new
  	@category = Category.find(params[:category_id])
    @size = Size.new
  end

  # GET /sizes/1/edit
  def edit
  end

  # POST /sizes
  # POST /sizes.json
  def create
    @size = Size.new(size_params)

    respond_to do |format|
      if @size.save
        format.html { redirect_to @size, notice: 'Size was successfully created.' }
        format.json { render action: 'show', status: :created, location: @size }
      else
        format.html { render action: 'new' }
        format.json { render json: @size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sizes/1
  # PATCH/PUT /sizes/1.json
  def update
    respond_to do |format|
      if @size.update(size_params)
        format.html { redirect_to @size, notice: 'Size was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sizes/1
  # DELETE /sizes/1.json
  def destroy
    @size.destroy
    respond_to do |format|
      format.html { redirect_to sizes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_size
      @size = Size.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def size_params
      params.require(:size).permit(:category_id, :name)
    end
end
