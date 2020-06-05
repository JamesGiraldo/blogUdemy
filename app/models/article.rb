class Article < ApplicationRecord
  include PermissionsConcern
  has_many :has_categories
  has_many :categories, through: :has_categories
  after_create :save_categories
  belongs_to :user
  validates :title, uniqueness: true
  validates :title, :body, presence: true
  validates :title, length: {minimum: 15, too_short: "Minimo Son %{count} Caracteres." }
  validates :body, length: { minimum: 100, too_short: "Minimo Son %{count} Caracteres." }
  scope :ultimos, -> {order("created_at DESC")}

  scope :titulo, -> (title) { where("title LIKE ?", "%#{title}%") }

  has_attached_file :img_art,
          styles: {
             thumb:  { geometry: '320x240>', format: :png, convert_options: " -background white -gravity center -extent 300x300" }, #80x60
             medium: { geometry: '300x300>', format: :png, convert_options: " -background white -gravity center -extent 300x300" },
             big:    { geometry: '500x500>', format: :png, convert_options: " -background white -gravity center -extent 500x500" },
             ban:    { geometry: '630x315>', format: :png, convert_options: " -background white -gravity center -extent 630x315" },
             # hd:     { geometry: '1920x1680>', format: :png, convert_options: " -background white -gravity center -extent 1920x1680" },
             },
             default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img_art, content_type: /\Aimage\/.*\z/

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
