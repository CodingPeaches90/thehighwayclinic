json.extract! profile, :id, :firstname, :lastname, :address, :pps_number, :dental_license, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
