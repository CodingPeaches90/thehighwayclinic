require 'json'

class AnalyticspageController < ApplicationController
  def analytics
      count_gender
      medical_card_holders
  end

  # Analtics 1 : Count the number of Females and Male Patients clinic wide
  def count_gender
      # First we see if the json file exists, if true then carry on
      if File.exists?("public/events.json")
          # We parse the json file into a string
          file = open("public/events.json")
          json = file.read
          j = json.to_s
          file.close


          @females = count_number_occurences(j, "F")
          @males = count_number_occurences(j, "M")

      else
          puts "No file exists here"
          @females = 0
          @males = 0
      end
  end


  # Reference : https://stackoverflow.com/questions/25938430/ruby-how-to-count-the-number-of-times-a-string-appears-in-another-string/25938828
  def count_number_occurences(string, substring)
      string.each_char.each_cons(substring.size).map(&:join).count(substring)
  end

  # Analtics 2 : Analysis of medical card holders site wide
  def medical_card_holders
      # First we see if the json file exists, if true then carry on
      if File.exists?("public/events.json")
          # We parse the json file into a string
          file = open("public/events.json")
          json = file.read
          j1 = json.to_s
          file.close

          @yes_medical_card = count_number_occurences(j1, "YES")
          @no_medical_card = count_number_occurences(j1, "NO")

          puts @yes_medical_card

      else
          puts "No file exists here"
          @yes_medical_card = 0
          @no_medical_card = 0
      end
  end

  helper_method :count_gender
  helper_method :count_number_occurences
  helper_method :medical_card_holders

end
