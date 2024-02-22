# EmployeeCheckin

**EmployeeCheckin** is an iOS application built using the MVVM architecture with interoperability between Swift and Objective-C. The storage used is Core Data.  
This app allows employees to check in their time using a date picker.  
When the user has not checked in yet, the date picker is initialized with 06:30 of the current day, retrieved from a mocked API call. After the user checks in, the date picker will display their latest check-in time.  

**FUNCTIONALITIES**  
* 📆 Datetime Picker   
Users can select their desired check-in time. The selected time is validated to ensure it's not in the future limited by a range till the current date.  

* 🌐 API Integration    
The date picker is initialized with with 06:30 of the current day, retrieved from a mocked API call. The mock API response is in JSON format: {"dateTime": "yyyy-MM-dd HH:mm"}.  

* 💽 Persistence  
The app has a CoreData database with a table named **Employee** containing a single attribute called **check_in_date_time**.  
I have performed a minor CoreData migration to add a new attribute called **name** with a default value   

* 🏛️ Architecture  
EmployeeCheckin follows the MVVM architecture pattern.  
CheckinViewModel manages Core Data operations while NetworkingViewModel takes care of networking.  

**USAGE**
* Launch the EmployeeCheckin app.
* Press the "Start" button to access the check-in screen.
* Use the date picker to select your desired check-in time.
* Press the "Submit" button to save your check-in time.
* Your check-in time is now saved in the database and displayed in first screen. 

<br>
<br>

![banner](https://github.com/meggsila/EmployeeCheckin/assets/80169743/447521f2-bc34-4823-8ba5-699240de608d)
