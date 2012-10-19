module Netzke::Basepack::DataAdapters
  class AbstractAdapter

    # Decorates the record retrieved by first
    def first_with_decoration
      decorate(first_without_decoration)
    end
    alias_method_chain :first, :decoration

    # Decorates the record retrieved by find_record
    def find_record_with_decoration(id)
      decorate(find_record_without_decoration(id))
    end
    alias_method_chain :find_record, :decoration

    # Decorates the record retrieved by new_record
    def new_record_with_decoration(params = {})
      decorate(new_record_without_decoration(params))
    end
    alias_method_chain :new_record, :decoration

    # Override initializer to accept decorator_class
    def initialize(model_class, decorator_class)
      @model_class = model_class
      @decorator_class = decorator_class
    end

    private

      # Decorates record(s) if decorator_class is set
      def decorate(record)
        if @decorator_class
          @decorator_class.decorate(record)
        else
          record
        end
      end

  end
end
