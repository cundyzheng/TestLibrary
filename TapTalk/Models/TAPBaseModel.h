//
//  TAPBaseModel.h
//  Moselo
//
//  Created by Ritchie Nathaniel on 3/8/17.
//  Copyright © 2017 Moselo. All rights reserved.
//

//@import JSONModel;
#import <JSONModel/JSONModel.h>

@interface TAPBaseModel : JSONModel

+ (BOOL)propertyIsOptional:(NSString*)propertyName;

@end
