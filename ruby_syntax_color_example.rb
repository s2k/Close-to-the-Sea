# encoding: UTF-8
require 'pp'

include Math

CONSTANT_VALUE = "CONST"
alpha          = ( Math::PI / 0.25 ) ** 0.5

class Ancestor
  def self.method_in_the_class a_thing, and_another
  end
end

class Inheritee < Ancestor
  method_in_the_class :foo, :bar
  def a_method args
    ap args
  end
end 

puts `ls -la`

@instance_variable = CONSTANT_VALUE
a_variable         = Math::PI * sin( alpha ** 2 )
foo                = [ :bar_symbol, "is_green" + ' but can be blue as well' ]
a_number           = { :sum => 8787495 + 2543.4523e7, 'hex_val' => 0xfe4 }
match              = "somethingthatlook...likeasrting".match( /o.+gt(hat.*\.+).+eas.+$/ )

puts match.inspect, true, false

notthat_long = <<-END
  A line
  and another
END

as_short = <<FIN
  A line
  and another
FIN

# Let's go blocks & yield
files = Dir[ '*.rb' ].each { | fn |
  puts fn.capitalize.gsub( /_/, '⎵')
}

o = ObjectSpace.each_object( Class ) do | do_lally |
  pp do_lally if do_lally.to_s.match( /^I|\AA/ )
end
