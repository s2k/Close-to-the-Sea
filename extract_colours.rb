require 'nokogiri'
require 'ap'

fn = 'close_to_the_sea.tmTheme'

hex_dgt = /[0-9a-fA-F]/

doc = Nokogiri::XML( open fn )

hex_vals = (doc / '//dict/array/dict/dict/string/text()').map{ | e |
  r = e.text.match(/#(#{ hex_dgt }+)/)
  r ? r[1] : nil
  }.compact.sort

dec_vals = hex_vals.map{ | e |
  cols = e.scan( /#{ hex_dgt }{2,2}/ ).map{ | i | '%03d' % i.to_i( 16 )}.join(' ')
  "#{e}: #{cols}"
}

puts dec_vals