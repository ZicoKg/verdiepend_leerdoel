import grpc
import python.proto.ServerRPC_pb2_grpc as ServerRPC_pb2_grpc
import python.proto.ServerRPC_pb2 as ServerRPC_pb2


class Client(object):

    def __init__(self):
        self.host = 'localhost'
        self.server_port = 3001

        # instantiate a channel
        self.channel = grpc.insecure_channel('{}:{}'.format(self.host, self.server_port))

        # bind the client and the server
        self.stub = ServerRPC_pb2_grpc.ServerStub(self.channel)

    def send_chat_event(self):
        chatevent = ServerRPC_pb2.DoChatEvent(recipient="", sender_uuid="", sender_name="Python kant!", chat_text="", round=0, time="", event_type="", network=True)
        print(f'{chatevent}')
        return self.stub.send_a_chat_event(chatevent)


if __name__ == '__main__':
    client = Client()
    result = client.send_chat_event()
    print(f'{result}')
