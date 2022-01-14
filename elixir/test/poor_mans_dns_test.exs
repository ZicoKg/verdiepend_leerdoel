defmodule Poor_mans_dns_test do
  use ExUnit.Case
  doctest Peer2PeerNetwork.PoorMansDns
  import Mox

  defp grpc_port, do: Integer.to_string(Application.get_env(:grpc, :elixir_port))

  setup do
    settings = %{"game_code" => "TEST","max_players" => "20"}
    game_code = settings["game_code"]
    if(File.dir?(Peer2PeerNetwork.PoorMansDns.get_game_path(game_code))) do
      File.rmdir(Peer2PeerNetwork.PoorMansDns.get_game_path(game_code))
    end
    
    :verify_on_exit!

    {:ok, settings: settings}
  end

  test "Test if game path gives the right game path", state do
    #ARRANGE
    game_code = state[:settings]["game_code"]
    expected = Peer2PeerNetwork.PoorMansDns.get_file_path() <> game_code <> "/"

    #ACT
    result = Peer2PeerNetwork.PoorMansDns.get_game_path(game_code)

    #ASSERT
    assert expected == result
  end


  test "Test if poor mans dns is created", state do
    #ARRANGE
    game_code = state[:settings]["game_code"]
    defmock(JavaClientMockTestCreated, for: Peer2PeerNetwork.JavaClient)
    expect(JavaClientMockTestCreated, :get_local_ip, fn -> "127.0.0.1" end)
    path = Peer2PeerNetwork.PoorMansDns.get_game_path(game_code)
    ip_file_name = Peer2PeerNetwork.PoorMansDns.get_ip_list_file_name()
    config_file_name = Peer2PeerNetwork.PoorMansDns.get_config_file_name()

    #ACT
    result = Peer2PeerNetwork.PoorMansDns.create_poor_mans_dns(state[:settings],JavaClientMockTestCreated)
    does_ip_file_exist =  File.exists?(path <> ip_file_name)
    does_config_file_exist = File.exists?(path <> config_file_name)

    #Clean up the test poor mans dns
    Peer2PeerNetwork.PoorMansDns.remove_poor_mans_dns(game_code)

    #ASSERT
    assert does_ip_file_exist == :true
    assert does_config_file_exist == :true
    assert result == :ok
  end


  test "Test if poor mans dns is created and throws an error when game already exist", state do
    #ARRANGE
    game_code = state[:settings]["game_code"]
    defmock(JavaClientMockCreatedThrowError, for: Peer2PeerNetwork.JavaClient)
    expect(JavaClientMockCreatedThrowError, :get_local_ip, fn -> "127.0.0.1" end)

    #ACT
    Peer2PeerNetwork.PoorMansDns.create_poor_mans_dns(state[:settings],JavaClientMockCreatedThrowError)

    #ASSERT
    assert_raise Peer2PeerNetwork.GameAlreadyExistException, fn ->
      Peer2PeerNetwork.PoorMansDns.create_poor_mans_dns(state[:settings],JavaClientMockCreatedThrowError)
    end

    #Clean up the test poor mans dns
    Peer2PeerNetwork.PoorMansDns.remove_poor_mans_dns(game_code)
  end


  test "Test if poor mans dns gives game not exist exception on remove", state do
    #ARRANGE
    game_code = state[:settings]["game_code"]

    #ASSERT
    assert_raise Peer2PeerNetwork.GameNotExistException, fn ->
      Peer2PeerNetwork.PoorMansDns.remove_poor_mans_dns(game_code)
    end
  end


  test "Test if get config shows the right information", state do
    #ARRANGE
    game_code = state[:settings]["game_code"]
    defmock(JavaClientMockTestConfig, for: Peer2PeerNetwork.JavaClient)
    expect(JavaClientMockTestConfig, :get_local_ip, fn -> "127.0.0.1" end)
    expected_game_code = "TEST"
    expected_max_player = "20"

    #ACT
    Peer2PeerNetwork.PoorMansDns.create_poor_mans_dns(state[:settings],JavaClientMockTestConfig)

    #ASSERT
    assert Peer2PeerNetwork.PoorMansDns.get_game_config(game_code)["game_code"] == expected_game_code
    assert Peer2PeerNetwork.PoorMansDns.get_game_config(game_code)["max_players"] == expected_max_player

    #Clean up the test poor mans dns
    Peer2PeerNetwork.PoorMansDns.remove_poor_mans_dns(game_code)
  end


  test "Test if get config throws an error when game not found", state do
    #ARRANGE
    game_code = state[:settings]["game_code"]

    #ASSERT
    assert_raise Peer2PeerNetwork.GameNotExistException, fn ->
      Peer2PeerNetwork.PoorMansDns.get_game_config(game_code)
    end
  end

  test "Test if add ip add the ip to the file", state do
    #ARRANGE
    game_code = state[:settings]["game_code"]
    defmock(JavaClientMockTestAddIP, for: Peer2PeerNetwork.JavaClient)
    expect(JavaClientMockTestAddIP, :get_local_ip, fn -> "127.0.0.1" end)
    ip = "127.0.0.2"

    #ACT
    Peer2PeerNetwork.PoorMansDns.create_poor_mans_dns(state[:settings],JavaClientMockTestAddIP)
    Peer2PeerNetwork.PoorMansDns.add_ip(ip,game_code)
    result = Enum.member?(Peer2PeerNetwork.PoorMansDns.get_ips(game_code), ip <> ":" <> grpc_port() )

    #ASSERT
    assert result == :true

    #Clean up the test poor mans dns
    Peer2PeerNetwork.PoorMansDns.remove_poor_mans_dns(game_code)
  end

  test "Test if add ip throws given ip already exist exception", state do
    #ARRANGE
    game_code = state[:settings]["game_code"]
    defmock(JavaClientMockTestAddIPAndThrow, for: Peer2PeerNetwork.JavaClient)
    expect(JavaClientMockTestAddIPAndThrow, :get_local_ip, fn -> "127.0.0.1" end)
    ip = "127.0.0.1"

    #ACT
    Peer2PeerNetwork.PoorMansDns.create_poor_mans_dns(state[:settings],JavaClientMockTestAddIPAndThrow)

    #ASSERT
    assert_raise Peer2PeerNetwork.GivenIpAlreadyKnownException, fn ->
      Peer2PeerNetwork.PoorMansDns.add_ip(ip,game_code)
    end

    #Clean up the test poor mans dns
    Peer2PeerNetwork.PoorMansDns.remove_poor_mans_dns(game_code)
  end

  test "Test if add ip throws game not exist exception", state do
    #ARRANGE
    game_code = state[:settings]["game_code"]
    ip = "127.0.0.2"

    #ASSERT
    assert_raise Peer2PeerNetwork.GameNotExistException, fn ->
      Peer2PeerNetwork.PoorMansDns.add_ip(ip,game_code)
    end
  end

end
