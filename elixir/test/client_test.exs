defmodule Client_test do
  use ExUnit.Case
  doctest Peer2PeerNetwork.Client
  import Mox

  setup do
    expect(GRPCStubMock, :connect, fn _, _ -> {:ok, true} end)
    :verify_on_exit!
    :ok
  end

  test "Test the creation of the connection" do
    #ARRANGE
    ip = "127.0.0.1"

    #ACT
    {:ok, result} = Peer2PeerNetwork.Client.connect(ip)

    #ASSERT
    assert result == :true
  end

  test "Test send_agent_takes_control_event()" do
    #ARRANGE
    event_name = "AGENT_TAKES_CONTROL_EVENT"
    expect(ServerStubMock, :send_agent_takes_control_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoAgentTakesControlEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_configure_agent_event()" do
    #ARRANGE
    event_name = "CONFIGURE_AGENT_EVENT"
    expect(ServerStubMock, :send_configure_agent_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoConfigureAgentEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_start_agent_event()" do
    #ARRANGE
    event_name = "START_AGENT_EVENT"
    expect(ServerStubMock, :send_start_agent_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoStartAgentEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_take_control_from_agent_event()" do
    #ARRANGE
    event_name = "TAKE_CONTROL_FROM_AGENT_EVENT"
    expect(ServerStubMock, :send_take_control_from_agent_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoTakeControlFromAgentEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_disconnect_event()" do
    #ARRANGE
    event_name = "DISCONNECT_EVENT"
    expect(ServerStubMock, :send_disconnect_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoDisconnectEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_register_connection_event()" do
    #ARRANGE
    event_name = "REGISTER_CONNECTION_EVENT"
    expect(ServerStubMock, :send_register_connection_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoRegisterConnectionEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_search_for_game_event()" do
    #ARRANGE
    event_name = "SEARCH_FOR_GAME_EVENT"
    expect(ServerStubMock, :send_search_for_game_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoSearchForGameEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_synchronise_game_event()" do
    #ARRANGE
    event_name = "SYNCHRONISE_GAME_EVENT"
    expect(ServerStubMock, :send_synchronise_game_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoSynchroniseGameEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_backlog_order_event()" do
    #ARRANGE
    event_name = "BACKLOG_ORDER_EVENT"
    expect(ServerStubMock, :send_backlog_order_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoBacklogOrderEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_a_chat_event()" do
    #ARRANGE
    event_name = "CHAT_EVENT"
    expect(ServerStubMock, :send_a_chat_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoChatEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_configure_game_event()" do
    #ARRANGE
    event_name = "CONFIGURE_GAME_EVENT"
    expect(ServerStubMock, :send_configure_game_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoConfigureGameEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_delivery_event()" do
    #ARRANGE
    event_name = "DELIVERY_EVENT"
    expect(ServerStubMock, :send_delivery_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoDeliveryEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_join_game_event()" do
    #ARRANGE
    event_name = "JOIN_GAME_EVENT"
    expect(ServerStubMock, :send_join_game_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoJoinGameEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_join_lobby_event()" do
    #ARRANGE
    event_name = "JOIN_LOBBY_EVENT"
    expect(ServerStubMock, :send_join_lobby_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoJoinLobbyEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_leave_game_event()" do
    #ARRANGE
    event_name = "LEAVE_GAME_EVENT"
    expect(ServerStubMock, :send_leave_game_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoLeaveGameEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_new_game_has_started_event()" do
    #ARRANGE
    event_name = "NEW_GAME_HAS_STARTED_EVENT"
    expect(ServerStubMock, :send_new_game_has_started_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoNewGameHasStartedEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_new_round_event()" do
    #ARRANGE
    event_name = "NEW_ROUND_EVENT"
    expect(ServerStubMock, :send_new_round_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoNewRoundEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_order_chips_event()" do
    #ARRANGE
    event_name = "ORDER_CHIPS_EVENT"
    expect(ServerStubMock, :send_order_chips_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoOrderChipsEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_replay_game_event()" do
    #ARRANGE
    event_name = "REPLAY_GAME_EVENT"
    expect(ServerStubMock, :send_replay_game_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoReplayGameEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_request_game_session_event()" do
    #ARRANGE
    event_name = "REQUEST_GAME_SESSION_EVENT"
    expect(ServerStubMock, :send_request_game_session_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoRequestGameSessionEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_sell_chips_event()" do
    #ARRANGE
    event_name = "SELL_CHIPS_EVENT"
    expect(ServerStubMock, :send_sell_chips_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoSellChipsEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_send_game_session_event()" do
    #ARRANGE
    event_name = "SEND_GAME_SESSION_EVENT"
    expect(ServerStubMock, :send_send_game_session_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoSendGameSessionEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_setup_game_event()" do
    #ARRANGE
    event_name = "SETUP_GAME_EVENT"
    expect(ServerStubMock, :send_setup_game_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoSetupGameEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_start_game_event()" do
    #ARRANGE
    event_name = "START_GAME_EVENT"
    expect(ServerStubMock, :send_start_game_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoStartGameEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_stop_game_event()" do
    #ARRANGE
    event_name = "STOP_GAME_EVENT"
    expect(ServerStubMock, :send_stop_game_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoStopGameEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_grab_card_based_on_chance_event()" do
    #ARRANGE
    event_name = "GRAB_CARD_BASED_ON_CHANCE_EVENT"
    expect(ServerStubMock, :send_grab_card_based_on_chance_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoGrabCardBasedOnChanceEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_save_card_for_replay_event()" do
    #ARRANGE
    event_name = "SAVE_CARD_FOR_REPLAY_EVENT"
    expect(ServerStubMock, :send_save_card_for_replay_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoSaveCardForReplayEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_commit_event_event()" do
    #ARRANGE
    event_name = "COMMIT_EVENT_EVENT"
    expect(ServerStubMock, :send_commit_event_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoCommitEventEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_confirm_commit_is_prepared_event()" do
    #ARRANGE
    event_name = "CONFIRM_COMMIT_IS_PREPARED_EVENT"
    expect(ServerStubMock, :send_confirm_commit_is_prepared_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoConfirmCommitIsPreparedEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_news_about_committed_event_event()" do
    #ARRANGE
    event_name = "NEWS_ABOUT_COMMITTED_EVENT_EVENT"
    expect(ServerStubMock, :send_news_about_committed_event_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoNewsAboutCommittedEventEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

  test "Test send_prepare_commit_event_event()" do
    #ARRANGE
    event_name = "PREPARE_COMMIT_EVENT"
    expect(ServerStubMock, :send_prepare_commit_event_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoPrepareCommitEventEvent.new()
    ip = "127.0.0.1"
    info = %{1 => ip, 2 => event, 3 => event_name}

    #ACT
    result = Peer2PeerNetwork.Client.handle_info({:event, info}, :ok)

    #ASSERT
    assert result == event_name
  end

end
