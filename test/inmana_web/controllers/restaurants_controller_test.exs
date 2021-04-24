defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase, async: true

  describe "create/2" do
    test "when all params are valid, creates restaurant", %{conn: conn} do
      params = %{name: "Burger King", email: "burger@king.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant Created!",
               "restaurant" => %{
                 "email" => "burger@king.com",
                 "id" => _id,
                 "name" => "Burger King"
               }
             } = response
    end

    test "when all params are invalid, return error", %{conn: conn} do
      params = %{name: "", email: ""}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == %{
               "message" => %{"email" => ["can't be blank"], "name" => ["can't be blank"]}
             }
    end
  end
end
