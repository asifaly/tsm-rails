# == Schema Information
#
# Table name: bid_statuses
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class BidStatus < ApplicationRecord
end
