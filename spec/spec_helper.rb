require_relative '../lib/hero'
require_relative '../lib/attack_action'
require_relative '../lib/dicepool'
require_relative '../lib/monster'
require_relative '../lib/flee_action'
require_relative '../lib/action'
require_relative '../lib/black_king_bar'

Dir['./spec/support/**/*.rb'].sort.each { |file| require file }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
