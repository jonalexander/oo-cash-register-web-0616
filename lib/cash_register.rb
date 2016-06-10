require 'Pry'

class CashRegister

  attr_accessor :total, :discount, :title, :price

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = [] #stores names of items
    @cart = []  #stores all object id for each item added
  end

  def add_item(title, price, quantity=1)
    @title = title
    @price  = price
    @quantity =  quantity
    @total += price * quantity

    @items.fill(title, @items.size, quantity)
    #popules array with just the item's title
    @cart << self
    #populates array CashRegister instances
  end

  def apply_discount
    @total = (@total - (@total * (@discount.to_f / 100).to_f)).to_i
    if @discount > 0
      return_string = "After the discount, the total comes to $#{@total}." 
    else 
      return_string = "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @cart[-1].price
    #@price from last object in cart[-1]
  end
end

#Pry.start