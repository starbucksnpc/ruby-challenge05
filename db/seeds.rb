require 'csv'

# 기존 데이터를 모두 삭제합니다.
Product.destroy_all
Category.destroy_all

# CSV 파일 경로 지정
csv_file = Rails.root.join('db', 'products.csv')
csv_data = File.read(csv_file)

# CSV 데이터 파싱
products = CSV.parse(csv_data, headers: true)

products.each do |row|
  # CSV 데이터에서 카테고리 이름을 가져옵니다.
  category_name = row['category']
  category = Category.find_or_create_by(name: category_name)

  # 제품 생성
  Product.create(
    title: row['name'],
    description: row['description'],
    price: row['price'],
    stock_quantity: row['stock quantity'],
    category: category
  )
end
