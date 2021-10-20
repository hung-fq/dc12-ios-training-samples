//
//  ViewController.m
//  xmlReading
//
//  Created by Bao on 18/10/2021.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController @synthesize myTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSError *error = nil;
    NSString *path=[[NSBundle mainBundle] pathForResource:@"UserInfo" ofType:@"xml"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSString *s = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSDictionary *_xmlDictionary = [XMLReader dictionaryForXMLString:s error:&error];
    _subjectsArray = [[[_xmlDictionary  objectForKey:@"xml"] objectForKey:@"Magazines"] objectForKey:@"magazine"];





@end
//
//NSError *error = nil;
//NSString *path=[[NSBundle mainBundle] pathForResource:@"UserInfo" ofType:@"xml"];
//NSData *data = [NSData dataWithContentsOfFile:path];
//NSString *s = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//NSDictionary *_xmlDictionary = [XMLReader dictionaryForXMLString:s error:&error];
//_subjectsArray = [[[_xmlDictionary  objectForKey:@"xml"] objectForKey:@"Magazines"] objectForKey:@"magazine"];
