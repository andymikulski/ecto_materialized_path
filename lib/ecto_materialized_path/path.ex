defmodule EctoMaterializedPath.Path do
  @behaviour Ecto.Type

  @moduledoc """
  Right now it's implemented absolutely the same as { :array, :integer }
  But things can change later
  """

  def cast(list) when is_list(list) do
    path_is_correct? = Enum.all?(list, fn(path_id) -> is_integer(path_id) end)

    if path_is_correct? do
      { :ok, list }
    else
      :error
    end
  end
  def cast(_), do: :error

  def dump(value), do: { :ok, value }

  def load(value), do: { :ok, value }

  # o(n log n) runtime
  def equal?(value1, value2), do: Enum.sort(value1) == Enum.sort(value2)

  def type, do: EctoMaterializedPath.Path
end
