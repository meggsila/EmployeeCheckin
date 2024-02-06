#  EmployeeCheckin README

Welcome to EmployeeCheckin, an iOS application built using the MVVM architecture. This app allows employees to check in their datetime using a datetime picker.  
When launching the app, you'll be presented with a UIViewController containing a title label and "Start" button. Pressing the "Start" button will take you to a SwiftUI screen that features a  DatePicker and a “Submit” button.  

## Functionalities

+ Datetime Picker 📆 
Users can select their desired check-in datetime. The selected datetime is validated to ensure it's not in the future limited by a range till the current date.  

+ API Integration 🌐 
On the first app launch, the datetime picker is initialized with with 06:30 of the current day, retrieved from a mocked API call. The mock API response is in JSON format: {"dateTime": "yyyy-MM-dd HH:mm"}.  

+ Persistence 💽 
The app has a CoreData database with a table named "Employee" containing a single column called “check_in_date_time”. When the user presses the "Submit" button, the selected datetime should be inserted into the "Employee" table in the database.  

+ Architecture 🏛️
EmployeeCheckin follows the MVVM architecture pattern.    

## Usage

+ Launch the EmployeeCheckin app.
+ Press the "Start" button to access the main screen.
+ Use the datetime picker to select your desired check-in datetime.
+ Press the "Submit" button to save the datetime.
+ Your check-in datetime is now saved in the database.

