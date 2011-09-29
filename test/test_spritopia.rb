require 'spritopia'
require 'minitest/autorun'

class SpritopiaTest < MiniTest::Unit::TestCase

  def test_true
    assert true
  end

  def test_it_works
    sprite_file = full_path('cats.sprite')

    assert_equal true,  Spritopia.process_file(sprite_file), "Spritopia should return true"

    assert_file_exists "cats.png", "cats.png should be generated"
    assert_file_exists "cats.json", "cats.json should be generated"
  end


  def assert_file_exists(filename, message = nil)
    assert File.file?(full_path(filename)), message
  end

  def full_path(filename)
    File.expand_path("../sample/#{filename}",__FILE__)
  end
end
