CGFDatabindLabel
================

Makes auto-updating the text of a UILabel a breeze.

```objc

CGFDatabindLabel *player1ScoreLabel = [[CGFDatabindLabel alloc] initWithFrame:CGRectMake(0,0,100,44) 
                                                                   andKeypath:@"score" 
                                                                     inObject:self.testObject];  
[self.view addSubview:player1ScoreLabel];

```
