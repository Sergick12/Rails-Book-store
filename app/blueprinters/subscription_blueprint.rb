class SubscriptionBlueprint < Blueprinter::Base
  identifier :id

  fields :is_active, :start, :finish, :subscriber_id
  association :subscriber, blueprint: SubscriberBlueprint
  association :book, blueprint: BookBlueprint

end