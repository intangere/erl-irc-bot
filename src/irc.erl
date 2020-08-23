-module(irc).

-export([start_link/0]).

-define(HOST, "127.0.0.1").
-define(PORT, 1337).
-define(NICK, "ErlBot").
-define(USERNAME, "ErlBot").
-define(DELIMETER, "\r\n").
-define(CMD_IDENTIFIER, "!").
-define(CHANNEL, "#large-test-erlang").

-spec start_link() -> {ok, pid}.
%% @doc IRC Bot process that is being supervised
start_link() ->
  Pid = spawn_link(fun() -> main() end),
  {ok, Pid}.

-spec connect() -> {ok, socket} | {error, reason}.
%% @private
%% @doc Tries to connect the IRC server
connect() ->
  gen_tcp:connect(?HOST, ?PORT,
                  [binary, {packet, line}, {active, false}]).

nick() ->
  "NICK " ++ ?NICK.

username() ->
  "USER " ++ ?USERNAME ++ " " ++ ?USERNAME ++ 
    " " ++ ?USERNAME ++ " :" ++ ?USERNAME.

join() ->
   "JOIN " ++ ?CHANNEL.

handle_data(Sock, Data) ->

   Splits = binary:split(Data, <<" ">>, [global]),

   if
     length(Splits) > 2 ->

       Status = lists:nth(2, Splits),

       io:fwrite([<<"Found:">>, Status, <<"\n">>]),
 
       if
         Status == <<"376">> ->
           io:fwrite("Joining!\n"),
           gen_tcp:send(Sock, join() ++ ?DELIMETER);
         true ->
           undefined
       end;
       % io:fwrite("Large splts\n");
     true ->
       undefined
   end.

handle_recv(Sock) ->
  case gen_tcp:recv(Sock, 0) of
    {ok, Data} ->
      io:fwrite("~p~n", [Data]),
      handle_data(Sock, Data),
      handle_recv(Sock);
    {error, Reason} ->
      io:fwrite(Reason),
      io:fwrite("Failed to receive data. Disconnected.")

   end.

main() ->
  case connect() of
    {ok, Sock} ->

      io:fwrite("Connected to " ++ ?HOST ++ "\n"),

      gen_tcp:send(Sock, nick() ++ ?DELIMETER),
      gen_tcp:send(Sock, username() ++ ?DELIMETER),

      io:fwrite("Sent nick and username\n"),

      handle_recv(Sock);

    {error, Reason} ->
      io:fwrite("Failed to connect to IRC server\n"),
      io:fwrite("~s~n", [Reason]);
    _ ->
      io:fwrite("Invalid domain?\n")

  end.
