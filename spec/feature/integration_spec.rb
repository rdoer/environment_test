# location: spec/feature/integration_spec.rg
require 'rails_helper'
#  YYYY-MM-DD 2006-12-26
RSpec.describe 'Creating a book', type: :feature do
    
    scenario 'valid inputs' do
        visit new_book_path
        fill_in 'Title', with: 'Hatchet'
        fill_in 'Author' , with: 'Gary Paulsen'
        fill_in 'Published', with: Date.today.strftime('2006-12-26')
        fill_in 'Price', with: '6.1'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('Hatchet')
        expect(page).to have_content('Gary Paulsen')
        expect(page).to have_content('2006-12-26')
        expect(page).to have_content('6.1')
    end
end

RSpec.describe 'Show Books', type: :feature do

    scenario 'Show' do
        visit new_book_path
        fill_in 'Title', with: 'Hatchet'
        fill_in 'Author' , with: 'Gary Paulsen'
        fill_in 'Published', with: Date.today.strftime('2006-12-26')
        fill_in 'Price', with: '6.1'
        click_on 'Create Book'
        visit books_path
        click_on 'Show'
        expect(page).to have_content('Title: Hatchet')
        expect(page).to have_content('Author: Gary Paulsen')
        expect(page).to have_content('Published: 2006-12-26')
        expect(page).to have_content('Price: $6.1')
        visit books_path
    end
end

RSpec.describe 'Delete Books', type: :feature do
    scenario 'Delete' do
        visit new_book_path
        fill_in 'Title', with: 'Hatchet'
        fill_in 'Author' , with: 'Gary Paulsen'
        fill_in 'Published', with: Date.today.strftime('2006-12-26')
        fill_in 'Price', with: '6.1'
        click_on 'Create Book'
        visit books_path
        click_on 'Destroy'
        # click_button('OK')
        # page.driver.browser.accept_js_confirms
        expect(page).not_to have_content('Hatchet')
        expect(page).not_to have_content('Gary Paulsen')
        expect(page).not_to have_content('2006-12-26')
        expect(page).not_to have_content('$6.1')
    end
end

RSpec.describe 'Edit Books', type: :feature do
    scenario 'Change book name' do
        visit new_book_path
        fill_in 'Title', with: 'Dog Song'
        fill_in 'Author' , with: 'Gary Paulsen'
        fill_in 'Published', with: Date.today.strftime('2006-12-26')
        fill_in 'Price', with: '6.1'
        click_on 'Create Book'
        visit books_path
        click_on 'Edit'
        fill_in 'Title', with: 'Hatchet'
        click_on 'Update Book'
        visit books_path
        expect(page).to have_content('Hatchet')
    end
end

