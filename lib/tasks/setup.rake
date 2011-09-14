namespace :db do
  desc "rebuilds the database and prepares sample data"
  task :setup => :environment do
    raise "this task should not be run in production" if Rails.env.production?
    puts "dropping the database ................"
    Rake::Task["db:drop"].invoke
    puts "creaging the database ................"
    Rake::Task["db:create"].invoke
    puts "running db:migrate ................"
    Rake::Task["db:migrate"].invoke

    Rake::Task["db:sample_data"].invoke
  end

  desc "prepare sample data"
  task :sample_data => :environment do
    raise "this task should not be run in production" if Rails.env.production?
    User.delete_all
    puts "running db:seed ................"
    Rake::Task["db:seed"].invoke
    puts "done ................"
  end
end
