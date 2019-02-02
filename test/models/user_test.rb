require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should validate_inclusion_of(:role) \
    .in_array(['user', 'admin', 'editor'])

  # Powyższe zastępuje:
  #
  # ['user', 'admin', 'editor'].each do |role|
  #   test "is valid with '#{role}' role" do
  #     user = build :user, role: role
  #     assert_predicate user, :valid?
  #   end
  # end
  #
  # test 'is invalid with "foo" role' do
  #   user = build :user, role: 'foo'
  #   assert_predicate user, :invalid?
  # end

  test 'cannot be created when email exists' do
    user = create :user, email: 'admin@codesensei.pl'
    user2 = build :user, email: 'admin@codesensei.pl'
    assert_predicate user2, :invalid?
  end

  # Do rozważenia: testy walidacji email, password, etc
end
