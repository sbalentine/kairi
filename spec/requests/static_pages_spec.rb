require 'spec_helper'

describe "Static pages" do
  
  subject { page }
  
  describe "Home page" do
    before { visit root_path }
    
    it { should have_selector('h1',       text: 'Welcome to KAIRI!') }
    it { should have_selector('title',    text: full_title('')) }
  end
  
  describe "Help page" do
    before { visit help_path }
    
    it { should have_selector('h1',       text: 'Help') }
    it { should have_selector('title',    text: full_title('')) }
  end
  
  describe "About page" do
    before { visit about_path }
    
    it { should have_selector('h1',       text: 'About') }
    it { should have_selector('title',    text: full_title('')) }
  end
  
  describe "Contact page" do
    before { visit contact_path }
    
    it { should have_selector('h1',       text: 'Contact') }
    it { should have_selector('title',    text: full_title('')) }
  end
  
  it "should have the right links on the layout" do
      visit root_path
      click_link "About"
      page.should have_selector 'title', text: full_title('About Us')
      click_link "Help"
      page.should have_selector 'title', text: full_title('Help')
      click_link "Contact"
      page.should have_selector 'title', text: full_title('Contact')
      click_link "Home"
      click_link "Sign up now!"
      page.should have_selector 'title', text: full_title('Sign up')
      click_link "Kairi"
      page.should have_selector 'title', text: full_title('')
    end
  
end