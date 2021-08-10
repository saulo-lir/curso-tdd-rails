module Api
  module V1
    class FilmsController < ApplicationController
      def index
        user = find_user
        discount = user.discount

        films = Film.all.each { |film| film.add_discount(discount) }
        render json: films
      end

      private

      def find_user
        found_user = User.find_by(token: params[:user_token])
        return found_user if found_user
        
        GuestUser.new
      end
    end
  end
end
