//
//  XMLParser.h
//  VXmlPhoto
//
//  Created by LyThienVuong on 21/10/2021.
//

#import <Foundation/Foundation.h>
@class Magazine;

NS_ASSUME_NONNULL_BEGIN

@interface XMLParser : NSObject
@property (nonatomic, retain) Magazine *magazine;
@property (nonatomic, retain) NSMutableArray *arrMagazine;
- (XMLParser *) initXMLParser;

@end

NS_ASSUME_NONNULL_END
