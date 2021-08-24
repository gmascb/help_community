class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show update destroy ]

  # GET /customers
  # GET /customers.json
  def index
    render json: Customer.all, status: 200
  end

  def show
    render json: @customer, status: 200
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: @customer, status: :created
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @customer.update(customer_params)
      render json: @customer, status: 201 
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy

    render json: nil, status: 204 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:name)
    end
end
