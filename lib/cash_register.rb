require "pry"

class CashRegister
  attr_accessor :total, :discount, :items, :last

  def initialize(*discount)
    @total = 0
    @discount = discount.first
    @items = []
    @last = nil
  end

  def add_item(title, price, *quantity)
    if quantity.first
      self.total += price * quantity.first
      quantity.first.times {self.items << title}
      self.last = price * quantity.first
    else
      self.total += price
      self.items << title
      self.last = price
    end
  end

  def apply_discount
    if discount
      self.total = self.total * (1 - discount / 100.0)
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= self.last
  end


end
