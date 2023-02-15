# frozen_string_literal: true

require 'digest/sha1'

class User < ApplicationRecord
  has_secure_password

  has_many :author_tests, class_name: 'Test', dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :passed_tests, through: :test_passages, source: :test

  def tests_by_level(test_level)
    passed_tests.where(level: test_level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validate :validate_email_format, on: :create

  private

  def validate_email_format
    errors.add(:base, "Неверный формат электронной почты. Должно быть, например: some_example@mail.net") unless
      email =~ /^\w{1,}@\w{1,}[.][a-z]{1,}$/
  end
end
