CURRENT_YEAR = Date.today.year

class Payment < ApplicationRecord
  attr_accessor :card_number, :card_cvv, :card_expires_month, :card_expires_year

  belongs_to :user

  def self.month_options
    Date::MONTHNAMES.compact.each_with_index.map { |name, i| [name, i + 1] }
  end

  def self.year_options
    (CURRENT_YEAR..CURRENT_YEAR + 10).to_a
  end

  def process_payment
    customer = Stripe::Customer.create(email: email, card: token)

    Stripe::Charge.create(customer: customer.id,
                          amount: 1000,
                          description: 'Premium',
                          currency: 'usd')
  end
end
