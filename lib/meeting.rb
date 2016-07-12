class MeetingItem
  include Listable
  attr_reader :description, :date
  CONST_TYPE = "meeting"
  
  def initialize(description, options={})
    @description = description
    @date = Chronic.parse(options[:date]) if options[:date]
  end

  def details
    format_description(@description, type = CONST_TYPE) +
    "meeting date: " +
    format_date(:date => @date)
  end
  def type
    CONST_TYPE
  end
end
