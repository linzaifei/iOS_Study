//
//  Person.m
//  GCD
//
//  Created by zifei on 2021/2/2.
//

#import "Person.h"

static Person *person = nil;
@implementation Person

- (instancetype)init{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        person = [super init];
    });
    return person;
    
}

@end
