# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
import grpc

from buildstream._protos.google.bytestream import bytestream_pb2 as google_dot_bytestream_dot_bytestream__pb2


class ByteStreamStub(object):
  """#### Introduction

  The Byte Stream API enables a client to read and write a stream of bytes to
  and from a resource. Resources have names, and these names are supplied in
  the API calls below to identify the resource that is being read from or
  written to.

  All implementations of the Byte Stream API export the interface defined here:

  * `Read()`: Reads the contents of a resource.

  * `Write()`: Writes the contents of a resource. The client can call `Write()`
  multiple times with the same resource and can check the status of the write
  by calling `QueryWriteStatus()`.

  #### Service parameters and metadata

  The ByteStream API provides no direct way to access/modify any metadata
  associated with the resource.

  #### Errors

  The errors returned by the service are in the Google canonical error space.
  """

  def __init__(self, channel):
    """Constructor.

    Args:
      channel: A grpc.Channel.
    """
    self.Read = channel.unary_stream(
        '/google.bytestream.ByteStream/Read',
        request_serializer=google_dot_bytestream_dot_bytestream__pb2.ReadRequest.SerializeToString,
        response_deserializer=google_dot_bytestream_dot_bytestream__pb2.ReadResponse.FromString,
        )
    self.Write = channel.stream_unary(
        '/google.bytestream.ByteStream/Write',
        request_serializer=google_dot_bytestream_dot_bytestream__pb2.WriteRequest.SerializeToString,
        response_deserializer=google_dot_bytestream_dot_bytestream__pb2.WriteResponse.FromString,
        )
    self.QueryWriteStatus = channel.unary_unary(
        '/google.bytestream.ByteStream/QueryWriteStatus',
        request_serializer=google_dot_bytestream_dot_bytestream__pb2.QueryWriteStatusRequest.SerializeToString,
        response_deserializer=google_dot_bytestream_dot_bytestream__pb2.QueryWriteStatusResponse.FromString,
        )


class ByteStreamServicer(object):
  """#### Introduction

  The Byte Stream API enables a client to read and write a stream of bytes to
  and from a resource. Resources have names, and these names are supplied in
  the API calls below to identify the resource that is being read from or
  written to.

  All implementations of the Byte Stream API export the interface defined here:

  * `Read()`: Reads the contents of a resource.

  * `Write()`: Writes the contents of a resource. The client can call `Write()`
  multiple times with the same resource and can check the status of the write
  by calling `QueryWriteStatus()`.

  #### Service parameters and metadata

  The ByteStream API provides no direct way to access/modify any metadata
  associated with the resource.

  #### Errors

  The errors returned by the service are in the Google canonical error space.
  """

  def Read(self, request, context):
    """`Read()` is used to retrieve the contents of a resource as a sequence
    of bytes. The bytes are returned in a sequence of responses, and the
    responses are delivered as the results of a server-side streaming RPC.
    """
    context.set_code(grpc.StatusCode.UNIMPLEMENTED)
    context.set_details('Method not implemented!')
    raise NotImplementedError('Method not implemented!')

  def Write(self, request_iterator, context):
    """`Write()` is used to send the contents of a resource as a sequence of
    bytes. The bytes are sent in a sequence of request protos of a client-side
    streaming RPC.

    A `Write()` action is resumable. If there is an error or the connection is
    broken during the `Write()`, the client should check the status of the
    `Write()` by calling `QueryWriteStatus()` and continue writing from the
    returned `committed_size`. This may be less than the amount of data the
    client previously sent.

    Calling `Write()` on a resource name that was previously written and
    finalized could cause an error, depending on whether the underlying service
    allows over-writing of previously written resources.

    When the client closes the request channel, the service will respond with
    a `WriteResponse`. The service will not view the resource as `complete`
    until the client has sent a `WriteRequest` with `finish_write` set to
    `true`. Sending any requests on a stream after sending a request with
    `finish_write` set to `true` will cause an error. The client **should**
    check the `WriteResponse` it receives to determine how much data the
    service was able to commit and whether the service views the resource as
    `complete` or not.
    """
    context.set_code(grpc.StatusCode.UNIMPLEMENTED)
    context.set_details('Method not implemented!')
    raise NotImplementedError('Method not implemented!')

  def QueryWriteStatus(self, request, context):
    """`QueryWriteStatus()` is used to find the `committed_size` for a resource
    that is being written, which can then be used as the `write_offset` for
    the next `Write()` call.

    If the resource does not exist (i.e., the resource has been deleted, or the
    first `Write()` has not yet reached the service), this method returns the
    error `NOT_FOUND`.

    The client **may** call `QueryWriteStatus()` at any time to determine how
    much data has been processed for this resource. This is useful if the
    client is buffering data and needs to know which data can be safely
    evicted. For any sequence of `QueryWriteStatus()` calls for a given
    resource name, the sequence of returned `committed_size` values will be
    non-decreasing.
    """
    context.set_code(grpc.StatusCode.UNIMPLEMENTED)
    context.set_details('Method not implemented!')
    raise NotImplementedError('Method not implemented!')


def add_ByteStreamServicer_to_server(servicer, server):
  rpc_method_handlers = {
      'Read': grpc.unary_stream_rpc_method_handler(
          servicer.Read,
          request_deserializer=google_dot_bytestream_dot_bytestream__pb2.ReadRequest.FromString,
          response_serializer=google_dot_bytestream_dot_bytestream__pb2.ReadResponse.SerializeToString,
      ),
      'Write': grpc.stream_unary_rpc_method_handler(
          servicer.Write,
          request_deserializer=google_dot_bytestream_dot_bytestream__pb2.WriteRequest.FromString,
          response_serializer=google_dot_bytestream_dot_bytestream__pb2.WriteResponse.SerializeToString,
      ),
      'QueryWriteStatus': grpc.unary_unary_rpc_method_handler(
          servicer.QueryWriteStatus,
          request_deserializer=google_dot_bytestream_dot_bytestream__pb2.QueryWriteStatusRequest.FromString,
          response_serializer=google_dot_bytestream_dot_bytestream__pb2.QueryWriteStatusResponse.SerializeToString,
      ),
  }
  generic_handler = grpc.method_handlers_generic_handler(
      'google.bytestream.ByteStream', rpc_method_handlers)
  server.add_generic_rpc_handlers((generic_handler,))
