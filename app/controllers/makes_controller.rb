class MakesController < ApplicationController
  before_action :set_make, only: [:show, :edit, :update, :destroy]

  # GET /makes
  # GET /makes.json
  def index
    @makes = Make.all
  end

  # GET /makes/1
  # GET /makes/1.json
  def show
  end

  # GET /makes/new
  def new
    @make = Make.new
  end

  # GET /makes/1/edit
  def edit
  end

  # POST /makes
  # POST /makes.json
  def create
    @make = Make.new(make_params)

    respond_to do |format|
      if @make.save
        format.html { redirect_to @make, notice: 'Make was successfully created.' }
        format.json { render action: 'show', status: :created, location: @make }
      else
        format.html { render action: 'new' }
        format.json { render json: @make.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /makes/1
  # PATCH/PUT /makes/1.json
  def update
    respond_to do |format|
      if @make.update(make_params)
        format.html { redirect_to @make, notice: 'Make was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @make.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /makes/1
  # DELETE /makes/1.json
  def destroy
    @make.destroy
    respond_to do |format|
      format.html { redirect_to makes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_make
      @make = Make.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def make_params
      params.require(:make).permit(:name)
    end
end
