defmodule OfpEchoTest do
  use ExUnit.Case
  doctest Openflow

  describe "Openflow.read/1" do
    test "with OFP_ECHO_REQUEST packet" do
      {:ok, %Openflow.Echo.Request{} = echo, ""} =
        "test/packet_data/ofp_echo_request.raw"
        |> File.read!()
        |> Openflow.read()

      assert echo.version == 4
      assert echo.xid == 0
      assert echo.data == ""
    end

    test "with OFP_ECHO_REPLY packet" do
      {:ok, %Openflow.Echo.Reply{} = echo, ""} =
        "test/packet_data/ofp_echo_reply.raw"
        |> File.read!()
        |> Openflow.read()

      assert echo.version == 4
      assert echo.xid == 0
      assert echo.data == ""
    end
  end

  describe "Openflow.to_binary/1" do
    test "with %Openflow.Echo.Request{}" do
      echo = %Openflow.Echo.Request{
        version: 4,
        xid: 0,
        data: ""
      }

      expect =
        "test/packet_data/ofp_echo_request.raw"
        |> File.read!()

      assert Openflow.to_binary(echo) == expect
    end

    test "with %Openflow.Echo.Reply{}" do
      echo = %Openflow.Echo.Reply{
        version: 4,
        xid: 0,
        data: ""
      }

      expect =
        "test/packet_data/ofp_echo_reply.raw"
        |> File.read!()

      assert Openflow.to_binary(echo) == expect
    end
  end
end
