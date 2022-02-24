task :default do
  FileList['setup.rb', 'app.rb'].each { |file| ruby file }
end