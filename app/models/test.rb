require 'active_support'
require 'active_support/core_ext'

xml = File.open('/Users/mscislowski/Documents/cs242/Assignment3.0/portfolio/app/models/data/svn_log.xml')
hash = Hash.from_xml(xml)
puts hash.to_json