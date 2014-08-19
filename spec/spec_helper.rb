require 'rspec'
require 'sneaker'
require 'color'
require 'sneaker_colorway'
require 'pg'

DB = PG.connect(:dbname => 'sneaker_color_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM sneaker *;")
    DB.exec("DELETE FROM color *;")
    DB.exec("DELETE FROM sneaker_colorway*;")
  end
end