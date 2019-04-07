defmodule Sample.Routes do
  import :n2o

  def route("/index") do
    Sample.Index
  end

  def route("/ws/index") do
    Sample.Index
  end

  def route("/") do
    Sample.Index
  end

  def route("/login") do
    Sample.Index
  end

  def route("/ws/") do
    Sample.Index
  end

  def route("/ws/login") do
    Sample.Index
  end

  def route("/favicon.ico") do
    :static_file
  end

  def route(_) do
    Sample.Index
  end

  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  def finish(state, ctx) do
    {:ok, state, ctx}
  end

  def init(state, ctx) do
    p = path(ctx.req)
    r = route(p)
    {:ok, state, ctx.update(path: p, module: r)}
  end
end
