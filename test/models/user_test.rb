require 'test_helper'

# Test for the User Model
class UserTest < ActiveSupport::TestCase
  should validate_presence_of(:username)
  should validate_uniqueness_of(:username)

  should validate_presence_of(:password)

  should validate_presence_of(:email_address)
  should validate_uniqueness_of(:email_address)

  should validate_presence_of(:phone_number)
  should validate_uniqueness_of(:phone_number)

  should validate_presence_of(:role)

  should have_many(:skills)
end
