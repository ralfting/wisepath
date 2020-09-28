defmodule WisePathWeb.Api.HealthCheckControllerTest do
  use WisePathWeb.ConnCase, async: true

  describe "index/1" do
    test "is returning ok", %{conn: conn} do
      data =
        conn
        |> get(Routes.api_health_check_path(conn, :index))
        |> json_response(:ok)

      assert data == %{"data" => %{"status" => "ok"}}
    end
  end
end
