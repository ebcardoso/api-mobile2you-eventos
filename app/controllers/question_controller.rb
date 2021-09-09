class QuestionController < ApplicationController
    skip_before_action :authenticate_request

    def question1
        @x = params[:x]
        @y = params[:y]
        @w = params[:w]

        numbers = []

        for @n in @x..@y do
            if @n % @w == 0
                numbers.push(@n)
            end
        end

        render json: {"numbers": numbers}
    end
end
