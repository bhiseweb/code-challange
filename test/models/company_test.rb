require 'test_helper'
require 'zip-codes'

class CompanyTest < ActiveSupport::TestCase
  test 'save company if it has @getmainstreet.com domain email' do
    company = Company.new(zip_code: '94203', email: 'company@getmainstreet.com')
    assert company.save
  end

  test 'email can be blank' do
    company = Company.new(zip_code: '94203', email: '')
    assert company.save
  end

  test 'should not save company if it does not has @getmainstreet.com domain email' do
    company = Company.new(zip_code: '94203', email: 'company@test.com')
    assert_not company.save
  end
end
