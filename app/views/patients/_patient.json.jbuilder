json.extract! patient, :id, :Full_Name, :Age, :Sex, :Address, :PPS, :Medical_Card, :user_id, :created_at, :updated_at
json.url patient_url(patient, format: :json)
