defmodule WisePathWeb.Api.PathViewTest do
  use WisePathWeb.ConnCase, async: true

  alias WisePathWeb.Api.PathView

  import Phoenix.View

  test "index.json" do
    paths = [
      %{
        id: "1",
        title: "Hello World",
        description: "Description",
        inserted_at: "inserted_at",
        updated_at: "updated_at"
      }
    ]

    assert render(WisePathWeb.Api.PathView, "index.json", %{data: paths}) == %{
             data: Enum.map(paths, &PathView.item/1)
           }
  end
end
