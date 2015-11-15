json.success "#{@employee.username} logged in successfully"
json.username @employee.username
json.auth_token @employee.auth_token
json.gravatar_url @url