require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "get new category form and create category" do
    get "/categories/new" #uzyskanie ścieżki do nowej kategorii
    assert_response :success # potwierdzenie że sie udało
    assert_difference 'Category.count', 1 do #chcemy miec pewność że liczba kategori zwiekszyła sie o jeden
      post categories_path, params: {category: {name: "Sports"}} # to jest linia z kontrolera test z create
      assert_response :redirect  #ma być przekierowanie

    end
    #Po zakończeniu przekierowania
    # chcemy śledzić to przekierowanie i zobaczyć, dokąd nas zaprowadzi.
    follow_redirect!
    assert_response :success
    assert_match "Sports", response.body #powinno wyswietlic sie sports i tego bedziemy szukac w body
  end

  test "get new category form and reject invalid category submission" do #stworz nowa kategorie i odrzuć nieprawidłowe zgłoszenie
    get "/categories/new" #uzyskanie ścieżki do nowej kategorii
    assert_response :success # potwierdzenie że sie udało
    #jeśli jest to nieprawidłowe zgłoszenie, nie powinno być różnicy w liczbie kategorii.
    assert_no_difference 'Category.count'do
      post categories_path, params: {category: {name: " "}} # to jest linia z kontrolera test z create
      #jezeli tak sie stanie renderuje nam nowy form
    end
    assert_match "following errors", response.body #szukamy tych slow ktore maja sie znalezc w body
    assert_select 'article.message' #shared/errors te dwie linijki sie tam znajduja i daja znać ze to chodzi o error
    assert_select 'div.message-header'
  end
end
