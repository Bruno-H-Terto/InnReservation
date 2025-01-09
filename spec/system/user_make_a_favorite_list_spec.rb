require 'rails_helper'

describe 'User make a favorite list', type: :system do
  it 'and sees your list' do
    user = create(:user)
    user.favorite_lists.create(name: 'Natureza')
    user.favorite_lists.create(name: 'Viagens')
    allow(Inn).to receive(:all).and_return(nil)

    login_as user, scope: :user
    visit root_path
    click_on 'Meus favoritos'

    expect(page).to have_css 'h2', text: 'Minhas listas'
    expect(page).to have_content 'Natureza'
    expect(page).to have_content 'Viagens'
  end

  it 'and add new list' do
    user = create(:user)

    login_as user, scope: :user
  end
end
