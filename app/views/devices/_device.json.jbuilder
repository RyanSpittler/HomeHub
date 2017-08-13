json.extract! device, :id, :ip_address, :type, :created_at, :updated_at
json.url device_url(device, format: :json)
