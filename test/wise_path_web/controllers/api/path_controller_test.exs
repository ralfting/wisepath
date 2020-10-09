defmodule WisePathWeb.Api.PathControllerTest do
  use WisePathWeb.ConnCase, async: true

  describe "GET /paths" do
    test "response paths", %{conn: conn} do
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

  describe "GET /paths/:id" do
    test "response path", %{conn: conn} do
      path = insert(:path)

      %{"data" => data} =
        conn
        |> get(Routes.api_path_path(conn, :show, path.id))
        |> json_response(:ok)

      assert data["id"] == path.id
    end

    test "response path with repositories", %{conn: conn} do
      path = insert(:path)
      insert(:repository, path: path)

      %{"data" => data} =
        conn
        |> get(Routes.api_path_path(conn, :show, path.id))
        |> json_response(:ok)

      assert Enum.count(data["repositories"]) == 1
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
    test "response 404 if id doesn\'t exists'", %{conn: conn} do
      inexistent_path_id = "f0d74da0-0063-4dc6-b7f4-f679b63c391a"

      response =
        conn
        |> delete(Routes.api_path_path(conn, :delete, inexistent_path_id))

      assert response.status == 404
    end

    test "path remove successfully", %{conn: conn} do
      paths = insert_list(5, :path)
      path = Enum.at(paths, 1)

      %{"data" => paths} = conn |> get_paths()

      assert Enum.count(paths) == 5

      response =
        conn
        |> delete(Routes.api_path_path(conn, :delete, path.id))

      assert response.status == 204

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
