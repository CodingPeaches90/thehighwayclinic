require 'report'

class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /patients
  # GET /patients.json
  def index
    # If search param has a name
    if params[:Full_Name]
        # Query if theres a record like the one specified AND user_id == current_user within devise helper
        @patients = Patient.where("full_name LIKE :name AND user_id = :id", {:name => "%#{params[:Full_Name]}%", :id => current_user.id})
        # another if to check if the patients instance has a size zero meaning no results
        if @patients.size == 0
            # if this condition is true then return all patients of that user!
            @patients = current_user.patients.all
        end
    else
        # If no search param (example, on page load) is provided then return all patients belong to current_user
        @patients = current_user.patients.all
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    @patient.user = current_user

    # invoke our gem
    Excel_maker.writes(@patient)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:Full_Name, :Age, :Sex, :Address, :PPS, :Medical_Card)
    end
end
