require 'swagger_helper'

describe 'Home Index API' do

    path '/' do
  
      get 'Get the Home#index' do
        tags 'Home'
        consumes 'application/json'
        
        response '201', 'You get the index' do
            schema type: :object,
                    properties: {
                        hello_world: { type: :string }
                    }
          run_test!
        end

      end
    end

  end