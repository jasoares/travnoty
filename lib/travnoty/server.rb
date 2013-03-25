module Travnoty
  class Server < Travnoty::Identity

    attr_reader :id, :code, :host, :name, :speed, :world_id, :hub_id,
      :updated_at, :created_at

  end
end
