# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


## This is real data - I drove a lot in 2014.

entries = [
  { date: '2014-01-03', odometer: 188330, gallons: 14.847, distance: 389.8, notes: nil, cost: 54.62 },
  { date: '2014-01-10', odometer: 188640, gallons: 14.539, distance: 310.0, notes: nil, cost: 53.2 },
  { date: '2014-01-10', odometer: 188964, gallons: 10.592, distance: 323.3, notes: nil, cost: 37.91 },
  { date: '2014-01-12', odometer: 189354, gallons: 13.711, distance: 389.9, notes: nil, cost: 48.8 },
  { date: '2014-01-19', odometer: 189733, gallons: 14.030, distance: 379.2, notes: nil, cost: 51.34 },
  { date: '2014-01-25', odometer: 190085, gallons: 14.682, distance: 352.1, notes: nil, cost: 53.72 },
  { date: '2014-02-02', odometer: 190444, gallons: 14.818, distance: 359.0, notes: nil, cost: 52.44 },
  { date: '2014-02-08', odometer: 190712, gallons: 11.475, distance: 267.0, notes: nil, cost: 39.81 },
  { date: '2014-02-10', odometer: 191124, gallons: 15.124, distance: 412.7, notes: nil, cost: 54.43 },
  { date: '2014-02-17', odometer: 191474, gallons: 14.809, distance: 359.2, notes: nil, cost: 54.19 },
  { date: '2014-02-28', odometer: 191840, gallons: 14.652, distance: 356.7, notes: nil, cost: 54.78 },
  { date: '2014-03-07', odometer: 192177, gallons: 14.333, distance: 336.4, notes: nil, cost: 53.88 },
  { date: '2014-03-21', odometer: 192908, gallons: 14.869, distance: 387.4, notes: nil, cost: 55.6 },
  { date: '2014-03-28', odometer: 193159, gallons: 10.956, distance: 251.0, notes: nil, cost: 39.1 },
  { date: '2014-03-30', odometer: 193528, gallons: 13.557, distance: 368.4, notes: nil, cost: 49.2 },
  { date: '2014-04-06', odometer: 193888, gallons: 14.261, distance: 359.5, notes: nil, cost: 53.75 },
  { date: '2014-04-15', odometer: 194269, gallons: 14.471, distance: 381.2, notes: nil, cost: 54.98 },
  { date: '2014-04-27', odometer: 194620, gallons: 13.572, distance: 350.9, notes: nil, cost: 52.92 },
  { date: '2014-05-10', odometer: 195126, gallons: 0.1000, distance: 115.5, notes: nil, cost: 0 },
  { date: '2014-05-17', odometer: 195411, gallons: 10.939, distance: 283.4, notes: nil, cost: 41.01 },
  { date: '2014-05-18', odometer: 195796, gallons: 12.814, distance: 385.2, notes: nil, cost: 47.4 },
  { date: '2014-05-23', odometer: 196189, gallons: 14.718, distance: 392.8, notes: nil, cost: 56.5 },
  { date: '2014-05-29', odometer: 196583, gallons: 14.827, distance: 393.9, notes: nil, cost: 56.33 },
  { date: '2014-06-04', odometer: 196947, gallons: 13.380, distance: 364.3, notes: nil, cost: 51.63 },
  { date: '2014-06-14', odometer: 197318, gallons: 14.531, distance: 370.1, notes: nil, cost: 54.91 },
  { date: '2014-06-22', odometer: 197682, gallons: 13.783, distance: 364.0, notes: nil, cost: 51.95 },
  { date: '2014-06-24', odometer: 198089, gallons: 14.558, distance: 407.6, notes: nil, cost: 55.89 },
  { date: '2014-07-02', odometer: 198495, gallons: 15.020, distance: 405.8, notes: nil, cost: 57.66 },
  { date: '2014-07-11', odometer: 198838, gallons: 13.953, distance: 342.4, notes: nil, cost: 53.29 },
  { date: '2014-07-13', odometer: 199260, gallons: 13.458, distance: 432.3, notes: nil, cost: 49.38 },
  { date: '2014-07-21', odometer: 199631, gallons: 14.243, distance: 361.5, notes: nil, cost: 53.82 },
  { date: '2014-07-29', odometer: 200015, gallons: 14.490, distance: 383.5, notes: nil, cost: 54.47 },
  { date: '2014-08-07', odometer: 200392, gallons: 14.752, distance: 376.9, notes: nil, cost: 54.57 },
  { date: '2014-08-17', odometer: 200796, gallons: 14.957, distance: 404.0, notes: nil, cost: 55.33 },
  { date: '2014-08-28', odometer: 201190, gallons: 14.355, distance: 393.5, notes: nil, cost: 51.95 },
  { date: '2014-08-03', odometer: 201577, gallons: 13.204, distance: 387.7, notes: 'Ithaca', cost: 47.79 },
  { date: '2014-08-19', odometer: 202119, gallons: 14.102, distance: 428.4, notes: nil, cost: 50.47 },
  { date: '2014-09-16', odometer: 202337, gallons: 13.362, distance: 365.5, notes: nil, cost: 49.06 },
  { date: '2014-09-17', odometer: 202691, gallons: 12.188, distance: 354.5, notes: nil, cost: 42.89 },
  { date: '2014-09-24', odometer: 203530, gallons: 15.174, distance: 410.9, notes: nil, cost: 52.79 },
  { date: '2014-09-30', odometer: 203913, gallons: 14.114, distance: 382.8, notes: nil, cost: 50.23 },
  { date: '2014-10-07', odometer: 204282, gallons: 13.708, distance: 368.4, notes: nil, cost: 47.96 },
  { date: '2014-10-09', odometer: 204667, gallons: 13.853, distance: 385.5, notes: nil, cost: 46.81 },
  { date: '2014-10-10', odometer: 205040, gallons: 12.006, distance: 372.7, notes: nil, cost: 34.57 },
  { date: '2014-10-13', odometer: 205456, gallons: 14.323, distance: 415.8, notes: nil, cost: 44.96 },
  { date: '2014-10-16', odometer: 205887, gallons: 14.899, distance: 430.8, notes: nil, cost: 51.24 },
  { date: '2014-10-21', odometer: 206292, gallons: 15.188, distance: 405.7, notes: nil, cost: 51.62 },
  { date: '2014-10-25', odometer: 206651, gallons: 13.546, distance: 358.7, notes: nil, cost: 45.50 },
  { date: '2014-10-30', odometer: 207003, gallons: 12.232, distance: 351.6, notes: nil, cost: 46.36 },
  { date: '2014-11-02', odometer: 207350, gallons: 13.104, distance: 347.4, notes: nil, cost: 41.13 },
  { date: '2014-11-07', odometer: 207765, gallons: 15.085, distance: 414.6, notes: nil, cost: 49.16 },
  { date: '2014-11-11', odometer: 208140, gallons: 14.266, distance: 375.4, notes: nil, cost: 45.92 },
  { date: '2014-11-16', odometer: 208499, gallons: 14.189, distance: 358.7, notes: nil, cost: 45.39 },
  { date: '2014-11-21', odometer: 208877, gallons: 13.746, distance: 378.0, notes: nil, cost: 43.70 },
  { date: '2014-11-27', odometer: 209319, gallons: 13.336, distance: 442.0, notes: nil, cost: 39.06 },
  { date: '2014-11-28', odometer: 209717, gallons: 13.658, distance: 397.7, notes: nil, cost: 40.41 },
  { date: '2014-12-05', odometer: 210074, gallons: 13.647, distance: 357.0, notes: nil, cost: 42.56 },
  { date: '2014-12-11', odometer: 210441, gallons: 13.662, distance: 367.5, notes: nil, cost: 40.97 },
  { date: '2014-12-16', odometer: 210756, gallons: 11.787, distance: 314.5, notes: nil, cost: 34.64 },
  { date: '2014-12-19', odometer: 211143, gallons: 14.094, distance: 386.5, notes: nil, cost: 37.48 },
  { date: '2014-12-20', odometer: 211518, gallons: 12.996, distance: 375.4, notes: nil, cost: 35.08 },
  { date: '2014-12-23', odometer: 211856, gallons: 12.534, distance: 337.4, notes: nil, cost: 32.58 },
  { date: '2014-12-26', odometer: 212218, gallons: 13.421, distance: 362.0, notes: nil, cost: 37.54 }
]

user = User.find_or_create_by(email: 'user@example.com')

unless user.persisted?
  user.password = 'p@ssw0rd'
  user.password_confirmation = 'p@ssw0rd'
  user.name 'Test User'
  user.save!
end

user.vehicles.create!(
  brand: 'Honda',
  name: 'Accord',
  year: 2000
)

vehicle = user.vehicles.first

entries.each do |entry|
  user.gas_entries.create!(entry.merge(vehicle: vehicle))
end

