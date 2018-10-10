params = {
  email: 'admin@gmail.com',
  password: '111111',
  password_confirmation: '111111',
  name: 'Admin',
  surname: 'Admin'
}

admin = User.new(params)
admin.skip_confirmation!
if admin.save
  puts 'Admin was added into the database!'
else
  puts 'Admin was not added into the database!'
  puts 'Errors:'
  puts admin.errors.full_messages.join(', ')
end
