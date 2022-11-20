# frozen_string_literal: true

class HasNameStylesValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return record.errors.add(:name, "doesn't be empty") if value.nil? || value == ''

    value.split.each do |x|
      record.errors.add(attribute, :blank, message: "doesn't fit the style") if x.match(/(^[A-Z])([a-z]+)/).nil?
    end
  end
end
