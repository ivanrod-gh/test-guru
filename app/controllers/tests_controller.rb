# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_tests, only: %i[index]

  def index; end

  private

  def find_tests
    @tests = Test.all
  end
end
