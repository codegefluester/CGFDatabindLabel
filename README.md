CGFDatabindLabel
================

Makes auto-updating the text of a UILabel a breeze.

![CGFDataBindLabel Build Status](https://travis-ci.org/codegefluester/CGFDatabindLabel.png)


### Simple Example

**ExampleViewController.h**

```objc
#import <UIKit/UIKit.h>

#import "CGFDatabindLabel.h"
#import "TestObject.h"

@interface CGFViewController : UIViewController
{

}

@property (strong, nonatomic) CGFDatabindLabel *player1ScoreLabel;
@property (strong, nonatomic) TestObject *testObject;

@end

```

**ExampleViewController.m**
```objc
#import "ExampleViewController.h"

@interface ExampleViewController ()

@end

@implementation ExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.testObject = [[TestObject alloc] init];
    self.player1ScoreLabel = [[CGFDatabindLabel alloc] initWithFrame:CGRectMake(30, 30, self.view.frame.size.width - 60, 44) 
    													  andKeypath:@"score" 
													        inObject:self.testObject];
    [self.player1ScoreLabel setTextColor:[UIColor blackColor]];
    [self.player1ScoreLabel setBackgroundColor:[UIColor clearColor]];
    
    [self.view addSubview:self.player1ScoreLabel];
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.testObject setScore:2];
    });
}

@end

```

### Formatter Block Example
If you want to format the text before the `UILabel` gets updated, you can use the `formattingBlock` property to provide a block that returns a formatted string that fits your needs.

```objc

self.player1ScoreLabel.formattingBlock = ^(id value)
{
	return [NSString stringWithFormat:@"%@ points", value];
};

```
