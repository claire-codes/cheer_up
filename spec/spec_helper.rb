$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'cheer_up'

def capture_stdout(&block)
  original_stdout = $stdout
  $stdout = fake = StringIO.new
  begin
    yield
  ensure
    $stdout = original_stdout
  end
  fake.string
end