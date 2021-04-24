defmodule Inmana.RestaurantTest do
  use Inmana.DataCase, async: true

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "chageset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Burger King", email: "burger@king.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{email: "burger@king.com", name: "Burger King"},
               errors: [],
               valid?: true
             } = response
    end

    test "when name is invalid, returns a invalid changeset" do
      params = %{name: "B", email: "burger@king.com"}

      response = Restaurant.changeset(params)

      assert errors_on(response) == %{name: ["should be at least 2 character(s)"]}
    end

    test "when it has no email and name, returns a invalid changeset" do
      params = %{name: "", email: ""}

      response = Restaurant.changeset(params)

      assert errors_on(response) == %{email: ["can't be blank"], name: ["can't be blank"]}
    end

    test "when email and is invalid, returns a invalid changeset" do
      params = %{name: "BK", email: "burgering.com"}

      response = Restaurant.changeset(params)

      assert errors_on(response) == %{email: ["has invalid format"]}
    end
  end
end
