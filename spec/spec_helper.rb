require 'rspec'
require 'sneaker'
require 'color'
require 'pg'

DB = PG.connect(:dbname => 'sneaker_color_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM sneaker *;")
    DB.exec("DELETE FROM color *;")
  end
end