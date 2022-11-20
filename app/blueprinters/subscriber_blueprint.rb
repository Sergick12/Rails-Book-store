# frozen_string_literal: true

class SubscriberBlueprint < Blueprinter::Base
  fields :name
  association :subscriptions, blueprint: SubscriptionBlueprint
end
