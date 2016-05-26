User.create!([
  {fname: "adnan.khan@wwindia.com", lname: "", status: true, email: "adnan.khan@wwindia.com", password: "$2a$10$byJrIKSgaBUIzkdft7H8TupkgBRtrJc6gRHu0IxgX/8lzmthVGisW", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-05-03 10:30:00", last_sign_in_at: "2016-05-03 10:30:00", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", phone: "", provider: "facebook", uid: "468383690025704", newsletter: true},
  {fname: "Ranjeev", lname: "Kumar", status: true, email: "ranjeev.kumar@wwindia.com", password: "$2a$10$IHQ409M6l9N06BzeIlPFvubOx4jLhqLdUnkxjCU4Rw1bPGOPZqnxK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 36, current_sign_in_at: "2016-05-16 07:24:26", last_sign_in_at: "2016-05-16 06:30:01", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", phone: "90123456789", provider: nil, uid: nil, newsletter: false}
])
Address.create!([
  {address_1: "Patna", address_2: nil, city: "Patna", state: "Bihar", country: "India", zipcode: "800001", user_id: 3},
  {address_1: "Koperkhairne", address_2: "", city: "Navi Mumbai", state: "Maharashtra", country: "India", zipcode: "400000", user_id: 3}
])
AttributeValue.create!([
  {value: "4 GB", status: true, product_attribute_id: 1},
  {value: "50 GB", status: true, product_attribute_id: 2}
])
Category.create!([
  {category_id: 1, status: "false", name: "PC"},
  {category_id: nil, status: "false", name: "Laptops & Nootbooks"},
  {category_id: nil, status: "false", name: "Components"},
  {category_id: nil, status: "false", name: "Tablets"},
  {category_id: nil, status: "false", name: "Software"},
  {category_id: nil, status: "false", name: "Phones & PDAs"},
  {category_id: nil, status: "false", name: "Cameras"},
  {category_id: nil, status: "false", name: "MP3 Players"},
  {category_id: nil, status: "false", name: "Desktops"},
  {category_id: 1, status: "false", name: "MAC"}
])
Category::HABTM_Products.create!([
  {category_id: 2, product_id: 7},
  {category_id: 2, product_id: 9},
  {category_id: 10, product_id: 10},
  {category_id: 1, product_id: 11},
  {category_id: 2, product_id: 12},
  {category_id: 10, product_id: 13}
])
Coupon.create!([
  {code: "DISC10", created_by_id: nil, modified_by_id: nil, status: true, no_of_uses: 2, discount_of: "10.0"},
  {code: "DISC15", created_by_id: nil, modified_by_id: nil, status: true, no_of_uses: 2, discount_of: "15.0"},
  {code: "DISC5", created_by_id: nil, modified_by_id: nil, status: true, no_of_uses: 2, discount_of: "5.0"}
])
Image.create!([
  {name: "Image6", product_id: nil, avatar: "product.png", main: false},
  {name: "Image7", product_id: nil, avatar: "pages_2013_11_17_14_36_44.jpg", main: false},
  {name: "Image8", product_id: nil, avatar: "New-Product-Coming-Soon.jpg", main: false},
  {name: "Image9", product_id: nil, avatar: "New-Product.jpg", main: false},
  {name: "Image10", product_id: nil, avatar: "new_product.jpg", main: false},
  {name: "Image2", product_id: 10, avatar: "coming-soon.jpg", main: false},
  {name: "Image3", product_id: 11, avatar: "Rovo-New-Product.png", main: false},
  {name: "Image4", product_id: 12, avatar: "Product-Value.jpg", main: false},
  {name: "Image5", product_id: 13, avatar: "product-coming-soon.jpg", main: false},
  {name: "Image1", product_id: 9, avatar: "new-product-22853660.jpg", main: false}
])
Product.create!([
  {name: "Product5", description: "Testing Product5.", status: true, price: "499.0"},
  {name: "Product1", description: "Testing Product1.", status: true, price: "299.0"},
  {name: "Product2", description: "Testing Product2.", status: true, price: "349.0"},
  {name: "Product4", description: "Testing Product4.", status: true, price: "449.0"},
  {name: "Product3", description: "Testing Product3.", status: true, price: "199.0"}
])
Product::HABTM_Categories.create!([
  {category_id: 2, product_id: 7},
  {category_id: 2, product_id: 9},
  {category_id: 10, product_id: 10},
  {category_id: 1, product_id: 11},
  {category_id: 2, product_id: 12},
  {category_id: 10, product_id: 13}
])
ProductAttribute.create!([
  {name: "RAM", status: true},
  {name: "ROM", status: true}
])
ProductAttributeAssociation.create!([
  {product_id: 9, product_attribute_id: 2, attribute_value_id: nil, status: false},
  {product_id: 9, product_attribute_id: 1, attribute_value_id: nil, status: false},
  {product_id: 9, product_attribute_id: nil, attribute_value_id: 2, status: false},
  {product_id: 9, product_attribute_id: nil, attribute_value_id: 1, status: false},
  {product_id: 10, product_attribute_id: 2, attribute_value_id: nil, status: false},
  {product_id: 10, product_attribute_id: 1, attribute_value_id: nil, status: false},
  {product_id: 10, product_attribute_id: nil, attribute_value_id: 2, status: false},
  {product_id: 10, product_attribute_id: nil, attribute_value_id: 1, status: false},
  {product_id: 11, product_attribute_id: 2, attribute_value_id: nil, status: false},
  {product_id: 11, product_attribute_id: 1, attribute_value_id: nil, status: false},
  {product_id: 11, product_attribute_id: nil, attribute_value_id: 2, status: false},
  {product_id: 11, product_attribute_id: nil, attribute_value_id: 1, status: false},
  {product_id: 12, product_attribute_id: 2, attribute_value_id: nil, status: false},
  {product_id: 12, product_attribute_id: 1, attribute_value_id: nil, status: false},
  {product_id: 12, product_attribute_id: nil, attribute_value_id: 2, status: false},
  {product_id: 12, product_attribute_id: nil, attribute_value_id: 1, status: false},
  {product_id: 13, product_attribute_id: 2, attribute_value_id: nil, status: false},
  {product_id: 13, product_attribute_id: 1, attribute_value_id: nil, status: false},
  {product_id: 13, product_attribute_id: nil, attribute_value_id: 2, status: false},
  {product_id: 13, product_attribute_id: nil, attribute_value_id: 1, status: false}
])

