class ServesController < ApplicationController
  before_action :set_serf, only: [:show, :edit, :update, :destroy]

  # GET /serves
  # GET /serves.json
  def index

    @serve = Serve.new
    @serves = Serve.where(checkout_time: nil).order(checkin_time: :desc)


    if params[:member_id]
      @memberFreeze = Member.find(params[:member_id])
    else
      @lastCheckin = Serve.where(checkout_time: nil).last
    end

    if params[:msg]
      @errors = 1
    end

  end

  # GET /serves/1
  # GET /serves/1.json
  def show
  end

  # GET /serves/new
  def new
    @serf = Serve.new
  end

  # GET /serves/1/edit
  def edit
  end

  # POST /serves
  # POST /serves.json
  def create
    @serf = Serve.new(serf_params)

    respond_to do |format|
      if @serf.member.freeze_count != 0
        format.html { redirect_to serves_path(member_id: @serf.member.id) }
      elsif @serf.save
        format.html { redirect_to serves_path, notice: 'Serve was successfully created.' }
      else
        format.html { redirect_to serves_path(msg: 1) }
      end
    end
  end

  # PATCH/PUT /serves/1
  # PATCH/PUT /serves/1.json
  def update
    respond_to do |format|
      if @serf.update(checkout_time: Time.now)
        format.html { redirect_to serves_path, notice: 'Serve was successfully updated.' }
        format.json { render :show, status: :ok, location: @serf }
      else
        format.html { render :edit }
        format.json { render json: @serf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /serves/1
  # DELETE /serves/1.json
  def destroy
    @serf.destroy
    respond_to do |format|
      format.html { redirect_to serves_url, notice: 'Serve was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def checkout_all
    respond_to do |format|
       if Serve.where(checkout_time: nil).update_all(checkout_time: Time.now)
         format.html { redirect_to serves_path, notice: 'Checkin was successfully updated.' }
         format.json { render :show, status: :ok, location: @serve }
       else
         format.html { render :edit }
         format.json { render json: @serves.errors, status: :unprocessable_entity }
       end
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_serf
      @serf = Serve.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def serf_params
      params.require(:serve).permit(:checkin_time, :checkout_time, :member_id, :staff_id)
    end
end
