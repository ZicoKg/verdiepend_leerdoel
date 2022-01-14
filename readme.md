<h1>Protobuf</h1>
In een proto bestand wordt vastgelegd hoe de functie call eruit komt te zien. Protobuf zorgt ervoor dat het taal onafhankelijk is hoe het contact tussen de RPC calls eruit gaat zien. Uiteindelijk moet het proto bestand omgezet worden naar de code waarin de functie of object gegenereerd moet worden.

<h2>Compileren binnen Elixir</h2>
Stap 1. Het compileren van de protobestanden voor Elixir.
</br><code>
cd ./elixir
protoc -I ../proto --elixir_out=plugins=grpc:./lib/proto ../proto/*.proto
</code>
</br>Uitvoeren van Elixir:
</br><code>
mix deps.get
iex -S mix
</code>
</br>Indien er getest wilt worden richting Python (zorg dat de Python server.py aanstaat):
</br><code>
Peer2PeerNetwork.PythonClient.send_a_chat_event(Peer2PeerNetwork.DoChatEvent.new(recipient: "", sender_uuid: "", sender_name: "De Elixir kant!", chat_text: "", round: 2, time: "", event_type: "", ips: []))
</code>

<h2>Compileren binnen Python</h2>
Stap 1. Het compileren van de protobestanden voor Elixir.
</br>Indien eerste 'Compileren binne Elixir' is gevolgd:
</br><code>
cd ..
</code>
</br>daarna:
</br><code>
python -m grpc_tools.protoc -I./proto --python_out=./python/proto --grpc_python_out=./python/proto ./proto/*.proto
</code>
</br>Uitvoeren van Python:
- Voer de main uit in server.py
- Indien er getest wilt worden richting Elixir (zorg dat Elixir aanstaat), voer de main uit in de client.py

</br>
protoc = Software die geinstaleerd dient te zijn zodat de code gecompileert kan worden.

--elixir_out = Path naar de map waar de gecompileerde code moet komen te staan.

plugins = Er moet een plugin worden ingeladen die de juiste methodes aanmaakt voor het stubben.

*.proto = Path + files die gecompileert dient te worden.
