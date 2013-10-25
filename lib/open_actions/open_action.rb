module OpenActions
  class OpenAction
    # @private
    def self.demodulize(name)
      name.split('::').last
    end

    def self.inherited(klass)
      OpenActions.actions[demodulize(klass.to_s)] = klass
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

    # Declare strings of copy to be shown in the interface. The block is
    # evaluated in the context of an OpenActions::OpenAction::CopyDefinition
    # object.
    # TODO: Document which strings are needed.
    def self.copy_strings(&block)
      cd = CopyDefinition.new
      cd.instance_eval(&block)
      config[:copy_strings] = cd.to_h
    end

    # If an action needs to validate its leader fields or action-taker fields,
    # it can add errors in this method.
    # @param [Hash] data Data about the action, in the same format as
    #   `take_action!`'s `data` parameter.
    # @param [ActiveModel::Errors] errors An object to add errors to.
    def validate_data(data, errors)
      # No-op by default -- subclasses should override.
    end

    # This method is given a data hash (with the same format as take_action!)
    # and an empty ActiveModel::Errors object. If an action needs to validate
    # its leader fields or action-taker fields, it can add errors in this
    # method.
    # @param [Hash] data Data about the action. This hash has keys for:
    #   * each leader_field and action_taker_field. If there's a field repeated
    #     between the two sets, we only pass in the action-taker value.
    #   * each user_auth provider. For example, if the action contains
    #     `user_auth :twitter`, the data hash will have a `:twitter` key whose
    #     data is a hash of twitter-specific auth information (?).
    def take_action!(data)
      # No-op by default -- subclasses should override.
    end

    # @private
    class CopyDefinition
      def initialize
        @copy_strings = {}
      end

      def method_missing(name, str, *)
        @copy_strings[name] = str
      end

      def to_h
        @copy_strings
      end
    end
  end
end
