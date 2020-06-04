class Article < ApplicationRecord
  include PermissionsConcern
  has_many :has_categories
  has_many :categories, through: :has_categories
  after_create :save_categories
  belongs_to :user
  validates :title, uniqueness: true
  validates :title, :body, presence: true
  validates :title, length: {minimum: 20, too_short: "Minimo Son %{count} Caracteres." }
  validates :body, length: { minimum: 100, too_short: "Minimo Son %{count} Caracteres." }
  scope :ultimos, -> {order("created_at DESC")}

  scope :titulo, -> (title) { where("title LIKE ?", "%#{title}%") }

  def categories=(value)
      @categories = value
      # raise @categories.to_yaml
  end
  private
  def save_categories
      @categories.each do |category_id|
        # raise "category_id #{category_id} article_id#{self.id}"
        HasCategory.create(category_id: category_id, article_id: self.id)
      end
  end
end
