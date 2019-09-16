require 'rails_helper'
 
RSpec.describe "Exchange Currency Process", :type => :system, js: true do
  it "exchange value" do
    visit '/'
    within("#exchange_form") do
      select('EUR', from: 'source_currency') # coloca no select a moeda euro
      select('USD', from: 'target_currency') # coloca no select a moeda dolar
      fill_in 'amount', with: rand(1..9999) # randomicamente escolhe uma quantidade de grana para converter
    end
    click_button 'CONVERTER' # simula o click no botao converter
 
    # save_and_open_page
    expect(page).to have_content("value") # espera o retorno value no content
  end
end