delegate :params, :h, :link_to, :number_to_currency, to: :@view

def initialize(view)
  @view = view
end

def as_json(options = {})
  {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Article.count,
      iTotalDisplayRecords: articles.total_entries,
      aaData: data
  }
end
def fetch_products
  products = Product.order("#{sort_column} #{sort_direction}")
  products = products.page(page).per_page(per_page)
  if params[:sSearch].present?
    products = products.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
  end
  products
end
private
def data
  articles.map do |a|
    [
        link_to(a.name, a),
        h(a.title),
        h(a.description)
    ]
  end
end