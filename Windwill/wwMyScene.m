//
//  wwMyScene.m
//  Windwill
//
//  Created by ManuQiao on 13-6-21.
//  Copyright (c) 2013年 ManuQiao. All rights reserved.
//

#define CC_RADIANS_TO_DEGREES(__ANGLE__) ((__ANGLE__) * 57.29577951f) // PI * 180
#define PI 3.14

#import "wwMyScene.h"
#import "MNQueue.h"

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
//        UITouch *touch = [touches anyObject];
        
        SKSpriteNode *windwill = (SKSpriteNode *)[self childNodeWithName:@"windwill"];
        [windwill.physicsBody setAngularVelocity:0];
        _startRotation = windwill.zRotation;
        _startPosition = [touch locationInView:self.view];
    }
    SKSpriteNode *windwill = (SKSpriteNode *)[self childNodeWithName:@"windwill"];
    float r = windwill.size.width / 2;
    float s = PI * r * r;
    _l = windwill.physicsBody.mass * s;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    SKSpriteNode *windwill = (SKSpriteNode *)[self childNodeWithName:@"windwill"];
//    [windwill stopAllActions];
    
    float angle = ccpAngleSigned(ccpSub([touch locationInView:self.view], windwill.position), ccpSub(_startPosition, windwill.position));
    
    windwill.zRotation = _startRotation + angle;
    
    if (!_movingDate) {
        _movingDate = [NSDate date];
    }
    else {
        NSDate *now = [NSDate date];
        _movingInterval = -[_movingDate timeIntervalSinceDate:now];
        _movingDate = now;
    }
    
    _currentend = windwill.zRotation;
    
    _speed = (_currentend - _currentbegan) / _movingInterval;
    
    _currentbegan = _currentend;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    SKSpriteNode *windwill = (SKSpriteNode *)[self childNodeWithName:@"windwill"];
//    float L = _l * _speed;
    NSLog(@"speed : %.2f", _speed);
    [windwill.physicsBody setAngularVelocity:_speed];
//    [windwill.physicsBody applyAngularImpulse:L];
}

- (SKSpriteNode *)createWindwill
{
    SKSpriteNode *windwill = [[SKSpriteNode alloc] initWithImageNamed:@"windwill.png"];
    [windwill setName:@"windwill"];
    [windwill setScale:3];
    [windwill setPosition:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
//    [windwill setScale:3];
    
    [windwill setPhysicsBody:[SKPhysicsBody bodyWithCircleOfRadius:windwill.size.width / 2]];
  
    [windwill.physicsBody setMass:10];
    [windwill.physicsBody setAffectedByGravity:NO];
    [windwill.physicsBody setAllowsRotation:YES];
    [windwill.physicsBody setRestitution:1];
    [windwill.physicsBody setAngularDamping:2];
    
    
    return windwill;
}
-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    SKSpriteNode *windwill = (SKSpriteNode *)[self childNodeWithName:@"windwill"];
    
   
}

@end
