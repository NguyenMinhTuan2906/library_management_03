class Admin::PublishersController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :load_publisher, except: [:new, :index, :create]
  layout "admin"

  def index
    if params[:q].present?
      @publishers = Publisher.select(:id, :name, :address).includes(:books)
        .search(params[:q]).order(name: :asc).paginate page: params[:page],
        per_page: Settings.paginate.per_page
    else
      @publishers = Publisher.select(:id, :name, :address).includes(:books)
        .order(name: :asc).paginate page: params[:page],
        per_page: Settings.paginate.per_page
    end
  end

  def show
  end

  def new
    @publisher = Publisher.new
  end

  def edit
  end

  def create
    @publisher = Publisher.new publisher_params
    if @publisher.save
      flash[:success] = t ".publisher"
      redirect_to admin_publishers_url
    else
      render :new
    end
  end

  def update
    if @publisher.update_attributes publisher_params
      flash[:success] = t ".success"
      redirect_to admin_publisher_url
    else
      render :edit
    end
  end

  def destroy
    if @publisher.books.any?
       flash[:danger] = t ".delete_fail"
    else
      if @publisher.destroy
        flash[:success] = t ".delete"
      else
        flash[:danger] = t ".delete_fail"
      end
    end
    redirect_to admin_publishers_url
  end

  private

  def publisher_params
    params.require(:publisher).permit :name, :description, :address
  end

  def load_publisher
    @publisher = Publisher.find_by id: params[:id]
    unless @publisher
      flash[:danger] = t ".none"
      redirect_to admin_publishers_url
    end
  end
end
