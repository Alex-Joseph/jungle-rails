class OrderIdsController < ApplicationController
  before_action :set_order_id, only: [:show, :edit, :update, :destroy]

  # GET /order_ids
  # GET /order_ids.json
  def index
    @order_ids = OrderId.all
  end

  # GET /order_ids/1
  # GET /order_ids/1.json
  def show
  end

  # GET /order_ids/new
  def new
    @order_id = OrderId.new
  end

  # GET /order_ids/1/edit
  def edit
  end

  # POST /order_ids
  # POST /order_ids.json
  def create
    @order_id = OrderId.new(order_id_params)

    respond_to do |format|
      if @order_id.save
        format.html { redirect_to @order_id, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order_id }
      else
        format.html { render :new }
        format.json { render json: @order_id.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_ids/1
  # PATCH/PUT /order_ids/1.json
  def update
    respond_to do |format|
      if @order_id.update(order_id_params)
        format.html { redirect_to @order_id, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_id }
      else
        format.html { render :edit }
        format.json { render json: @order_id.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_ids/1
  # DELETE /order_ids/1.json
  def destroy
    @order_id.destroy
    respond_to do |format|
      format.html { redirect_to order_ids_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_id
      @order_id = OrderId.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_id_params
      params.require(:order_id).permit(:email)
    end
end
