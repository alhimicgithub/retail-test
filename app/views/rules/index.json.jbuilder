json.array!(@rules) do |rule|
  json.extract! rule, :id, :name, :product_number, :product_id, :value, :measurment
  json.url rule_url(rule, format: :json)
end
