# == Schema Information
#
# Table name: base_products
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class BaseProduct < ApplicationRecord
end