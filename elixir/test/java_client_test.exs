defmodule Java_Client_test do
  use ExUnit.Case
  doctest Peer2PeerNetwork.JavaClient
  import Mox

  setup do
    expect(GRPCStubMock, :connect, fn _, _ -> {:ok, true} end)
    :verify_on_exit!
    :ok
  end

  test "Test the creation of the connection" do
    #ARRANGE

    #ACT
    {:ok, result} = Peer2PeerNetwork.JavaClient.connect()

    #ASSERT
    assert result == :true
  end

  test "Test get_local_ip()" do
    #ARRANGE
    ip = "127.0.0.1"
    expect(NetworkStubMock, :get_local_ip, fn _, _ -> {:ok, %{:local_ip => ip}} end)

    #ACT
    result = Peer2PeerNetwork.JavaClient.get_local_ip()

    #ASSERT
    assert result == ip
  end

  test "Test send_agent_takes_control_event()" do
    #ARRANGE
    event_name = "AGENT_TAKES_CONTROL_EVENT"
    expect(ServerStubMock, :send_agent_takes_control_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoAgentTakesControlEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_agent_takes_control_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_configure_agent_event()" do
    #ARRANGE
    event_name = "CONFIGURE_AGENT_EVENT"
    expect(ServerStubMock, :send_configure_agent_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoConfigureAgentEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_configure_agent_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_start_agent_event()" do
    #ARRANGE
    event_name = "START_AGENT_EVENT"
    expect(ServerStubMock, :send_start_agent_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoStartAgentEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_start_agent_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_take_control_from_agent_event()" do
    #ARRANGE
    event_name = "TAKE_CONTROL_FROM_AGENT_EVENT"
    expect(ServerStubMock, :send_take_control_from_agent_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoTakeControlFromAgentEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_take_control_from_agent_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_disconnect_event()" do
    #ARRANGE
    event_name = "DISCONNECT_EVENT"
    expect(ServerStubMock, :send_disconnect_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoDisconnectEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_disconnect_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_register_connection_event()" do
    #ARRANGE
    event_name = "REGISTER_CONNECTION_EVENT"
    expect(ServerStubMock, :send_register_connection_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoRegisterConnectionEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_register_connection_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_search_for_game_event()" do
    #ARRANGE
    event_name = "SEARCH_FOR_GAME_EVENT"
    expect(ServerStubMock, :send_search_for_game_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoSearchForGameEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_search_for_game_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_synchronise_game_event()" do
    #ARRANGE
    event_name = "SYNCHRONISE_GAME_EVENT"
    expect(ServerStubMock, :send_synchronise_game_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoSynchroniseGameEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_synchronise_game_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_backlog_order_event()" do
    #ARRANGE
    event_name = "BACKLOG_ORDER_EVENT"
    expect(ServerStubMock, :send_backlog_order_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoBacklogOrderEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_backlog_order_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_a_chat_event()" do
    #ARRANGE
    event_name = "CHAT_EVENT"
    expect(ServerStubMock, :send_a_chat_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoChatEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_a_chat_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_configure_game_event()" do
    #ARRANGE
    event_name = "CONFIGURE_GAME_EVENT"
    expect(ServerStubMock, :send_configure_game_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoConfigureGameEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_configure_game_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_delivery_event()" do
    #ARRANGE
    event_name = "DELIVERY_EVENT"
    expect(ServerStubMock, :send_delivery_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoDeliveryEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_delivery_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_join_game_event()" do
    #ARRANGE
    event_name = "JOIN_GAME_EVENT"
    expect(ServerStubMock, :send_join_game_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoJoinGameEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_join_game_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_join_lobby_event()" do
    #ARRANGE
    event_name = "JOIN_LOBBY_EVENT"
    expect(ServerStubMock, :send_join_lobby_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoJoinLobbyEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_join_lobby_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_leave_game_event()" do
    #ARRANGE
    event_name = "LEAVE_GAME_EVENT"
    expect(ServerStubMock, :send_leave_game_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoLeaveGameEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_leave_game_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_new_game_has_started_event()" do
    #ARRANGE
    event_name = "NEW_GAME_HAS_STARTED_EVENT"
    expect(ServerStubMock, :send_new_game_has_started_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoNewGameHasStartedEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_new_game_has_started_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_new_round_event()" do
    #ARRANGE
    event_name = "NEW_ROUND_EVENT"
    expect(ServerStubMock, :send_new_round_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoNewRoundEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_new_round_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_order_chips_event()" do
    #ARRANGE
    event_name = "ORDER_CHIPS_EVENT"
    expect(ServerStubMock, :send_order_chips_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoOrderChipsEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_order_chips_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_replay_game_event()" do
    #ARRANGE
    event_name = "REPLAY_GAME_EVENT"
    expect(ServerStubMock, :send_replay_game_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoReplayGameEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_replay_game_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_request_game_session_event()" do
    #ARRANGE
    event_name = "REQUEST_GAME_SESSION_EVENT"
    expect(ServerStubMock, :send_request_game_session_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoRequestGameSessionEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_request_game_session_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_sell_chips_event()" do
    #ARRANGE
    event_name = "SELL_CHIPS_EVENT"
    expect(ServerStubMock, :send_sell_chips_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoSellChipsEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_sell_chips_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_send_game_session_event()" do
    #ARRANGE
    event_name = "SEND_GAME_SESSION_EVENT"
    expect(ServerStubMock, :send_send_game_session_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoSendGameSessionEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_send_game_session_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_setup_game_event()" do
    #ARRANGE
    event_name = "SETUP_GAME_EVENT"
    expect(ServerStubMock, :send_setup_game_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoSetupGameEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_setup_game_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_start_game_event()" do
    #ARRANGE
    event_name = "START_GAME_EVENT"
    expect(ServerStubMock, :send_start_game_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoStartGameEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_start_game_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_stop_game_event()" do
    #ARRANGE
    event_name = "STOP_GAME_EVENT"
    expect(ServerStubMock, :send_stop_game_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoStopGameEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_stop_game_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_grab_card_based_on_chance_event()" do
    #ARRANGE
    event_name = "GRAB_CARD_BASED_ON_CHANCE_EVENT"
    expect(ServerStubMock, :send_grab_card_based_on_chance_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoGrabCardBasedOnChanceEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_grab_card_based_on_chance_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_save_card_for_replay_event()" do
    #ARRANGE
    event_name = "SAVE_CARD_FOR_REPLAY_EVENT"
    expect(ServerStubMock, :send_save_card_for_replay_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoSaveCardForReplayEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_save_card_for_replay_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_commit_event_event()" do
    #ARRANGE
    event_name = "COMMIT_EVENT_EVENT"
    expect(ServerStubMock, :send_commit_event_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoCommitEventEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_commit_event_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_confirm_commit_is_prepared_event()" do
    #ARRANGE
    event_name = "CONFIRM_COMMIT_IS_PREPARED_EVENT"
    expect(ServerStubMock, :send_confirm_commit_is_prepared_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoConfirmCommitIsPreparedEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_confirm_commit_is_prepared_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_news_about_committed_event_event()" do
    #ARRANGE
    event_name = "NEWS_ABOUT_COMMITTED_EVENT_EVENT"
    expect(ServerStubMock, :send_news_about_committed_event_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoNewsAboutCommittedEventEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_news_about_committed_event_event(event)

    #ASSERT
    assert result == event_name
  end

  test "Test send_prepare_commit_event_event()" do
    #ARRANGE
    event_name = "PREPARE_COMMIT_EVENT"
    expect(ServerStubMock, :send_prepare_commit_event_event, fn _, _ -> {:ok, event_name} end)
    event = Peer2PeerNetwork.DoPrepareCommitEventEvent.new()

    #ACT
    result = Peer2PeerNetwork.JavaClient.send_prepare_commit_event_event(event)

    #ASSERT
    assert result == event_name
  end

end
