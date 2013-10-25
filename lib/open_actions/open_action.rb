module OpenActions
  class OpenAction
    # @private
    def self.inherited(klass)
      OpenActions.actions << klass
    end

    # @return [Hash] Accumulated config for this action type.
    def self.config
      @config ||= {}
    end

    # Declare a dependency on an auth provider.
    def self.user_auth(provider)
      config[:user_auth] ||= []
      config[:user_auth] << provider
    end

    # Declare the structure of the form shown to leaders when creating the
    # action. The block is evaluated in the context of an OpenActions::FormSpec
    # object.
    def self.leader_fields(&block)
      fs = FormSpec.new
      fs.instance_eval(&block)
      config[:leader_fields] = fs.to_a
    end

    # Declare the description of the action type that will be shown in the list
    # of action types on Causes.
    # @example
    #   "<strong>Watching a video</strong> to unlock a donation from a sponsor."
    def self.leader_description(str)
      config[:leader_description] = str
    end

    # Declare the structure of the form shown to users who are taking the
    # action. The block is evaluated in the context of an OpenActions::FormSpec
    # object.
    def self.action_taker_fields(&block)
      fs = FormSpec.new
      fs.instance_eval(&block)
      config[:action_taker_fields] = fs.to_a
    end

    def validate_data(data, errors)
    end

    def take_action!(data)
    end
  end
end