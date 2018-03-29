defmodule Openflow.Action.NxController do
  defstruct(
    max_len: :no_buffer,
    id: 0,
    reason: :action
  )

  @experimenter 0x00002320
  @nxast 20

  alias __MODULE__

  def new(options) do
    %NxController{
      max_len: options[:max_len] || :no_buffer,
      id: options[:id] || 0,
      reason: options[:reason] || :action
    }
  end

  def to_binary(%NxController{max_len: max_len, id: controller_id, reason: reason}) do
    max_len_int = Openflow.Utils.get_enum(max_len, :controller_max_len)
    reason_int = Openflow.Enums.to_int(reason, :packet_in_reason)

    exp_body =
      <<@experimenter::32, @nxast::16, max_len_int::16, controller_id::16, reason_int::8, 0::8>>

    <<0xFFFF::16, 16::16, exp_body::bytes>>
  end

  def read(
        <<@experimenter::32, @nxast::16, max_len_int::16, controller_id::16, reason_int::8,
          _::bytes>>
      ) do
    max_len = Openflow.Utils.get_enum(max_len_int, :controller_max_len)
    reason = Openflow.Enums.to_atom(reason_int, :packet_in_reason)
    %NxController{max_len: max_len, id: controller_id, reason: reason}
  end
end
