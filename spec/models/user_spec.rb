require 'rails_helper'

RSpec.describe User, type: :model do

  it "should fail, non matching passwords" do
    user =
      User.create({
        first_name: "Bob",
        last_name: "ThaBuilder",
        email: "abc@123.com",
        password: "123456",
        password_confirmation: ""
      })
    expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it "should be successful" do
    user =
      User.create({
        first_name: "Bob",
        last_name: "ThaBuilder",
        email: "abc@123.com",
        password: "123456",
        password_confirmation: "123456"
      })
    expect(user).to be_valid
  end

  it "should fail, not unique email" do
    user1 =
      User.create({
        first_name: "Bob",
        last_name: "ThaBuilder",
        email: "ABC@TEST.com",
        password: "123456",
        password_confirmation: "123456"
      })

    user2 =
      User.create({
        first_name: "Boberta",
        last_name: "DaBuilder",
        email: "abc@test.COM",
        password: "123456",
        password_confirmation: "123456"
      })
    expect(user2.errors.full_messages).to include("Email has already been taken")
  end

  it "should fail, missing first_name" do
    user =
      User.create({
        first_name: nil,
        last_name: "ThaBuilder",
        email: "abc@123.com",
        password: "123456",
        password_confirmation: "123456"
      })
    expect(user.errors.full_messages).to include("First name can't be blank")
  end

  it "should fail, < min length password" do
    user =
      User.create({
        first_name: "Bob",
        last_name: "ThaBuilder",
        email: "abc@123.com",
        password: "123",
        password_confirmation: "123"
      })
    expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end

end
