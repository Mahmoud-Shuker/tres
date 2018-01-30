defmodule Openflow.SetAsync do
  defstruct(
    version: 4,
    xid: 0,
    # virtual field
    datapath_id: nil,
    # virtual field
    aux_id: 0,
    packet_in_mask_master: 0,
    packet_in_mask_slave: 0,
    port_status_mask_master: 0,
    port_status_mask_slave: 0,
    flow_removed_mask_master: 0,
    flow_removed_mask_slave: 0
  )

  alias __MODULE__

  def ofp_type, do: 28

  def read(
        <<packet_in_mask_master::32, packet_in_mask_slave::32, port_status_mask_master::32,
          port_status_mask_slave::32, flow_removed_mask_master::32, flow_removed_mask_slave::32>>
      ) do
    %SetAsync{
      packet_in_mask_master: packet_in_mask_master,
      packet_in_mask_slave: packet_in_mask_slave,
      port_status_mask_master: port_status_mask_master,
      port_status_mask_slave: port_status_mask_slave,
      flow_removed_mask_master: flow_removed_mask_master,
      flow_removed_mask_slave: flow_removed_mask_slave
    }
  end

  def to_binary(%SetAsync{
        packet_in_mask_master: packet_in_mask_master,
        packet_in_mask_slave: packet_in_mask_slave,
        port_status_mask_master: port_status_mask_master,
        port_status_mask_slave: port_status_mask_slave,
        flow_removed_mask_master: flow_removed_mask_master,
        flow_removed_mask_slave: flow_removed_mask_slave
      }) do
    <<packet_in_mask_master::32, packet_in_mask_slave::32, port_status_mask_master::32,
      port_status_mask_slave::32, flow_removed_mask_master::32, flow_removed_mask_slave::32>>
  end
end
