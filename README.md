Here's a video of the application



https://github.com/user-attachments/assets/e7e34745-d930-48ef-b157-cef73dddc49b



I used IQKeyboardManager to handle dismissing of the keyboard, because keyboards don't dismiss automatically by default in iOS.

I created the dashboard using storyboard, then linked the multiple place holder tabs with code.

The Home screen that houses the categories as well as all meals was built using SwiftUI and then put in a UIHosting Controller to integrate with UIKit as this is primarily a UIKit project.

I created the screen to create meals using programmatic UI constraints. I separated the view from the view controller and used delegates where necessary to communicate between them as well as handle updates.

