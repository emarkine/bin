#!/usr/bin/env ruby
# Copyright 2011 EugeneLab   

require 'rubygems'
require 'rush'

local = Rush::Box.new('localhost')
local['/etc/'].vi
puts `service  restart`

