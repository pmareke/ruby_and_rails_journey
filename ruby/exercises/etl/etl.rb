class ETL
  def self.transform input
    input.each_with_object({}) do |(key, values), acc|
      values.each { |item| acc[item.downcase] = key}
    end
  end
end
