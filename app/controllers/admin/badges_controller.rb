# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show edit update update_inline destroy publish unpublish state]
  before_action :find_badges, only: %i[index update_inline]

  def index; end

  def new
    @badge = Badge.new
  end

  def create
    fill_badge_data

    if @badge.save
      redirect_to admin_badge_path(@badge), notice: t('.success')
    else
      render :new
    end
  end

  def show; end
  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def fill_badge_data
    @badge = current_user.author_badges.new(badge_params)
    case @badge.requirement_id
    when 1..2
      @badge.requirement_data = params[:badge][:test_id]
    when 3
      @badge.requirement_data = params[:badge][:category_id]
    when 4
      @badge.requirement_data = (params[:badge][:percent] == "completely" ? 100 : 50)
    end
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def find_badges
    @badges = Badge.all
  end

  def badge_params
    params.require(:badge).permit(:title, :picture, :requirement_id, :requirement_data)
  end
end
