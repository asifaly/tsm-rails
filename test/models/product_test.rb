# == Schema Information
#
# Table name: products
#
#  id              :bigint           not null, primary key
#  description     :string
#  funded          :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  base_product_id :bigint           not null
#
# Indexes
#
#  index_products_on_base_product_id  (base_product_id)
#
# Foreign Keys
#
#  fk_rails_...  (base_product_id => base_products.id)
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
