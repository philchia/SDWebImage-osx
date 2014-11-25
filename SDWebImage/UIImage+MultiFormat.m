//
//  NSImage+MultiFormat.m
//  SDWebImage
//
//  Created by Olivier Poitrey on 07/06/13.
//  Copyright (c) 2013 Dailymotion. All rights reserved.
//

#import "UIImage+MultiFormat.h"
#import "UIImage+GIF.h"
#import "NSData+ImageContentType.h"
#import <ImageIO/ImageIO.h>

#ifdef SD_WEBP
#import "NSImage+WebP.h"
#endif

@implementation NSImage (MultiFormat)

+ (NSImage *)sd_imageWithData:(NSData *)data {
    NSImage *image;
    NSString *imageContentType = [NSData sd_contentTypeForImageData:data];
    if ([imageContentType isEqualToString:@"image/gif"]) {
        image = [NSImage sd_animatedGIFWithData:data];
    }
#ifdef SD_WEBP
    else if ([imageContentType isEqualToString:@"image/webp"])
    {
        image = [NSImage sd_imageWithWebPData:data];
    }
#endif
    else {
        image = [[NSImage alloc] initWithData:data];
    }


    return image;
}

@end
