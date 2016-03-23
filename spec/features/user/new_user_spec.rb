require 'rails_helper'
RSpec.describe 'signing up' do
  it 'prompts for valid fields' do
    visit '/user/new'
    expect(page).to have_field('user[email]')
    expect(page).to have_field('user[name]')
    expect(page).to have_field('user[password]')
    expect(page).to have_field('user[password_confirmation]')
  end
end