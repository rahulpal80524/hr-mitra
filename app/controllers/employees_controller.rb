class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :show, :destroy]

  def index
    begin
      # Initialize Redis
      redis = Redis.new

      # Check if employees are cached in Redis
      if redis.exists("employees")  && redis.exists("employees") != 0
        employees_json = JSON.parse(redis.get("employees"))
        @employees = employees_json.map do |employee|
          Employee.new(
            id: employee['id'],
            first_name: employee['first_name'],
            last_name: employee['last_name'],
            email: employee['email'],
            city: employee['city'],
            state: employee['state'],
            country: employee['country'],
            pincode: employee['pincode'],
            phone_number: employee['phone_number'],
            address_line_1: employee['address_line_1'],
            address_line_2: employee['address_line_2'],
            created_at: Time.parse(employee['created_at']),
            updated_at: Time.parse(employee['updated_at'])
          )
        end
      else
        # Fetch employees from the database
        @employees = Employee.all

        # Store employees in Redis for caching with a TTL of 1 hour
        redis.set("employees", @employees.to_json, ex: 1.hour)
      end
    rescue => e
      # Log the error
      Rails.logger.error "Error in EmployeesController#index: #{e.message}"
      # Render an error page or handle the error as appropriate
      render plain: "An error occurred while processing your request", status: :internal_server_error
    end
  end


  def new
    @employee  = Employee.new
    respond_to do |format|
      format.html # Render HTML normally
      format.js   # Render JavaScript response (for AJAX request)
    end
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      # Clear the employees cache when a new employee is created
      redis.del("employees")
      # redirect_to employees_path, notice: 'Employee has been created'
      respond_to do |format|
        format.html { redirect_to employees_path }
        format.js   # Render JavaScript response (for AJAX request)
      end
    else
      render :new
    end
  end

  def edit

  end

  def show
  end

  def destroy
    if @employee.destroy
      redirect_to employees_path, notice: 'Employee has been deleted'
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path, notice: 'Employee has been updated'
    else
      render :edit
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :city, :state, :country, :pincode, :phone_number, :address_line_1, :address_line_2)
  end

  def set_employee
      @employee = Employee.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
     redirect_to employees_path, notice: "The employee you were looking for could not be found."
  end

  def redis
    @redis ||= Redis.new
  end

end
