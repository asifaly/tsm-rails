# == Schema Information
#
# Table name: bids
#
#  id            :bigint           not null, primary key
#  bid_amount    :decimal(14, 2)
#  bid_validity  :datetime
#  rate          :decimal(4, 2)
#  spread        :decimal(4, 2)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :bigint           not null
#  base_rate_id  :bigint
#  bid_status_id :bigint           not null
#  offer_id      :bigint           not null
#
# Indexes
#
#  index_bids_on_account_id     (account_id)
#  index_bids_on_base_rate_id   (base_rate_id)
#  index_bids_on_bid_status_id  (bid_status_id)
#  index_bids_on_offer_id       (offer_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (base_rate_id => base_rates.id)
#  fk_rails_...  (bid_status_id => bid_statuses.id)
#  fk_rails_...  (offer_id => offers.id)
#
class Bid < ApplicationRecord
  belongs_to :offer
  belongs_to :account
  belongs_to :bid_status
  belongs_to :base_rate, optional: true
  has_rich_text :conditions
end
