require 'singleton'
require 'prawn'
# In this class we consume the singleton pattern where we only deal
# we one instance of "Patient" per method invokation. This class takes
# a patient object and writes to a JSON file. The JSON file can then be used
# by the admin of the application so he/she can view analytics for the application

class Excel_maker

    include Singleton

    PATH = "public/reports/"

    def self.writes(patient)
      events_json = []
      File.open("public/events.json","a") do |f|
        f.write(patient.to_json)
      end
      write_pdf_record(patient)
    end

    # Write to PDF using the Prawn Gem
    def self.write_pdf_record(patient)

        # If we don't have the reports directory then make one!
        Dir.mkdir("#{PATH}") unless File.exists?("#{PATH}")

        # Get the Current Patient's Name
        patient_name = patient.Full_Name

        # Generate PDF with the Patient's Name appended to the PDF name
        Prawn::Document.generate("#{PATH}#{patient_name} File.pdf", :margin => 100) do
            # Put Main Logo on Front
            image Rails.root.to_s + '/app/assets/images/logo.png', :width => 500, :height => 500, :position => :center

            # Create Second Page
            start_new_page

            # Now Append Patient data to second page
            text "@{patient}"

        end
    end
end
