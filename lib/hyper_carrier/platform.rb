# frozen_string_literal: true

module HyperCarrier
  class Platform < HyperCarrier::Carrier
    attr_accessor :conf
    attr_reader :rates_with_excessive_length_fees

    def initialize(options = {})
      requirements.each { |key| requires!(options, key) }
      @conf = nil
      @debug = options[:debug].blank? ? false : true
      @options = options
      @last_request = nil
      @test_mode = @options[:test]

      conf_path = File.join(__dir__, 'configuration', 'platforms', "#{self.class.ancestors[1].name.split('::')[1].underscore}.yml")
      @conf = YAML.safe_load(File.read(conf_path), permitted_classes: [Symbol])

      conf_path = File.join(__dir__, 'configuration', 'carriers', "#{self.class.to_s.split('::')[1].underscore}.yml")
      @conf = @conf.deep_merge(YAML.safe_load(File.read(conf_path), permitted_classes: [Symbol]))

      @rates_with_excessive_length_fees = @conf.dig(:attributes, :rates, :with_excessive_length_fees)
    end

    def find_bol(*)
      raise NotImplementedError, "#{self.class.name}: #find_bol not supported"
    end

    def find_estimate(*)
      raise NotImplementedError, "#{self.class.name}: #find_estimate not supported"
    end

    def find_pod(*)
      raise NotImplementedError, "#{self.class.name}: #find_pod not supported"
    end
  end
end
