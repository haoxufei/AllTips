//
//  LazyTableViewController.m
//  ios-tips
//
//  Created by mac on 2018/8/10.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "LazyTableViewController.h"
#import "EOCParseOperation.h"
#import "AppRecord.h"
#import "ImageLoader.h"
static  NSString *const dataURL = @"http://phobos.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=100/xml";
@interface LazyTableViewController (){
    NSMutableDictionary *imageLoadDic;
}

@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation LazyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    imageLoadDic = [NSMutableDictionary dictionary];
    
    self.navigationItem.title = @"lazy练习";
    self.tableView.rowHeight = 64.f;
    [self getDataRequest];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    //获取当前正在运行的网络线程对象
    NSArray *currentImageLoaders = imageLoadDic.allValues;  //imageLoader
    [currentImageLoaders makeObjectsPerformSelector:@selector(CancelLoadImage)];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getDataRequest{
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:dataURL]];
    NSURLSessionDataTask *datatask = [[NSURLSession sharedSession] dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       // [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (error) {
            
        }else{
            EOCParseOperation *operation = [[EOCParseOperation alloc]init];
            operation.data = data;
            NSOperationQueue *queue = [[NSOperationQueue alloc]init];
            [queue addOperation:operation];
            __weak typeof(operation) weakParseOperation = operation;
            operation.completionBlock = ^{
                self.dataArray = weakParseOperation.parseDataArr;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            };
        }
    }];
    [datatask resume];
   // [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!Cell) {
        Cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    AppRecord *apprecord = self.dataArray[indexPath.row];
    Cell.textLabel.text  = apprecord.AppName;
    
    if (apprecord.appIcon) {//有图片
        Cell.imageView.image = apprecord.appIcon;
    }else{//没有图片
        //  Runloop 两种mode defaulemode 和trackingmode  当我滑动的时候属于trackingmode下 defaulemode下的任务暂停 知道切换到defaultmode下的时候 才会继续执行任务
        Cell.imageView.image = [UIImage imageNamed:@"Placeholder"];//显示默认图片
//        [self performSelector:@selector(LoadCellImage:) withObject:indexPath afterDelay:0.f inModes:[NSDefaultRunLoopMode]];
        if (!tableView.dragging && !tableView.decelerating) {///不在拖动和减速的时候
            [self LoadCellImage:indexPath];
        }
    }
    //cell.imageView.imgae  它的高度是由image.szie和tableview高度一起决定的
    return Cell;
}
-(void)LoadCellImage:(NSIndexPath *)indexpath{
   AppRecord *apprecord = self.dataArray[indexpath.row];
    ImageLoader *imageloader = imageLoadDic[indexpath];
    
    if (!imageloader) {
        imageloader = [[ImageLoader alloc]init];
        imageLoadDic[indexpath] = imageloader;
    }
    
    imageloader.apprecord = apprecord;
    imageloader.completionBlock = ^{
   
        dispatch_async(dispatch_get_main_queue(), ^{
             UITableViewCell *cell =  [self.tableView cellForRowAtIndexPath:indexpath];
            cell.imageView.image = apprecord.appIcon;
            
            
        });
        //remove掉imagloader
        [self->imageLoadDic removeObjectForKey:indexpath];
    };
    [imageloader StartLoadimage];
    
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    [self loadVisibleCellimage];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (decelerate) {// 停止拖动的时候 scroller有减速动画
        
    }else{// 停止拖动的时候 scroller没有减速动画
        [self loadVisibleCellimage];
    }
}
- (void)loadVisibleCellimage{
    
    //获取所有可见的范围的cell 如果说gaicell没有图片 网络加载图片
    NSArray *visibleCellArr = [self.tableView indexPathsForVisibleRows];
    for (NSIndexPath *indexpath in visibleCellArr) {
        AppRecord *apprecort = self.dataArray[indexpath.row];
        if (!apprecort.appIcon) {
            
            [self LoadCellImage:indexpath];
            
        }
        
    }
        
}
-(void)dealloc{
    NSLog(@"tablevie dealloc!");
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
