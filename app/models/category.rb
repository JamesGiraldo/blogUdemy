class Category < ApplicationRecord

  has_many :has_categories, dependent: :restrict_with_error
  has_many :articles, through: :has_categories
  belongs_to :user
  validates :name, :color, presence: true
  validates :name, length: { in: 7..20 }
  validates :color, length: { in: 4..8 }

  has_attached_file :img_cat,
        styles: {
           medium: { geometry: '300x300>', format: :png, convert_options: " -background white -gravity center -extent 300x300" },
           },
           default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img_cat, content_type: /\Aimage\/.*\z/
end
