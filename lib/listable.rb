module Listable
  def format_description(description)
    "#{description}".ljust(30)
  end
  def format_date(options={})
    # not sure if this is what you wanted :o
    if (options.key?(:due))
      options[:due] ? options[:due].strftime("%D") : "No due date"
    else
      dates =  options[:start_date].strftime("%D") if options[:start_date]
      dates << " -- " + options[:end_date].strftime("%D") if options[:end_date]
      dates = "N/A" if !dates
      return dates
    end
  end
  def format_priority(priority)
    value = " ⇧ (^)" if priority == "high"
    value = " ⇨ (=)" if priority == "medium"
    value = " ⇩ (v)" if priority == "low"
    value = "" if !priority
    return value
  end
end
