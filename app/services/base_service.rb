# frozen_string_literal: true

class BaseService
  attr_accessor :params

  def self.call(params = {})
    new(params).call
  end

  def initialize(params)
    @params = params
  end

  def call
    raise NotImplementedError
  end
end
