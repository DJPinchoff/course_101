# In this example we want to select the key-value pairs where the value is 'Fruit'.

def select_fruit(produce)
  selected_fruit = {}

  produce.each do |k, v|
    if v == 'Fruit'
      selected_fruit[k] = v
    end
  end
  selected_fruit
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce)
p select_fruit({})