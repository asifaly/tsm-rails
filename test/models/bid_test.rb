# == Schema Information
#
# Table name: bids
#
#  id           :bigint           not null, primary key
#  bid_amount   :decimal(14, 2)
#  bid_validity :datetime
#  rate         :decimal(4, 2)
#  spread       :decimal(4, 2)
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  account_id   :bigint           not null
#  base_rate_id :bigint
#  offer_id     :bigint           not null
#
# Indexes
#
#  index_bids_on_account_id    (account_id)
#  index_bids_on_base_rate_id  (base_rate_id)
#  index_bids_on_offer_id      (offer_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (base_rate_id => base_rates.id)
#  fk_rails_...  (offer_id => offers.id)
#
require "test_helper"

class BidTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
