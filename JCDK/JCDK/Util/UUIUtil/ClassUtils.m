//
//  ClassUtils.m
//  JCDK
//
//  Created by 张科 on 16/9/6.
//  Copyright © 2016年 张科. All rights reserved.
//

#import "ClassUtils.h"

@implementation ClassUtils
+ (NSDictionary *)dateDicWithDate:(NSDate *)date
{
    CGFloat currentVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    NSCalendar * calendar;
    NSDateComponents *comps;
    if (currentVersion >=8.0)
    {
        calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
          comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekOfMonth|NSCalendarUnitWeekday fromDate:date];
    }
    else
    {
        calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]; // 指定日历的算法 NSCalendarIdentifierGregorian,NSGregorianCalendar
        // NSDateComponent 可以获得日期的详细信息，即日期的组成
        comps = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:date];
 
    }
    NSDictionary *dic = @{@"year":[NSString stringWithFormat:@"%ld",(long)comps.year],
                          @"month":[NSString stringWithFormat:@"%ld",(long)comps.month],
                          @"day":[NSString stringWithFormat:@"%ld",(long)comps.day],
                          @"hour":[NSString stringWithFormat:@"%ld",(long)comps.hour],
                          @"minute":[NSString stringWithFormat:@"%ld",(long)comps.minute],
                          @"second":[NSString stringWithFormat:@"%ld",(long)comps.second],
                          @"weekDay":[NSString stringWithFormat:@"%ld",(long)comps.weekday]};
    return dic;

}
+ (NSString *)dataStringWithDate:(NSDate *)date
{
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:[ClassUtils dateDicWithDate:date]];
    NSString *weekDay = [NSString stringWithFormat:@"星期%@", [ClassUtils arabicNumeralsToChinese:[[dic objectForKey:@"weekDay"] integerValue]]];
    NSString *timeStr = [NSString stringWithFormat:@"%@-%@-%@",[dic objectForKey:@"year"],[dic objectForKey:@"month"],[dic objectForKey:@"day"]];
    NSString *dateStr = [NSString stringWithFormat:@"(%@)%@",weekDay,timeStr];
    return dateStr;
}

+ (NSString *)arabicNumeralsToChinese:(NSInteger)number
{
    
    switch (number)
    {
        case 0:
            return @"零";
            break;
        case 1:
            return @"一";
            break;
        case 2:
            return @"二";
            break;
        case 3:
            return @"三";
            break;
        case 4:
            return @"四";
            break;
        case 5:
            return @"五";
            break;
        case 6:
            return @"六";
            break;
        case 7:
            return @"日";
            break;
        case 8:
            return @"八";
            break;
        case 9:
            return @"九";
            break;
        case 10:
            return @"十";
            break;
        case 100:
            return @"百";
            break;
        case 1000:
            return @"千";
            break;
        case 10000:
            return @"万";
            break;
        case 100000000:
            return @"亿";
            break;
        default:
            return nil;
            break;
    }
}
@end
