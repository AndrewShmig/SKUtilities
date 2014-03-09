//
//  SpriteMyScene.m
//  SpriteButton
//
//  Created by AndrewShmig on 3/9/14.
//  Copyright (c) 2014 AndrewShmig. All rights reserved.
//

#import "BGMyScene.h"
#import "BGButtonNode.h"


@implementation BGMyScene

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */

        self.backgroundColor = [SKColor colorWithRed:0.15
                                               green:0.15
                                                blue:0.3
                                               alpha:1.0];

        BGButtonNode *btn = [BGButtonNode buttonNodeWithTextureNormal:[SKTexture textureWithImageNamed:@"store_normal.png"]
                                                             selected:[SKTexture textureWithImageNamed:@"store_selected.png"]];
        btn.position = CGPointMake(300, 300);
        [btn setTouchUpInsideTarget:self action:@selector(touchUpInside)];

        [self addChild:btn];
    }

    return self;
}

- (void)touchUpInside
{
    NSLog(@"touched up inside!!!");
}

@end
