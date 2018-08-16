class EmployeesController < ApplicationController
     before_action :set_employee, only: [:show, :edit, :update, :destroy]
     before_action :get_dogs, only: [:new, :edit]

     def index 
        @employees = Employee.all
     end

     def show 
     end

     def new 
        @employee = Employee.new
     end

     def create 
        @employee = Employee.create(employee_params)
        # binding.pry
        if @employee.save 
            redirect_to employee_path(@employee)
        else
            render :new 
        end
    end

     def edit 
     end

     def update 
        @employee.update(employee_params)
        if @employee.save 
            redirect_to employee_path(@employee)
        else
            render :edit
        end

     end

     def destroy 
        @employee.destroy
        redirect_to employees_path
     end
        

    private 

    def employee_params 
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end

    def set_employee 
        @employee = Employee.find(params[:id])
    end

    def get_dogs
        @dogs = Dog.all 
    end

   
    
end
