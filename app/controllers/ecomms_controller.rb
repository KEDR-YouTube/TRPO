class EcommsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    
    def index
      @ecomm = Ecomm.all
    end
  
    def show
      @ecomm = Ecomm.find(params[:id])
    end
  
    def new
      @ecomm = Ecomm.new
    end
  
    def create
      @ecomm = Ecomm.new(ecomm_params)
      @ecomm.user = current_user
      
      if @ecomm.save
        redirect_to @ecomm, notice: 'Товар успешно создан.'
      else
        render :new, status: 422
      end
    end
  
    def edit
      @ecomm = Ecomm.find(params[:id])
    end
  
    def update
      @ecomm = Ecomm.find(params[:id])
      
      if @ecomm.update(ecomm_params)
        redirect_to @ecomm, notice: 'Товар успешно загружен.'
      else
        render :edit
      end
    end
  
    def destroy
      @ecomm = Ecomm.find(params[:id])
      @ecomm.destroy
      
      redirect_to ecomms_url, notice: 'Товар успешно удален.'
    end
  
    private
  
    def ecomm_params
      params.require(:ecomm).permit(:title, :picture, :description, :price, :location)
    end
  end