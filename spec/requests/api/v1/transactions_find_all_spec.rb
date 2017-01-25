require 'rails_helper'

RSpec.describe "Transactions API Find_All Controller" do
  it "can find transactions by result" do 
    create_list(:transaction, 3)
    get '/api/v1/transactions/find_all?result=success'

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions).to have_key("id")
    expect(transactions).to have_key("result")
    expect(transactions).to have_key("credit_card_number")
    expect(transactions["result"]).to eq("success")
  end

  it "can find all transactions by credit_card_number" do 
    create_list(:transaction, 3)
    get '/api/v1/transactions/find_all?credit_card_number=4654405418249632'

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions).to have_key("id")
    expect(transactions).to have_key("result")
    expect(transactions).to have_key("credit_card_number")
    expect(transactions["credit_card_number"]).to eq("4654405418249632")
  end
end