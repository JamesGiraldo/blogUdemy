# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

Rails.application.config.assets.precompile += %w( articles.css )
Rails.application.config.assets.precompile += %w( articles.js )
Rails.application.config.assets.precompile += %w( categories.css )
Rails.application.config.assets.precompile += %w( categories.js )
Rails.application.config.assets.precompile += %w( contacts.css )
Rails.application.config.assets.precompile += %w( contacts.js )
Rails.application.config.assets.precompile += %w( comments.css )
Rails.application.config.assets.precompile += %w( comments.js )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
