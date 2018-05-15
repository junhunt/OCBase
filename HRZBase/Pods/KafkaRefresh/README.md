
<p align="center">
  <a href=#>
    <img src="https://github.com/xorshine/KafkaRefresh/blob/master/assets/titleView.png" alt="" width=60 height=60>
  </a>

  <h3 align="center">KafkaRefresh</h3> 
  <p align="center">
     Animated, customizable, and flexible pull-to-refresh framework for faster and easier iOS development.
    <br> 
    <br>
    <a href="https://github.com/xorshine/KafkaRefresh/issues/new?template=bug_en.md">Report bug</a>
    ·
    <a href="https://github.com/xorshine/KafkaRefresh/issues/new?template=feature.md&labels=feature">Request feature</a> 
    ·
    <a href="https://github.com/xorshine/KafkaRefresh/blob/master/CREADME.md">中文文档</a> 
  </p>
</p> 
<br>
 
### Status
<!--[![Travis](https://img.shields.io/travis/rust-lang/rust.svg)](https://github.com/xorshine/KafkaRefresh)-->
[![GitHub license](https://img.shields.io/github/license/xorshine/KafkaRefresh.svg)](https://github.com/xorshine/KafkaRefresh/blob/master/LICENSE)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/KafkaRefresh.svg)](https://img.shields.io/cocoapods/v/KafkaRefresh.svg)
![platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)
![language](https://img.shields.io/badge/language-objc-orange.svg) 
[![Email](https://img.shields.io/badge/e--mail-xorshine%40icloud.com-blue.svg)](mailto:xorshine@icloud.com) 

****
 
### Screenshots
<table>
<tr height="60px" align="center">
  <td width="20%"><strong>KafkaRefreshStyle</strong></td>
  <td width="40%"><strong>Top Screenshots</strong></td>
  <td width="40%"><strong>Bottom Screenshots</strong></td>
</tr>
<tr align="center" height="120px">
  <td width="300px">Native</td>
  <td><img src="assets/Gif/native.gif"></img></td>
  <td><img src="assets/Gif/_native.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorWoody</td>
  <td><img src="assets/Gif/woody.gif"></img></td>
  <td><img src="assets/Gif/_woody.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorAllen</td>
  <td><img src="assets/Gif/allen.gif"></img></td>
  <td><img src="assets/Gif/_allen.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorCircle</td>
  <td><img src="assets/Gif/circle.gif"></img></td>
  <td><img src="assets/Gif/_circle.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorDot</td>
  <td><img src="assets/Gif/dot.gif"></img></td>
  <td><img src="assets/Gif/_dot.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorArc</td>
  <td><img src="assets/Gif/arc.gif"></img></td>
  <td><img src="assets/Gif/_arc.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>ReplicatorTriangle</td>
  <td><img src="assets/Gif/triangle.gif"></img></td>
  <td><img src="assets/Gif/_triangle.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>AnimatableRing</td>
  <td><img src="assets/Gif/ring.gif"></img></td>
  <td><img src="assets/Gif/_ring.gif"></img></td>
</tr>
<tr align="center" height="120px">
  <td>AnimatableArrow</td>
  <td><img src="assets/Gif/arrow.gif"></img></td>
  <td><img src="assets/Gif/_arrow.gif"></img></td>
</tr>
</table>

### Features
*  **Built-in rich animation style, support self-customization** 


*  **Non-refresh state hidden automatically** 
	
	>  To avoid developers manually adjust contentInset refresh the appearance of the control after the impact of the visual experience;</br>
  the most common situation, the absence of data, the bottom of the refresh control is not hidden, the use of KafkaRefresh to avoid the problem.

*  **Anti-dithering at the end of the refresh** 
	
	>When the refresh control finishes refreshing, if UIScrollView is in a scrolling state, KafkaRefresh will adjust the contntOffset that controls the UIScrollView at this time according to the refresh control.
	
*  **Support setting the offset threshold to trigger refresh** 
	
	>Setting the value of `stretchOffsetYAxisThreshold` can control the refresh pull distance.This property is a ratio relative to the height of the control and must be set greater than 1.0.

*  **Support global setting** 
	
	>KafkaRefreshDefaults is a singleton for global settings
	
*  **Support progress callback** 
	
	>Real-time callback Drag the offset ratio, for the expansion of the interface, according to the progress of adjustment animation.
	
*  **Adaptive contentInset system adjustment and manual adjustment** 
	
	>Adaptive UINavigationController for UIScrollView's contentInset property adjustment, even if the contentInset automatically set value, then KafkaRefresh can still adapt this adjustment.

*  **Solve the section view floating problem when refreshing** 
 
*  **Support horizontal and vertical screen switching adaptive** 
	
	>No need to consider in the horizontal and vertical screen refresh refresh problem.
	
*  **iOS 7+** 
	
	>Support iOS 7 above system. Including iPhone X.

	
*  **Document coverage 100%** 
	
	> You can see the use of all methods and classes in the header file.

 
### Installation 
* CocoaPods
```ruby
pod 'KafkaRefresh'
```

* Carthage 

	> If anyone wants to install by *carthage* , please supply a pull request. I'm not using this package manager myself.

### Usage

```objective-c
 #import "KafkaRefresh.h" 
```

##### initialization

* the first way
```objective-c
 [self.tableView bindRefreshStyle:KafkaRefreshStyleAnimatableArrow
						   fillColor:MainColor
						  atPosition:KafkaRefreshPositionHeader refreshHanler:^{
		 //.......
	}];

 [self.tableView bindRefreshStyle:KafkaRefreshStyleAnimatableArrow
						   fillColor:MinorColor
						  atPosition:KafkaRefreshPositionFooter
					   refreshHanler:^{
		 //.....
	}];
```

* the second way
```objective-c
 KafkaArrowHeader * arrow = [[KafkaArrowHeader alloc] init];
 arrow.refreshHandler = ^{
	 //.....
 };
 self.tableView.headRefreshControl = arrow;
```

* the third way(global configuration)

```objective-c

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[[KafkaRefreshDefaults standardRefreshDefaults] setHeaderDefaultStyle:KafkaRefreshStyleAnimatableRing];
	return YES;
}

[self.tableView bindDefaultRefreshStyleAtPosition:KafkaRefreshPositionHeader refreshHanler:^{
		//.....
}];

```

##### triggering refresh manually

```objective-c
 [self.tableView.headRefreshControl beginRefreshing];
 [self.tableView.footRefreshControl beginRefreshing];
```

##### end refresh
> When you finish refreshing and don't need to show any hints, or any animation, call the following method.

```objective-c
- (void)endRefreshing; 
```
> When you finish the refresh and need to display the prompt message, call the following method.

```objective-c
- (void)endRefreshingWithAlertText:(NSString *)text completion:(dispatch_block_t)completion; 
```

>When you end the refresh and no longer need to refresh, call the following method.

```objective-c
- (void)endRefreshingAndNoLongerRefreshingWithAlertText:(NSString *)text;
```

### Customize
Take KafkaheadRefreshControl as an example
```objective-c
 #import "KafkaheadRefreshControl.h"
 @interface CustomHeader : KafkafootRefreshControl

 @end
 ```
 
 ```objective-c
 @implementation CustomHeader 
 
 - (void)setupProperties{
	[super setupProperties];
	//Initialization properties
}
 
- (void)kafkaDidScrollWithProgress:(CGFloat)progress max:(const CGFloat)max{
	//progress callback
}

- (void)kafkaRefreshStateDidChange:(KafkaRefreshState)state{
	[super kafkaRefreshStateDidChange:state];
	
	switch (state) {
		case KafkaRefreshStateNone:{
			break;
		}
		case KafkaRefreshStateScrolling:{
			break;
		}
		case KafkaRefreshStateReady:{
			break;
		}
		case KafkaRefreshStateRefreshing:{ 
			break;
		}
		case KafkaRefreshStateWillEndRefresh:{ 
			break;
		}
	}
}
 @end
```

### Precautions
* Please update the latest version；
* After iOS 11, if you use estimatedRowHeight and the estimatedRowHeight height is too far from the true height, UITableView repeated refreshes may occur before version 0.8.3, which has been resolved since version 0.8.3 (iOS bug)


### Communication
> 1. If you need help，please email <xorshine@icloud.com>.
> 2. If you found a bug，and can provide steps to reliably reproduce it, open an issue.
> 3. Personal energy is limited, Kafka provides callback interface enough to increase the richer UI effect, we welcome you to join together and submit the pull request.  


### License
KafkaRefresh is released under the MIT license. See LICENSE for details.