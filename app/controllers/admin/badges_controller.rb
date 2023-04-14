# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show edit update update_inline destroy publish unpublish state]
  before_action :find_badges, only: %i[index update_inline]

  def index; end

  def new
    @badge = Badge.new
  end

  def create
    @badge = current_user.author_badges.new(badge_params)
    fill_requirement_data
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

  def fill_requirement_data
    params[:badge].each do |key,value|
      if key.include?('required_') && value.present?
        @badge.requirement_data = value
        return
      end
    end
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def find_badges
    @badges = Badge.all
  end

  def badge_params
    params.require(:badge).permit(:title, :picture, :requirement_id)
  end
end
