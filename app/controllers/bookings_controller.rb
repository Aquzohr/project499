class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index

    if current_user.role=="staff"
      @bookings = Booking.order(start_datetime: :desc)
    end

    if current_user.role=="member"
      @bookings = Booking.where(member_id: current_user.member.id).order(created_at: :desc)


      packageoccupiedby = PackageOccupiedby.where(member_id: current_user.member.id)
      @balance_session = 0
      unless packageoccupiedby.blank?
        @balance_session = packageoccupiedby.last.balance_session
      end
    end

  end
  
  def confirm
    PackageOccupiedby.where(member_id: params[:member_id]).last.decrement!(:balance_session, 1)
    Booking.find(params[:id]).update(status: 0)

    redirect_to bookings_path
  end


  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    if params[:msg]
      @errors = 1
    end

    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    package_type = Member.find(params[:booking][:member_id]).OwnerPackageID
    @booking.package_type = package_type

    booking_count = 0
    package_quata = 0
    unless params[:booking][:start_datetime].blank?
      start_time = Time.parse(params[:booking][:start_datetime])#.to_s(:time)
      end_time = Time.parse(params[:booking][:end_datetime])#.to_s(:time)


      #booking_count = Booking.where("package_type=? AND cast(start_datetime as text) LIKE ?", package_type, '%'+start_time+'%').count
      booking_count = Booking.where("end_datetime >= ? OR start_datetime <= ?", start_time, end_time).count
      package_quata = Member.find(params[:booking][:member_id]).OwnerPackageQuata

    end

    respond_to do |format|
      if booking_count >= package_quata
        format.html { redirect_to new_booking_path(msg: 1, booking_count: booking_count, package_quata: package_quata) } #booking more than quata
      elsif @booking.save
        format.html { redirect_to bookings_path, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to bookings_path, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:member_id, :staff_id, :start_datetime, :end_datetime)
    end
end
