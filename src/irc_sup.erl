-module(irc_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    Server = {irc, {irc, start_link, []},
              permanent, 2000, worker, [irc]},
    Children = [Server],
    RestartStrategy = #{strategy => one_for_one, 
                        intensity => 5, 
                        period => 1},
    {ok, {RestartStrategy, Children}}.



