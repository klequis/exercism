1. converts hrs to min

201,  3001

minutesToClock $ hour * 60 + min
minutesToClock $ 201 * 60 + 3001
minutesToClock 1561

minutesToClock x = Clock (mod (div x 60) 24) (mod x 60)
minutesToClock x = Clock (mod (div x 60) 24)     1



