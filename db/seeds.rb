# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#



# D: Create a set of example users and associated employee records
fnames = ['john','jane','jim','jenifer','paul','paula']
snames = ['murphy','slater','hayden','carrol','sinclare', 'simmons']
sex = ['M','F']

(0..20).each do |uniq_id|
  (0..5).each do |i|

    fname = fnames[rand(0..(fnames.size-1))]
    sname = snames[rand(0..(snames.size-1))]
    dob = "#{rand(1945..1985)}-#{rand(1..12)}-#{rand(1..27)}"
    password = "password"
    email = "#{fname}.#{sname}_#{uniq_id}#{dob.gsub('-','')}@example.com"

    # D: Create the employee record
    e = Employee.create!(
      fname: fname,
      sname: sname,
      sex: sex[rand(0..1)],
      dob: dob,
      join_date: "#{rand(1998..2014)}-#{rand(1..12)}-#{rand(1..27)}",
      salary: 12000 * rand(1..10)
    )
    
    # D: Create the User record
    u = User.create!(
      email: email,
      password: password,
      password_confirmation: password,
      admin: false
    )
    
    # D: Update the association
    e.user_id = u.id
    u.employee_id = e.id
    
    # D: Save the update
    e.save
    u.save
    
  end
end

# Create default user account
user_usr = User.create! :email => 'user@example.com', :password => 'topsecret', :password_confirmation => 'topsecret', :admin => false
user_emp = Employee.create! :fname => 'Damien', :sname => 'Roche', :sex => 'M', :dob => "1985-12-17", :join_date => "2014-09-01", :salary => 100
user_usr.employee_id = user_emp.id
user_emp.user_id = user_usr.id
user_emp.save
user_usr.save

# Create a default admin account
admin_usr = User.create! :email => 'admin@example.com', :password => 'topsecret', :password_confirmation => 'topsecret', :admin => true
admin_emp = Employee.create! :fname => 'Damien', :sname => 'Roche', :sex => 'M', :dob => "1985-12-17", :join_date => "2014-09-01", :salary => 100
admin_usr.employee_id = admin_emp.id
admin_emp.user_id = admin_usr.id
admin_emp.save
admin_usr.save

