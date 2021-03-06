require 'rails_helper'

RSpec.describe "Customers API Find_All Controller" do
  it "can find all customers by first_name" do 
    create_list(:customer, 3)
    get '/api/v1/customers/find_all?first_name=Prof. Severus'
    
    customers = JSON.parse(response.body)
    customer = customers.first

    expect(response).to be_success
    expect(customer).to have_key("first_name")
    expect(customer).to have_key("last_name")
    expect(customer["first_name"]).to eq("Prof. Severus")
  end

  it "can find all customers by last_name" do 
    create_list(:customer, 3)
    get '/api/v1/customers/find_all?last_name=Snape'

    customers = JSON.parse(response.body)
    customer = customers.first

    expect(response).to be_success
    expect(customer).to have_key("id")
    expect(customer).to have_key("first_name")
    expect(customer).to have_key("last_name")
    expect(customer["last_name"]).to eq("Snape")
  end
end