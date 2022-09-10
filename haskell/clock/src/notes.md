# create cases

`fromHrMin hour min`

- e.g., fromHrMin 8 0 == "08:00"

- fromHrMin 24 0 == "00:00"

- fromHrMin 25 0 == "01:00"

- fromHrMin 100 0 == "04:00" (100/24) = 4.1666 = 4 & 0 min == "04:00"

-- if min is 60 or greater /60

| hour < 24 = hour
| hour == 24 = 0
| hour >= 24 = floor (hour / 24)

| min < 60  = min
| min == 60 = `addToHour`s





 