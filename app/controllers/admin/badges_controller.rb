class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badges_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t('.success_create')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @badge.update(badges_params)
      redirect_to [:admin, @badge], notice: t('.success_update')
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('.success_destroy')
  end

  private

  def badges_params
    params.require(:badge).permit(:name, :image, :rule, :rule_parameter)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end
end
