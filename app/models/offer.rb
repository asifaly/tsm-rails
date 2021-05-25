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
#  status                   :string
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
class Offer < ApplicationRecord
  # acts_as_tenant :account
  include AASM
  has_many :bids, dependent: :destroy
  belongs_to :account
  belongs_to :product
  belongs_to :currency
  belongs_to :base_rate, optional: true
  has_rich_text :underlying_contract_details
  has_rich_text :goods_description
  # enum rate_types: { fixed: 'Fixed', floating: 'Floating' }
  enum shipment_modes: { sea: 'SEA', air: 'AIR', rail: 'RAIL', road: 'ROAD', multi: 'MULTI-MODAL' }
  enum payment_types: { payment: 'PAYMENT', acceptance: 'ACCEPTANCE', deferred: 'DEFERRED PAYMENT',
                        negotiation: 'NEGOTIATION' }
  STATUSES = { draft: 'review1', review1: 'review2', review2: 'final', final: 'archive' }.freeze

  aasm column: :status do
    state :draft, initial: true
    state :review1
    state :review2
    state :final
    state :archive

    event :review1 do
      transitions from: :draft, to: :review1
    end

    event :review2 do
      transitions from: :review1, to: :review2
    end

    event :final do
      transitions from: :review2, to: :final
    end

    event :archive do
      transitions from: :final, to: :archive
    end

    event :return do
      transitions from: %i[review1 review2], to: :draft
    end
  end

  def next_state
    STATUSES[status.to_sym]
  end
end
