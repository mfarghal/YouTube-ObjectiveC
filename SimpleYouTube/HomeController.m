//
//  HomeController.m
//  SimpleYouTube
//
//  Created by Mohamed Farghal on 6/30/17.
//  Copyright © 2017 Mohamed Farghal. All rights reserved.
//

#import "HomeController.h"
#import "VideoCell.h"
#import "SettingsLuncher.h"
#import "Extension-UIColor.h"
#import "Setting.h"
#import "MenuBar.h"
#import "Channel.h"
#import "Video.h"
@interface HomeController ()


@property (nonatomic,retain) SettingsLuncher *settingsLuncher;
    //private Method

-(void)featchVideos;
-(void)setupMenuBar;
-(void)btnMoreBarItem;
-(void)btnSearchBarItem;
-(void)showControllerForSettings;
-(void)registerCellToCollectionView;
@end

@implementation HomeController
{
    //Private var
    MenuBar *menuBar ;
    UIView *blackView ;
    NSString * reuseIdentifier ;
    NSMutableArray *videoArray ;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    reuseIdentifier = @"VideoCell";

    
    [[self collectionView] setDelegate:self];
    [[self collectionView] setDataSource:self];
    [[self collectionView] setContentInset:UIEdgeInsetsMake(50, 0, 0, 0)];
    [[self collectionView] setScrollIndicatorInsets:UIEdgeInsetsMake(50, 0, 0, 0)];
    //[[self collectionView] setPagingEnabled:YES];
    
    
    
    [[self collectionView] setBackgroundColor:[UIColor whiteColor]];
    [self registerCellToCollectionView];
    
    [self featchVideos];
    
    [self setupMenuBar];
    [self setupMenuBarButton];

   }


-(void)featchVideos{
    NSURL *url = [NSURL URLWithString:@"https://s3-us-west-2.amazonaws.com/youtubeassets/home.json"];
    [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"Error %@",error);
            return;
        }
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"%@",dict);
        
        videoArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary *_NSDictArray in dict) {
            Channel *channel = [[Channel alloc] init];
            channel.profileImageName = [[_NSDictArray objectForKey:@"channel"] objectForKey:@"profile_image_name"];
            channel.name  = [[_NSDictArray objectForKey:@"channel"] objectForKey:@"name"];

            
            Video *blankVideo = [[Video alloc] init];
            blankVideo.title = [_NSDictArray objectForKey:@"title"];
            blankVideo.thumbnailImageName = [_NSDictArray objectForKey:@"thumbnail_image_name"];
            blankVideo.numberOfViews = [_NSDictArray objectForKey:@"number_of_views"];
            blankVideo.channel = channel;
            
            
            [videoArray addObject:blankVideo];
            
        }
       
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self collectionView] reloadData];
        });
        
        
    }].resume ;
}



-(void)registerCellToCollectionView{
    NSString *nibName = reuseIdentifier;
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    [[self collectionView] registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
}
-(void)setupMenuBarButton{
    /*Add Home Label*/
    UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [self view].frame.size.width - 32, [self view].frame.size.height)];
    [lblTitle setText:@"Home"];
    [lblTitle setTextColor:[UIColor whiteColor]];
    [[lblTitle font] fontWithSize:20];
    
    /*Add Search Button*/
    UIBarButtonItem *btnBar = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"search_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(btnSearchBarItem)];
    
    /*Add More Label*/
    UIBarButtonItem *btnMore = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"nav_more_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(btnMoreBarItem)];
    
    
    [[self navigationItem] setTitleView:lblTitle];
    [[self navigationItem] setRightBarButtonItems :@[btnMore,btnBar]];
    
}







-(void)btnSearchBarItem{
    
}

/*Implement Lazy var*/
-(SettingsLuncher *)settingsLuncher{
    if (!_settingsLuncher) {
        _settingsLuncher = [[SettingsLuncher alloc] init];
        _settingsLuncher.homeController = self;
    }
    return _settingsLuncher;
}
-(void)btnMoreBarItem{
    [self.settingsLuncher showSettingsCollection];
}

-(void)showControllerForSettingsWith:(Setting*)setting{
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    [[viewController navigationItem] setTitle:setting.name];
    
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [[self navigationController] pushViewController:viewController animated:YES];
}


-(void)setupMenuBar{
    
    /*to make menu apper/disapper when scroll*/
    [self navigationController].hidesBarsOnSwipe = YES;
    
    
    /*UIView *redview = [[UIView alloc] init];
    redview.backgroundColor = [UIColor ExactRGBWithRed:230 Green:32 Blue:31];
    [self.view addSubview:redview];
    
    redview.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[redview]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(redview)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[redview(==50)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(redview)]];*/
    
    
    
    menuBar = [[MenuBar alloc]init];
    [self.view addSubview:menuBar];
    
    [[menuBar.topAnchor constraintEqualToAnchor:[[self topLayoutGuide] bottomAnchor]] setActive:true];
    
    
    
    //Add constraint
    menuBar.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[menuBar]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(menuBar)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menuBar(==50)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(menuBar)]];
    [self.view setNeedsUpdateConstraints];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {    
    return videoArray != nil ? videoArray.count:0 ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
     VideoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VideoCell" forIndexPath:indexPath];
    [cell setVideoToCell:videoArray[indexPath.row]];
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    double height = ([[self view] frame].size.width - 16 - 16) * 9 / 16;
    return CGSizeMake([[self view] frame].size.width, height + 16 + 68 );
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
