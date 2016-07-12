class TodoItem
  include Listable
  attr_reader :description, :due, :priority
  @@allowed_priority_types = ["low", "medium","high", nil]

  def validate(priority)
    unless (@@allowed_priority_types.include?(priority))
      raise UdaciListErrors::InvalidPriorityValue
    end
  end
  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Date.parse(options[:due]) : options[:due]
    validate(options[:priority])
    @priority = options[:priority]
  end

  def details
    format_description(@description) + "due: " +
    format_date(:due => @due) +
    format_priority(@priority)
  end
end
