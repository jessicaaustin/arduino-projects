#!/usr/bin/ruby

query_string=`echo $QUERY_STRING`
arduino_device=`ls -1 /dev/tty.usb* | tr -d '\n'`

if query_string.length != 0
  `/opt/local/bin/arduino-serial -b 9600 -p #{arduino_device} -s #{query_string}`
  result=`echo $?`
  result=result.gsub(/\n/,"")
end

print "Content-type: application/json\n\n"
print "{\"result\": \"#{result}\"}\n"

