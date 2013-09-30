//
//  CGFDatabindLabel.h
//  CGFDatabindLabel
//
//  Created by Björn Kaiser on 30.09.13.
//  Copyright (c) 2013 Björn Kaiser. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSString*(^CGFDatabindLabelFormattingBlock)(id value);

@interface CGFDatabindLabel : UILabel
{

}

- (instancetype) initWithFrame:(CGRect)frame andKeypath:(NSString*)aKeypath inObject:(id)object;

@property (strong, nonatomic, readonly) NSString *keypath;
@property (strong) CGFDatabindLabelFormattingBlock formattingBlock;

@end
