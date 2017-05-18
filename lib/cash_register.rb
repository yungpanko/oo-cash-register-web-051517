require 'pry'

class CashRegister

  attr_accessor :total, :discount_applied, :last_transaction

  def initialize(*discount)
    @total = 0
    @all_items = []
    unless discount[0] == nil
      @discount_applied = true
    end
  end

  def discount
    discount = 20
  end

  def add_item(title, price, *quantity)
    unless quantity == []
      self.total += price * quantity[0]
      self.last_transaction = price * quantity[0]
      quantity[0].times do
        @all_items << title
      end
    else
      self.total += price 
      self.last_transaction = price
      @all_items << title
    end

  end

  def apply_discount
    if @discount_applied == true
      self.total = self.total * ((100.0 - discount) / 100.0)
      "After the discount, the total comes to $#{total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @all_items
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end

end
