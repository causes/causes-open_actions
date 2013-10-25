# Accumulates field definitions and then converts them into an Array that can
# be used to build a form.
module OpenActions
  class FormSpec
    def initialize
      @fields = {}
    end

    def text_field(name, *args)
      @fields[name] = [:text_field, *args]
    end

    def text_area(name, *args)
      @fields[name] = [:text_area, *args]
    end

    def to_a
      @fields.map do |name, (type, *args)|
        [type, name, *args]
      end
    end
  end
end
