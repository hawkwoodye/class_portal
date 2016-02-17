json.array!(@courses) do |course|
  json.extract! course, :id, :couse_number, :title, :description, :instructor, :start_date, :end_date, :status
  json.url course_url(course, format: :json)
end
