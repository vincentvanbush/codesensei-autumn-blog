require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # można użyć chrome zamiast headless_chrome żeby przeglądarka się pokazała
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
end
