# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

admin = User.create(
    username: "admin",
    email: "podipireddy5@gmail.com",
    password: "admin",
    password_confirmation: "admin",
    account_id: "1",
    account_type: "Vendor",
    first_name: "John",
    last_name: "Smith",
    admin: true
)

@test = User.create(
  username: "test",
  email: "podipilr@mcmcaster.ca",
  password: "test",
  password_confirmation: "test",
  account_type: "Consumer", 
  first_name: "Alex",
  last_name: "Smith",
  admin: false
)

test1 = User.create(
  username: "test1",
  email: "lokesh93@hotmail.com",
  password: "test",
  first_name: "Bob",
  last_name: "Thebuilder",
  password_confirmation: "test",
  account_type: "Vendor",
  admin: false
)
test2 = User.create(
  username: "test2",
  email: "user2@test.com",
  password: "test",
  first_name: "Derik",
  last_name: "Fisher",
  password_confirmation: "test",
  account_type: "Vendor",
  admin: false
)
test3 = User.create(
  username: "test3",
  email: "user3@test.com",
  password: "test",
  first_name: "Kobe",
  last_name: "Bryant",
  password_confirmation: "test",
  account_type: "Vendor",
  admin: false
)
test4 = User.create(
  username: "test4",
  email: "user4@test.com",
  password: "test",
  first_name: "Nick",
  last_name: "Young",
  password_confirmation: "test",
  account_type: "Vendor",
  admin: false
)
test5 = User.create(
  username: "test5",
  email: "user5@test.com",
  password: "test",
  first_name: "Jeremy",
  last_name: "Lin",
  password_confirmation: "test",
  account_type: "Vendor",
  admin: false
)
test6 = User.create(
  username: "test6",
  email: "user6@test.com",
  password: "test",
  first_name: "Steve",
  last_name: "Nash",
  password_confirmation: "test",
  account_type: "Vendor",
  admin: false
)

TimedTask.create(interval: 1, measure_of_time: "instant")
TimedTask.create(interval: 1, measure_of_time: "day")
TimedTask.create(interval: 1, measure_of_time: "week")
TimedTask.create(interval: 1, measure_of_time: "month")


EmailNotificationSetting.create(settings_for: 'Vendor', timed_task: TimedTask.first, user: admin)
EmailNotificationSetting.create(settings_for: 'Vendor', timed_task: TimedTask.first, user: @test)
EmailNotificationSetting.create(settings_for: 'Vendor', timed_task: TimedTask.first, user: test1)
EmailNotificationSetting.create(settings_for: 'Vendor', timed_task: TimedTask.first, user: test2)

EmailNotificationSetting.create(settings_for: 'Post', timed_task: TimedTask.first, user: admin)
EmailNotificationSetting.create(settings_for: 'Post', timed_task: TimedTask.first, user: @test)

EmailNotificationSetting.create(settings_for: 'Comment', timed_task: TimedTask.first, user: admin)
EmailNotificationSetting.create(settings_for: 'Comment', timed_task: TimedTask.first, user: @test)

EmailNotificationSetting.create(settings_for: 'Bid', timed_task: TimedTask.first, user: admin)
EmailNotificationSetting.create(settings_for: 'Bid', timed_task: TimedTask.first, user: @test)

EmailNotificationSetting.create(settings_for: 'Conversation', timed_task: TimedTask.first, user: admin)
EmailNotificationSetting.create(settings_for: 'Conversation', timed_task: TimedTask.first, user: @test)
@v = Vendor.create(business_name: "SyncI&DLabs",
              establish_date: Date.today, tax_number: 1234)
# @c = Consumer.create();
# @c.user = @test
@v.user = admin
@v.save
@v1 = Vendor.create(business_name: "TestCorp", tax_number: 12345)
@v1.user = test1
@v2 = Vendor.create(business_name: "Test2Corp", establish_date: Date.today, tax_number: 123456)
@v3 = Vendor.create(business_name: "Test3Corp", establish_date: Date.today, tax_number: 123457)
@v4 = Vendor.create(business_name: "Test4Corp", establish_date: Date.today, tax_number: 123458)
@v5 = Vendor.create(business_name: "Test5Corp", establish_date: Date.today, tax_number: 123459)
@v6 = Vendor.create(business_name: "Test6Corp", establish_date: Date.today, tax_number: 123454)
@v2.user = test2
@v3.user = test3
@v4.user = test4
@v5.user = test5
@v6.user = test6
@v1.save
@v2.save
@v3.save
@v4.save
@v5.save
@v6.save


