//
//  AFileManager.h
//  AFNetWorking
//
//  Created by 王力 on 15/8/4.
//  Copyright © 2015年 王力. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFileManager : NSObject
/**
 *  判断文件是否存在
 *
 *  @param fileName 文件名
 *
 */
+(BOOL)isFileExist: (NSString *)fileName;
/**
 *  获取文件路径
 *
 *  @param fileName      文件名
 *  @param extrafilePath 文件路径
 *
 */
+ (NSString *) getFilePathWithFileName:(NSString *)fileName FilePath:(NSString *) extrafilePath;
/**
 *  获取文件内容
 *
 *  @param fileName      文件名
 *  @param extrafilePath 文件路径
 *
 *  @return 文件内容字典
 */
+ (NSMutableDictionary*) readPlistFileWithFileName:(NSString *)fileName FilePath:(NSString *) extrafilePath;
/**
 *  把字典写入文件
 *
 *  @param dict          需要写的字典
 *  @param fileName      文件名
 *  @param extrafilePath 文件路径
 *
 */
+ (BOOL) writePlistFile:(NSDictionary *)dict FileName:(NSString *)fileName FilePath:(NSString *) extrafilePath;
/**
 *  把字符串写入文件
 *
 *  @param string        需要写的字符串
 *  @param fileName      文件名
 *  @param extrafilePath 文件路径
 *
 */
+ (BOOL) writeStringFile:(NSString *) string FileName:(NSString *)fileName FilePath:(NSString *) extrafilePath;
/**
 *  把数组写入文件
 *
 *  @param array         需要写入的数组
 *  @param fileName      文件名
 *  @param extrafilePath 文件路径
 *
 */
+ (BOOL) writePlistFiles:(NSArray *)array FileName:(NSString *)fileName FilePath:(NSString *) extrafilePath;
/**
 *  从文件读取字符串
 *
 *  @param fileName      文件名
 *  @param extrafilePath 文件路径
 *
 *  @return <#return value description#>
 */
+ (NSString *) readStringPlistFile:(NSString *) fileName FilePath:(NSString *)extrafilePath;
/**
 *  从文件中读取数组
 *
 *  @param fileName      文件名
 *  @param extrafilePath 文件路径
 *
 *  @return 读取到的数组
 */
+ (NSMutableArray*) readArrayPlistFile:(NSString *)fileName FilePath:(NSString *) extrafilePath;
/**
 *  从文件读取字典
 *
 *  @param fileName      文件名
 *  @param extrafilePath 文件路径
 *
 *  @return 读取到的字典
 */
+ (NSMutableDictionary *) readDictionaryPlistFile:(NSString *) fileName FilePath:(NSString *)extrafilePath;
@end
