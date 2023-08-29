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

- It's possible to navigate to another pages with `visit`.
- It's always a GET request.
- The method accepts the string url ("/projects") or the rails path (`root_path`).

## [Clicking links and buttons](https://rubydoc.info/github/teamcapybara/capybara#clicking-links-and-buttons)

- It's possible to interact with buttons and links using:
  - `click_link`.
  - `click_button`.
  - `click_on`.

## [Interacting with forms](https://rubydoc.info/github/teamcapybara/capybara#interacting-with-forms)

- It's possible to interact with a form using:
 - `fill_in`
 - `choose`.
 - `check`.
 - `uncheck`.
 - `attach_file`.
 - `select`.

## [Querying](https://rubydoc.info/github/teamcapybara/capybara#querying)

- It's possible querying the page for the existence of certain elements.
 - `has_selector?`.
 - `has_xpath?`.
 - `has_css?`.
 - `has_content?`.

## [Finding](https://rubydoc.info/github/teamcapybara/capybara#finding)

- It's possible to find elements using:
 - `find_field`.
 - `find_link`.
 - `find_button`.
 - `find`.

## [Scoping](https://rubydoc.info/github/teamcapybara/capybara#scoping)

- It's possible to restrict certain actions to within a specific area of the page:
 - `within("li#employee") do fill_in 'Name', with: 'Jimmy end`
