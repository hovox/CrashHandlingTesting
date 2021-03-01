//
//  MyCrashingCls.m
//  CrashHandlingTest
//
//  Created by Hovhannes Safaryan on 01.03.21.
//

#import "MyCrashingCls.h"

#import <GLKit/GLKit.h>

@implementation MyCrashingCls
{
    EAGLContext * _glContext;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        assert(_glContext);
        if (!_glContext) {
            return nil;
        }
    }
    return self;
}




-(BOOL)myMethod2 {
    return  _glContext == [EAGLContext currentContext];
}
@end
