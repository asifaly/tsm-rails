# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
# Uncomment the following to create! an Admin user for Production in Jumpstart Pro
User.create! name: 'asif', email: 'asif@tsm.com', password: '12345678', password_confirmation: '12345678', admin: true,
             terms_of_service: true

COUNTRIES = [
  { code: 'US', description: 'United States of America' },
  { code: 'IN', description: 'India' },
  { code: 'DE', description: 'Germany' },
  { code: 'FR', description: 'France' },
  { code: 'TH', description: 'Thailand' },
  { code: 'VN', description: 'Vietnam' }
]

CURRENCIES = [
  { code: 'USD', iso_code: 918, description: 'United States Dollar' },
  { code: 'EUR', iso_code: 916, description: 'Euro' },
  { code: 'INR', iso_code: 915, description: 'Indian Rupees' },
  { code: 'THB', iso_code: 914, description: 'Thai Baht' },
  { code: 'VND', iso_code: 913, description: 'Vietnamese Dong' }
]

BASE_PRODUCTS = ['Letter Of Credit', 'Guarantee/Standby', 'Trade Loans', 'Supply Chain Finance',
                 'Reimbursements'].freeze

PRODUCTS = [
  { description: 'Confirmation under L/C', base_product_id: 1, funded: false },
  { description: 'Discounting under L/C', base_product_id: 1, funded: true },
  { description: 'Accepted Bills under L/C', base_product_id: 1, funded: false },
  { description: 'Confirmation under Standby L/C', base_product_id: 2, funded: false },
  { description: 'Usance Payable at Sight', base_product_id: 1, funded: true },
  { description: "Supplier's Credit", base_product_id: 3, funded: true },
  { description: 'Trade Loan/Bankers Acceptance', base_product_id: 3, funded: true },
  { description: 'Reimbursement Authorization Financing', base_product_id: 5, funded: true }
]

BASE_RATES = %w[FIXED LIBOR HIBOR MIBOR SOFOR EURIBOR].freeze
BID_STATUSES = ['DRAFT', 'AWAITING SIGNATURE', 'SUBMITTED', 'ACCEPTED', 'REJECTED', 'CANCELLED', 'RENEGOTIATION'].freeze
OFFER_STATUSES = ['DRAFT', 'AWAITING SIGNATURE', 'OPEN', 'COMPLETED', 'ARCHIVED'].freeze

Country.create!(COUNTRIES)
puts "#{COUNTRIES.length} countries created"

Currency.create!(CURRENCIES)
puts "#{CURRENCIES.length} currencies created"

BASE_PRODUCTS.each do |product|
  BaseProduct.create!({ description: product })
end
puts "#{BASE_PRODUCTS.length} base products created"

Product.create!(PRODUCTS)

puts "#{PRODUCTS.length} products created"

BASE_RATES.each do |rate|
  BaseRate.create!({ description: rate })
end

puts "#{BASE_RATES.length} base rates created"

BID_STATUSES.each do |status|
  BidStatus.create!({ name: status })
end

puts "#{BID_STATUSES.length} base statuses created"

OFFER_STATUSES.each do |status|
  OfferStatus.create!({ name: status })
end

puts "#{OFFER_STATUSES.length} offer statuses created"
