require 'spec_helper'

describe OpenActions do
  describe '.actions' do
    it 'returns all subclasses of OpenAction' do
      klass = Class.new(OpenActions::OpenAction)
      OpenActions.actions.values.must_include klass
    end
  end
end
