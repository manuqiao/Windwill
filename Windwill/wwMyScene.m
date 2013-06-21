//
//  wwMyScene.m
//  Windwill
//
//  Created by ManuQiao on 13-6-21.
//  Copyright (c) 2013年 ManuQiao. All rights reserved.
//

#import "wwMyScene.h"

@interface wwMyScene ()

@property BOOL isContentCreated;

@end

@implementation wwMyScene

- (void)didMoveToView:(SKView *)view
{
    if (!self.isContentCreated) {
        [self createContent];
        self.isContentCreated = YES;
    }
}

- (void)createContent
{
    [self setPhysicsBody:[SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame]];
    
    SKSpriteNode *windwill = [self createWindwill];
    [windwill.physicsBody applyAngularImpulse:10];
    [self addChild:windwill];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        
    }
    SKSpriteNode *windwill = (SKSpriteNode *)[self childNodeWithName:@"windwill"];
    CGPoint vector = CGPointMake(100, 500);
    [windwill.physicsBody applyAngularImpulse:10];
}

- (SKSpriteNode *)createWindwill
{
    SKSpriteNode *windwill = [[SKSpriteNode alloc] initWithImageNamed:@"windwill.png"];
    [windwill setName:@"windwill"];
    [windwill setPosition:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
//    [windwill setScale:3];
    
    [windwill setPhysicsBody:[SKPhysicsBody bodyWithCircleOfRadius:windwill.size.width / 2]];
  
    [windwill.physicsBody setMass:10];
    [windwill.physicsBody setAffectedByGravity:NO];
    [windwill.physicsBody setAllowsRotation:YES];
    [windwill.physicsBody setRestitution:1];
    [windwill.physicsBody setAngularDamping:1];
    
    
    return windwill;
}
-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
