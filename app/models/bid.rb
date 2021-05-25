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
class Bid < ApplicationRecord
  include AASM
  belongs_to :offer
  belongs_to :account
  belongs_to :base_rate, optional: true
  has_rich_text :conditions
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
