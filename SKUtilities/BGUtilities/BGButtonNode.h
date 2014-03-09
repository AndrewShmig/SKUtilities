//  Created by AndrewShmig on 3/9/14.
//  Copyright (c) 2014 AndrewShmig. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>


@interface BGButtonNode : SKSpriteNode

#pragma mark - Properties

// possible values: UIControlStateNormal, UIControlStateSelected
// defaults to UIControlStateNormal
@property (nonatomic, assign) UIControlState state;

@property (nonatomic, readwrite, strong) SKTexture *normalTexture;
@property (nonatomic, readwrite, strong) SKTexture *selectedTexture;

@property (nonatomic, readonly) SEL touchDownAction;
@property (nonatomic, readonly) SEL touchUpInsideAction;
@property (nonatomic, readonly, weak) id touchDownTarget;
@property (nonatomic, readonly, weak) id touchUpInsideTarget;

#pragma mark - Instance methods

- (instancetype)initWithTextureNormal:(SKTexture *)normalTexture
                             selected:(SKTexture *)selectedTexture;
- (instancetype)initWithTextureNormal:(SKTexture *)normalTexture;

#pragma mark - Class methods

+ (instancetype)buttonNodeWithTextureNormal:(SKTexture *)normalTexture
                                   selected:(SKTexture *)selectedTexture;
+ (instancetype)buttonNodeWithTextureNormal:(SKTexture *)normalTexture;

#pragma mark - Touch processing

- (void)setTouchDownTarget:(id)target action:(SEL)action;
- (void)setTouchUpInsideTarget:(id)target action:(SEL)action;

@end
