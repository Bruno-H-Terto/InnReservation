require 'rails_helper'

describe 'User visit homepage', type: :system do
  it 'not authenticate' do
    inns = []
    inns << Inn.new(name: 'Campo Alegre')
    inns << Inn.new(name: 'Rancho St. Luiz')
    inns << Inn.new(name: 'Caminho da Serra')
    allow(Inn).to receive(:all).and_return(inns)

    visit root_path

    expect(page).to have_css 'h1', text: 'Reservas Pousadaria'
    expect(page).to have_content 'Reserve agora seu quarto'
    expect(page).to have_content 'Campo Alegre'
    expect(page).to have_content 'Rancho St. Luiz'
    expect(page).to have_content 'Caminho da Serra'
  end

  context 'authenticate' do
    it 'sees inns' do
      user = create(:user, name: 'Frodo', email: 'frodo@email.com')
      inns = []
      inns << Inn.new(name: 'Campo Alegre')
      inns << Inn.new(name: 'Rancho St. Luiz')
      inns << Inn.new(name: 'Caminho da Serra')
      allow(Inn).to receive(:all).and_return(inns)

      login_as user, scoper: :user
      visit root_path

      within 'nav' do
        expect(page).to have_content 'frodo@email.com'
      end
      expect(page).to have_content 'Campo Alegre'
      expect(page).to have_content 'Rancho St. Luiz'
      expect(page).to have_content 'Caminho da Serra'
    end

    it 'not found inns' do
      allow(Inn).to receive(:all).and_return(nil)
      user = create(:user)

      login_as user, scope: :user
      visit root_path

      expect(page).to have_content 'Sem Pousadas disponíveis'
    end
  end
end
