class UdaciList
  attr_reader :title, :items
  @@allowed_item_types = ["todo", "event", "link"]

  def initialize(options={})
    @title = options[:title] ? options[:title] : "Untitled List"
    @items = []
  end
  def validate(type)
    unless (@@allowed_item_types.include?(type))
      raise UdaciListErrors::InvalidItemType
    end
  end
  def add(type, description, options={})
    type = type.downcase
    validate(type)
    @items.push TodoItem.new(description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new(description, options) if type == "link"
    
  end
  def delete(index)
    if (index > @items.length)
      raise UdaciListErrors::IndexExceedsListSize
    end  
    @items.delete_at(index - 1)
  end
  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
