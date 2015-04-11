# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

fnames = ['john','jane','jim','jenifer','paul','paula']
snames = ['murphy','slater','hayden','carrol','sinclare']
sex = ['M','F']

50.times do |i|
  Employee.create(
    fname: fnames[rand(0..fnames.size)],
    sname: snames[rand(0..snames.size)],
    sex: sex[rand(0..1)],
    dob: "#{rand(1945..1985)}-#{rand(1..12)}-#{rand(1..27)}",
    join_date: "#{rand(1998..2014)}-#{rand(1..12)}-#{rand(1..27)}",
    salary: 12000 * rand(1..10)
  )
end