json.(@scan, :id, :value, :created_at, :updated_at)
json.(@checkout, :total, :original_total)
json.product(@scan.product, :code, :name, :price)
