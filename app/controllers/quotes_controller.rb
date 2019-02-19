class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.all
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    session[:quote_params] ||= {}
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json
  def create
    session[:quote_params].deep_merge!(params[:quote]) if params[:quote]
    @quote = Quote.new(session[:quote_params])
    @quote.current_step = session[:order_step]
    if @quote.valid?
      if params[:back_button]
        @quote.previous_step
      elsif @quote.last_step?
        @quote.save
      else
        @quote.set_q_key unless @quote.first_step?
        @quote.next_step
      end
      session[:order_step] = @quote.current_step
    end
    if @quote.new_record?
      render 'new'
    else
      session[:order_step] = session[:quote_params] = nil
      flash[:notice] = "Quote Saved"
      redirect_to @quote
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # def set_q_key
    #   binding.pry
    #   @quote.q_key = SecureRandom.urlsafe_base64(nil, false)
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.permit(:back_button, :user_details, :user_name, :from_date, :to_date,
        :q_key, :user_password, :user_email, :user_phone, :cost,
        subscription_attributes: [:name, :daily_rate, :from_date, :to_date])
    end
end
