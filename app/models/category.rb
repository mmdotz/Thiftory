class Category < ActiveRecord::Base
  has_many :subcat1s, dependent: :destroy
  has_many :subcat2s, through:  :subcat1s
  has_many :items, through: :subcat2s
  has_many :finances, through: :items

  accepts_nested_attributes_for :subcat1s
  validates_associated          :subcat1s
  validates :name, presence: true

end
