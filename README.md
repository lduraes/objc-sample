# iOS Callenge

We need you to create an app that allows users to make searches for locations and present the results in a list, allowing them to be presented in a map view inside the app.  
The app architecture, project and code organization, file structure and comments will be evaluated.

### Acceptance Criteria:

1. The app should support iOS 7+. The look and feel is the system's default. PICTURE 1.1 for iOS 7.
1. Text field on the top of the screen as shown in the PICTURE 1.1.
1. Tapping search button makes the search through the call to the Google Maps API.
1. The UI must be responsive while searching through the API call.
1. The results must be listed in the same order as received by the API response. Each item in the list should show the name of the related location.
1. If there is only one result, display only one row in the list, as in PICTURE 1.1.
1. if there are more than one results, show a row for "Display All on Map" in a separated section, as in PICTURE 1.2.
1. Selecting this row would display the map with all results centered, as in PICTURE 2.2.
1. If there is no results, a "No Results" text should be displayed in the view instead of the result rows.
1. Selecting one item in the list should present a map view with all result items annotated. The selected item annotation should be centered, as in PICTURE 2.1. Feel free to set the zoom level.
1. Selecting an item annotation in the map view should present its location name and coordinates (PICTURE 2.1).
1. In the Map screen, add a "Save" button to the navigation bar, allowing the user to save the selected result object. This action should save the current object to a Core Data store and the object should be unique in the store.
    * **This is not applicable to the "Display All on Map" option**.
1. Case the object has been previously saved, the "Save" button should become into a "Delete" button. Tapping this button will delete the current object from Core Data, after popping up an alert view confirming the deletion. User should be able to "Cancel" or "Delete" the item from the presented alert view.
    * **This is not applicable to the "Display All on Map" option**.
1. Provide unit tests for models and view controllers, using the XCTest framework.

### Sample Screenshots

Screenshot | Description
-----------|-------------
![Alt text](raw/master/screenshots/one_item.png "PICTURE 1.1") | PICTURE 1.1: Main view when containing only one result.
![Alt text](raw/master/screenshots/many_items.png "PICTURE 1.2") | PICTURE 1.2: Main view when containing multiple results.
![Alt text](raw/master/screenshots/mapview.png "PICTURE 2.1") | PICTURE 2.1: Map view when displayed with a selected item. Please, make sure to add a "Save" or "Delete" button as required by ACs 12 and 13.
![Alt text](raw/master/screenshots/mapview_all.png "PICTURE 2.2") | PICTURE 2.2: How the app map view should look like when displayed from "Display All on Map" option from the results list.

### Technical Details:

* **Documentation:** [Google Maps API](https://developers.google.com/maps/documentation/geocoding/)
* **API call example:** http://maps.googleapis.com/maps/api/geocode/json?address=Springfield&sensor=false
* **Location name key to be used:** `formatted_address`
* **Location coordinates key path:** `geometry.location`

### Notes

* This assessment must be delivered within 2 days.
* You can use whatever third party library you want to accomplish these requirements.
* You must provide a COMMENTS.txt (plain text) or a COMMENTS.md (Markdown) file at the root of your repository, explaining:
    * Main architecture decisions you've made and a quick explanation of why.
    * List of third party libraries and why you chose each one.
    * What could be improved if you had more time.
    * Mention anything that was asked but not delivered and why, and any additional comments.
* Any questions, please send an email to **recruitment.engineering@avenuecode.com**

### Delivery Instructions

1. You must provide his BitBucket username. A free BitBucket account can be created at http://bitbucket.org
1. The recruiter will give you read permission to a repository named **ios-challenge**, at https://bitbucket.org/ac-recruitment/ios-challenge
1. You must fork this repository into a private repository on your own account and push your code in there.
1. Once finished, you must give the user **ac-recruitment** read permission on your repository so that you can be evaluated. Then, please contact back your recruiter and he will get an engineer to evaluate your test.
1. After you are evaluated, the recruiter will remove your read permission from the original repository.

Thank you,  
The AvenueCode Recruiting Team