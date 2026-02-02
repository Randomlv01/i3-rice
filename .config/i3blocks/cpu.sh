/usr/bin/top -bn1 | grep "CPU(s)" | awk '{print "  " 100 - $8 "%"}'
