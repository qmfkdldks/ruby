require 'ostruct'

# Do experiment null context and oop principle
class JobSite
  attr_reader :contact

  def initialize(contact = nil)
    contact = contact || NullContext.new(Contact)
  end

  # The problem we are trying to solve.
  # Normally We need to check whether contact exists 
  # to call name in a secure way.
  def contact_name
    if contact
      contact.name
    else
      'no name'
    end
  end

  # You solve it assigning NullContext when object not exists.
  # You can ommit if statment 'cause, because NullContext will
  # Return always somethig.
  # But Null Context Class should implement all methods that
  # real class do have, which turns out to be repetitive works.
  def contact_phone
    contact.phone
  end

  # Try to mix with delegate and null context pattern.
  # Actually delegate is from Rails App. 
  # delegate :email, to: :contact, prefix: :contact
end

# NullContext
class NullContext
  attr_reader :klass

  def initialize(klass)
    @klass = klass
  end

  # This should be implemented if you don't use metaprogramming.
  def phone
    'no phone'
  end

  # Metaprogramming to respond on evey undefined methods.
  # Every methods defined in real class will return "no something".
  def method_missing(method_name, *_args)
    methods = klass.instance_methods(false)

    if methods.include?(method_name)
      "no #{method_name}"
    else
      super
    end
  end

  def respond_to_missing?(method, *_args); end
end

# Real Contact Class
class Contact < OpenStruct
  def name
  end

  def phone
  end

  def email
  end
end
