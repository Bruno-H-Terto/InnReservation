require 'rails_helper'

describe 'User sign out', type: :system do
  it 'with success' do
    visit root_path
    click_on 'Nova conta'
    fill_in 'Nome', with: 'Teste'
    fill_in 'E-mail', with: 'teste@email.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme sua senha', with: '123456'
    click_on 'Criar Usuário'

    expect(page).to have_content 'Conta criada com sucesso!'
    within 'nav' do
      expect(page).to have_content 'teste@email.com'
    end
  end
end
