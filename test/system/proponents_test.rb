require "application_system_test_case"

class ProponentsTest < ApplicationSystemTestCase
  setup do
    @proponent = proponents(:one)
  end

  test "visiting the index" do
    visit proponents_url
    assert_selector "h1", text: "Proponents"
  end

  test "creating a Proponent" do
    visit proponents_url
    click_on "New Proponent"

    fill_in "Birth date", with: @proponent.birth_date
    fill_in "Cpf", with: @proponent.cpf
    fill_in "Inss discount", with: @proponent.inss_discount
    fill_in "Name", with: @proponent.name
    fill_in "Salary", with: @proponent.salary
    click_on "Create Proponent"

    assert_text "Proponent was successfully created"
    click_on "Back"
  end

  test "updating a Proponent" do
    visit proponents_url
    click_on "Edit", match: :first

    fill_in "Birth date", with: @proponent.birth_date
    fill_in "Cpf", with: @proponent.cpf
    fill_in "Inss discount", with: @proponent.inss_discount
    fill_in "Name", with: @proponent.name
    fill_in "Salary", with: @proponent.salary
    click_on "Update Proponent"

    assert_text "Proponent was successfully updated"
    click_on "Back"
  end

  test "destroying a Proponent" do
    visit proponents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Proponent was successfully destroyed"
  end
end
