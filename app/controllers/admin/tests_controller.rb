# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show edit update update_inline destroy publish unpublish state]
  before_action :find_tests, only: %i[index update_inline]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.author_tests.new(test_params)
    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  def show; end
  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def publish
    @test.calculate_test_passable
    if @test.published
      flash.now[:notice] = t('.success')
    else
      flash.now[:alert] = t('.requirements')
    end
    render :show
  end

  def unpublish
    @test.update(published: false)
    flash.now[:alert] = t('.success')
    render :show
  end

  def state
    @test.calculate_test_passable
    render :show
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :category_id, :time)
  end

  def rescue_with_test_not_found
    render plain: "Ошибка: Тест не найден"
  end
end
