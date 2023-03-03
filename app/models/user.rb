# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :confirmable,
         :rememberable,
         :validatable,
         :trackable

  EMAIL_FORMAT = /\A\w{1,}@\w{1,}[.][a-z]{1,}\z/

  has_many :author_tests, class_name: 'Test', dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :passed_tests, through: :test_passages, source: :test

  def tests_by_level(test_level)
    passed_tests.where(level: test_level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    check_admin
  end

  validates :first_name, presence: true, length: { in: 1..20 }
  validates :last_name, presence: true, length: { in: 1..20 }
  validates :access_level, presence: true

  private

  def check_admin
    access_level == 'Admin'
  end
end