c = Country.create([
    {name: 'Canada'},
    {name: 'United States'}])
p = Province.create([
  {name: 'Ontario', country_id: c.first.id, short_name: "ON"},
  {name: 'Quebec', country_id: c.first.id, short_name: "QC"},
  {name: 'New York',country_id: c.second.id, short_name: "NY"}])
  
ci=City.create([
  {name: 'Toronto', province_id: p.first.id},
  {name: 'Missauga', province_id: p.first.id},
  {name: 'Waterloo', province_id: p.first.id},
  {name: 'Kitchener', province_id: p.first.id},
  {name: 'Quebec City', province_id: p[1].id},
  {name: 'Montreal', province_id: p[1].id}])
  {name: 'New York City', province_id: p.third.id}

for i in 1..3 do
  ind = Industry.create(name: "industry_" + i.to_s)
  for j in 1..3 do
    cat = Category.create(name:  "category_" + i.to_s + "_" + j.to_s, industry_id: ind.id)
    for k in 1..3 do
      ext = i.to_s + "_" + j.to_s + "_" + k.to_s
      Subcategory.create(name: "sub-cat_" + ext, tip: "tip_" + ext, category_id: cat.id)
    end
  end
end

for i in 1..5 do
  ExternalSource.create(source_type: "Source_Type_" + i.to_s)
  PaymentMethod.create(name: "PaymentMethod_" + i.to_s)
end

@first_post = Post.create(
  title: "Need a Waitress",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to ",
  user_id: @test.id,
  due_date: "2015-05-07",
)

@second_post = Post.create(
  title: "Need a Cook",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to ",
  user_id: @test.id,
  due_date: "2015-04-27",
)
@third_post = Post.create(
  title: "Need a Gaurd",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to ",
  user_id: @test.id,
  due_date: "2015-03-15",
)
first_sub = PostSubscription.create(
  post_id: @first_post.id,
  category_id: 1,
  subcategory_id: 1,
)

second_sub = PostSubscription.create(
  post_id: @second_post.id,
  category_id: 2,
  subcategory_id: 4,
)
third_sub = PostSubscription.create(
  post_id: @third_post.id,
  category_id: 3,
  subcategory_id: 7,
)
for i in 3..8 do
  for j in 1..3 do 
    Bid.create(value: 25, status: "bid-pending", info: "Lorem Ipsum is simply dummy text of the printing", user_id: i, post_id: j)
  end
end

for i in 1..3 do 
  Bid.create(value: 45, status: "bid-pending", info: "Lorem Ipsum is simply dummy text of the printing", user_id: 1, post_id: i)
end

location_one = LocationOption.create(
  name: "All"
)
location_two = LocationOption.create(
  name: "North America"
)
location_three = LocationOption.create(
  name: "Canda"
)
location_four = LocationOption.create(
  name: "Ontario"
)
location_five = LocationOption.create(
  name: "GTA"
)
#All
city = City.all
city.each do |c|
  OptionsCityList.create(
    location_option_id: location_one.id,
    city_id: c.id
  )
end
#North America
count = Country.first
prov = count.provinces.all
prov.each do |p|
  city = p.cities.all
  city.each do |c|
    OptionsCityList.create(location_option_id:location_two.id,
      city_id:c.id)
  end 
end
count = Country.second
prov = count.provinces.all
prov.each do |p|
  city = p.cities.all
  city.each do |c|
    OptionsCityList.create(location_option_id:location_two.id,
      city_id:c.id)
  end 
end
#Canada
count = Country.first
prov = count.provinces.all
prov.each do |p|
  city = p.cities.all
  city.each do |c|
    OptionsCityList.create(location_option_id:location_three.id,
      city_id:c.id)
  end 
end
#Ontario
city = Province.first.cities.all
city.each do |c|
 OptionsCityList.create(location_option_id:location_four.id,
   city_id:c.id)
end
#GTA have to do it manually
OptionsCityList.create(location_option_id:location_five.id,
   city_id:City.first.id)
OptionsCityList.create(location_option_id:location_five.id,
   city_id:City.second.id)