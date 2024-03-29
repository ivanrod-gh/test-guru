# frozen_string_literal: true

class Test < ApplicationRecord
  QUESTIONS_MIN_COUNT = 1
  QUESTIONS_ANSWERS_MIN_COUNT = 2
  QUESTIONS_RIGHT_ANSWERS_MIN_COUNT = 1
  MAXIMUM_QUESTION_SHORT_BODY_LENGTH = 5
  MINIMUM_EXECUTION_TIME = 5

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :test_passages, dependent: :destroy
  has_many :passed_users, through: :test_passages, source: :user
  has_many :questions, dependent: :destroy

  scope :joins_category_by_title, lambda { |category_title|
                                    joins(:category)
                                      .where(categories: { title: category_title })
                                  }
  scope :simples, -> { where(level: 0..1) }
  scope :averages, -> { where(level: 2..4) }
  scope :hards, -> { where(level: 5..Float::INFINITY) }
  scope :published, -> { where(published: true) }

  scope :joins_test_passages_by_category_id, lambda { |category_id|
                                               joins(:test_passages).where(category_id: category_id)
                                             }

  scope :passage_successful_by_user, lambda { |user|
                                       where("test_passages.user_id = ? AND successful = true", user.id)
                                     }

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :validate_execution_time_if_specified

  def self.test_names_reversed_by_category(category_title)
    joins_category_by_title(category_title).order(title: :desc).pluck(:title)
  end

  def calculate_test_passable
    return if destroyed?

    check_test_questions_count
    check_test_questions_answers
    if errors.errors.empty? && published != true
      update(published: true)
    elsif errors.errors.present? && published != false
      update(published: false)
    end
  end

  private

  def validate_execution_time_if_specified
    errors.add(:base, I18n.t('admin.tests.state.minimum_execution_time')) if time && time < MINIMUM_EXECUTION_TIME
  end

  def check_test_questions_count
    if questions.count < QUESTIONS_MIN_COUNT
      errors.add(:base, I18n.t(
                          'admin.tests.state.questions_count',
                          count: QUESTIONS_MIN_COUNT
                        ))
    end
  end

  def check_test_questions_answers
    questions.each do |question|
      check_answers_count(question)
      check_right_answers_count(question)
    end
  end

  def check_answers_count(question)
    return unless question.answers.count < QUESTIONS_ANSWERS_MIN_COUNT

    body = chop_string_length(question.body)
    errors.add(:base, I18n.t(
                        'admin.tests.state.test_question_answers_count',
                        body: body,
                        count: QUESTIONS_ANSWERS_MIN_COUNT
                      ))
  end

  def chop_string_length(string)
    if string.length > MAXIMUM_QUESTION_SHORT_BODY_LENGTH
      "#{string[0, MAXIMUM_QUESTION_SHORT_BODY_LENGTH]}..."
    else
      string
    end
  end

  def check_right_answers_count(question)
    return unless question.answers.where(correct: 'true').count < QUESTIONS_RIGHT_ANSWERS_MIN_COUNT

    body = chop_string_length(question.body)
    errors.add(:base, I18n.t(
                        'admin.tests.state.test_question_right_answers_count',
                        body: body,
                        count: QUESTIONS_RIGHT_ANSWERS_MIN_COUNT
                      ))
  end
end
