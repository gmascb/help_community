# spec/integration/hello_controller_spec.rb
# https://github.com/rswag/rswag
# run make rswag to generate swagger.yml

require 'swagger_helper'

describe 'Customer API' do

  before(:each) {
    @customer = Customer.find_or_create_by!(name: "Steve Jobs")
  }

  path '/customers' do
    get 'Get all Customers' do
      tags 'Customer'
      consumes 'application/json'
      
      response '200', 'customer#index' do
        schema type: :array,
                items: {
                    type: :object,
                    properties: {
                        name: {
                                type: :string,
                                example: "Steve Jobs"
                            }
                    }
                }
          run_test!
      end
    end
  end

  path '/customers/{id}' do
    get 'Get Customer' do
        tags 'Customer'
        consumes 'application/json'
        
        parameter name: 'id', :in => :path, :type => :number

        response '200', 'customer#show' do
           schema type: :object,
                  properties: {
                      name: {
                              type: :string,
                              example: "Steve Jobs"
                          }
                  }

            let(:id) { @customer.id } 

            run_test!
        end
    end
  end

  path '/customers' do
    post 'Create Customer' do
        tags 'Customer'
        consumes 'application/json'
        
        parameter name: :customer, in: :body, schema: {
          type: :object,
          properties: {
              name: {
                      type: :string,
                      example: "Steve Jobs",
              }    
          },
          required: %w[name]
        }

        response '201', 'customer#create' do
            
          let(:customer) {
              {
                name: "Steve Jobs"
              }
          }

          run_test!
        end
    end
  end

  path '/customers/{id}' do
    delete 'Delete Customer' do
        tags 'Customer'
        consumes 'application/json'
        
        parameter name: 'id', :in => :path, :type => :number

        response '204', 'customer#delete' do

            let(:id) { Customer.find_or_create_by!(name: "Bill Gastes" ).id }

            run_test!
        end
    end
  end
  
end