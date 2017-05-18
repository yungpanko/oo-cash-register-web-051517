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
      @total += price * quantity[0]
      @last_transaction = price * quantity[0]
      quantity[0].times do
        @all_items << title
      end
    else
      @total += price
      @last_transaction = price
      @all_items << title
    end

  end

  def apply_discount
    if @discount_applied == true
      @total = @total * ((100.0 - discount) / 100.0)
      "After the discount, the total comes to $#{total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @all_items
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
