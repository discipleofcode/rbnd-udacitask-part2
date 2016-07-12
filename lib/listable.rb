module Listable
  def format_description(description, type)
    "#{description}".ljust(25) + " [#{type}]".ljust(12)
  end
  def format_date(options={})
    # not sure if this is what you wanted :o
    # now that I think about it I could pass type here
    # still I think format date should be just in each class
    # as each type has their own result :(
    if (options.key?(:due))
      options[:due] ? options[:due].strftime("%Y-%m-%d") : "No due date"
    elsif (options.key?(:date))
      options[:date] ? options[:date].strftime("%Y-%m-%d") : "N/A"
    else
      dates =  options[:start_date].strftime("%Y-%m-%d") if options[:start_date]
      dates << " -- " + options[:end_date].strftime("%Y-%m-%d") if options[:end_date]
      dates = "N/A" if !dates
      return dates
    end
  end
  def format_priority(priority)
    # this is not displaying on my Windows machine ;(
    # getting '?' so i've added some text equivalents...
    value = " ⇧ (^)".colorize(:red) if priority == "high"
    value = " ⇨ (=)".colorize(:yellow) if priority == "medium"
    value = " ⇩ (v)".colorize(:green) if priority == "low"
    value = "" if !priority
    return value
  end
end
