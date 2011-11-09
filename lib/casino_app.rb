class CasinoApp
  attr_accessor  :customers

  def initialize
    @customers = []
  end

  def allow_in customer
    @customers << customer
  end

  def customer_report
    customer_report = {}
    @customers.each do | customer |
      customer_report[customer.name] = {}
      customer_report[customer.name][:total_won] = customer.total_won
      customer_report[customer.name][:total_wins] = customer.total_wins
      customer_report[customer.name][:total_spent] = customer.total_spent
    end
    customer_report
  end
end
