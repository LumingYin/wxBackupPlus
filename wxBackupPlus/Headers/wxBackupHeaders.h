//
//  wxBackupHeaders.h
//  wxBackupPlus
//
//  Created by Bright on 9/1/17.
//  Copyright © 2017 Bright. All rights reserved.
//
#import <AppKit/AppKit.h>
@import AppKit;

@interface ViewController : NSViewController
{
    long long targetLastIdx;
    long long accountLastIdx;
    NSString *contentPath;
    NSMutableArray *paths;
    NSMutableArray *accounts;
    NSMutableArray *contacts;
    NSComboBox *_targetCombo;
    NSComboBox *_accountCombo;
    NSTextField *_outputPath;
    NSButton *_pathButton;
    NSButton *_backupButton;
    NSTableView *_tableView;
    NSTableColumn *_tableColumn;
    NSProgressIndicator *_progressBar;
}

+ (id)encodeParam:(id)arg1;
@property __weak NSProgressIndicator *progressBar; // @synthesize progressBar=_progressBar;
@property __weak NSTableColumn *tableColumn; // @synthesize tableColumn=_tableColumn;
@property __weak NSTableView *tableView; // @synthesize tableView=_tableView;
@property __weak NSButton *backupButton; // @synthesize backupButton=_backupButton;
@property __weak NSButton *pathButton; // @synthesize pathButton=_pathButton;
@property __weak NSTextField *outputPath; // @synthesize outputPath=_outputPath;
@property __weak NSComboBox *accountCombo; // @synthesize accountCombo=_accountCombo;
@property __weak NSComboBox *targetCombo; // @synthesize targetCombo=_targetCombo;
- (void)report:(id)arg1;
- (void)enableUI:(BOOL)arg1;
- (BOOL)checkTemplate;
- (BOOL)copyTemplate:(id)arg1;
- (void)loadContactList:(long long)arg1;
- (void)loadAccountInfo:(long long)arg1;
- (void)loadFileInfo;
- (void)clickBackup:(id)arg1;
- (void)clickPath:(id)arg1;
- (void)chooseContact:(id)arg1;
- (void)chooseAccount:(id)arg1;
- (void)chooseTarget:(id)arg1;
- (BOOL)tableView:(id)arg1 shouldSelectTableColumn:(id)arg2;
- (BOOL)tableView:(id)arg1 shouldSelectRow:(long long)arg2;
- (id)tableView:(id)arg1 viewForTableColumn:(id)arg2 row:(long long)arg3;
- (id)tableView:(id)arg1 objectValueForTableColumn:(id)arg2 row:(long long)arg3;
- (long long)numberOfRowsInTableView:(id)arg1;
- (void)awakeFromNib;
- (void)setRepresentedObject:(id)arg1;
- (void)viewDidLoad;

@end

