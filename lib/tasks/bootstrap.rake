desc 'Recreate database & load seed & dummy data'
task bootstrap: %w[ bootstrap:reset bootstrap:data ]

namespace :bootstrap do

  desc 'Recreate the development database with seed data'
  task reset: %w[ db:drop db:create db:migrate db:seed ] do
  end

  desc 'Run all bootstrap data tasks'
  task data: %w[ bootstrap:data:admin ] do
    puts 'Bootstrap complete!'
  end

  namespace :data do

    task :admin => :environment do
      admin = User.create email: 'admin@testing.com', password: 'password', password_confirmation: 'password'
      admin.admin = true
      admin.save!
    end

  end

end
