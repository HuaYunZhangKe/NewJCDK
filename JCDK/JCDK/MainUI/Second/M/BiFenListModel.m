//
//  BiFenListModel.m
//  JCDK
//
//  Created by 张科 on 2017/2/9.
//  Copyright © 2017年 张科. All rights reserved.
//

#import "BiFenListModel.h"

@implementation BiFenListModel
- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self.bid=@"";
     self.league = @"";
    self.color = @"";
    self.date = @"";
   self.time=@"";
    self.h_half=@"";
    self.a_half=@"";
    self.datetime=@"";
    self.h_yellow=@"";
   self.h_red=@"";
    self.h_name=@"";
   self.h_score=@"";
    self.a_name=@"";
    self.a_red=@"";
   self.a_yellow=@"";
   self.d1=@"";
    self.d2=@"";
   self.d3=@"";
    self.d4=@"";
self.d5=@"";
    self.d6=@"";
    self.comments=@"";
  self.jingcai=@"";
   self.current=@"";
   self.h_rank=@"";
  self.a_rank=@"";
    self.a=@"";
   self.is_follow=@"";
    
    self = [super initWithDictionary:dictionary];
    if (self) {
        
        
    }
    return self;

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"])
    {
        self.bid = value;
       
    }
    
}
@end
