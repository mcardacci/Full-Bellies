class FavoriteVendor < ActiveRecord::Base
  belongs_to :user
  belongs_to :vendor
end
