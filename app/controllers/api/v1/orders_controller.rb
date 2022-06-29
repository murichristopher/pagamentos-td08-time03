class Api::V1::OrdersController < ActionController::API
  def create
    @order = Order.new(orders_params)
    @order.client = Client.find_by(registration_number: params[:client][:registration_number])
    @order.exchange_rate = ExchangeRate.current

    if @order.save
      render status: 201
    elsif @order.client.nil?
      render status: 412, json: { errors: ['Usuário não encontrado'] }
    else
      render status: 412, json: { errors: @order.errors.full_messages }
    end
  end 

  private

  def orders_params
    params.permit(:order_code, :transaction_total_value)
  end
end
