require 'rails_helper'

RSpec.describe "Customers API Random Controller" do
  it "can return a customer" do 
    create_list(:customer, 3)
    get '/api/v1/customers/random'

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer).to have_key("id")
    expect(customer).to have_key("first_name")
    expect(customer).to have_key("last_name")
    expect(customer["first_name"]).to be_a(String)
  end

end