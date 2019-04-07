defmodule N2O do
  defmacro element(modu) do
    quote do
      [
        ancestor: :element,
        module: unquote(modu),
        id: :undefined,
        actions: [],
        class: [],
        style: [],
        source: [],
        data_fields: [],
        aria_states: [],
        body: [],
        role: [],
        tabindex: 0,
        show_if: false,
        html_tag: :undefined,
        title: []
      ]
    end
  end
end

defmodule N2O.Records do
  require N2O
  require Record

  Record.defrecord(:context, Record.extract(:cx, from_lib: "n2o/include/n2o.hrl"))
  Record.defrecord(:http_req, Record.extract(:http_req, from: "deps/cowboy/src/cowboy_req.erl"))

  Record.defrecord(
    :dtl,
    N2O.element(:element_dtl) ++ [file: "index", bindings: [], app: __DIR__, folder: "priv/templates", ext: "html", bind_script: true]
  )

  Record.defrecord(
    :link,
    N2O.element(:element_link) ++
      [target: :undefined, url: "javascript:void(0);", postback: :undefined, delegate: :undefined, name: :undefined]
  )

  Record.defrecord(
    :button,
    N2O.element(:element_button) ++
      [type: "button", name: :undefined, value: :undefined, postback: :undefined, delegate: :undefined, disabled: :undefined]
  )

  Record.defrecord(
    :textbox,
    N2O.element(:element_textbox) ++
      [
        value: :undefined,
        disabled: :undefined,
        maxlength: [],
        placeholder: [],
        next: :undefined,
        postback: :undefined,
        delegate: :undefined,
        name: :undefined
      ]
  )

  Record.defrecord(:span, N2O.element(:undefined))
  Record.defrecord(:div, N2O.element(:undefined))
  Record.defrecord(:br, N2O.element(:undefined))
  Record.defrecord(:h1, N2O.element(:undefined))
  Record.defrecord(:h2, N2O.element(:undefined))
  Record.defrecord(:h3, N2O.element(:undefined))
  Record.defrecord(:h4, N2O.element(:undefined))
end
