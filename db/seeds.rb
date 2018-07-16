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
martinUser.add_role :technician

damiUser = User.new(
  :email                 => "damian.desimini@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
damiUser.save!
damiUser.add_role :technician

maxiUser = User.new(
  :email                 => "maximiliano.avila@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
maxiUser.save!
maxiUser.add_role :technician

darioUser = User.new(
  :email                 => "dario.dinapoli@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
darioUser.save!
darioUser.add_role :technician

marcosUser = User.new(
  :email                 => "marcos.olate@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
marcosUser.save!
marcosUser.add_role :technician

guilleUser = User.new(
  :email                 => "guille.cabrera@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
guilleUser.save!
guilleUser.add_role :technician

santiUser = User.new(
  :email                 => "santiago.thomas@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
santiUser.save!
santiUser.add_role :technician

juabaUser = User.new(
  :email                 => "juan.cardenas@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
juabaUser.save!
juabaUser.add_role :technician

luisUser = User.new(
  :email                 => "luis.savedra@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
luisUser.save!
luisUser.add_role :technician

gasparUser = User.new(
  :email                 => "gaspar.sierra@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
gasparUser.save!
gasparUser.add_role :technician

hugoUser = User.new(
  :email                 => "hugo.perez@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
hugoUser.save!
hugoUser.add_role :dir
hugoUser.add_role :chief

leoUser = User.new(
  :email                 => "leonardo.gaias@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
leoUser.save!
leoUser.add_role :dir

pabloUser = User.new(
  :email                 => "pablo.ferreri@cotesma.com",
  :password              => "123456",
  :password_confirmation => "123456"
)
pabloUser.save!
pabloUser.add_role :dir

Job.create!({
  :code  => "0.1",
  :title => "Mal equipo abonado"
  })
Job.create!({
  :code  => "0.2",
  :title => "Trabajo en bajada"
  })
Job.create!({
  :code  => "0.3",
  :title => "Trabajo en central"
  })
Job.create!({
  :code  => "0.4",
  :title => "Trabajo en interior domicilio"
  })
Job.create!({
  :code  => "0.5",
  :title => "Trabajo en par primario"
  })
Job.create!({
  :code  => "0.6",
  :title => "Trabajo en par secundario"
  })
Job.create!({
  :code  => "0.7",
  :title => "Configuracion de modem"
  })
Job.create!({
  :code  => "0.9",
  :title => "Trabajo en armario"
  })
Job.create!({
  :code  => "1.0",
  :title => "Ver orden"
  })
Job.create!({
  :code  => "131",
  :title => "Falsa alarma"
  })
Job.create!({
  :code  => "121",
  :title => "Aviso"
  })
Job.create!({
  :code  => "111",
  :title => "Coordinado"
  })

Truck.create!({
  :number => "13",
  :brand => "Partner"
  })
Truck.create!({
  :number => "14",
  :brand => "Hilux"
  })
Truck.create!({
  :number => "20",
  :brand => "Hilux"
  })
Truck.create!({
  :number => "21",
  :brand => "Hilux"
  })
Truck.create!({
  :number => "22",
  :brand => "Partner"
  })
Truck.create!({
  :number => "23",
  :brand => "Hilux"
  })
Truck.create!({
  :number => "25",
  :brand => "Partner"
  })
Truck.create!({
  :number => "26",
  :brand => "Partner"
  })

#####################    TEAMS    #####################
#
team_01 = Team.new(
  :date => "2018-07-15",
  :created_at => "2018-07-15 23:55:32",
  :updated_at => "2018-07-15 23:55:32",
  :truck_id => 3,
  :finished => false
)
team_01.user_ids=[2,3]
team_01.save!

##########
team_02 = Team.new(
  :date => "2018-07-15",
  :created_at => "2018-07-15 23:55:32",
  :updated_at => "2018-07-15 23:55:32",
  :truck_id => 3,
  :finished => false
)
team_02.user_ids=[4,5]
team_02.save!

##########
team_03 = Team.new(
  :date => "2018-07-15",
  :created_at => "2018-07-15 23:55:32",
  :updated_at => "2018-07-15 23:55:32",
  :truck_id => 3,
  :finished => false
)
team_03.user_ids=[6,7]
team_03.save!


#####################    CLAIMS    #####################
#
claim_01 = Claim.new(
  :ticket => 1,
  :client => 423555,
  :created_at => "2018-07-15 23:55:32",
  :updated_at => "2018-07-15 23:55:32",
  :status => "revisar",
  :team_id => team_01.id,
  :starts_at => nil,
  :ends_at => nil,
  :kind => "Reclamo",
  :observation => nil,
  :author_id => 12,

)
claim_01.save!

##########
claim_02 = Claim.new(
  :ticket => 2,
  :client => "sma_123",
  :created_at => "2018-08-15 23:55:32",
  :updated_at => "2018-08-15 23:55:32",
  :status => "finalizado",
  :team_id => team_01.id,
  :starts_at => nil,
  :ends_at => nil,
  :kind => "Reclamo",
  :observation => nil,
  :author_id => 12,

)
claim_02.save!
##########

claim_03 = Claim.new(
  :ticket => 3,
  :client => 423555,
  :created_at => "2018-09-15 23:55:32",
  :updated_at => "2018-09-15 23:55:32",
  :status => "coordinado",
  :team_id => team_02.id,
  :starts_at => nil,
  :ends_at => nil,
  :kind => "Reclamo",
  :observation => nil,
  :author_id => 12,

)
claim_03.save!
##########

claim_04 = Claim.new(
  :ticket => 4,
  :client => "sma_123",
  :created_at => "2018-10-15 23:55:32",
  :updated_at => "2018-10-15 23:55:32",
  :status => "contactar",
  :team_id => team_02.id,
  :starts_at => nil,
  :ends_at => nil,
  :kind => "Reclamo",
  :observation => nil,
  :author_id => 12,

)
claim_04.save!
##########

claim_05 = Claim.new(
  :ticket => 5,
  :client => 423555,
  :created_at => "2018-11-15 23:55:32",
  :updated_at => "2018-11-15 23:55:32",
  :status => "contactado",
  :team_id => team_03.id,
  :starts_at => nil,
  :ends_at => nil,
  :kind => "Reclamo",
  :observation => nil,
  :author_id => 12,

)
claim_05.save!
##########
claim_06 = Claim.new(
  :ticket => 6,
  :client => "sma_123",
  :created_at => "2018-12-15 23:55:32",
  :updated_at => "2018-12-15 23:55:32",
  :status => "revisar",
  :team_id => team_03.id,
  :starts_at => nil,
  :ends_at => nil,
  :kind => "Reclamo",
  :observation => nil,
  :author_id => 12,

)
claim_06.save!
##########
