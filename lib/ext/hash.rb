if RUBY_VERSION < '1.9' then
  class Hash
    alias hkeys keys

    def keys
      hkeys.sort {|a,b| a.to_s <=> b.to_s unless (a.nil? and b.nil?)}
    end

    def each
      keys.each { |k| yield k, self[k] if block_given? }
    end
  end
end
