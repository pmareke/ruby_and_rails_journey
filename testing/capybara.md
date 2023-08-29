# [Capybara](http://teamcapybara.github.io/capybara/)

## Using Capybara with RSpec

- Install the library with `gem install capybara`
- Load RSpec by adding the following line in the `spec_helper.rb` file `require 'capybara/rspec'`

### Example

```ruby
feature "Signing in" do
  background do
    User.create(email: 'user@example.com', password: 'caplin')
  end

  scenario "Signing in with correct credentials" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'caplin'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end

  given(:other_user) { User.create(email: 'other@example.com', password: 'rous') }

  scenario "Signing in as another user" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Email', with: other_user.email
      fill_in 'Password', with: other_user.password
    end
    click_button 'Sign in'
    expect(page).to have_content 'Invalid email or password'
  end
end
```

## [Navigating](https://rubydoc.info/github/teamcapybara/capybara#navigating)

## [Clicking links and buttons](https://rubydoc.info/github/teamcapybara/capybara#clicking-links-and-buttons)

## [Interacting with forms](https://rubydoc.info/github/teamcapybara/capybara#interacting-with-forms)

## [Querying](https://rubydoc.info/github/teamcapybara/capybara#querying)

## [Finding](https://rubydoc.info/github/teamcapybara/capybara#finding)

## [Scoping](https://rubydoc.info/github/teamcapybara/capybara#scoping)
