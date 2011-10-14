namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Brad Jackson",
                 :email => "bjsmail@optusnet.com.au",
                 :password => "BrAdJ4CK",
                 :password_confirmation => "BrAdJ4CK")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end

    50.times do
	    User.all(:limit => 6).each do |user|
	      user.microposts.create!(:content => Faker::Lorem.sentence(5))
	    end
	  end
  end
end