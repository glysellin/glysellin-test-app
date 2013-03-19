namespace :testapp do
  task install: :environment do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:schema:load"].invoke
    Rake::Task["glysellin:seed"].invoke
    Rake::Task["db:seed"].invoke
  end
end