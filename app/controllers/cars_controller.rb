class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  # While I see that you are trying to use before_action to make your code more DRY,
  # for readability, I would just repeat the
  #
  #   @car = Car.find(params[:id])
  #
  # code block in each one of those methods


  # Also, it looks like you used rails g controller to make this file. While that is
  # acceptable, you need to go clean out all of the unneccessary code comments /
  # code that it generated as well (such as the render json methods, unused .coffee
  # files in javascripts, and the unused .json_builder files in views). Also make sure
  # you read through all of your code and understand anything that the generator set up
  # for you.

  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = current_user.cars.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = current_user.cars.create!(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    @cars = Car.find(params[:id])
    if @cars.user == current_user
      @cars.update(car_params)
    else
      flash[:alert] = "Only the author of the cars can Update"
    end
    redirect_to cars_path
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @cars = Car.find(params[:id])
    if @cars.user == current_user
      @cars.destroy
    else
      flash[:alert] = "Only the author of the cars can delete"
    end
    redirect_to cars_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:title, :body, :make, :model, :year, :price, :seller_name, :seller_phone, :photo_url)
    end
end
