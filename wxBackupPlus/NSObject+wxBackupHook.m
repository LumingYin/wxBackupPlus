//
//  NSObject+wxBackupHook.m
//  wxBackupPlus
//
//  Created by Bright on 9/1/17.
//  Copyright © 2017 Bright. All rights reserved.
//
@import ObjectiveC;
@import Cocoa;

#import "NSObject+wxBackupHook.h"
#import "wxBackupHeaders.h"
#import "HookHelper.h"
#import "ViewController+Addition.h"

@implementation NSObject (wxBackupHook)

- (void)hk_applicationDidFinishLaunching:(NSNotification *)notification {
    NSLog(@"Hooked into wxBackup's applicationDidFinishLaunching: method.");
    [self hk_applicationDidFinishLaunching:notification];
}

- (void)hk_beginSheetModalForWindow:(NSWindow *)sheetWindow completionHandler:(void (^ __nullable)(NSModalResponse returnCode))handler {
    // This is a temporary workaround to bypass sheet window when the last export has completed.
    NSApplication *app = [NSApplication sharedApplication];
    NSArray *windows = app.windows;
    NSWindow *actualMainWindow;
    for (NSWindow *window in windows) {
        NSString *typeStr = NSStringFromClass([window class]);
        if ([typeStr isEqualToString:@"NSWindow"] && [window.title isEqualToString:@"微信聊天记录导出"]) {
            actualMainWindow = window;
            break;
        }
    }
    ViewController *vc = (ViewController *)(actualMainWindow.contentViewController);
    if (vc != nil && vc.inBatchMode) {
        NSLog(@"Bypassing modal display since we're in batch export mode.");
        handler(NSModalResponseOK);
        [vc currentExportCompleted:vc];
    }
    else {
        [self hk_beginSheetModalForWindow:sheetWindow completionHandler:handler];
    }

}

- (void)hk_setRepresentedObject:(id)arg1 {
    NSLog(@"setRepresentedObject called: %@", arg1);
    [self hk_setRepresentedObject:arg1];
}

- (void)kickoffBatchBackup:(NSButton *)sender {
    NSLog(@"Toggling batch backup to: %ld", (long)sender.state);
    ViewController *vc = (ViewController *)self;
    if (sender.state == NSControlStateValueOn) {
        vc.inBatchMode = YES;
    } else if (sender.state == NSControlStateValueOff) {
        vc.inBatchMode = NO;
    }
}

- (void)hk_viewDidLoad {
    [self hk_viewDidLoad];
    ViewController *vc = (ViewController *)self;
    NSButton *button = [[NSButton alloc] initWithFrame:CGRectMake(59, 37.5, 250, 30)];
    [button setButtonType:NSSwitchButton];
    [button setTitle:@"批量导出全部聊天记录"];
    [button setTarget:self];
    [button setAction:@selector(kickoffBatchBackup:)];
    [vc.view addSubview:button];
    [vc.backupButton setTitle:@"开始导出"];
    [button setState:NSControlStateValueOn];
    [vc kickoffBatchBackup:button];
}

+ (void)hookwxBackup {
    NSLog(@"Hooking into wxBackup.");
    hookMethod(objc_getClass("NSAlert"), @selector(beginSheetModalForWindow:completionHandler:), [self class], @selector(hk_beginSheetModalForWindow:completionHandler:));
    hookMethod(objc_getClass("ViewController"), @selector(viewDidLoad), [self class], @selector(hk_viewDidLoad));
    hookMethod(objc_getClass("ViewController"), @selector(setRepresentedObject:), [self class], @selector(hk_setRepresentedObject:));
    hookMethod(objc_getClass("AppDelegate"), @selector(applicationDidFinishLaunching:), [self class], @selector(hk_applicationDidFinishLaunching:));
}

@end
