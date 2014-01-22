//
//  CGFDatabindLabel.m
//  CGFDatabindLabel
//
//  Created by Björn Kaiser on 30.09.13.
//  Copyright (c) 2013 Björn Kaiser. All rights reserved.
//

#import "CGFDatabindLabel.h"

@interface CGFDatabindLabel ()

@property (readwrite) NSString *keypath;
@property (strong) id theObject;

@end

@implementation CGFDatabindLabel

- (instancetype) initWithFrame:(CGRect)frame andKeypath:(NSString*)aKeypath inObject:(id)object
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _theObject = object;
        
        if([_theObject respondsToSelector:NSSelectorFromString(aKeypath)])
        {
            self.keypath = aKeypath;
            [_theObject addObserver:self forKeyPath:self.keypath options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew context:nil];
        }
        else
        {
            NSLog(@"%@ is not key-value compliant for keypath %@", object, aKeypath);
        }
    }
    return self;
}

- (void) observeValueForKeyPath:(NSString *)keyPath
                       ofObject:(id)object
                         change:(NSDictionary *)change
                        context:(void *)context
{
    
    if (keyPath == self.keypath)
    {
        NSString *text = [[change objectForKey:@"new"] stringValue];
        
        if(self.formattingBlock)
        {
            text = self.formattingBlock([[change objectForKey:@"new"] stringValue]);
        }
        
        [self setText:text];
    }
}

- (void) dealloc
{
    [_theObject removeObserver:self forKeyPath:self.keypath];
}

@end
