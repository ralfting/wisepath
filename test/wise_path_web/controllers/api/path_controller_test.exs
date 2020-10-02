defmodule WisePathWeb.Api.PathControllerTest do
  use WisePathWeb.ConnCase, async: true

  describe "GET /paths" do
    test "response paths without repositories", %{conn: conn} do
      [path1, path2] = insert_list(2, :path)

      %{"data" => data} =
        conn
        |> get(Routes.api_path_path(conn, :index))
        |> json_response(:ok)

      [data1, data2] = data

      assert data1["title"] == path1.title
      assert data1["description"] == path1.description

      assert data2["title"] == path2.title
      assert data2["description"] == path2.description
    end
  end

  describe "POST /paths" do
    test "create a repository successfully", %{conn: conn} do
      body = %{
        "title" => "My first Repo",
        "description" => "Awesome repo"
      }

      %{"data" => data} =
        conn
        |> post(Routes.api_path_path(conn, :create, body))
        |> json_response(:ok)

      assert data["title"] == body["title"]
      assert data["description"] == body["description"]
    end
  end
end
