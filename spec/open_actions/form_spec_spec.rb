require 'spec_helper'

module OpenActions
  describe FormSpec do
    it 'returns an empty array if no fields have been defined' do
      FormSpec.new.to_a.must_equal []
    end

    it 'records text_field and text_area calls' do
      fs = FormSpec.new
      fs.text_field :foo
      fs.text_field :bar
      fs.text_area :baz
      fs.to_a.must_equal [
        [:text_field, :foo],
        [:text_field, :bar],
        [:text_area, :baz]
      ]
    end

    it 'records extra params' do
      fs = FormSpec.new
      fs.text_field :foo, class: 'red'
      fs.to_a.must_equal [[:text_field, :foo, class: 'red']]
    end

    it 'only records one field per name' do
      fs = FormSpec.new
      fs.text_field :foo, class: 'red'
      fs.text_field :foo, class: 'blue'
      fs.to_a.must_equal [[:text_field, :foo, class: 'blue']]
    end
  end
end
