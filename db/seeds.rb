# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
adminUser = User.new(
  :email                 => "admin@cotesma.com",
  :password              => "admins",
  :password_confirmation => "admins"
)
adminUser.save!
adminUser.add_role :admin

martinUser = User.new(
  :email                 => "martin.paneblanco@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
martinUser.save!

damiUser = User.new(
  :email                 => "damian.desimini@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
damiUser.save!

maxiUser = User.new(
  :email                 => "maximiliano.avila@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
maxiUser.save!

darioUser = User.new(
  :email                 => "dario.dinapoli@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
darioUser.save!

marcosUser = User.new(
  :email                 => "marcos.olate@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
marcosUser.save!

guilleUser = User.new(
  :email                 => "guille.cabrera@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
guilleUser.save!

santiUser = User.new(
  :email                 => "santiago.thomas@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
santiUser.save!

juabaUser = User.new(
  :email                 => "juan.cardenas@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
juabaUser.save!

luisUser = User.new(
  :email                 => "luis.savedra@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
luisUser.save!

gasparUser = User.new(
  :email                 => "gaspar.sierra@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
gasparUser.save!

hugoUser = User.new(
  :email                 => "hugo.perez@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
hugoUser.save!

leoUser = User.new(
  :email                 => "leonardo.gaias@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
leoUser.save!

pabloUser = User.new(
  :email                 => "pablo.ferreri@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
pabloUser.save!
