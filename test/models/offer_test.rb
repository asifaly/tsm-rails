# == Schema Information
#
# Table name: offers
#
#  id                       :bigint           not null, primary key
#  available_by             :enum
#  disclosed                :boolean
#  expiry_date              :date
#  final_destination        :string
#  open_offer               :boolean
#  percentage_sold          :decimal(4, 2)
#  place_of_taking_incharge :string
#  port_of_discharge        :string
#  port_of_loading          :string
#  rate                     :decimal(4, 2)
#  risk_sold_amount         :decimal(14, 2)
#  shipment_mode            :enum
#  spread                   :decimal(4, 2)
#  tenor_days               :integer
#  transaction_amount       :decimal(14, 2)
#  valid_until              :datetime
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  account_id               :bigint           not null
#  base_rate_id             :bigint
#  currency_id              :bigint           not null
#  product_id               :bigint           not null
#
# Indexes
#
#  index_offers_on_account_id    (account_id)
#  index_offers_on_base_rate_id  (base_rate_id)
#  index_offers_on_currency_id   (currency_id)
#  index_offers_on_product_id    (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (base_rate_id => base_rates.id)
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (product_id => products.id)
#
require "test_helper"

class OfferTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
