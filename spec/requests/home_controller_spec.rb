# spec/integration/hello_controller_spec.rb
# https://github.com/rswag/rswag
# run make rswag to generate swagger.yml

require 'swagger_helper'

describe 'Hello API' do

  path '/hello' do

    get 'Get the Home#HelloWorld' do
      tags 'Home'
      consumes 'application/json'
      
      response '200', 'Hello World!' do
        schema type: :object,
                  properties: {
                      msg: {
                              type: :string,
                              example: "Hello World!"
                          }
                  }
        
        run_test!
      end
      
    end

  end
  
end