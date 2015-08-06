json.(@scan, :id, :value, :created_at, :updated_at)
json.(@checkout, :total)
json.product(@scan.product, :code, :name, :price)
