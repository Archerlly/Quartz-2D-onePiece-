//
//  OnePiceVIew.m
//  one pice
//
//  Created by 阿城 on 15/10/9.
//  Copyright © 2015年 阿城. All rights reserved.
//

#import "OnePiceVIew.h"
#define kAngel (- M_PI / 10)
#define kCenter CGPointMake(150, 150)
@interface OnePiceVIew ()

@end

@implementation OnePiceVIew


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 2);
    [[UIColor blackColor]setStroke];
    bone(ctx,rect);
    hat();
    mouth(ctx);
    mouthAdd(ctx);
    head();
    eyeAndNose();
   
}

void hat(){
    CGFloat angel = - M_PI * 0.2;
    CGPoint point = CQchange(kCenter, -70 * cos(angel), 70 * sin(angel));
    CGPoint ctPoint = CQchange(kCenter, 0, -50);
    
    UIBezierPath *dai =[UIBezierPath bezierPathWithArcCenter:kCenter radius:70 startAngle:-M_PI - kAngel endAngle:kAngel clockwise:1];
    [[UIColor redColor]setFill];
    [dai fill];
    [dai stroke];
    
    UIBezierPath *hat = [UIBezierPath bezierPathWithArcCenter:kCenter radius:70 startAngle:-M_PI - angel endAngle:angel clockwise:1];
    [hat addQuadCurveToPoint:point controlPoint:ctPoint];
    UIBezierPath *hat1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 115, 200, 30)];
    [hat appendPath:hat1];
    [[UIColor brownColor]setFill];
    [hat fill];
    [hat stroke];
}

void head(){
    UIBezierPath *head = [UIBezierPath bezierPathWithArcCenter:kCenter  radius:65 startAngle:-M_PI - kAngel endAngle:kAngel clockwise:0];
    [head addQuadCurveToPoint:CGPointMake(kCenter.x - 65 * cos(kAngel),kCenter.y - 65 * sin(-kAngel)) controlPoint:CQchange(kCenter, 0, -40)];
    
    [[UIColor whiteColor]setFill];
    [head fill];
    [head setLineWidth:2];
    [head stroke];
}

void mouth(CGContextRef ctx){
    CGFloat angel = M_PI * 0.33;
    
    CGPoint first = CQchange(kCenter, 65 * cos(angel), 65 *sin(angel));
    CGContextMoveToPoint(ctx, first.x, first.y);
    
    CGPoint secend = CQchange(first, 20, 80);
    CGContextAddArcToPoint(ctx, secend.x , secend.y, secend.x - 1, secend.y, 20);
    CGContextAddLineToPoint(ctx, kCenter.x, secend.y);
    
    CGPoint third = CQchange(kCenter, -65 * cos(angel), 65 *sin(angel));
    
    CGPoint forth = CQchange(third, -20, 80);
    CGContextAddArcToPoint(ctx, forth.x , forth.y, third.x , third.y, 20);
    CGContextAddLineToPoint(ctx, third.x, third.y);
    
    CGFloat value = 5.5;
    CGPoint point1 = CQchange(first, value, 4 * value);
    CGPoint point2 = CQchange(third, -value, 4 * value);
    CGContextMoveToPoint(ctx, point1.x, point1.y);
    CGContextAddQuadCurveToPoint(ctx, kCenter.x, point2.y + 10, point2.x, point2.y);
    
    CGPoint point3 = CQchange(first, 2 * value, 8 * value);
    CGPoint point4 = CQchange(third, -2 * value, 8 * value);
    CGContextMoveToPoint(ctx, point3.x, point3.y);
    CGContextAddQuadCurveToPoint(ctx, kCenter.x, point4.y + 10, point4.x, point4.y);
    
    CGPoint a1 = CGPointMake(kCenter.x, point3.y + 8);

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:kCenter];
    [path addLineToPoint:CQchange(a1, -30, 0)];
    [path addLineToPoint:kCenter];
    [path addLineToPoint:CQchange(a1, -10, 0)];
    [path addLineToPoint:kCenter];
    [path addLineToPoint:CQchange(a1, 10, 0)];
    [path addLineToPoint:kCenter];
    [path addLineToPoint:CQchange(a1, 30, 0)];
    [path addLineToPoint:kCenter];

    CGContextAddPath(ctx, path.CGPath);

    [[UIColor whiteColor]setFill];
    
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
}

void mouthAdd(CGContextRef ctx){
    CGFloat angel = M_PI * 0.33;
    
    CGPoint first = CQchange(kCenter, 65 * cos(angel), 65 *sin(angel));
    
    CGPoint secend = CQchange(first, 20, 80);
    
    CGPoint third = CQchange(kCenter, -65 * cos(angel), 65 *sin(angel));

    CGPoint forth = CQchange(third, -20, 80);

    CGFloat value = 5.5;
    
    CGPoint point3 = CQchange(first, 2 * value, 8 * value);
    CGPoint point4 = CQchange(third, -2 * value, 8 * value);
    CGContextMoveToPoint(ctx, point3.x, point3.y);
    CGContextAddQuadCurveToPoint(ctx, kCenter.x, point4.y + 10, point4.x, point4.y);
    
    CGContextAddArcToPoint(ctx, forth.x , forth.y, forth.x + 100, forth.y, 20);
    CGContextAddArcToPoint(ctx, secend.x , secend.y, first.x , first.y, 20);
    CGContextAddLineToPoint(ctx, point3.x, point3.y);
    [[UIColor whiteColor]setFill];
    
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
}

void eyeAndNose(){
    CGPoint center1 = CQchange(kCenter, -30, 0);
    CGPoint center2 = CQchange(kCenter, 30, 0);
    CGPoint center3 = CQchange(kCenter, 0, 40);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center1 radius:25 startAngle:0 endAngle:2 * M_PI clockwise:1];
    [path moveToPoint:center2];
    [path addArcWithCenter:center2 radius:25 startAngle:0 endAngle:2 * M_PI clockwise:1];
    [path moveToPoint:center3];
    [path addArcWithCenter:center3 radius:10 startAngle:0 endAngle:2 * M_PI clockwise:1];
    [[UIColor blackColor]setFill];
    [path fill];
    
}

void bone(CGContextRef ctx ,CGRect rect){
    CGFloat l1 = 90;
    CGFloat l2 = 7;
    CGFloat r = 15;
    CGPoint center1 = CQchange(kCenter, -l1 + l2, -l1 - l2);
    CGPoint center2 = CQchange(kCenter, -l1 - l2, -l1 + l2);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center1 radius:r startAngle:0 endAngle:2 * M_PI clockwise:1];
    [path addArcWithCenter:center2 radius:r startAngle:0 endAngle:2 * M_PI clockwise:1];
    
    [path moveToPoint:CQchange(kCenter, -l2, l2)];
    [path addLineToPoint:center2];
    [path addLineToPoint:center1];
    [path addLineToPoint:CQchange(kCenter, l2, -l2)];
    
    [[UIColor whiteColor]setFill];
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextFillPath(ctx);
    CGContextSaveGState(ctx);
    
    for (int i = 0; i < 3; i++) {
        //旋转90
        CGContextTranslateCTM(ctx, rect.size.width, 0);
        CGContextRotateCTM(ctx, M_PI_2);
        CGContextAddPath(ctx, path.CGPath);
        CGContextFillPath(ctx);
    }
    CGContextRestoreGState(ctx);
    
    
}

CGPoint CQchange(CGPoint point , CGFloat x, CGFloat y){
    return CGPointMake(point.x + x, point.y + y);
}

@end
