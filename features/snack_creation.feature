Feature: Snack creation
  In order to propose new snack ideas
  As a cogs 160 student 
  I want to be able to add new snack to the list of snacks
  
  Scenario: Create a new snack
    Given a list containing snacks
    When I create a new snack using the snack form
    Then I should see the new snack in the list of proposed snacks 
  

  
