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
        |> json_response(:created)

      assert data["title"] == body["title"]
      assert data["description"] == body["description"]
    end
  end

  describe "UPDATE /paths/:id" do
    test "update a reposoritory successfully", %{conn: conn} do
      path = insert(:path)

      body = %{
        "title" => "title UPDATED"
      }

      %{"data" => data} =
        conn
        |> put(Routes.api_path_path(conn, :update, path.id), %{path: body})
        |> json_response(:ok)

      assert body["title"] == data["title"]
    end
  end

  describe "DELETE /paths/:id" do
    test "path remove successfully", %{conn: conn} do
      paths = insert_list(5, :path)
      path = Enum.at(paths, 1)

      %{"data" => paths} = conn |> get_paths()

      assert Enum.count(paths) == 5

      %{"data" => path_removed} =
        conn
        |> delete(Routes.api_path_path(conn, :delete, path.id))
        |> json_response(:ok)

      assert path_removed["id"] == path.id

      %{"data" => paths_removed} = conn |> get_paths()

      assert Enum.count(paths_removed) == 4
    end
  end

  defp get_paths(conn) do
    conn
    |> get(Routes.api_path_path(conn, :index))
    |> json_response(:ok)
  end
end
