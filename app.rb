require 'chronic'
require 'colorize'
require 'faker'
# Find a third gem of your choice and add it to your project
require 'date'
require_relative "lib/listable"
require_relative "lib/errors"
require_relative "lib/udacilist"
require_relative "lib/todo"
require_relative "lib/event"
require_relative "lib/link"
require_relative "lib/meeting"

def random_meeting_date
  Faker::Time.between(DateTime.now, DateTime.now + 60).strftime("%Y-%m-%d")
end

def generate_meetings(list, number)
  for i in 0..(number-1)
    list.add("meeting", Faker::Name.name, date: random_meeting_date)
  end
end

list = UdaciList.new(title: "Julia's Stuff")
list.add("todo", "Buy more cat food", due: "2016-02-03", priority: "low")
list.add("todo", "Sweep floors", due: "2016-01-30")
list.add("todo", "Buy groceries", priority: "high")
list.add("event", "Birthday Party", start_date: "2016-05-08")
list.add("event", "Vacation", start_date: "2016-05-28", end_date: "2016-05-31")
list.add("link", "https://github.com", site_name: "GitHub Homepage")
list.all
list.delete(3)
list.all

# SHOULD CREATE AN UNTITLED LIST AND ADD ITEMS TO IT
# --------------------------------------------------
new_list = UdaciList.new # Should create a list called "Untitled List"
new_list.add("todo", "Buy more dog food", due: "in 5 weeks", priority: "medium")
new_list.add("todo", "Go dancing", due: "in 2 hours")
new_list.add("todo", "Buy groceries", priority: "high")
new_list.add("event", "Birthday Party", start_date: "May 31")
new_list.add("event", "Vacation", start_date: "Dec 20", end_date: "Dec 30")
new_list.add("event", "Life happens")
new_list.add("link", "https://www.udacity.com/", site_name: "Udacity Homepage")
new_list.add("link", "http://ruby-doc.org")

# SHOULD RETURN ERROR MESSAGES
# ----------------------------
# new_list.add("image", "http://ruby-doc.org") # Throws InvalidItemType error
# new_list.delete(9) # Throws an IndexExceedsListSize error
# new_list.add("todo", "Hack some portals", priority: "super high") # throws an InvalidPriorityValue error

# DISPLAY UNTITLED LIST
# ---------------------
new_list.all

# DEMO FILTER BY ITEM TYPE
# ------------------------
new_list.filter("event")

# MEETING WITH YOUR DESINY - DONT TAKE IT TO YOUR HEART
# -----------------------------------------------------
love_date = Faker::Time.between(DateTime.now, DateTime.now + 6000)
boss_date = Faker::Time.between(love_date, DateTime.now + 6000)
end_date = Faker::Time.between(boss_date, DateTime.now + 36000)
divination_list = UdaciList.new(title: "Meet your destiny list")
divination_list.add("meeting", "Meet my love!", date: love_date.strftime("%Y-%m-%d"))
divination_list.add("meeting", "Meet my new boss!", date: boss_date.strftime("%Y-%m-%d"))
divination_list.add("meeting", "Meet my end!", date: end_date.strftime("%Y-%m-%d")) #better not

divination_list.filter("meeting")

# TRUE MEETINGS LIST
# ------------------
meetings_list = UdaciList.new(title: "Meetings list")
generate_meetings(meetings_list, 9);


meetings_list.filter("meeting")