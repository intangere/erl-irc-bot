-module(irc_app).

-export([start/2,stop/1]).

-behaviour(application).

start(_StartType, _StartArgs) ->
    case irc_sup:start_link() of
      {ok, Pid} ->
          {ok, Pid};
      Other ->
          {error, Other}
    end.

stop(_State) ->
    ok.
