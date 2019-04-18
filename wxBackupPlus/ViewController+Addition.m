//
//  ViewController+Addition.m
//  wxBackupPlus
//
//  Created by Blue on 4/17/19.
//  Copyright © 2019 Bright. All rights reserved.
//

@import ObjectiveC;
#import "ViewController+Addition.h"

static char const * const BatchModeEnabledKey = "BatchModeEnabledKey";

@implementation ViewController (Addition)
- (void)currentExportCompleted:(id)arg {
    if (self.inBatchMode) {
        NSMutableArray *array = [self valueForKey:@"contacts"];
        long row = self.tableView.selectedRow;
        if (row + 1 < array.count) {
            [self.tableView selectRowIndexes:[NSIndexSet indexSetWithIndex:row + 1] byExtendingSelection:NO];
            [self.tableView scrollRowToVisible:row + 1];
            [self clickBackup:self];
        }
    }
}

- (BOOL)inBatchMode {
    NSNumber *number = objc_getAssociatedObject(self, BatchModeEnabledKey);
    if (number == nil) {
        return NO;
    }
    return [number boolValue];
}

-(void)setInBatchMode:(BOOL)inBatchMode {
    if (inBatchMode) {
        self.tableView.enabled = NO;
        NSMutableArray *array = [self valueForKey:@"contacts"];
        if (array.count > 0) {
            [self.tableView selectRowIndexes:[NSIndexSet indexSetWithIndex:0] byExtendingSelection:NO];
        }
    } else {
        self.tableView.enabled = YES;
    }
    NSNumber *number = [NSNumber numberWithBool:inBatchMode];
    objc_setAssociatedObject(self, BatchModeEnabledKey, number , OBJC_ASSOCIATION_RETAIN);
}

@end
