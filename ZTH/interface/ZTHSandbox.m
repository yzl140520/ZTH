//
//  ZTHSandbox.h
//  ZTH
//
//  Created by yzl on 16/6/3.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "ZTHSandbox.h"

@interface ZTHSandbox()
{
    NSString *	_appPath;
    NSString *	_docPath;
    NSString *	_libPrefPath;
    NSString *	_libCachePath;
    NSString *	_tmpPath;
}

- (BOOL)remove:(NSString *)path;
- (BOOL)touch:(NSString *)path;
- (BOOL)touchFile:(NSString *)path;

@end

#pragma mark -

@implementation ZTHSandbox

DEFINE_SINGLETON_FOR_CLASS(ZTHSandbox)
@dynamic appPath;
@dynamic docPath;
@dynamic libPrefPath;
@dynamic libCachePath;
@dynamic tmpPath;

+ (NSString *)appPath
{
    return [[ZTHSandbox getInstance] appPath];
}

- (NSString *)appPath
{
    if ( nil == _appPath )
    {
        NSString * exeName = [[NSBundle mainBundle] infoDictionary][@"CFBundleExecutable"];
        _appPath = [[NSHomeDirectory() stringByAppendingPathComponent:exeName] stringByAppendingPathExtension:@"app"];
    }
    
    return _appPath;
}

+ (NSString *)docPath
{
    return [[ZTHSandbox getInstance] docPath];
}

- (NSString *)docPath
{
    if ( nil == _docPath )
    {
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        _docPath = [paths objectAtIndex:0];
    }
    
    return _docPath;
}

+ (NSString *)libPrefPath
{
    return [[ZTHSandbox getInstance] libPrefPath];
}

- (NSString *)libPrefPath
{
    if ( nil == _libPrefPath )
    {
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        _libPrefPath = [[paths objectAtIndex:0] stringByAppendingFormat:@"/Preference"];
        
        [self touch:_libPrefPath];
    }
    
    return _libPrefPath;
}

+ (NSString *)libCachePath
{
    return [[ZTHSandbox getInstance] libCachePath];
}

- (NSString *)libCachePath
{
    if ( nil == _libCachePath )
    {
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        _libCachePath = [[paths objectAtIndex:0] stringByAppendingFormat:@"/Caches"];
        
        [self touch:_libCachePath];
    }
    
    return _libCachePath;
}

+ (NSString *)tmpPath
{
    return [[ZTHSandbox getInstance] tmpPath];
}

- (NSString *)tmpPath
{
    if ( nil == _tmpPath )
    {
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        _tmpPath = [[paths objectAtIndex:0] stringByAppendingFormat:@"/tmp"];
        
        [self touch:_tmpPath];
    }
    
    return _tmpPath;
}

+ (BOOL)remove:(NSString *)path
{
    return [[ZTHSandbox getInstance] remove:path];
}

- (BOOL)remove:(NSString *)path
{
    return [[NSFileManager defaultManager] removeItemAtPath:path error:NULL];
}

+ (BOOL)touch:(NSString *)path
{
    return [[ZTHSandbox getInstance] touch:path];
}

- (BOOL)touch:(NSString *)path
{
    if ( NO == [[NSFileManager defaultManager] fileExistsAtPath:path] )
    {
        return [[NSFileManager defaultManager] createDirectoryAtPath:path
                                         withIntermediateDirectories:YES
                                                          attributes:nil
                                                               error:NULL];
    }
    
    return YES;
}

+ (BOOL)touchFile:(NSString *)file
{
    return [[ZTHSandbox getInstance] touchFile:file];
}

- (BOOL)touchFile:(NSString *)file
{
    if ( NO == [[NSFileManager defaultManager] fileExistsAtPath:file] )
    {
        return [[NSFileManager defaultManager] createFileAtPath:file
                                                       contents:[NSData data]
                                                     attributes:nil];
    }
    
    return YES;
}

@end

ZTHSandbox* ZLSANDBOX() {
    return [ZTHSandbox getInstance];
}