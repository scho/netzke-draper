module Netzke::Basepack::DataAdapters
  class ActiveRecordAdapter

    # Decorates the records retrieved by get_records
    def get_records_with_decoration(params, columns=[])
      decorate(get_records_without_decoration(params, columns))
    end
    alias_method_chain :get_records, :decoration

    # Decorates the records retrieved by find_record
    def find_record_with_decoration(id)
      decorate(find_record_without_decoration(id))
    end
    alias_method_chain :find_record, :decoration

  end
end
