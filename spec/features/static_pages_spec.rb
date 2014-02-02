require 'spec_helper'

describe "Static Pages" do

  subject { page }
  
  describe "Home Page" do
    let(:user) { User.create(firstname: "Foo",
                             lastname: "Bar",
                             email: "faker@fake.com",
                             password: "foobar")}
    
    before { visit root_path }
    
    it { should have_selector("h1", text: "epetshare") }
    it { should have_link("sign up", href: signup_path) }
    it { should have_selector("form", text: "sign in")}

    context "with valid user" do
      before do
        fill_in "email", with: user.email
        fill_in "password", with: user.password
        click_button "Sign in"
        it { should have_selector("h2", text: user.lastname) }
      end
    end
    context "with invalid user" do
      before do
        fill_in "email", with: "notauser@yahoo.com"
        fill_in "password", with: "password"
        click_button "Sign in"
        it { should have_selector("#errors", text: "Not a valid user.")}
      end
    end
  end
end
