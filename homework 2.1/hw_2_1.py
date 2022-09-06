def create_cook_book():
  with open('cook_book.txt') as file:
    cb_dict = {}
    for line in file:
      cook_book = line.strip()
      cb_dict[cook_book] = []
      ingridients = int(file.readline().strip())
      for i in range(ingridients):
        product_name, product_quantity, product_measure = (file.readline().strip()).split(' | ')
        product_quantity = int(product_quantity)
        cb_dict[cook_book].append({'ingridient_name' : product_name, 'quantity' : product_quantity, 'measure' : product_measure})
    return cb_dict

def get_shop_list_by_dishes(dishes, person_count):
  shop_list = {}
  for dish in dishes:
    for ingridient in create_cook_book()[dish]:
      new_shop_list_item = dict(ingridient)
      new_shop_list_item['quantity'] *= person_count
      if new_shop_list_item['ingridient_name'] not in shop_list:
        shop_list[new_shop_list_item['ingridient_name']] = new_shop_list_item
      else:
        shop_list[new_shop_list_item['ingridient_name']]['quantity'] += new_shop_list_item['quantity']
  return shop_list

def print_shop_list(shop_list):
  for shop_list_item in shop_list.values():
    print('{ingridient_name} {quantity} {measure}'.format(**shop_list_item))
  
def create_shop_list():
  person_count = int(input('Введите количество человек: '))
  dishes = input('Введите количество блюд в расчете на одного (через запятую): ').lower().split(', ')
  shop_list = get_shop_list_by_dishes(dishes, person_count)
  print_shop_list(shop_list)


create_shop_list()
