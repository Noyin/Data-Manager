//
//  SharedMethods.h
//  TapMatch
//
//  Created by Noyin Lawal on 2014-08-15.
//  Copyright (c) 2014 Noyin Lawal. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface DataManager : NSObject


+(DataManager*)sharedInstance;
-(void)saveScore;
-(int64_t)retrieveScore;


@end
