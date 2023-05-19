category = Category.new(name: "ABC")

50.times do |n|
  Doctor.create(
    first_name: "Name #{n}",
    last_name: "Surname #{n}",
    phone: "38068620536#{n}",
    password: "somepass",
    password_confirmation: "somepass",
    category: category
  )
end
