class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def signedinuserprofile profile =
      Profile.find_by_user_id(current_user.id)
    if profile.nil?
      redirect_to "/profiles/new"
    else
        # @profile = Profile.find_by_user_id(current_user.id)
        # redirect_to "/profiles/#{@profile.id}"
        # else if the user already has a profile then direct to the home page!
        redirect_to root_path
    end
  end

  helper_method :counter_patients
  helper_method :redirection_profile


  def counter_patients
      puts "Tiggered"
      patient_user_counter = Patient.where(user_id: current_user).select(:user_id).count
  end

  def redirection_profile
      @idProfile = Profile.where(user_id: current_user).select(:id)
      redirect_to "/profiles/#{@idProfile}"
  end

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
      # @profile = Profile.find_by_user_id(current_user.id)
      # redirect_to "/profiles/#{@profile.id}"
  end

  # GET /profiles/new
  def new
      @profile = Profile.new
      @profile.user_id = current_user.id
      respond_to do |format|
          format.html #new.html.erb
          format.json {
              render json: @profile
           }
       end
   end

  # GET /profiles/1/edit
  def edit
      @profile.user = current_user
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:firstname, :lastname, :address, :pps_number, :dental_license)
    end
end
