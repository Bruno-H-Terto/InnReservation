require 'rails_helper'

describe 'User visit homepage', type: :system do
  it 'not authenticate' do
    visit root_path

    expect(page).to have_css :h1, text: 'Reservas Pousadaria'
    expect(page).to have_content 'Reserve agora seu quarto'
  end

  it 'authenticate' do
    user = create :user, name: 'Frodo', email: 'frodo@email.com'

    login_as user, scoper: :user
    visit root_path

    within 'nav' do
      expect(page).to have_content 'frodo@email.com'
    end

  end
end