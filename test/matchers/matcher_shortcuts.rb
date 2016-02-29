def redirect_to_login
  redirect_to('the login path') { login_path }
end

def redirect_to_root
  redirect_to('the root path') { root_path }
end

def redirect_to_user_index
  redirect_to('the user index') { users_path }
end
