require 'json'
require 'selenium-webdriver'
require 'test_helper'

class GameControllerTest < ActionDispatch::IntegrationTest
  test "should get play" do
    get game_play_url
    assert_response :found
  end

  test "should get record" do
    post game_record_url
    assert_response :found
  end

  test "test_untitled_test_case" do
    @driver = Selenium::WebDriver.for :chrome
    @base_url = "https://www.katalon.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
    @driver.get "http://localhost:3000/session/login"
    @driver.find_element(:id, "login").click
    @driver.find_element(:id, "login").clear
    @driver.find_element(:id, "login").send_keys "test"
    @driver.find_element(:id, "password").click
    @driver.find_element(:id, "password").clear
    @driver.find_element(:id, "password").send_keys "test"
    @driver.find_element(:name, "commit").click
    @driver.find_element(:id, "b1").click
    !60.times{ break if (@driver.find_element(:id, "endLabel").text.include? "Игра окончена." rescue false); sleep 1 }
    assert_equal @driver.find_element(:id, "endLabel").text, "Игра окончена. Ты набрал: 0"
    @driver.quit
    assert @verification_errors.empty?
  end
end
