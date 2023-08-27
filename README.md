# iOS_StopWatch
<img width = "550" height = "1250" src = "https://github.com/sembaynaz/iOS_StopWatch/assets/96616194/b92e630e-7710-43b4-b49b-53ea0af173f4">
<img width = "550" height = "1250" src = "https://github.com/sembaynaz/iOS_StopWatch/assets/96616194/da910229-7c28-460f-85de-cfb0a302e6ce">

## Project Description
The iOS_StopWatch project is a simple stopwatch and timer app built for iOS using UIKit (no Storyboard). It allows users to switch between a timer mode and a stopwatch mode, set time durations, and control the start, pause, and reset functionalities.

## Installation
No secondary libraries were used here, only **UIKit**. You can download the project from GitHub as a zip file and then open it in the **xCode** application. (No additional installations are required)

## Usage

When you launch the app, you'll see a segmented control at the top that allows you to switch between the Timer and Stopwatch modes.
In Timer mode, a UIPickerView will appear below the segmented control, allowing you to set the hours, minutes, and seconds for the timer.
In Stopwatch mode, the UIPickerView will be hidden. You can tap the play button to start the stopwatch, pause button to pause it, and stop button to reset it.
The time display label at the center of the screen will show the elapsed time in hours, minutes, and seconds format.
The play, pause, and stop buttons have dynamic icons that change based on their state.
My code consists of three sections (you can refer to the MARK comments):
1. UI elements and constraints
2. Setting up the Picker View
3. Project Functionality

If you are learning to create projects without storyboards, it will be very useful to see how to configure various elements in code.
Wat func I have: (PV = PickerView)
func segmentTouched() - for hidden PV and zeroing the counter
func whenPVValueChanged() - for set button images
func clean() - zeroing the counter
func timeToString() - for displaying to label
func stop() - func when tapped stop button
func play() - func when tapped play button
func countTimer() - functionality of the Timer segment (time += 1)
func countStopWatch() - functionality of the StopWatch segment (time -= 1)
func pause() - func when tapped pause button
func showPickerView() - zeroing the PV
func setImagesForButtons() - images changes


## Contribution
Contributions to this project are welcome!
You can organize my code, add a new functionalities, user interface improvments,testing, error handling. 

## Author
git: sembaynaz

mail: nazerke.sembay11@gmail.com 

telegram: @sembaynaz
