class TrainerPackagesController < ApplicationController
  before_action :set_trainer_package, only: [:show, :edit, :update, :destroy]

  # GET /trainer_packages
  # GET /trainer_packages.json
  def index
    @trainer_packages = TrainerPackage.all
  end

  # GET /trainer_packages/1
  # GET /trainer_packages/1.json
  def show
  end

  # GET /trainer_packages/new
  def new
    @trainer_package = TrainerPackage.new
  end

  # GET /trainer_packages/1/edit
  def edit
  end

  # POST /trainer_packages
  # POST /trainer_packages.json
  def create
    @trainer_package = TrainerPackage.new(trainer_package_params)

    respond_to do |format|
      if @trainer_package.save
        format.html { redirect_to package_path, notice: 'Trainer package was successfully created.' }
        format.json { render :show, status: :created, location: @trainer_package }
      else
        format.html { render :new }
        format.json { render json: @trainer_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainer_packages/1
  # PATCH/PUT /trainer_packages/1.json
  def update
    respond_to do |format|
      if @trainer_package.update(trainer_package_params)
        format.html { redirect_to package_path, notice: 'Trainer package was successfully updated.' }
        format.json { render :show, status: :ok, location: @trainer_package }
      else
        format.html { render :edit }
        format.json { render json: @trainer_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainer_packages/1
  # DELETE /trainer_packages/1.json
  def destroy
    @trainer_package.destroy
    respond_to do |format|
      format.html { redirect_to trainer_packages_url, notice: 'Trainer package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainer_package
      @trainer_package = TrainerPackage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trainer_package_params
      params.require(:trainer_package).permit(:name, :price, :session)
    end
end
