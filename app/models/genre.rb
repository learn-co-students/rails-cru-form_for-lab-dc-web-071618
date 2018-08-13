class Genre < ActiveRecord::Base
  has_many :Songs
end
