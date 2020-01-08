def find_item_by_name_in_collection(name, collection)

  i = 0 
  while i < collection.length do 
    if collection[i][:item] == name 
      return collection[i]
    end 
    i += 1   
  end 

end

def consolidate_cart(cart)
  cartSummary = []
  i = 0 
  
  while i < cart.length do 
    cartSummary_item = find_item_by_name_in_collection(cart[i][:item], cartSummary)
    if cartSummary_item != nil 
      cartSummary_item[:count] += 1 
    else 
      cartSummary_item = {
        :item => cart[i][:item],
        :price => cart[i][:price],
        :clearance => cart[i][:clearance],
        :count => 1 
      }
      cartSummary << cartSummary_item
    end 
    i += 1 
  end 
  cartSummary 
end 

def apply_coupons(cart, coupons)
  i = 0 
  while i < cart.length do 
    if (cart[i][:item] == coupons[i][:item]) && (cart[i][:count] >= coupons[i][:num])
      new_count = coupons[i][:num] - cart[i][:count] 
      cart = {
        :item => "#{cart[i][:item]} W/COUPON",
        :price => coupons[i][:cost] / coupons[i][:num],
        :clearance => cart[i][:clearance],
        :count => cart[i][:num]
      }
      cart[i][:count] = new_count 
    end
    i += 1 
  end 

  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
