class PackageOccupiedbiesController < ApplicationController
  before_action :set_package_occupiedby, only: [:show, :edit, :update, :destroy]

  # GET /package_occupiedbies
  # GET /package_occupiedbies.json
  def index
    @package_occupiedbies = PackageOccupiedby.order(start_date: :desc)
  end

  # GET /package_occupiedbies/1
  # GET /package_occupiedbies/1.json
  def show
  end

  # GET /package_occupiedbies/new
  def new
    @package_occupiedby = PackageOccupiedby.new
  end

  # GET /package_occupiedbies/1/edit
  def edit
  end

  # POST /package_occupiedbies
  # POST /package_occupiedbies.json
  def create
    @package_occupiedby = PackageOccupiedby.new(package_occupiedby_params)

    respond_to do |format|
      if @package_occupiedby.save
        format.html { redirect_to package_occupiedbies_path, notice: 'Package occupiedby was successfully created.' }
        format.json { render :show, status: :created, location: @package_occupiedby }
      else
        format.html { render :new }
        format.json { render json: @package_occupiedby.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /package_occupiedbies/1
  # PATCH/PUT /package_occupiedbies/1.json
  def update
    respond_to do |format|
      if @package_occupiedby.update(package_occupiedby_params)
        format.html { redirect_to package_occupiedbies_path, notice: 'Package occupiedby was successfully updated.' }
        format.json { render :show, status: :ok, location: @package_occupiedby }
      else
        format.html { render :edit }
        format.json { render json: @package_occupiedby.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /package_occupiedbies/1
  # DELETE /package_occupiedbies/1.json
  def destroy
    @package_occupiedby.destroy
    respond_to do |format|
      format.html { redirect_to package_occupiedbies_url, notice: 'Package occupiedby was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package_occupiedby
      @package_occupiedby = PackageOccupiedby.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_occupiedby_params
      params.require(:package_occupiedby).permit(:start_date, :end_date, :balance_session, :trainer_package_id, :member_id)
    end
end
