# Order.create!([
#   {user_id: 1, product_id: 1, quantity: 1, subtotal: nil, tax: nil, total: nil},
#   {user_id: 3, product_id: 2, quantity: 2, subtotal: nil, tax: nil, total: nil},
#   {user_id: 3, product_id: 4, quantity: 2, subtotal: "10.0", tax: "0.9", total: "10.9"},
#   {user_id: 1, product_id: 3, quantity: 2, subtotal: "12.0", tax: "1.08", total: "13.08"}
# ])
# Product.create!([
#   {name: "Fried Chicken Sandwich", price: "7.0", description: "literally the best chicken sandwich", in_stock: true, supplier_id: 2},
#   {name: "Portillo's Italian Beef", price: "6.0", description: "italian beef so good", in_stock: true, supplier_id: 1},
#   {name: "Frozen 'za", price: "5.0", description: "quick meal, surprisingly super good", in_stock: true, supplier_id: 2},
#   {name: "Cheeseburger", price: "6.0", description: "quarter-pound of delicious goodness", in_stock: true, supplier_id: 1},
#   {name: "Big Burger", price: "12.0", description: "Bacon, cheese, lettuce, tomato", in_stock: true, supplier_id: 3}
# ])
# Supplier.create!([
#   {name: "Big Bob's Novelty Emporium", email: "bigbob@emporium.com", phone_number: "310-555-9922"},
#   {name: "Radio Shack", email: "john.hanson@gmail.com", phone_number: "801-666-5550"},
#   {name: "Uncle Bucks Van by the River", email: "buckminster462@yahoo.com", phone_number: "716-555-0000"}
# ])
# User.create!([
#   {name: "Test", email: "test@email.com", password_digest: "$2a$10$szeHUNkXmMn1xqU4Xr1.DewpvbPANGHMBTvgKxmq8ApuT5ckC07Ky", admin: false},
#   {name: "Joe Bob", email: "joebob@gmail.com", password_digest: "$2a$10$0Twim4LvRg2z3nzFJf6.M.7KvXJuvbawvCb/7YpR0HoydA1PQ050W", admin: false},
#   {name: "Jim Croce", email: "jim@gmail.com", password_digest: "$2a$10$tr2OOnWqgb0kkrqO0D0gFuvEtDC1St/jXB8EkLQ2V1XmZjZmmR3ny", admin: true}
# ])

# Category.create(name: "Burgers")
# Category.create(name: "Sandwich")
# Category.create(name: "Pizza")

# ProductCategory.create(product_id: 1, category_id: 1)
# ProductCategory.create(product_id: 5, category_id: 1)
# ProductCategory.create(product_id: 2, category_id: 2)
# ProductCategory.create(product_id: 3, category_id: 2)
# ProductCategory.create(product_id: 4, category_id: 3)
# ProductCategory.create(product_id: 2, category_id: 1)
# ProductCategory.create(product_id: 5, category_id: 2)



