# This file follows the decorator pattern methodology in order
# to take the heavy lifting of manipulating front end facing data
# within our view and bring it to this file. The decision
# to use one master decorator was down to the fact that some methods can
# be interchangeable for different models.

class MasterDecorator < SimpleDelegator

    # This method configures the First Name and Last Name on the Profile View
    def concat_first_name_last_name
        "Dr #{firstname} #{lastname}"
    end

    # This method configures the pps number to all capitals
    def pps_number_to_uppercase
        pps_number.upcase
    end

    # Fix time format for tweets
    def display_time_for_tweet
        created_at.strftime("%B #{created_at.day.ordinalize}, %Y")
    end

    # Fix time for appointment
    def display_time_for_appointment
        date.strftime("%I:%M:%S %p, %B #{date.day.ordinalize}, %Y")
    end

    # Conditional for the medical card status -> Red (NO) Green (YES) for show page
    def medical_card_status_show(medical_card_status)
        if medical_card_status.to_str.include? "YES"
            '<li><p style = "color: green;">Medical Card Status : YES </p></li>'.html_safe
        else
            '<li><p style = "color: red;">Medical Card Status : NO </p></li>'.html_safe
        end
    end

    # Conditional for the medical card status for the index view (using tables)
    def medical_card_status_index(medical_card_status)
        if medical_card_status.to_str.include? "YES"
            '<td bgcolor="#00FF00"><p style = "color: green; text-align: center">YES</p></td>'.html_safe
        else
            '<td bgcolor="#FF0000"><p style = "color: white; text-align: center">NO</p></td>'.html_safe
        end
    end

    # Split email address
    def email_address_split(email)
        'Dr '+ email.split('@')[0]
    end

end
