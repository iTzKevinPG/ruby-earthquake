class ApplicationController < ActionController::API
    def index
        render json: { message: 'Is healty!' }
    end
end
