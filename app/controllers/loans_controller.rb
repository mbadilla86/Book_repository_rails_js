class LoansController < ApplicationController
  before_action :set_loan, only: %i[ show edit update destroy ]
  before_action :set_books, :set_users, only: %i[ new edit]

  # GET /loans or /loans.json
  def index
    @loans = Loan.active
  end

  # GET /loans/1 or /loans/1.json
  def show
  end

  # GET /loans/new
  def new
    @loan = Loan.new(dead_line: Date.today + 1.day)
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans or /loans.json
  def create
    @loan = Loan.new(loan_params.merge(check_out: Date.today))

    respond_to do |format|
      if @loan.save
        format.html { redirect_to @loan, notice: "Loan was successfully created." }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1 or /loans/1.json
  def update
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to @loan, notice: "Loan was successfully updated." }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1 or /loans/1.json
  def destroy
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to loans_url, notice: "Loan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    def set_users
      @users = User.all.map {|user| [user.full_name, user.id]}
    end

    def set_books
      @books = Book.pluck(:title, :id)
    end

    # Only allow a list of trusted parameters through.
    def loan_params
      params.require(:loan).permit(:dead_line, :user_id, :book_id)
    end
end
