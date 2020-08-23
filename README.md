# erl-irc-bot
Simple Erlang IRC Bot
-
Compile with:
```
erlc -o ebin src/*.erl
```

Config variables are in src/irc.erl as macros at the moment:
```
HOST
PORT
NICK
USERNAME
CHANNEL
```
Run with:
```
erl -pa ebin -eval "application:start(irc)."
```

Generate docs with:
```
edoc:application(irc).
```
