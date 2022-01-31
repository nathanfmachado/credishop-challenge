class ProponentsController < ApplicationController
  before_action :set_proponent, only: %i[show edit update destroy]

  # GET /proponents or /proponents.json
  def index
    @proponents = Proponent.all.page(params[:page])
  end

  # GET /proponents/1 or /proponents/1.json
  def show; end

  # GET /proponents/new
  def new
    @proponent = Proponent.new
    @proponent.addresses.build
    2.times { @proponent.contacts.build }

    @states = State.all
    @phone_type_enum = PhoneTypeEnum.to_a
  end

  # GET /proponents/1/edit
  def edit; end

  # POST /proponents or /proponents.json
  def create
    @proponent = Proponent.new(proponent_params)

    respond_to do |format|
      if @proponent.save
        format.html { redirect_to proponent_url(@proponent), notice: "Proponente criado com Sucesso!" }
        format.json { render :show, status: :created, location: @proponent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proponent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proponents/1 or /proponents/1.json
  def update
    respond_to do |format|
      if @proponent.update(proponent_params)
        format.html { redirect_to proponent_url(@proponent), notice: "Proponente atualizado com Sucesso!." }
        format.json { render :show, status: :ok, location: @proponent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proponent.errors, status: :unprocessable_entity }
      end
    end
  end

  def calculate_inss_discount
    return unless params["salary"].present?

    inss_discount = CalculateInssDiscountJob.perform_now(params["salary"].to_f)
    render json: { inss_discount: inss_discount }.to_json
  end

  # DELETE /proponents/1 or /proponents/1.json
  def destroy
    @proponent.destroy

    respond_to do |format|
      format.html { redirect_to proponents_url, notice: "Proponent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_proponent
    @proponent = Proponent.find(params[:id])
    @address = @proponent.addresses
    @contacts = @proponent.contacts
  end

  # Only allow a list of trusted parameters through.
  def proponent_params
    params.require(:proponent).permit(
      :name, :cpf, :birth_date, :salary, :inss_discount,
      addresses_attributes: %i[
        street number neighborhood city state_id cep
      ],
      contacts_attributes:  %i[
        phone phone_type
      ]
    )
  end
end
