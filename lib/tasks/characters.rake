desc "Update the character ilvls"
task :update do
  UpdateCharactersJob.perform_now
end
