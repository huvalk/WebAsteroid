require 'test_helper'

class LocaleControllerTest < ActionDispatch::IntegrationTest
  test "shold get locale" do
    get locale_lang_url
    assert_response :found
  end

  test "shold change lang game en" do
    get locale_lang_url({ lang: 'en', cont: 'game', act: 'play' })
    assert_response :found
    follow_redirect!
    assert_equal '/game/play', path
    assert_equal :en, I18n.locale
  end

  test "shold change lang game ru" do
    get locale_lang_url({ lang: 'ru', cont: 'game', act: 'play' })
    assert_response :found
    follow_redirect!
    assert_equal '/game/play', path
    assert_equal :ru, I18n.locale
  end

  test "shold change lang login ru" do
    get locale_lang_url({ lang: 'ru', cont: 'session', act: 'login' })
    assert_response :found
    follow_redirect!
    assert_equal '/session/login', path
    assert_equal :ru, I18n.locale
  end

  test "shold change lang login en" do
    get locale_lang_url({ lang: 'en', cont: 'session', act: 'login' })
    assert_response :found
    follow_redirect!
    assert_equal '/session/login', path
    assert_equal :en, I18n.locale
  end
end
