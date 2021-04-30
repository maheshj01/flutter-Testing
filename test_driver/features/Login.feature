Feature: Main Screen Validates and then Logins and Checks if each product clicks are ok

    Scenario: Validates the email when text is entered
        Given I have "emailfield" and "passfield" and "LoginButton"
        When I fill the "emailfield" field with "youremail@gmail.com"
        And I fill the "passfield" field with "somewrongpassword@"
        Then I tap the "LoginButton" button
        Then I pause for 2 seconds
        Then I have "HomePage" on screen
        Then I pause for 3 seconds
        When I tap "thumb_up3" button 10 times
        Then I expect the "claps3" to be "👏 110.0"
        When I tap "thumb_down4" button 10 times
        Then I expect the "claps4" to be "👏 90.0"
        Then I tap "FavouratePage" page
        Then I pause for 3 seconds
        Then I tap "ProductPage" page
        Then I tap "like0" button
        Then I pause for 3 seconds 
        Then I tap "FavouratePage" page
