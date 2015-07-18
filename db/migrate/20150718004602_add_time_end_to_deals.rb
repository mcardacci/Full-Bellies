class AddTimeEndToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :end_time, :datetime
  end
end
