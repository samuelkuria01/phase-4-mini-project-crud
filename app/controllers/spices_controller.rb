class SpicesController < ApplicationController

    def index 
        spices = Spice.all
        render json: spices
    end


        #Get/spices/:id
    def show
        spice = Spice.find_by(id: params[:id])
        if spice
            render json: spice
        else
            render json: {error: "Spice not find"}, status: :not_found
        end
    end

    #Post/spice/:id
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    #destroy
    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.destroy
            head :no_content
        else
            rendor json:{error: "Spice not found"}
        end
    end

    #update
    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(spice_params)
            render json: spice, status: :accepted
        else
            rendor json: {error: "Spice not found"}, status: :not_found
        end
    end


    #all methods below are private
    private

        def spice_params
            params.permit(:title, :description, :notes, :rating)
        end

end
