require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    # @book = books(:one)
    @book = Book.create(title: 'kos', description: 'sok', published: 2018-03-21)
  end

  test "should get index" do
    get books_url, as: :json
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, params: { book: { description: @book.description, published: @book.published, title: @book.title } }, as: :json
    end

    assert_response 201
  end

  test "should show book" do
    get book_url(@book), as: :json
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { description: @book.description, published: @book.published, title: @book.title } }, as: :json
    assert_response 200
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book), as: :json
    end

    assert_response 204
  end
end
