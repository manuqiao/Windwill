//
//  wwHelloScene.m
//  Windwill
//
//  Created by ManuQiao on 13-6-21.
//  Copyright (c) 2013年 ManuQiao. All rights reserved.
//

#import "wwHelloScene.h"
#import "wwMyScene.h"
@implementation wwHelloScene
- (void)didMoveToView:(SKView *)view
{
    SKLabelNode *hello = [[SKLabelNode alloc] init];
    [hello setText:@"Hello"];
    [hello setPosition:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
    [self addChild:hello];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    SKScene *scene = [[wwMyScene alloc] initWithSize:self.size];
    [self.view presentScene:scene];
}
@end
