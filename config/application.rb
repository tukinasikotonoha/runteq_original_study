require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RunteqOriginalStudy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Timezoneを修正
    # DBへの保存はJSTで画面表示もJST(日本時間)
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    # rails g コマンドを使用した際に、assets、helper、testファイル、ルーティングが生成されないように設定
    config.generators do |g|
      g.helper false          # ヘルパー生成せず
      g.assets false          # CSS/JSファイル生成せず
      g.skip_routes true      # routes.rb変更せず
      g.test_framework false  # テストスクリプト生成せず
    end
  end
end
