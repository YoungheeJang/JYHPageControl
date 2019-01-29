# JYHPageControl

**JYHPageControl** looks like **UIPageControl**. If You will use this **JYHPageControl**, It is very easy to make custom pageControl.

## Overview

<img src="images/sample-01.gif" width="600" height="1067">
<img src="images/sample-02.gif" width="600" height="150">
<img src="images/sample-03.gif" width="600" height="150">
<img src="images/sample-04.gif" width="600" height="150">


## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build JYHPageControl.

To integrate SnapKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
pod 'JYHPageControl', '~> 1.3.0'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage
```Swift
import JYHPageControl
```

```Swift
var pageControl: JYHPageControl?
pageControl = JYHPageControl(currentDotSize: CGSize(width: 20, height: 12),
                             currentDotBackgroundColor: UIColor.red,
                             currentDotBorderColor: UIColor.lightGray,
                             currentDotAlpha: 1.0,
                             defaultDotSize: CGSize(width: 6, height: 6),
                             defaultDotBackgroundColor: UIColor.white,
                             defaultDotBorderColor: UIColor.lightGray,
                             defaultDotAlpha: 0.7,
                             gab: 6,
                             radius: true,
                             numberOfPages: 7,
                             currentPage: 0,
                             animation: true)
self.view.addSubview(pageControl!)
```

### More usage

<img src="images/sample-05.gif" width="600" height="150">

```Swift
pageControl?.useHeaderImageView(size: CGSize(width: 15, height: 15), image: UIImage(named: "sampleHeader")!)
pageControl?.useFooterImageView(size: CGSize(width: 15, height: 15), image: UIImage(named: "sampleFooter")!)
```


## License
[MIT](https://choosealicense.com/licenses/mit/) License

Copyright (c) 2019 Younghee Jang

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
