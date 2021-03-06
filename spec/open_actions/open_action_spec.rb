require 'spec_helper'

module OpenActions
  describe OpenAction do
    describe '.user_auth' do
      it 'records an auth dependency' do
        klass = Class.new(OpenAction) do
          user_auth :twitter
        end
        klass.config[:user_auth].must_equal [:twitter]
      end
    end

    describe '.leader_fields' do
      it "records the structure of the leader's form" do
        klass = Class.new(OpenAction) do
          leader_fields do
            text_field :shoe_size
            text_area :biography
          end
        end

        klass.config[:leader_fields].must_equal([
          [:text_field, :shoe_size],
          [:text_area,  :biography]
        ])
      end
    end

    describe '.action_taker_fields' do
      it "records the structure of the action taker's form" do
        klass = Class.new(OpenAction) do
          leader_fields do
            text_field :shoe_size
            text_area :biography
          end
        end

        klass.config[:leader_fields].must_equal([
          [:text_field, :shoe_size],
          [:text_area,  :biography]
        ])
      end
    end

    describe '.copy_strings' do
      it 'records arbitrary strings of copy' do
        klass = Class.new(OpenAction) do
          copy_strings do
            verb 'sing'
            verbed 'sang'
            quality 'poor'
          end
        end

        klass.config[:copy_strings].must_equal(
          verb: 'sing',
          verbed: 'sang',
          quality: 'poor'
        )
      end
    end
  end
end
