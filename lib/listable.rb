module Listable
  def format_description(description, type)
    "#{description}".ljust(25) + " [#{type}]".ljust(10)
  end
  def format_date(options={})
    # not sure if this is what you wanted :o
    if (options.key?(:due))
      options[:due] ? options[:due].strftime("%Y-%m-%d") : "No due date"
    else
      dates =  options[:start_date].strftime("%Y-%m-%d") if options[:start_date]
      #p end_date
      dates << " -- " + options[:end_date].strftime("%Y-%m-%d") if options[:end_date]
      dates = "N/A" if !dates
      return dates
    end
  end
  def format_priority(priority)
    # this is not displaying on my Windows machine ;(
    # getting '?' so i've added some text equivalents...
    value = " ⇧ (^)" if priority == "high"
    value = " ⇨ (=)" if priority == "medium"
    value = " ⇩ (v)" if priority == "low"
    value = "" if !priority
    return value
  end
end
