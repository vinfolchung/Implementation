#import "UIView+PlaceSize.h"
@implementation UIView (PlaceSize)

- (void)setX:(CGFloat)x
{
    CGRect temp = self.frame;
    temp.origin.x = x;
    self.frame = temp;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect temp = self.frame;
    temp.origin.y = y;
    self.frame = temp;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect temp = self.frame;
    temp.size.width = width;
    self.frame = temp;
}
- (CGFloat)width
{
    return self.frame.size.width;
}


- (void)setHeight:(CGFloat)height
{
    CGRect temp = self.frame;
    temp.size.height = height;
    self.frame = temp;
}
- (CGFloat)height
{
    return self.frame.size.height;
}


- (void)setSize:(CGSize)size

{
    CGRect temp = self.frame;
    temp.size = size;
    self.frame = temp;
}
- (CGSize)size
{
    return self.frame.size;
}

- (void)setPosition:(CGPoint)position
{
    CGRect temp = self.frame;
    temp.origin = position;
    self.frame = temp;
}
- (CGPoint)position
{
    return self.frame.origin;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint temp = self.center;
    temp.x = centerX;
    self.center = temp;
}

- (CGFloat)centerX
{
    return self.center.x;
}


-(void)setCenterY:(CGFloat)centerY
{
    CGPoint temp = self.center;
    temp.y = centerY;
    self.center = temp;
}

-(CGFloat)centerY
{
    return self.center.y;
}

@end
