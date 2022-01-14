defmodule Ping_Echo_test do
  use ExUnit.Case
  doctest Peer2PeerNetwork.PingEcho
  import Mox

  test "Test the creation of ping/echo with the genserver" do
    #ARRANGE
    expect(GenServerMock, :start_link, fn _, _ -> {:ok, true} end)
    expect(ApplicationMock, :put_env, fn _, _, _ -> {:ok, true} end)
    expect(TaskSupervisorMock, :start_child, fn _, _ -> {:ok, true} end)
    ip = "127.0.0.1"

    #ACT
    {:ok, result} = Peer2PeerNetwork.PingEcho.start_link(ip)

    #ASSERT
    assert result == :true
  end

  test "Test the creation of the connection" do
    #ARRANGE
    expect(GRPCStubMock, :connect, 2, fn _, _ -> {:ok, true} end)
    ip = "127.0.0.1"

    #ACT
    {:ok, result} = Peer2PeerNetwork.PingEcho.connect_ping(ip)

    #ASSERT
    assert result == :true
  end

  test "Test correct connection for ping/echo" do
    #ARRANGE
    expect(GRPCStubMock, :connect, 2, fn _, _ -> {:ok, true} end)
    expect(ServerStubMock, :ping_echo, fn _, _ -> {:ok, %{:echo => "false"}} end)
    ip = "127.0.0.1"
    ip_atom = String.to_atom(ip)

    #ACT
    Peer2PeerNetwork.PingEcho.ping(ip, "true")
    result = Application.get_env(:peer_2_peer_network, ip_atom)

    #ASSERT
    assert result == "false"
  end

  test "Test error in the connection for ping/echo" do
    #ARRANGE
    expect(GRPCStubMock, :connect, 2, fn _, _ -> {:error, true} end)
    expect(ServerStubMock, :ping_echo, fn _, _ -> {:ok, %{:echo => "echo"}} end)
    ip = "127.0.0.1"
    ip_atom = String.to_atom(ip)

    #ACT
    Peer2PeerNetwork.PingEcho.ping(ip, "false")
    result = Application.get_env(:peer_2_peer_network, ip_atom)

    #ASSERT
    assert result == "true"
  end

  test "Test a terminated connection for ping/echo" do
    #ARRANGE
    expect(GRPCStubMock, :connect, 2, fn _, _ -> {:ok, true} end)
    expect(ServerStubMock, :ping_echo, fn _, _ -> {:ok, %{:echo => "echo"}} end)
    ip = "127.0.0.1"
    ip_atom = String.to_atom(ip)

    #ACT
    Peer2PeerNetwork.PingEcho.ping(ip, "unknown")
    result = Application.get_env(:peer_2_peer_network, ip_atom)

    #ASSERT
    assert result == "Terminated"
  end

  test "Test if a disconnect_event is send when disconnected is true" do
    #ARRANGE
    text = "disconnect_event fired"
    expect(JavaClientMock, :send_disconnect_event, fn _ -> {:ok, text} end)
    ip = "127.0.0.1"
    ip_atom = String.to_atom(ip)
    Application.put_env(:peer_2_peer_network, ip_atom, "true")

    #ACT
    result = Peer2PeerNetwork.PingEcho.time_ping(ip, "false")

    #ASSERT
    assert result == text
  end

  test "Test if the process is terminated when the environment is 'Terminated'" do
    #ARRANGE
    ip = "127.0.0.1"
    ip_atom = String.to_atom(ip)
    Application.put_env(:peer_2_peer_network, ip_atom, "Terminated")

    #ACT & ASSERT
    assert catch_exit(Peer2PeerNetwork.PingEcho.time_ping(ip, "false"))
  end

end
