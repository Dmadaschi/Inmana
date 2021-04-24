defmodule Inmana.WelcomerTest do
  use ExUnit.Case, async: true
  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, returns special message" do
      params = %{"name" => "banana", "age" => "42"}

      result = Welcomer.welcome(params)

      assert result == {:ok, "You are very special"}
    end

    test "when the user is not special, returns some message" do
      params = %{"name" => "daniel", "age" => "25"}

      result = Welcomer.welcome(params)

      assert result == {:ok, "You are welcome daniel"}
    end

    test "when the user is under age, returns error" do
      params = %{"name" => "daniel", "age" => "15"}

      result = Welcomer.welcome(params)

      assert result == {:error, "You shall not pass daniel"}
    end
  end
end
