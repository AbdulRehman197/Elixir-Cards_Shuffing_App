defmodule Cards do
  @moduledoc """
  This is Cards modules for creating shuffling and saving cards
  """
  #  def hello do
  #   "hello world"
  #  end
  @doc """
  this method is for creating cards
  ## Examples

      iex> Cards.create_deck
      ["Ace", "one", "two"]

  """
  def create_deck do
    ["Ace", "one", "two"]
    # suits = ["color", "darks", "bank"]

    # result =
    #   for value <- values, suit <- suits do
    #     "#{suit} of #{value}"
    #   end

    # List.flatten(result)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end
 @doc """
  this method is for checking the value have the array or not in cards
  and `duck` is aray and `card` is checking value that return true or false
  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contain?(deck, "one")
      true

  """
  def contain?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, size) do
    Enum.split(deck, size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    {status, file} = File.read(filename)

    case status do
      :ok -> :erlang.binary_to_term(file)
      :error -> "This file is not exist"
    end
  end
  def create_hand(hand_size) do
    Cards.create_deck |>Cards.shuffle |>Cards.deal(hand_size)
  end
end
