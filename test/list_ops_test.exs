defmodule ListOpsTest do
  use ExUnit.Case

  defp odd?(n), do: rem(n, 2) == 1

  # @tag :pending
  test "count of empty list" do
    assert ListOps.count([]) == 0
  end

  @tag :pending
  test "count of normal list" do
    assert ListOps.count([1,3,5,7]) == 4
  end

  @tag :pending
  test "count of huge list" do
    assert ListOps.count(Enum.to_list(1..1_000_000)) == 1_000_000
  end

  @tag :pending
  test "reverse of empty list" do
    assert ListOps.reverse([]) == []
  end

  @tag :pending
  test "reverse of normal list" do
    assert ListOps.reverse([1,3,5,7]) == [7,5,3,1]
  end

  @tag :pending
  test "reverse of huge list" do
    assert ListOps.reverse(Enum.to_list(1..1_000_000)) == Enum.to_list(1_000_000..1)
  end

  @tag :pending
  test "map of empty list" do
    assert ListOps.map([], &(&1+1)) == []
  end

  @tag :pending
  test "map of normal list" do
    assert ListOps.map([1,3,5,7], &(&1+1)) == [2,4,6,8]
  end

  @tag :pending
  test "map of huge list" do
    assert ListOps.map(Enum.to_list(1..1_000_000), &(&1+1)) ==
      Enum.to_list(2..1_000_001)
  end

  @tag :pending
  test "filter of empty list" do
    assert ListOps.filter([], &odd?/1) == []
  end

  @tag :pending
  test "filter of normal list" do
    assert ListOps.filter([1,2,3,4], &odd?/1) == [1,3]
  end

  @tag :pending
  test "filter of huge list" do
    assert ListOps.filter(Enum.to_list(1..1_000_000), &odd?/1) ==
      Enum.map(1..500_000, &(&1*2-1))
  end

  @tag :pending
  test "reduce of empty list" do
    assert ListOps.reduce([], 0, &(&1+&2)) == 0
  end

  @tag :pending
  test "reduce of normal list" do
    assert ListOps.reduce([1,2,3,4], -3, &(&1+&2)) == 7
  end

  @tag :pending
  test "reduce of huge list" do
    assert ListOps.reduce(Enum.to_list(1..1_000_000), 0, &(&1+&2)) ==
      Enum.reduce(1..1_000_000, 0, &(&1+&2))
  end

  @tag :pending
  test "reduce with non-commutative function" do
    assert ListOps.reduce([1,2,3,4], 10, fn x, acc -> acc - x end) == 0
  end

  @tag :pending
  test "append of empty lists" do
    assert ListOps.append([], []) == []
  end

  @tag :pending
  test "append of empty and non-empty list" do
    assert ListOps.append([], [1,2,3,4]) == [1,2,3,4]
  end

  @tag :pending
  test "append of non-empty and empty list" do
    assert ListOps.append([1,2,3,4], []) == [1,2,3,4]
  end

  @tag :pending
  test "append of non-empty lists" do
    assert ListOps.append([1,2,3], [4,5]) == [1,2,3,4,5]
  end

  @tag :pending
  test "append of huge lists" do
    assert ListOps.append(Enum.to_list(1..1_000_000), Enum.to_list(1_000_001..2_000_000)) ==
      Enum.to_list(1..2_000_000)
  end

  @tag :pending
  test "concat of empty list of lists" do
    assert ListOps.concat([]) == []
  end

  @tag :pending
  test "concat of normal list of lists" do
    assert ListOps.concat([[1,2],[3],[],[4,5,6]]) == [1,2,3,4,5,6]
  end

  @tag :pending
  test "concat of huge list of small lists" do
    assert ListOps.concat(Enum.map(1..1_000_000, &[&1])) ==
      Enum.to_list(1..1_000_000)
  end

  @tag :pending
  test "concat of small list of huge lists" do
    assert ListOps.concat(Enum.map(0..9, &Enum.to_list((&1*100_000+1)..((&1+1)*100_000)))) ==
      Enum.to_list(1..1_000_000)
  end
end
