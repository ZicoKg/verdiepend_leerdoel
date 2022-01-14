import grpc
from concurrent import futures
import python.proto.ServerRPC_pb2 as ServerRPC_pb2
import python.proto.ServerRPC_pb2_grpc as ServerRPC_pb2_grpc


class ServerService(ServerRPC_pb2_grpc.ServerServicer):

    def __init__(self, *args, **kwargs):
        pass

    def send_a_chat_event(self, request, context):
        print(request)
        return ServerRPC_pb2.EmptyReply(response=request.sender_name)


def start():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    ServerRPC_pb2_grpc.add_ServerServicer_to_server(ServerService(), server)
    server.add_insecure_port('[::]:3000')
    server.start()
    server.wait_for_termination()


if __name__ == '__main__':
    start()
