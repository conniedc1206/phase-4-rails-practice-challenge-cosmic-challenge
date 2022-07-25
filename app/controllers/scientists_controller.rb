class ScientistsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    
    # GET /scientists
    def index
        scientists = Scientist.all
        render json: scientists
    end

    # GET /scientists/:id
    def show
        scientist = Scientist.find(params[:id])
        render json:scientist, serializer: ScientistShowSerializer
    end

    # POST /scientists
    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    # PATCH /scientists/:id
    def update
        scientist = Scientist.find(params[:id])
        scientist.update!(scientist_params)
        render json: scientist, status: :accepted
    end

    # DELETE /scientists/:id
    def destroy
        scientist = Scientist.find(params[:id])
        scientist.destroy
        head :no_content
    end

    private

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

    def record_not_found(error)
        render json: { error: "#{error.model} not found" }, status: :not_found
    end

    def record_invalid(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
