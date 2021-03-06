require './test/test_helper'

class BasicTest < Test::Unit::TestCase
  include Rack::Test::Methods
  include TestHelper::Methods

  def test_status
    get "/"
    assert_response 200
    assert_json

    assert_match /report_bugs/, last_response.body
  end

  def test_mongo
    bill = Bill.create!(
      bill_id: "hr1492-113",
      short_title: "Columbus Sailed the Ocean Blue"
    )

    get "/bills", {bill_id: "hr1492-113"}
    assert_response 200
    assert_json

    assert_match /Columbus Sailed/, last_response.body
  end

  def test_elasticsearch
    Utils.es_store! "bills", "hr1492-113", {
      bill_id: "hr1492-113",
      short_title: "Columbus Sailed the Ocean Blue"
    }
    Searchable.client.indices.refresh

    get "/bills/search", {bill_id: "hr1492-113"}
    assert_response 200
    assert_json

    assert_match /Columbus Sailed/, last_response.body
  end

end