weekday(monday).
weekday(tuesday).
weekday(wednesday).
weekday(thursday).
weekday(friday).
weekend(saturday).
weekend(sunday).
holiday(friday).
weather(monday,sunny).
weather(tuesday,snow).
weather(wednesday,sunny).
weather(thursday,cold).
weather(friday,snow).
weather(saturday,rain).
weather(sunday,cold).
ski(J):- weekend(J), weather(J,W), W\=rain.
ski(J):- holiday(J),!, weather(J,snow).
ski(J):-weekday(J), weather(J,sunny),\+nicedayoff(J).
nicedayoff(J):- weekend(J), weather(J,sunny).
nicedayoff(J):- holiday(J), weather(J,sunny). 