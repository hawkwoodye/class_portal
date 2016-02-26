class Course < ActiveRecord::Base
    belongs_to :instructor
    belongs_to :admin
    has_many :student
end
