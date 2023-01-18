require 'pry'

class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction 

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @last_transaction = [title, price, quantity]
        self.total = total + (price * quantity)
        quantity.times do |num|
            self.items << title
        end
    end

    def apply_discount
        if @discount != 0 
            savings = total * (@discount.to_f / 100)
            self.total  = (total - savings).to_int
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = total - (@last_transaction[1] * @last_transaction[2])
        @last_transaction[2].times do |num|
            self.items.pop()
        end
    end

end

