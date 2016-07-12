class LinkItem
  include Listable
  attr_reader :description, :site_name
  CONST_TYPE = "link"

  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name]
  end

  def format_name
    @site_name ? @site_name : ""
  end
  def details
    format_description(@description, type = CONST_TYPE) + "site name: " + format_name
  end
  def type
    CONST_TYPE
  end
end
