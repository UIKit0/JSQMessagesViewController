//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "UIImage+JSQMessages.h"

@implementation UIImage (JSQMessages)

- (UIImage *)jsq_imageMaskedWithColor:(UIColor *)maskColor
{
    NSParameterAssert(maskColor != nil);
    
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    UIImage *newImage = nil;
    
    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, self.scale);
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextScaleCTM(context, 1.0f, -1.0f);
        CGContextTranslateCTM(context, 0.0f, -(imageRect.size.height));
        
        CGContextClipToMask(context, imageRect, self.CGImage);
        CGContextSetFillColorWithColor(context, maskColor.CGColor);
        CGContextFillRect(context, imageRect);
        
        newImage = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)jsq_bubbleRegularImage
{
    return [UIImage imageNamed:@"bubble"];
}

+ (UIImage *)jsq_bubbleRegularTaillessImage
{
    return [UIImage imageNamed:@"bubble_tailless"];
}

+ (UIImage *)jsq_bubbleRegularStrokedImage
{
    return [UIImage imageNamed:@"bubble_stroked"];
}

+ (UIImage *)jsq_bubbleRegularStrokedTaillessImage
{
    return [UIImage imageNamed:@"bubble_stroked"];
}

+ (UIImage *)jsq_bubbleCompactImage
{
    return [UIImage imageNamed:@"bubble_min"];
}

+ (UIImage *)jsq_bubbleCompactTaillessImage
{
    return [UIImage imageNamed:@"bubble_min"];
}

@end
