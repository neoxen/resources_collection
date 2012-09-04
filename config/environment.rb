#encoding: utf-8
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
JobLogger::Application.initialize!

#time personalize
Time::DATE_FORMATS[:create_time] = "创建于 %b %d on %I:%M %p"
Time::DATE_FORMATS[:update_time] = "更新于 %b %d on %I:%M %p"
Time::DATE_FORMATS[:style_time] = "更新于 %B %d &lt;br /&gt; %I:%M %p"
