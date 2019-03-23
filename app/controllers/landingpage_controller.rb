require 'twitter'

class LandingpageController < ApplicationController
  # Define tweet client
  def index
      username = 'IrishDentists'
      @glob_username = username
      options = {:count => 3, :include_rts => true}
      @tweets = $client.user_timeline(username, options)

      @last_record_patient = Patient.where

      puts @tweets
  end

  # Get the last record current user added
  def last_record
      @last_r = Patient.where(:user_id=>[current_user.id]).order('created_at DESC').first.Full_Name
  end
  # Get the id of the last record of patient added
  def last_record_id
      @last_r_id = Patient.where(:user_id=>[current_user.id]).order('created_at DESC').first.id
  end
  # Conditional to check if any patients exists
  def is_patients_exists?
      patient_size = Patient.where(:user_id=>[current_user.id]).order('created_at DESC').size
      if patient_size > 0
          true
      else
          false
      end
  end

  helper_method :last_record
  helper_method :last_record_id
  helper_method :is_patients_exists?
end
