# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :db do
  require_relative "db/seeds"
  desc "Import CSV to table"
  task :import_csvs => :environment do
    # empty_tables
    # import_customers_csv
    # import_merchants_csv
    # import_items_csv
    # import_invoices_csv
    import_transactions_csv
    # import_invoice_items_csv
  end
end