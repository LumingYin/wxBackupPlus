//
//  ViewController+Addition.h
//  wxBackupPlus
//
//  Created by Blue on 4/17/19.
//  Copyright © 2019 Bright. All rights reserved.
//

#import "wxBackupHeaders.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewController (Addition)

@property (nonatomic) BOOL inBatchMode;

- (void)currentExportCompleted: (id)arg;

@end

NS_ASSUME_NONNULL_END
