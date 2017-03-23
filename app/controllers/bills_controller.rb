class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource
  
   skip_authorize_resource :only => [:show, :create]

  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill.accessible_by(current_ability).paginate(:page => params[:page]).order('user_id').per_page(10).order(created_at: :desc).search(params[:search])#all
   
   respond_to do |format|
      format.html
      format.csv { send_data @bills.to_csv }

     end
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
  end

  def import
    Bill.import(params[:file])
    
    redirect_to root_url, notice: 'Bills imported.'
  end

  # GET /bills/new
  def new
    @bill = Bill.new
    #0.times { @bill.dvs.build}
  end

  # GET /bills/1/edit
  def edit
  end


  # POST /bills
  # POST /bills.json
  def create
    @bill = Bill.new(bill_params)
     @bill.user_id = current_user.id

    respond_to do |format|
      if @bill.save
        format.html { redirect_to @bill, notice: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit(:section, :year, :month, :dvno, :typebill, :compactor, :rock, :shelf, :bundleno, :section_id, :typebill_id, :user_id) #dvs_attributes: [:dvno])
    end
end
