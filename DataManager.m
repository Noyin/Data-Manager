//
//  SharedMethods.m
//  TapMatch
//
//  Created by Noyin Lawal on 2014-08-15.
//  Copyright (c) 2014 Noyin Lawal. All rights reserved.
//

#import "DataManager.h"

@interface DataManager()
{

}
@end



@implementation DataManager


static DataManager * dataManager = nil;
+(DataManager*)sharedInstance
{
    if (!dataManager) {
        dataManager = [[DataManager allocWithZone:NULL] init];
            }
    return dataManager;
}

-(void)saveScore
{
    NSArray * documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString * documentDirectory = [documentDirectories objectAtIndex:0];
    NSString * filePath = [documentDirectory stringByAppendingString:@"ScoreData"];
    NSMutableData * data = [[NSMutableData alloc] init];
    if (data) {
        NSKeyedArchiver * encoder = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        [encoder encodeInt64:self.gemsCollected forKey:@"scoreData"];
        [encoder finishEncoding];
        [data writeToFile:filePath atomically:YES];
    }
}


-(int64_t)retrieveScore
{
    NSArray * documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString * documentDirectory = [documentDirectories objectAtIndex:0];
    NSString * filePath = [documentDirectory stringByAppendingString:@"ScoreData"];
    NSData * data = [[NSData alloc] initWithContentsOfFile:filePath options:NSDataReadingMapped error:nil];
    int64_t storedScore = 0;
    if (data) {
        NSKeyedUnarchiver * decoder = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
         storedScore = [decoder decodeInt64ForKey:@"scoreData"];
        [decoder finishDecoding];
    }
    return storedScore;
}







@end
