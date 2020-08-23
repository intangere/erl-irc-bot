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
