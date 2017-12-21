class NontrainerPackagesController < ApplicationController
  before_action :set_nontrainer_package, only: [:show, :edit, :update, :destroy]

  # GET /nontrainer_packages
  # GET /nontrainer_packages.json
  def index
    @nontrainer_packages = NontrainerPackage.all
  end

  # GET /nontrainer_packages/1
  # GET /nontrainer_packages/1.json
  def show
  end

  # GET /nontrainer_packages/new
  def new
    @nontrainer_package = NontrainerPackage.new
  end

  # GET /nontrainer_packages/1/edit
  def edit
  end

  # POST /nontrainer_packages
  # POST /nontrainer_packages.json
  def create
    @nontrainer_package = NontrainerPackage.new(nontrainer_package_params)

    respond_to do |format|
      if @nontrainer_package.save
        format.html { redirect_to @nontrainer_package, notice: 'Nontrainer package was successfully created.' }
        format.json { render :show, status: :created, location: @nontrainer_package }
      else
        format.html { render :new }
        format.json { render json: @nontrainer_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nontrainer_packages/1
  # PATCH/PUT /nontrainer_packages/1.json
  def update
    respond_to do |format|
      if @nontrainer_package.update(nontrainer_package_params)
        format.html { redirect_to @nontrainer_package, notice: 'Nontrainer package was successfully updated.' }
        format.json { render :show, status: :ok, location: @nontrainer_package }
      else
        format.html { render :edit }
        format.json { render json: @nontrainer_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nontrainer_packages/1
  # DELETE /nontrainer_packages/1.json
  def destroy
    @nontrainer_package.destroy
    respond_to do |format|
      format.html { redirect_to nontrainer_packages_url, notice: 'Nontrainer package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nontrainer_package
      @nontrainer_package = NontrainerPackage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nontrainer_package_params
      params.require(:nontrainer_package).permit(:name, :price, :freeze_time)
    end
end
