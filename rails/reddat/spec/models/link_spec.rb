require "rails_helper"

describe Link, "validations" do
  it { expect(subject).to validate_presence_of(:title) }
  it { expect(subject).to validate_presence_of(:url) }
end
