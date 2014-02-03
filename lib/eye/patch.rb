require "eye"
require "eye/patch/overrides"

begin
  require "eye/notify/ses"
rescue LoadError
  # Don't worry about loading the ses notifier when `aws/ses` is unavailable
end

module Eye::Patch

  require "eye/patch/settings"
  require "eye/patch/config"
  require "eye/patch/application"
  require "eye/patch/version"

  def self.parse(filename)
    settings = Eye::Patch::Settings.new(filename)

    config = Eye::Config.new(
      Eye::Patch::Config.new(settings),
      Eye::Patch::Application.new(settings))
    config.validate!

    config
  end
end