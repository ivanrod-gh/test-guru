module BadgesHelper
  def badge_header(badge)
    badge.persisted? ? I18n.t('admin.badges.edit.header') : I18n.t('admin.badges.new.header')
  end
end
