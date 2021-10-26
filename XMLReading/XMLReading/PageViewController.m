//
//  PageViewController.m
//  TPhotoView
//
//  Created by admin on 2021/10/14.
//

#import "PageViewController.h"
#import "ViewController.h"

@interface PageViewController ()

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //Next to get new token on website if expired
    NSString *stringURL = @"https://cdn-eu-hz-2.ufile.io/get/cticj16c?token=Mzk5YTM0N2MwNjc1MmM3YzVhNTk2YjFkMzcyZmZiNTFlNmJmMzBhMjdiZjM5ZjBkZDNkNWI3ZmI2NjBkYzk2MDMxMWJlMmY5NzM5NmY0OGVjOTQ2NjRlZmFhZjZjZDlkZWVmZTU0MmYxNmQzMjRhODFiOGVhZjZhNzVlNzFkOTE3eDRJaEhUeXZGaTR6KzFhNXZBUTVLNEtuOGVhRHYyck85N3FRNkVUMjlMNFBsb29hZkpLV2JGOUFGb01TNlVRNXZweHBZbFBvYitmR090aTQvVFJObnN3VExSK0x2V1hITUZVNU1ZOW95ckxKNzNIaVRjYU8zUXZYZFNRR0NGQ2RkS25VMmMwcDZkS2J5dTk5anVJSjJWZkZRNTZRMUI1amJzWk5wWUF0c0Z4Y2NHZjBrTk1zTXdGUUVBZHppV1FBbGhKYUp6WXdNSERWeTZONGdKWlNSNjE2dTlmd2RFWDhwbmVWTWtTWmpOY2ppc0RWK1RkYnZHc3RiQzdWVWVobHpTS1kzT0F4WFFYQmdzU09uSGR2UENDTlg4Ty9ZVXZlNytGQXN5Z2RTSTJDTCs2QzVtVzgwMTA4OU9OalB6S05JUDY1azJCYXNpbmR6TkhMdnh3L3JSN0wzNS9MSmYzWTF0SytPWFFKblg5cUN2REhuOW5oaXBTdzZKZWRUM0w=";
    
    NSURL  *url = [NSURL URLWithString:stringURL];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSString *content = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"NSData: %@",content);
    
    //XML content:
    /**<xml version="1.0" encoding="UTF-8"?>
    <magazines>
       <magazine>img1.png</magazine>
       <magazine>img2.png</magazine>
       <magazine>img3.png</magazine>
    </magazines>*/
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    [parser setDelegate:self];
    
    // Invoke the parser and check the result
    [parser parse];
    
    self.dataSource = self;
    self.pageIndex = 0;

    ViewController *initVC = (ViewController *)[self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:initVC];
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

- (UIViewController *) viewControllerAtIndex: (NSUInteger) index {
    NSLog(@"viewControllerAtIndex");
    
    ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    viewController.imageName = self.imagesArray[index];
    viewController.pageIndex = index;
    viewController.goNextDelegate = self;
    viewController.goPreviousDelegate = self;
    return viewController;
}

- (UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = ((ViewController *) viewController).pageIndex;
    NSLog(@"viewControllerAfterViewController");
    if (index == NSNotFound) {
        return  nil;
    }
    index ++;
    if (index == [self.imagesArray count]) {
        return  nil;
    }
    self.pageIndex = index;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = ((ViewController *) viewController).pageIndex;
    NSLog(@"viewControllerBeforeViewController");
    if (index == 0 || index == NSNotFound) {
        return  nil;
    }
    index --;
    self.pageIndex = index;
    return [self viewControllerAtIndex:index];
}

#pragma mark - private
- (void)clickNextRegconize {
    NSLog(@"Clicked on next button %lu", (unsigned long)self.pageIndex);
    if (self.pageIndex >= [self.imagesArray count]-1) {
        return;
    } else {
        self.pageIndex ++;
    }
    ViewController *viewController = (ViewController *)[self viewControllerAtIndex:self.pageIndex];
    NSArray *viewControllers = [NSArray arrayWithObject:viewController];
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

- (void)clickPreviousRegconize {
    NSLog(@"Clicked on previous button %lu", (unsigned long)self.pageIndex);
    if (self.pageIndex == 0) {
        return;
    } else {
        self.pageIndex --;
    }
    ViewController *viewController = (ViewController *)[self viewControllerAtIndex:self.pageIndex];
    NSArray *viewControllers = [NSArray arrayWithObject:viewController];
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
}

#pragma mark - parse XML
- (void) parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"parserDidStartDocument");
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    NSLog(@"didStartElement --> %@", elementName);
    if ([elementName isEqualToString:@"magazines"]) {
        self.imagesArray = [[NSMutableArray alloc] init];
    }
}

-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSLog(@"foundCharacters --> %@", string);
    self.imageName = [[NSMutableString alloc] initWithString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"didEndElement   --> %@", elementName);
    if ([elementName isEqualToString:@"magazine"]) {
        [self.imagesArray addObject:self.imageName];
    }
    self.imageName = nil;
}

- (void) parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"parserDidEndDocument");
    NSLog(@"imagesArray: %@", self.imagesArray);
}

@end
