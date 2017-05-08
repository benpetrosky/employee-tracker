require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/division')
require('./lib/employee')
require('pry')
require("pg")


get("/") do
  erb(:index)
end

get('/divisions/new') do
  @divisions = Division.all()
  erb(:divisions)
end

post('/divisions') do
  name = params.fetch('name')
  division = Division.new({:name => name})
  division.save()
  erb(:success)
end

get('/divisions/:id/edit') do
  @division = Division.find(params.fetch("id").to_i())
  @employees = @division.employees()
  erb(:division)
end

post('/employees/:id') do
  id = params.fetch('id')
  @division = Division.find(id)
  description = params.fetch("description")
  #  employee = employee.new({:description => description})
  @division.employees().new({:description => description})
  @division.save()
  @employees = employee.all()
  erb(:success)
end

get('/employees/:id/edit') do
  @employee = Employee.find(params.fetch('id').to_i())
  erb(:employee_edit)
end

patch("/employees/:id") do
  description = params.fetch("description")
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.update({:description => description})
  @employees = Employee.all()
  erb(:index)
end
