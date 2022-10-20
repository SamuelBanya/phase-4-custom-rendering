class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    # render json: cheeses
    # Revision to include 'only:' built-in serializer to avoid showing the ':created_at' and ':updated_at' 
    # symbol related data

    # NOTE: Commented out since I later use ':exclude' serializer
    # render json: cheeses, only: [:id, :name, :price, :is_best_seller]

    # NOTE: Using ':except' serializer, which does the same thing as the above but flipped:
    render json: cheeses, except: [:created_at, :updated_at]
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    else 
      render json: { error: "Cheese not found" }, status: :not_found
    end
  end

end
