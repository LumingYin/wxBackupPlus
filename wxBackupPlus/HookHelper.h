//
//  HookHelper.h
//  wxBackupPlus
//
//  Created by Bright on 9/1/17.
//  Copyright © 2017 Bright. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface HookHelper : NSObject

void hookMethod(Class originalClass, SEL originalSelector, Class swizzledClass, SEL swizzledSelector);
void hookClassMethod(Class originalClass, SEL originalSelector, Class swizzledClass, SEL swizzledSelector);

@end
