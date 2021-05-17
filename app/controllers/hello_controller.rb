class HelloController < ApplicationController

    def world
        render json: { msg: "Hello World!" }, status: 200
    end

    def index
        redirect_to '/api-docs/index.html'
    end

end
