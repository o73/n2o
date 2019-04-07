defmodule Sample.Index do
  def event(:init) do
    :wf.reg(:room)
  end

  def event({:chat, pid}) do
    pid |> send({:message, :wf.q(:message)})
  end

  def event(e) do
    :wf.info('Unknown Event ~p', [e])
  end

  def main() do
    :dtl.new(file: "index", bindings: [title: "Elixir N2O", body: body()])
  end

  def body() do
    {:ok, pid} = :wf.async(fn -> loop() end)
    [:div.new(id: :history), :textbox.new(id: :message), :button.new(id: :send, body: "Chat", postback: {:chat, pid}, source: [:message])]
  end

  def loop() do
    receive do
      {:message, message} ->
        :wf.insert_bottom(:history, [:span.new(body: message), :br.new()])
        :wf.flush(:room)

      unknown ->
        :wf.info('Unknown Looper Message ~p', [unknown])
    end

    loop()
  end
end
