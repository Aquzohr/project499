json.extract! announcement, :id, :title, :des, :date, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
