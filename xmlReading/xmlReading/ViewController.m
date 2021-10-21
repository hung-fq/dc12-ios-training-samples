#import "ViewController.h"
#import "XMLReader.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@end

@implementation ViewController

#pragma mark - Define const

static int const numberOfLines = 2;
static int const systemFont = 10;

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    NSError *error = nil;
    NSString *path=[[NSBundle mainBundle] pathForResource:@"UserInfo" ofType:@"xml"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"dictionary: %@", string);
    _contentTextView.text = string;
    NSDictionary *_xmlDictionary = [XMLReader dictionaryForXMLString:string error:&error];
    subjectsArray = [[[_xmlDictionary objectForKey:@"xml"] objectForKey:@"Magazines"] objectForKey:@"magazine"];
    [self.tableView reloadData];
}

#pragma mark - Method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [subjectsArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Demo XML";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"StatusCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:systemFont];
        cell.textLabel.numberOfLines = numberOfLines;
        cell.detailTextLabel.font = [UIFont systemFontOfSize:systemFont];
    }
    NSDictionary *status = [subjectsArray objectAtIndex: indexPath.row];
    cell.textLabel.text = [status objectForKey:@"@id"];
    cell.detailTextLabel.text = [status objectForKey:@"@thumb"];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
