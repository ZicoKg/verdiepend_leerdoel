defmodule Peer2PeerNetwork.MixProject do
  use Mix.Project

  def project do
    [
      app: :peer_2_peer_network,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [
        tool: ExCoveralls
      ],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Peer2PeerNetwork.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:protobuf, "~> 0.9.0"},
      {:cowlib, "~> 2.9.0", override: true},
      {:grpc, github: "elixir-grpc/grpc"},
      {:json, "~> 1.4"},
      {:junit_formatter, "~> 3.3"},
      {:doctor, "~> 0.18.0", only: :dev},
      {:mox, "~> 1.0", only: :test},
      {:hammox, "~> 0.5", only: :test},
      {:excoveralls, "~> 0.10", only: :test},
    ]
  end
end
