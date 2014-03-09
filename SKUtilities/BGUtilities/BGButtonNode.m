//
//  BGButtonNode.m
//  SpriteButton
//
//  Created by AndrewShmig on 3/9/14.
//  Copyright (c) 2014 AndrewShmig. All rights reserved.
//

#import "BGButtonNode.h"

@implementation BGButtonNode

#pragma mark - Init methods

- (instancetype)initWithTextureNormal:(SKTexture *)normalTexture
                             selected:(SKTexture *)selectedTexture
{
    self = [super initWithTexture:normalTexture];

    if (self) {
        _normalTexture = normalTexture;
        _selectedTexture = selectedTexture;
        _state = UIControlStateNormal;

        self.userInteractionEnabled = YES;
    }

    return self;
}

- (instancetype)initWithTextureNormal:(SKTexture *)normalTexture
{
    return [self initWithTextureNormal:normalTexture
                              selected:nil];
}

#pragma mark - Class methods

+ (instancetype)buttonNodeWithTextureNormal:(SKTexture *)normalTexture
                                   selected:(SKTexture *)selectedTexture
{
    return [[self alloc] initWithTextureNormal:normalTexture
                                      selected:selectedTexture];
}

+ (instancetype)buttonNodeWithTextureNormal:(SKTexture *)normalTexture
{
    return [[self alloc] initWithTextureNormal:normalTexture];
}

#pragma mark - Overriden setters

- (void)setState:(UIControlState)state
{
    if (self.state != state) {
        _state = state;

        switch (_state) {
            case UIControlStateNormal:
                super.texture = self.normalTexture;
                break;

            case UIControlStateSelected:
                super.texture = self.selectedTexture;
                break;

            default:
                break;
        }
    }
}

#pragma mark - Touch targets & actions

- (void)setTouchDownTarget:(id)target action:(SEL)action
{
    _touchDownTarget = target;
    _touchDownAction = action;
}

- (void)setTouchUpInsideTarget:(id)target action:(SEL)action
{
    _touchUpInsideTarget = target;
    _touchUpInsideAction = action;
}

#pragma mark - Touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.state = UIControlStateSelected;

    if (self.touchDownAction) {
        [self performSelectorOnMainThread:self.touchDownAction
                               withObject:self.touchDownTarget
                            waitUntilDone:YES];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInNode:self.parent];

    if (CGRectContainsPoint(self.frame, touchPoint)) {
        self.state = UIControlStateSelected;
    } else {
        self.state = UIControlStateNormal;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInNode:self.parent];

    if (CGRectContainsPoint(self.frame, touchPoint)) {
        if (self.touchUpInsideAction) {
            [self performSelectorOnMainThread:self.touchUpInsideAction
                                   withObject:self.touchUpInsideTarget
                                waitUntilDone:YES];
        }
    }

    self.state = UIControlStateNormal;
}

@end
