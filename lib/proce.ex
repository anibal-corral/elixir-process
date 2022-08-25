defmodule Proce do
# def hello(name) do
#   Process.sleep(1000)
#   IO.puts("Hello #{name}")
# end
# This is with messages
def hello(count) do
  receive do
    #exit when the reason is a "normal" reason.
    {:crash, reason} ->
      exit(reason)
    #exit when the resaon is an "anormal" reason
    {:crash, reason} ->
      exit(reason)
    {:quit} ->
      IO.puts "I'm outta here"
    {:reset}->
      hello(0)
    {:add, n}->
      hello(count+n)
    msg ->
      IO.puts("#{count}: Hello #{inspect msg}")
      hello(count)
  end
end

def zombie() do
  inner_process = fn -> Process.sleep(10000) end
  outer_process = fn -> spawn_link(inner_process);exit(:bad) end
  Enum.each(1..100, fn _ -> spawn(outer_process)end)
end
end
