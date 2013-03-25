require 'travnoty/identity'

module Travnoty
  class Hub < Travnoty::Identity

    attr_reader :id, :code, :host, :language, :main_hub_id, :name,
      :updated_at, :created_at

    def main_hub
      @main_hub ||= self.class.fetch(:id => @attrs[:main_hub_id])
    end

    alias main_hub? main_hub_id?

  end
end
