//
//  wwMyScene.h
//  Windwill
//

//  Copyright (c) 2013年 ManuQiao. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface wwMyScene : SKScene
{
    float _startRotation;
    CGPoint _startPosition;
    
    NSDate* _movingDate;
    float _movingInterval;
    float _speed;
    
    float _currentbegan;
    float _currentend;
    
    float _l;//转动惯量
    
    NSMutableArray *_queue;
}
@end
