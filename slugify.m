//
//  
//  slugifyObjectiveC
//
//  Created by Rafael de Jesús Echeverría fuentes on 08/12/11.
//  Copyright (c) 2012. All rights reserved.
//


+ (NSString *)slugify:(NSString *)string
{
    string = [string stringByReplacingOccurrencesOfString:@" "withString:@"-"]; 
    string = [string lowercaseString];
    NSMutableString *resultString = [NSMutableString stringWithCapacity:string.length];  
    NSScanner *scanner = [NSScanner scannerWithString:string];  
    NSCharacterSet *allowedChars = [NSCharacterSet characterSetWithCharactersInString:@"-abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ "];  
    while ([scanner isAtEnd] == NO) {  
        NSString *buffer;  
        if ([scanner scanCharactersFromSet:allowedChars intoString:&buffer]) {  
            [resultString appendString:buffer]; 
        } else {  
            [scanner setScanLocation:([scanner scanLocation] + 1)];  
        }  
    }  
    return resultString;
}
