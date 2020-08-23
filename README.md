# erl-irc-bot
Simple Erlang IRC Bot
-

Config variables are in src/irc.erl as macros at the moment:
```
HOST
PORT
NICK
USERNAME
CHANNEL
```

Notes: 
- Uses the 376 motd status code to auto join

Todo: 
- Ping 
- Command system 

Compile with:
```
erlc -o ebin src/*.erl
```

Run with:
```
erl -pa ebin -eval "application:start(irc)."
```

Generate docs with:
```
edoc:application(irc).
```

With private functions:
```
edoc:application(irc, [private]).
```
