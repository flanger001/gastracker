namespace :user_stations do
  desc "Creates associative records for users to stations"
  task :migrate => :environment do
    Station.includes(:user).find_each do |station|
      UserStation.create!(:station => station, :user => station.user) if station.user.present?
    end
  end
end
