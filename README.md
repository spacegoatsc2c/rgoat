# README

Install the ruby
`bundle install`

Create the database
`rake db:create`
`rake db:migrate`


Create systemctl timers running these somewhat regularly
`rails runner UpdateCharactersJob.perform_now`
`rails runner UpdateBossesJob.perform_now`

Create systemctl service running this command
`rails server --environment=production`
