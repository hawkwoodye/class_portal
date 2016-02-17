class Course < ActiveRecord::Base
    belongs_to :instructor
    belongs_to :admin
end
