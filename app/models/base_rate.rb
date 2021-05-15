# == Schema Information
#
# Table name: base_rates
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class BaseRate < ApplicationRecord
end
