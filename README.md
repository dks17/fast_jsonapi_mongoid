# README
```console
rails new fast_jsonapi_mongoid --api --skip-active-record
```
add gems:
```ruby

gem 'mongoid', '~> 6'
gem 'fast_jsonapi', '~> 1.1'
```

```console
bundle install
```

add mongoid database configuration:
```console
rails g mongoid:config
```

```ruby
# application.rb

Mongoid.load!('./config/mongoid.yml')
config.generators { |g| g.orm :mongoid }
```

generate new resource:
```console
rails g scaffold Book title description published:date
```

fix controller test:
```ruby
# books_controller_test.rb
  setup do
    # @book = books(:one)
    @book = Book.create(title: 'kos', description: 'sok', published: 2018-03-21)
  end
```

run tests:
```console
rake test

rake test
Run options: --seed 61023

# Running:

E

Error:
BooksControllerTest#test_should_create_book:
ActiveRecord::ConnectionNotEstablished: No connection pool with 'primary' found.
    


bin/rails test test/controllers/books_controller_test.rb:14

E

Error:
BooksControllerTest#test_should_show_book:
ActiveRecord::ConnectionNotEstablished: No connection pool with 'primary' found.
    


bin/rails test test/controllers/books_controller_test.rb:22

E

Error:
BooksControllerTest#test_should_update_book:
ActiveRecord::ConnectionNotEstablished: No connection pool with 'primary' found.
    


bin/rails test test/controllers/books_controller_test.rb:27

E

Error:
BooksControllerTest#test_should_get_index:
ActiveRecord::ConnectionNotEstablished: No connection pool with 'primary' found.
    


bin/rails test test/controllers/books_controller_test.rb:9

E

Error:
BooksControllerTest#test_should_destroy_book:
ActiveRecord::ConnectionNotEstablished: No connection pool with 'primary' found.
    


bin/rails test test/controllers/books_controller_test.rb:32



Finished in 0.097911s, 51.0668 runs/s, 0.0000 assertions/s.
5 runs, 0 assertions, 0 failures, 5 errors, 0 skips
```

change `fast_jsonapi` gem with fix:
```ruby
# gem 'fast_jsonapi', '~> 1.1'
gem 'fast_jsonapi', git: 'https://github.com/dks17/fast_jsonapi.git', branch: 'fix_activerecord'
```

run tests again:
```console
bundle install

rake test
Run options: --seed 934

# Running:

.....

Finished in 0.149939s, 33.3469 runs/s, 46.6857 assertions/s.
5 runs, 7 assertions, 0 failures, 0 errors, 0 skips

```