//
//  main.c
//  wxBackupPlus
//
//  Created by Bright on 9/1/17.
//  Copyright © 2017 Bright. All rights reserved.
//

#include <stdio.h>
#import "wxBackupPlus.h"
#import "NSObject+wxBackupHook.h"

static void __attribute__((constructor)) initialize(void) {
    NSLog(@"++++++++ wxBackupPlus loaded ++++++++");
    [NSObject hookwxBackup];
}
