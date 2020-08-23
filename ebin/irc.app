{application, irc,
 [{description, "Simple IRC Bot"},
  {vsn, "0.1.0"},
  {modules, [
            irc_app,
            irc_sup,
            irc
            ]},
  {registered, [
                irc_sup,
                irc
               ]},
  {applications, [kernel, stdlib]},
  {mod, {irc_app, []}}
 ]}.
