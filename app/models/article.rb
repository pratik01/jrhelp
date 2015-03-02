class Article < ActiveRecord::Base
  attr_accessible :description, :title ,:user_id ,:image

  mount_uploader :image, ImageUploader

  include Tire::Model::Search
  include Tire::Model::Callbacks


  def self.search(params)
    tire.search(load: true) do
      query { string params, default_operator: "AND" } if params.present?
    end
  end

  mapping do
    indexes :id,           :index    => :not_analyzed
    indexes :title
    indexes :description
    indexes :user_id
  end

  after_save do
    self.index.store self
  end
end

Article.import
