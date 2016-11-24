json.array!(@personal_infos) do |personal_info|
  json.extract! personal_info, :id, :legal_first_name, :legal_last_name, :preferred_name, :email, :title, :primary_phone, :secondary_phone, :vendor_id
  json.url personal_info_url(personal_info, format: :json)
end
