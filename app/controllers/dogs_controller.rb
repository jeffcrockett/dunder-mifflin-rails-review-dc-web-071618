class DogsController < ApplicationController
    before_action :set_dog, only: [:show, :edit, :update]
    before_action :get_employees, only: [:new, :edit]

    def new 
    end

    def show 
    end 

    def create 
        @dog = Dog.create(dog_params)
        if @dog.save 
            redirect_to dog_path(@dog)
        else
            render :new
        end
    end

    private

    def dog_params 
        params.require(:dog).permit(:name, :age, :breed, employee_ids: [])
    end

    def set_dog 
        @dog = Dog.find(params[:id])
    end

    def get_employees 
        @employees = Employee.all
end
