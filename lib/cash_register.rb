def initialize(discount = nil)
    @total = 0
    @discount = discount
  end

  def add_item(title, price, quantity = 1)
      @price = price
      @total = @total + (price * quantity)
      @items ||= []
      quantity.times do
        @items << title
      end

      @last_quantity_bought = quantity
      @last_price = price # yes, we already have a reference to this as @price, but this is just setting a new variable explicitly for our use case
    end

    def void_last_transaction
      ## now, down here, when we invoke this

      total_last_transaction = @last_quantity_bought * @last_price
      @total = @total - total_last_transaction

      ## we can subtract the total of the last transaction.

      @last_quantity_bought.times do
        @items.pop
        ## pop an item out
      end
    end

  def apply_discount
    if discount
      self.total = (self.total * ((100.0 - discount.to_f)/100)).to_i
      return "After the discount, the total comes to $#{total}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @items
  end

end

  