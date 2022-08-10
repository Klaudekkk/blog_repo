require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    # wszystko, co tutaj piszemy, będzie uruchamiane przed każdym testem.
    @category = Category.new(name: "Sports")
  end

  test "category shoud be valid" do
    #zmienna @category nie bedzie dostepna poza tym testem, po wykonaniu jest czyszczona
    # przeniesione do 6 linijki, automatycznie pojawi sie w kazdym tescie
    assert @category.valid?
  end

  test "name shoud be present" do
    @category.new(name: " ")
    assert_not @category.valid?
  end

  test "name shoud be unique" do
    @category.save #aby sprawdzic czy jest unique musi najpierw istniec w bazie
    @category2 = Category.new(name: "Sports")
    assert_not @category2.valid? #przed dodaniem do modelu unique bedzie zwracac faila, no bo nie działa

  end

  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid? # bedzie zwracac fail bo mozna wprowadzic powyzej 25 znakow przed dodaniem tego do modelu

  end

  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end


end