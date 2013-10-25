module OpenActions
  # @returns [Array] All subclasses of OpenActions::OpenAction.
  def self.actions
    @actions ||= []
  end
end

require 'open_actions/version'
require 'open_actions/form_spec'
require 'open_actions/open_action'
require 'open_actions/tweet_at_target'
