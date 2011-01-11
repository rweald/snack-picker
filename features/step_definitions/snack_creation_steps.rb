Given /^a list containing snacks$/ do
  # build the necessary snacks to populate table view
  Factory.build(:snack, :name => "oreos").save
  Factory.build(:snack, :name => "nutter butters").save
  Factory.build(:snack, :name => "ritz").save

  # now check to ensure view is property displayed.
  visit(snacks_path)
  page.all(:xpath, "//tbody/tr").count.should equal(3)
  
end

When /^I create a new snack using the snack form$/ do
  visit(snacks_path)
  # within(".form_container") do 
    fill_in "snack_name", :with => "cheeseitz"
    fill_in "snack_category", :with => "junk"
    fill_in "snack_price", :with => "10"
    fill_in "snack_quantity", :with => "10"
    click_link_or_button "Add New Snack"
  # end
end

Then /^I should see the new snack in the list of proposed snacks$/ do
  visit(snacks_path)
  page.all(:xpath, "//tbody/tr").count.should equal(4)
  page.should have_xpath("//tbody/tr[contains(@id, '4')]")
end
