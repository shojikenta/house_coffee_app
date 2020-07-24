# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( 
  superfish.css style.css simple-line-icons.css icomoon.css \
  flexslider.css bootstrap.css animate.css style.css magnific-popup.css \
  superfish.js respond.min.js modernizr-2.6.2.min.js \
  main.js jquery.waypoints.min.js jquery.stellar.min.js \
  jquery.min.js jquery.flexslider-min.js jquery.easing.1.3.js \
  jquery.countTo.js hoverlntent.js google_map.js bootstrap.min.js custom.js)
