//
//  YueMedia.m
//  Sutra
//
//  Created by medica_mac on 2017/8/29.
//  Copyright © 2017年 com.medica. All rights reserved.
//

#import "YueMedia.h"

@implementation YueMedia

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:self.mediaType forKey:@"mediaType"];
    [aCoder encodeObject:self.mediaName forKey:@"mediaName"];
    [aCoder encodeObject:self.mediaDetail forKey:@"mediaDetail"];
    [aCoder encodeObject:self.filePath forKey:@"filePath"];
    [aCoder encodeObject:self.assetUrl forKey:@"assetUrl"];
    [aCoder encodeObject:self.image forKey:@"image"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.mediaType = [aDecoder decodeIntegerForKey:@"mediaType"];
        self.mediaName = [aDecoder decodeObjectForKey:@"mediaName"];
        self.mediaDetail = [aDecoder decodeObjectForKey:@"mediaDetail"];
        self.filePath = [aDecoder decodeObjectForKey:@"filePath"];
        self.assetUrl = [aDecoder decodeObjectForKey:@"assetUrl"];
        self.image = [aDecoder decodeObjectForKey:@"image"];
    }
    
    return self;
}
@end
