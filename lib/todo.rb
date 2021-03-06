class TodoItem
  include Listable
  attr_reader :description, :due, :priority
  @@allowed_priority_types = ["low", "medium", "high", nil]
  CONST_TYPE = "todo"

  def validate(priority)
    unless (@@allowed_priority_types.include?(priority))
      raise UdaciListErrors::InvalidPriorityValue
    end
  end
  def initialize(description, options={})
    @description = description
    @due = Chronic.parse(options[:due])
    validate(options[:priority])
    @priority = options[:priority]
  end

  def details
    format_description(@description, type = CONST_TYPE) + "due: " +
    format_date(:due => @due) +
    format_priority(@priority)
  end
  def type
    CONST_TYPE
  end
end
