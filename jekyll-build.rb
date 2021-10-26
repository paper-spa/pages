# frozen_string_literal: true

require "rubygems"
require "bundler"
Bundler.setup(:default)

require "jekyll"

# Various fixes required, see PagesJekyll::Configuration, Jekyll::Configuration
# FIXME: merge with user config
# FIXME: backwards_compatibilize
# FIXME: restrict plugins
# FIXME: remove configure_theme
# FIXME: set requested theme
# FIXME: kramdown sanitization
# FIXME: collections dir sanitization
# FIXME: additional overrides
config = Jekyll::Configuration::DEFAULTS.dup

# Preserve existing site and build directory interface
config["source"] = "/page-build/site-source-pagesjekyll-ftw"
config["destination"] = "/page-build/repo"

site = Jekyll::Site.new(config)

# Preserve existing build sequence
%w(reset read generate render cleanup write).each do |method|
   site.public_send(method)
end
