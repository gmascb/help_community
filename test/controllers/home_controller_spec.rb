# spec/integration/hello_controller_spec.rb
# https://github.com/rswag/rswag
require 'swagger_helper'

describe 'Hello API' do

  path '/hello' do

    get 'Get the Home#HelloWorld' do
      tags 'Home'
      consumes 'application/json'
      
      response '200', 'blog created' do
        
        run_test!
      end
      
    end

  end
  
end