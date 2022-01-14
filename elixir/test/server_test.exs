defmodule Server_test do
  use ExUnit.Case
  doctest Peer2PeerNetwork.Server.Server
  import Mox


  test "Test if children are created with make_children()" do
    #ARRANGE
    expect(DynamicSupervisorMock, :start_child, 3, fn _,_ -> true end)
    ips = ["127.0.0.1"]

    #ACT
    result = Peer2PeerNetwork.Server.Server.make_children(ips)

    #ASSERT
    assert result == :noreply
  end

  test "Test if the event is send to Elixir" do
    #ARRANGE
    expect(DynamicSupervisorMock, :start_child, 3, fn _,_ -> {:ok, true} end)
    expect(ProcessMock, :send, 2, fn _,_,_ -> {:ok, true} end)
    event = Peer2PeerNetwork.DoStopGameEvent.new()

    #ACT
    result = Peer2PeerNetwork.Server.Server.send_to_elixir(event)

    #ASSERT
    assert result == Peer2PeerNetwork.EmptyReply.new()
  end

  test "Test if send_event works as expected" do
    #ARRANGE
    expect(DynamicSupervisorMock, :start_child, 3, fn _,_ -> {:ok, true} end)
    expect(ProcessMock, :send, 2, fn _,_,_ -> {:ok, true} end)
    ips = ["127.0.0.1", "localhost"]
    event = Peer2PeerNetwork.DoStopGameEvent.new()
    event_name = "HenkDeTank"

    #ACT
    result = Peer2PeerNetwork.Server.Server.send_event(ips, event, event_name)

    #ASSERT
    assert result == :noreply
  end

  test "Test if environment values are updated" do
    #ARRANGE
    key1 = :"127.0.0.1"
    key2 = :"localhost"
    Application.put_env(:peer_2_peer_network, key1, "true")
    Application.put_env(:peer_2_peer_network, key2, "false")
    keys = [key1, key2]
    env = Application.get_all_env(:peer_2_peer_network)

    #ACT
    result = Peer2PeerNetwork.Server.Server.update_env(env, keys)

    #ASSERT
    assert result == :noreply
    assert Application.get_env(:peer_2_peer_network, key1) == "Terminated"
    assert Application.get_env(:peer_2_peer_network, key2) == "false"
  end

end
