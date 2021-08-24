require 'swagger_helper'

describe 'Home API' do

    path '/hello' do
      get 'Get the Home#HelloWorld' do
        tags 'Home'
        consumes 'application/json'
        
        response '200', 'You get the hello world!' do
            schema type: :object,
                    properties: {
                        msg: { type: :string }
                    }
          run_test!
        end

      end
    end

  end