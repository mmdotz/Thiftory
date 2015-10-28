class Finance < ActiveRecord::Base
  belongs_to :item

  def item_total_outlay
    procure_cost + shipping_cost + pre_sale_cost
  end

  def self.sum_total_outlay
    self.all.map { |finance| finance.item_total_outlay }.sum
  end

  def item_profit? #single item buyer_pmt, item_total_outlay
    self.buyer_pmt > self.item_total_outlay
  end

  # def total_profit?  Why is this not working when we can copy the logic into the if statement and it works?
  #    self.all.map { |finance| finance.buyer_pmt }.sum > self.sum_total_outlay
  # end
end
