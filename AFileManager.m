//
//  AFileManager.m
//  AFNetWorking
//
//  Created by 王力 on 15/8/4.
//  Copyright © 2015年 王力. All rights reserved.
//

#import "AFileManager.h"

@implementation AFileManager
+(BOOL)isFileExist: (NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filepath = [path stringByAppendingPathComponent: fileName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL result = [fileManager fileExistsAtPath: filepath];
    return result;
}
+ (NSString *) getFilePathWithFileName:(NSString *)fileName FilePath:(NSString *) extrafilePath
{
    [AFileManager createDirectortyAtPath:extrafilePath];
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *subPath = nil;
    subPath = [NSString stringWithFormat:@"%@/%@.plist",extrafilePath,fileName];
    return [docPath stringByAppendingPathComponent:subPath];
}
+ (void) createDirectortyAtPath:(NSString *) extrafilePath
{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@", extrafilePath]];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![AFileManager isFileExist:path]) {
        NSError *error = nil;
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    }
}
+ (NSMutableDictionary*) readPlistFileWithFileName:(NSString *)fileName FilePath:(NSString *) extrafilePath{
    
    NSString *filePath = [AFileManager getFilePathWithFileName:fileName FilePath:extrafilePath];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    return dict;
}
+ (BOOL) writePlistFile:(NSDictionary *)dict FileName:(NSString *)fileName FilePath:(NSString *) extrafilePath
{
    NSString *filePath = [AFileManager getFilePathWithFileName:fileName FilePath:extrafilePath];
    return [dict writeToFile:filePath atomically:NO ];
}
+ (BOOL) writeStringFile:(NSString *) string FileName:(NSString *)fileName FilePath:(NSString *) extrafilePath
{
    NSString *filePath = [AFileManager getFilePathWithFileName:fileName FilePath:extrafilePath];
    return [string writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:Nil];
}
+ (BOOL) writePlistFiles:(NSArray *)array FileName:(NSString *)fileName FilePath:(NSString *) extrafilePath{
    [AFileManager createDirectortyAtPath:extrafilePath];
    NSString *filePath = [AFileManager getFilePathWithFileName:fileName FilePath:extrafilePath];
    return [array writeToFile:filePath atomically:YES];
}
+ (NSMutableArray*) readArrayPlistFile:(NSString *)fileName FilePath:(NSString *) extrafilePath{
    NSString *filePath = [AFileManager getFilePathWithFileName:fileName FilePath:extrafilePath];
    NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:filePath];
    return array;
}
+ (NSMutableDictionary *) readDictionaryPlistFile:(NSString *) fileName FilePath:(NSString *)extrafilePath{
    NSString *filePath = [AFileManager getFilePathWithFileName:fileName FilePath:extrafilePath];
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    return dictionary;
}
+ (NSString *) readStringPlistFile:(NSString *) fileName FilePath:(NSString *)extrafilePath{
    NSString *filePath = [AFileManager getFilePathWithFileName:fileName FilePath:extrafilePath];
    NSString *string = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    return string;
}

@end
