## Course Project AR application 


**TEAM: 
Y Rishikesh Reddy( SE20UCSE234) 
Sreevaatsav Bavana(SE20UARI147)**

This is the directory for the Course Project for the AI in industry course. 

### AR Basketball 
This is a swift application intergrated with the Augmented reality toolkits in IOS. 

In this game, the hoop will be dynamically shanging it's position in the space and the user will be able to shoot the ball onto the target.

Repository structure:- 

```
├── My Basketball AR 
│   ├── AR Basketball
│   │   ├── AppDelegate.swift (Entry point of the application.)
│   │   ├── Assets.xcassets (Contains app icons and image sets.)
│   │   │   ├── AppIcon.appiconset (App icon configurations.
)
│   │   │   │   ├── Contents.json 
│   │   │   │   ├── imresizer-1702234890297.jpg
│   │   │   │   └── myapp.png
│   │   │   ├── Contents.json
│   │   │   ├── basketballSkin.imageset (Images related to basketball skins.)
│   │   │   │   ├── Contents.json
│   │   │   │   └── basketballSkin.png
│   │   │   ├── deleteIcon.imageset (Images to delete )
│   │   │   │   ├── Contents.json
│   │   │   │   └── deleteIcon.png
│   │   │   └── myapp.imageset (Images for the app.)
│   │   │       ├── Contents.json
│   │   │       └── myapp.png
│   │   ├── Base.lproj (Localised resources)
│   │   │   ├── LaunchScreen.storyboard (Launch screen setup)
│   │   │   └── Main.storyboard (Main app UI setup)
│   │   ├── CustomButtons.swift (Custom button implementations)
│   │   ├── Info.plist (Configuration file)
│   │   ├── ViewController.swift (View controller handling AR interactions.)
│   │   └── art.scnassets (AR enviornment's assets)
│   │       ├── hoop.scn 
│   │       ├── log3.png
│   │       └── logo2.png
│   └── MyBasketball AR .xcodeproj (XCode project file)
│       
└── README.md
```


### Running the app
1. Clone or Download the repository to your local machine.

2. Launch Xcode on your Mac. Connect your iOS device to your Mac using a USB cable.

3. In Xcode, open the project (MyBasketball AR.xcodeproj) from the cloned/downloaded repository.
Select your connected iOS device as the target device in Xcode.

4. Go to the project settings in Xcode, select the Signing & Capabilities tab.
Choose your development team and ensure a valid provisioning profile is selected for the app.

5. Click on the play button in Xcode to build and run the app on your connected iOS device.


