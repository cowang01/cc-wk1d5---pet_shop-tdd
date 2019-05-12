
  ##Graham Cowan Code Clan homework ex.wk1d5 10/05/2019
  ##pet shop tdd - function ruby practice

  #N.B. limitation to unique pet name per pet shop!


#1 pet shop name - test pass 10/05/19
def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

#2 pet shop total cash - test pass 10/05/19
def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

#3..4 pet shop cash change - test pass 10/05/19
def add_or_remove_cash(pet_shop, cost)
  pet_shop[:admin][:total_cash] += cost
end

#5 pet shop sold pets - test pass 10/05/19
def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

#6 pet shop change sold pets - test pass 10/05/19
def increase_pets_sold(pet_shop, quantity)
  pet_shop[:admin][:pets_sold] += quantity
end

#7 pet shop stock count - test pass 10/05/19
def stock_count(pet_shop)
   pet_shop[:pets].count()
end

#8..9 pet shop all pet types - pass 10/05/19
def pets_by_breed(pet_shop, breed)
  all_breed = []
  for l_breed in pet_shop[:pets]
    if l_breed[:breed] == breed
       all_breed.push(l_breed[:name])
    end
  end
  return all_breed
end

#10..12 pet shop find a pet - pass 11/05/19 - revision
def find_pet_by_name(pet_shop, name)
  pet = nil
  for l_pet_shop in pet_shop[:pets]
    if l_pet_shop[:name] == name
      pet = l_pet_shop
    end
  end
  return pet
end

#12 pet shop remove pet - pass 11/05/19 - revised
def remove_pet_by_name(pet_shop, name)
  pet = nil
  for l_pet_shop in pet_shop[:pets]
    if l_pet_shop[:name] == name
      pet = pet_shop[:pets].index(l_pet_shop)
    end
  end
  pet_shop[:pets].delete_at(pet)
end

#13 pet shop add shtock - test pass 11/05/19
def add_pet_to_stock(pet_shop, pet)
  pet_shop[:pets].push(pet)
end

#14 customer cash - test pass 11/05/19
def customer_cash(customer)
  return customer[:cash]
end

#15 customer remove cash - test pass 11/05/19
def remove_customer_cash(customer, value)
  customer[:cash] -= value
end

#16 customer count of pets - test pass 11/05/19
def customer_pet_count(customer)
  return customer[:pets].count()
end

#17 add pet to a customer - test pass 11/05/19
def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

#---------------------------------------------------

#18..19 customer can afford pet? - test pass 11/05/19
def customer_can_afford_pet(customer, pet)
  customer[:cash] >= pet[:price]
end

#20..22 sell a pet to a customer - test pass 12/05/19
#change customer pet count, pet sold, cust cash, total cash.
def sell_pet_to_customer(pet_shop, pet, customer)
  for l_pet_shop in pet_shop[:pets]
    if l_pet_shop == pet
      if customer_can_afford_pet(customer, pet) == true
        remove_customer_cash(customer, pet[:price])
        add_or_remove_cash(pet_shop, pet[:price])
        add_pet_to_customer(customer, pet)
        increase_pets_sold(pet_shop, 1)
      end
    end
  end
end
