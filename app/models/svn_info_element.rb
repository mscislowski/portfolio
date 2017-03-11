require 'nokogiri'
require 'active_record'

class SVN_Info < ActiveRecord::Base

  xml = File.open('/Users/mscislowski/Documents/cs242/Assignment3.0/portfolio/app/models/data/svn_list.xml')
  puts xml
  hash = Hash.from_xml(xml)
  puts hash
  json = hash.to_json
  push json
end