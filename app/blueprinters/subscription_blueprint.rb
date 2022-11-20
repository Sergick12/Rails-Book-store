# frozen_string_literal: true

class SubscriptionBlueprint < Blueprinter::Base
  identifier :id

  fields :is_active, :start, :finish, :subscriber_id
  association :book, blueprint: BookBlueprint
end
