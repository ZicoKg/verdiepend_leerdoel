import Mox

ExUnit.start()

defmock(JavaClientMock, for: Peer2PeerNetwork.JavaClient)
Application.put_env(:peer_2_peer_network, :java_client, JavaClientMock)

defmock(DynamicSupervisorMock, for: Peer2PeerNetwork.IDynamicSupervisor)
Application.put_env(:peer_2_peer_network, :dynamic_supervisor, DynamicSupervisorMock)

defmock(ProcessMock, for: Peer2PeerNetwork.IProcess)
Application.put_env(:peer_2_peer_network, :process, ProcessMock)

defmock(GRPCStubMock, for: Peer2PeerNetwork.IGRPCStub)
Application.put_env(:peer_2_peer_network, :grpc_stub, GRPCStubMock)

defmock(ServerStubMock, for: Peer2PeerNetwork.IServerStub)
Application.put_env(:peer_2_peer_network, :server_stub, ServerStubMock)

defmock(NetworkStubMock, for: Peer2PeerNetwork.INetworkServiceUtilStub)
Application.put_env(:peer_2_peer_network, :network_stub, NetworkStubMock)

defmock(GenServerMock, for: Peer2PeerNetwork.IGenServer)
Application.put_env(:peer_2_peer_network, :genserver, GenServerMock)

defmock(ApplicationMock, for: Peer2PeerNetwork.IApplication)
Application.put_env(:peer_2_peer_network, :application, ApplicationMock)

defmock(TaskSupervisorMock, for: Peer2PeerNetwork.ITaskSupervisor)
Application.put_env(:peer_2_peer_network, :task_supervisor, TaskSupervisorMock)
