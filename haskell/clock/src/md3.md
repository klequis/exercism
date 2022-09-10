- calculate total minutes = totalMin
- /min per day (1440) -> x -> floor x == numDays
- convert num days to min: numDays * 1440 = numDaysInMin
- subtract numDaysInMin from total minutes: totalMin - numDaysInMin == minRemain
- calc theHour: floor minRemain/60 = theHour
- minRemain

almost, it is in the spread sheet


new idea
-------------------------
# hours
min / 60 = m1
floor m1                   = x (hours)

hours = hours / 24 = x
        floor x = hours    = y
        x + y              = hours




4820 min
4820/60 = 80 hours
80 hr = 80 * 60 min = 4800
4820 - 4800 = 20 min left
so is 80 hrs * 20 min

but 80/24 = 3.333
&   3 * 24 = 72 = 1:12


  25     0 == 1:00 25/24 = 1.041666 -> floor 1                       01:00
 100     0 == 4:00 100/24= 4.666 -> floor 4                          04:00
   1    60 == 1 + 60/60  = 2                                         02:00
   0   160 == 160 / 60   = 2.666 -> floor 2 | 160 - 120 = 40         02:40

   0  1723 == 1723/60 = 28.71666 -> floor 28
                        1723 - 28*60 =  43 min
                        28 - 24 =        4 hrs                       04:43

maybe
- hours = hrs / 24 = x 
          floor x = answer
- minutes = min / 60 = floor x = y
            min - y * 60 == answer for minutes
            y - 24 = answer for hours
