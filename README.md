# erl-irc-bot
Simple Erlang IRC Bot
-
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
