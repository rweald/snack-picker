Given /^a list containing snacks$/ do
  visit(url_for(:controller => "snacks", :action => "index"))
  page.should have_selector("table tbody")
end

When /^I create a new snack using the snack form$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the new snack in the list of proposed snacks$/ do
  pending # express the regexp above with the code you wish you had
end
