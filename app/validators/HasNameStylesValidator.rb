class HasNameStylesValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
<<<<<<< HEAD
    if (value.nil?)
       record.errors.add(:name, "doesn't be empty") 
=======
    if (value.nil? || value == "")
      return record.errors.add(:name, "doesn't be empty") 
>>>>>>> Validation
     end
     value.split.each { |x|
       if x.match(/(^[A-Z])([a-z]+)/).nil?
          record.errors.add(attribute ,:blank, message: "doesn't fit the style")
       end
     } 
  end
end