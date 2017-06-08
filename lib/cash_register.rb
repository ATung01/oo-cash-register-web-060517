require "pry"

class CashRegister
  attr_accessor :total, :discount, :items
  attr_writer :last_item


  def initialize(*discount)
    @total = 0
    @discount = discount[0]
    @items = []
    # binding.pry
  end

  def add_item(title, price, quantity = 1)
    # binding.pry
    @total += price * quantity
    quantity.times do |x|
    @items << title
    end
    @last_item = price * quantity
  end

  def apply_discount
    if @discount == nil
      "There is no discount to apply."
    else
      @total = @total - @total * @discount.to_i / 100.00
      "After the discount, the total comes to $#{@total.to_i}."
      # binding.pry
    end
  end



  def void_last_transaction
    @items.pop
    @total -= @last_item

  end

end
