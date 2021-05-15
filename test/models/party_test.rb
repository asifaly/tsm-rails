# == Schema Information
#
# Table name: parties
#
#  id         :bigint           not null, primary key
#  bic        :string
#  city       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#  country_id :bigint           not null
#
# Indexes
#
#  index_parties_on_account_id  (account_id)
#  index_parties_on_country_id  (country_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (country_id => countries.id)
#
require "test_helper"

class PartyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
