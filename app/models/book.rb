class Book < ActiveRecord::Base
  attr_accessible :condition, :isbn, :name, :price

  def self.search(search)
    if search
      find(:all, :conditions => ['isbn LIKE ? or name LIKE ?', "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end
end
