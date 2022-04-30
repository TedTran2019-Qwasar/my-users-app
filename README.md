# my-users-app
A rudimentary implementation of the MVC architecture using Sinatra. 
Done in Ruby ver 3.0.1

Project Setup
1. bundle install
2. thin start

A brief reminder
1. Do commands from root directory
2. You are emulating the browser using curl, hence the need for a cookie file
  
  2a. curl -c cookie.txt -b cookie.txt to write and read to the same cookie store like browsers do

Use
1. Create User: curl -X POST http://localhost:3000/users -d firstname=Ted -d lastname=Tran -d age=27 -d email=Ted@gmail.com -d password=password

  1a. Creating user DOESN'T log you in. 

2. Get all Users: curl http://localhost:3000/users

3. Sign In: curl -c cookie.txt -b cookie.txt -X POST http://localhost:3000/sign_in -d email='Ted@gmail.com' -d password='password'

4. Sign Out: curl -c cookie.txt -b cookie.txt -X DELETE http://localhost:3000/sign_out

5. Update Password: curl -c cookie.txt -b cookie.txt -X PUT http://localhost:3000/users -d password=password2

6. Delete current user and logout: curl -c cookie.txt -b cookie.txt -X DELETE http://localhost:3000/users

7. Access index view: curl http://localhost:3000/ (Or visit the page in browser)
