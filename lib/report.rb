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

        # Get details
        patient_name = patient.Full_Name
        patient_age = patient.Age.to_s
        patient_sex = patient.Sex
        patient_address = patient.Address
        patient_pps = patient.PPS
        patient_medical_card_status = patient.Medical_Card

        # Generate PDF with the Patient's Name appended to the PDF name
        Prawn::Document.generate("#{PATH}#{patient_name} File.pdf", :margin => 100) do

            # Put Main Logo on Front
            image Rails.root.to_s + '/app/assets/images/logo.png', :width => 500, :height => 500, :position => :center

            # Create Second Page
            start_new_page

            # define new grid
            define_grid(:columns => 5, :rows => 8, :gutter => 10)

            # define variables into their own box

            # Define Name
            grid([0,0], [0,1]).bounding_box do
                text "Patient Full Name : "
            end
            grid([0,2], [0,3]).bounding_box do
                text patient_name
            end

            # Define Age
            grid([1,0], [1,1]).bounding_box do
                text "Patient Age : "
            end
            grid([1,2], [1,3]).bounding_box do
                text patient_age
            end

            # Define Sex
            grid([2,0], [2,1]).bounding_box do
                text "Patient Sex : "
            end
            grid([2,2], [2,3]).bounding_box do
                text patient_sex
            end

            # Define Address
            grid([3,0], [3,1]).bounding_box do
                text "Patient'a Address :  "
            end
            grid([3,2], [3,3]).bounding_box do
                text patient_address
            end

            # Define pps
            grid([4,0], [4,1]).bounding_box do
                text "Patient's PPS Number : "
            end
            grid([4,2], [4,3]).bounding_box do
                text "Patient Full Name : "
            end

            # Define Medical Card Status
            grid([5,0], [5,1]).bounding_box do
                text "Medical Card Status : "
            end
            grid([5,2], [5,3]).bounding_box do
                text patient_medical_card_status
            end

            # Stamp
            create_stamp("approved") do
                rotate(30, :origin => [-5, -5]) do
                    stroke_color "FF3333"
                    stroke_ellipse [0, 0], 29, 15
                    stroke_color "000000"

                    fill_color "993333"
                    font("Times-Roman") do
                        draw_text "Confidential", :at => [-23, -3]
                    end
                    fill_color "000000"
                end
            end
            stamp_at "approved", [200, 200]
        end
    end
end
