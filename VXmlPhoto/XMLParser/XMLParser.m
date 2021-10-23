//
//  XMLParser.m
//  VXmlPhoto
//
//  Created by LyThienVuong on 21/10/2021.
//

#import "XMLParser.h"
#import "Magazine.h"

@implementation XMLParser {
    NSMutableString *currentElement;
}
@synthesize magazine, arrMagazine;

- (XMLParser *) initXMLParser {
    self = [super init];
    arrMagazine = [[NSMutableArray alloc] init];
    return self;
}

- (void) parser:(NSXMLParser *)xmlParser didStartElement:(NSString *)startElementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualName attributes:(NSDictionary *)attributeDict {
    if (![startElementName isEqualToString:@"magazine"]) {
        return;
    } else {
        magazine = [[Magazine alloc] init];
        magazine.magID = [attributeDict objectForKey:@"id"];
        magazine.magThumb = [attributeDict objectForKey:@"thumb"];
        magazine.magTitle =[attributeDict objectForKey:@"title"];
    }
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!currentElement) {
        currentElement = [[NSMutableString alloc] initWithString:string];
    } else {
        [currentElement appendString:string];
    }
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)endElementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualName {
    if ([endElementName isEqualToString:@"Magazines"]) {
        return;
    }
    if ([endElementName isEqualToString:@"magazine"]) {
        [arrMagazine addObject:magazine];
    }
}

- (NSMutableArray *)getMagazines {
    return arrMagazine;
}

@end
