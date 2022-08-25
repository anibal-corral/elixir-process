defmodule Proce do
# def hello(name) do
#   Process.sleep(1000)
#   IO.puts("Hello #{name}")
# end
# This is with messages
def hello(count) do
  receive do
    [:quit] ->
      IO.puts "I'm outta here"
    [:reset]->
      hello(0)
    [:add, n]->
      hello(count+n)
    msg ->
      IO.puts("#{count}: Hello #{inspect msg}")
      hello(count)
  end
end
end
