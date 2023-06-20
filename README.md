# Phone-Book

Requirements of my assigned task:

* Create the Main Screen: Display a list of contacts sorted alphabetically. Each contact should include a name, phone number, and a default photo (display a generic image if no avatar is available, similar to Facebook).
* Create a navigation bar: The title should be "Phone Book". On the left side, add a Settings button (use the Settings icon), and on the right side, add a button to add a new contact (use the "+" icon).
* Create the Settings Screen: Include one option to enable Dark Mode. By default, it should be disabled. Use a UISwitch to implement the Dark Mode setting. To configure the Dark Mode appearanc.
* Create the Add New Contact Screen: Include appropriate labels and text fields for adding the name, surname, phone number (use the numeric keypad), and an image. Tapping on the image icon should display a bottom action sheet allowing the user to select a photo from the gallery or take a photo using the camera.
* Implement contact storage: Save contacts (name, surname, phone number, photo reference) in plist files inside the Contacts folder. Use UUID().uuidString to generate unique identifiers as the names for the plist files.
* Save photos in the Photo folder within the Documents directory. You can use the same unique identifiers as used for contacts.
* Display an alert on every third app launch: Show an UIAlertController with the title "Info" and the message "You have opened the app N times," where N is the number of times the app has been launched. Implement this using UserDefaults and the app lifecycle.
