defmodule Sample do
  use Application

  def start(_type, _args) do
    :application.set_env(:n2o, :route, Sample.Routes)

    dispatch =
      :cowboy_router.compile([
        {:_,
         [
           {"/static/[...]", :cowboy_static,
            [{:directory, :wf.to_list(__DIR__) ++ "/priv/static"}, {:mimetypes, {&:mimetypes.path_to_mimes/2, :default}}]},
           {"/rest/:resource", :n2o_cowboy_rest, []},
           {"/rest/:resource/:id", :n2o_cowboy_rest, []},
           {"/ws/[...]", :bullet_handler, [{:handler, :n2o_bullet}]},
           {:_, :n2o_cowboy, []}
         ]}
      ])

    {:ok, _} = :cowboy.start_http(:http, 100, [port: 8080], env: [dispatch: dispatch])
    Sample.Sup.start_link()
  end
end
