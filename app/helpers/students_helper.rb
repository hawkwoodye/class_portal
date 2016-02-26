module StudentsHelper
  def resource_name
    :"student"
  end

  def resource
    @resource ||= Student.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
