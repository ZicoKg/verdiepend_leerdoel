use Mix.Config

config :logger, :console, format: "$time $metadata[$level] $message\n"
config :grpc, start_server: true, elixir_port: 3001, python_port: 3000, python_host: "localhost"
config :peer_2_peer_network,
       server_stub: Peer2PeerNetwork.IServerStub,
       grpc_stub: Peer2PeerNetwork.IGRPCStub,
       python_client: Peer2PeerNetwork.PythonClient
