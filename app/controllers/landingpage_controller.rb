require 'twitter'

class LandingpageController < ApplicationController
    # Define our Helper methods so they are available to the view
  helper_method :get_last_record

  # Define tweet client
  def index
      username = 'IrishDentists'
      @glob_username = username
      options = {:count => 3, :include_rts => true}
      @tweets = $client.user_timeline(username, options)

      puts @tweets
  end

  # Get the last record from the database and its ID
  def get_last_record
      @last_record_patient = Patient.last.Full_Name
      @last_record_patient_id = Patient.last.id
      puts @last_record_patient_id
  end
end
