﻿
Feature: This test suite contains test scenarios for language tab.
Background: 
Given I log into the portal with UserName 'reshma.eli.philip@outlook.com' and Password 'Tomato4132@'


@language
Scenario: TC_001,TC_003. Create a new language record with valid characters
	Given User has no language in their profile
	When I create a new language record 'Test' ''
	Then the record should be saved 'Test'
	
	Scenario: TC_002,TC_004,TC_005,TC_006. Create a new language record with invalid characters 
	Given User has no language in their profile
	When I create a new language record 'हिंदी' 'Basic'
	Then the record should not be saved 'हिंदी'

	

	Scenario Outline: TC_007. Update a language 
  	   Given the user profile is set up with the languages:
      | Language | Level  |
      | French   | Basic  |
      | English  | Basic  |

	When the user wants to update the language or level from "French","Basic" to "Mal","Basic"
    Then the result of update from  "French","Basic" to "Mal","Basic" is possible

  
	Scenario Outline: TC_008. Delete a language 
  	   Given the user profile is set up with the languages:
      | Language | Level  |
      | French   | Basic  |
      | English  | Fluent |
	  | dutch    | Basic  |
	  | Hindi    | Fluent |


	When the user wants to delete the language  "French"
    Then the language "French" should be deleted.

	Scenario:  TC_009,TC_010 Duplicate Entry Check for Addition of language
	 Given the user profile is set up with the languages:
      | Language | Level  |
      | French   | Basic  |
      | English  | Fluent |
	When I try to create another record with same value 'french' 'Fluent'
	Then Adding of second record 'french' 'Fluent' fails 

	Scenario: TC_011, Duplicate Entry Check while updating a language
	 Given the user profile is set up with the languages:
      | Language | Level  |
      | English   | Basic  |
      | French  | Fluent |
	  | Hindi  | Basic |
	  When the user wants to update the language or level from "Hindi","Basic" to "English","Basic"
	  Then the system should block the updation from 'Hindi' to 'English'.

	 Scenario: TC_012. Verify the Addition of Language in Two Sessions
    Given User has no language in their profile
    And I open a second session in tab 2.
    And the user profile is set up with the languages in Session 1:
      | Language | Level  |
      | French   | Basic  |
      | English  | Fluent |
      | Dutch    | Basic  |
      | Hindi    | Fluent |
    When I create a new language record 'German' 'Basic' in Session 2
    Then the entry of 'German','Basic' should be blocked.

	Scenario: TC_013 Validate the addition of language feature with 1000 characters
	Given User has no language in their profile
	When I create a new language with 1000 random charcaters and level 'Basic'
	Then the addition of language with more than 50 characters should fail


 
  

