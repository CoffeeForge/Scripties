#!/bin/bash

pingtime=$(ping 1.1.1.1 -c 100 -w 4 | grep rtt | awk '{print $4}' | cut -d '/' -f 3)

if [ -z "$pingtime" ]; then
echo "HIBA A KAPCSOLATBAN!/NINCS INTERNETELÉRÉS" 
exit
fi
 
if [ $(echo "$pingtime<15"|bc) -eq 1 ]; then
echo "A KAPCSOLAT MEGFELEŐ!"
else
echo "A KAPCSOLAT LASSÚ!"
fi

echo "$pingtime ms"
