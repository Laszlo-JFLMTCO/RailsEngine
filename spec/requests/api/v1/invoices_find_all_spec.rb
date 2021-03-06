require 'rails_helper'

RSpec.describe 'Invoices API Find_All Controller' do
  it 'can find an invoice by id' do
    test_invoices = create_list(:invoice, 3)
    get "/api/v1/invoices/find_all?id=#{test_invoices.first['id']}"

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(1)
    expect(invoice).to be_a(Hash)
    expect(invoice).to have_key('id')
    expect(invoice['id']).to be_a(Integer)
    expect(invoice['id']).to eq(test_invoices.first['id'])
    expect(invoice).to have_key('customer_id')
    expect(invoice['customer_id']).to be_a(Integer)
    expect(invoice).to have_key('merchant_id')
    expect(invoice['merchant_id']).to be_a(Integer)
    expect(invoice).to have_key('status')
    expect(invoice['status']).to be_a(String)
  end

  it 'can find an invoice by customer id' do
    test_invoices = create_list(:invoice, 3)
    test_invoices[0].update(customer: Customer.first)
    test_invoices[1].update(customer: Customer.last)
    test_invoices[2].update(customer: Customer.first)
    get "/api/v1/invoices/find_all?customer_id=#{test_invoices.first['customer_id']}"

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(2)
    expect(invoice).to be_a(Hash)
    expect(invoice).to have_key('id')
    expect(invoice['id']).to be_a(Integer)
    expect(invoice).to have_key('customer_id')
    expect(invoice['customer_id']).to be_a(Integer)
    expect(invoice).to have_key('merchant_id')
    expect(invoice['merchant_id']).to be_a(Integer)
    expect(invoice).to have_key('status')
    expect(invoice['status']).to be_a(String)
  end

  it 'can find an invoice by merchant id' do
    test_invoices = create_list(:invoice, 3)
    test_invoices[0].update(merchant: Merchant.first)
    test_invoices[1].update(merchant: Merchant.last)
    test_invoices[2].update(merchant: Merchant.first)
    get "/api/v1/invoices/find_all?merchant_id=#{test_invoices.first['merchant_id']}"

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(2)
    expect(invoice).to be_a(Hash)
    expect(invoice).to have_key('id')
    expect(invoice['id']).to be_a(Integer)
    expect(invoice).to have_key('customer_id')
    expect(invoice['customer_id']).to be_a(Integer)
    expect(invoice).to have_key('merchant_id')
    expect(invoice['merchant_id']).to be_a(Integer)
    expect(invoice).to have_key('status')
    expect(invoice['status']).to be_a(String)
  end

  it 'can find an invoice by status' do
    test_invoices = create_list(:invoice, 3)
    test_invoices[0].update(status: 'status1')
    test_invoices[1].update(status: 'status2')
    test_invoices[2].update(status: 'status1')
    get "/api/v1/invoices/find_all?status=#{test_invoices.first['status']}"

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(2)
    expect(invoice).to be_a(Hash)
    expect(invoice).to have_key('id')
    expect(invoice['id']).to be_a(Integer)
    expect(invoice).to have_key('customer_id')
    expect(invoice['customer_id']).to be_a(Integer)
    expect(invoice).to have_key('merchant_id')
    expect(invoice['merchant_id']).to be_a(Integer)
    expect(invoice).to have_key('status')
    expect(invoice['status']).to be_a(String)
  end

  it 'can find an invoice by created at date' do
    test_invoices = create_list(:invoice, 3)
    get "/api/v1/invoices/find_all?created_at=#{test_invoices.first['created_at']}"

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(3)
    expect(invoice).to be_a(Hash)
    expect(invoice).to have_key('id')
    expect(invoice['id']).to be_a(Integer)
    expect(invoice).to have_key('customer_id')
    expect(invoice['customer_id']).to be_a(Integer)
    expect(invoice).to have_key('merchant_id')
    expect(invoice['merchant_id']).to be_a(Integer)
    expect(invoice).to have_key('status')
    expect(invoice['status']).to be_a(String)
  end

  it 'can find an invoice by updated at date' do
    test_invoices = create_list(:invoice, 3)
    get "/api/v1/invoices/find_all?updated_at=#{test_invoices.first['updated_at']}"

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(3)
    expect(invoice).to be_a(Hash)
    expect(invoice).to have_key('id')
    expect(invoice['id']).to be_a(Integer)
    expect(invoice).to have_key('customer_id')
    expect(invoice['customer_id']).to be_a(Integer)
    expect(invoice).to have_key('merchant_id')
    expect(invoice['merchant_id']).to be_a(Integer)
    expect(invoice).to have_key('status')
    expect(invoice['status']).to be_a(String)
  end

end