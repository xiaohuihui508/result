//
//  ViewController.m
//  个人中心的效果
//
//  Created by mac on 17/2/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewController.h"
#import "CPKenburnsView.h"
#import "SJAvatarBrower.h"


const CGFloat BackGroupHeight = 280;
const CGFloat HeadImageHeight= 80;

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    
    UITableView *demoTableView;
    UIView *BGView;
    UIImageView *headImageView;
    UILabel *nameLabel;
    UILabel *titleLabel;
    UIButton *leftBtn;
    UIButton *rightBtn;
    CPKenburnsView *kenbunrsView;
}
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[[UIColor blueColor]colorWithAlphaComponent:1]] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    //    tableview init
    [self.view addSubview:self.TableView];
    //    kenbunrsView init
    [demoTableView addSubview:self.Kenbunrs];
    //    表头viewinit
    [demoTableView addSubview:self.headView];
    //    用户图像init
    [BGView addSubview:self.ueserImage];
    //    用户名字init
    [BGView addSubview:self.userLable];
    //    导航栏标题init
    self.navigationItem.titleView = self.titleLable;
    //    导航栏左右边标按钮init
    self.navigationItem.rightBarButtonItem = self.rightBat;
    self.navigationItem.leftBarButtonItem = self.leftBat;
    
    
    
}
#pragma mark <懒加载创建控件>
- (UITableView*)TableView {
    demoTableView                         = [[UITableView alloc]init];
    demoTableView.delegate                = self;
    demoTableView.dataSource              = self;
    [demoTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    demoTableView.frame                   = [UIScreen mainScreen].bounds;
    demoTableView.contentInset            = UIEdgeInsetsMake(BackGroupHeight, 0, 0, 0);
    demoTableView.tableFooterView         = [[UIView alloc]init];
    return demoTableView;
}
- (CPKenburnsView *)Kenbunrs {
    kenbunrsView                          = [[CPKenburnsView alloc] initWithFrame:CGRectMake(0, -BackGroupHeight, KScreen_Width, BackGroupHeight)];
    kenbunrsView.image                    = [UIImage imageNamed:@"background"];
    return kenbunrsView;
}
- (UIView*)headView {
    BGView                                = [[UIView alloc]init];
    BGView.backgroundColor                = [UIColor clearColor];
    BGView.frame                          = CGRectMake(0, -BackGroupHeight, KScreen_Width, BackGroupHeight);
    return BGView;
}
- (UIImageView *)ueserImage {
    headImageView=[[UIImageView alloc]init];
    headImageView.layer.masksToBounds     = YES;
    headImageView.layer.borderWidth       = 1;
    headImageView.layer.cornerRadius      = 40;
    headImageView.contentMode             = UIViewContentModeScaleAspectFill;
    headImageView.layer.borderColor       = [[UIColor whiteColor] CGColor];
    headImageView.image                   = [UIImage imageNamed:@"2.jpg"];
    headImageView.frame                   = CGRectMake((KScreen_Width-HeadImageHeight)/2, 80, HeadImageHeight, HeadImageHeight);
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewtapGesture)];
    //点击的次数
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    //给self.view添加一个手势监测；
    headImageView.userInteractionEnabled=YES;
    [headImageView addGestureRecognizer:singleRecognizer];
    
    return headImageView;
}
- (void)viewtapGesture {
    NSLog(@"局部放大");
    [SJAvatarBrower showImage:headImageView];//调用方法
}
- (UILabel *)userLable {
    nameLabel                            = [[UILabel alloc]init];
    nameLabel.text                       = @"螃蟹云购";
    nameLabel.layer.masksToBounds        = YES;
    nameLabel.layer.cornerRadius         = 10;
    nameLabel.font                       = [UIFont systemFontOfSize:13];
    nameLabel.textAlignment              = NSTextAlignmentCenter;
    nameLabel.frame                      = CGRectMake((KScreen_Width-HeadImageHeight)/2, CGRectGetMaxY(headImageView.frame)+10, HeadImageHeight, 20);
    nameLabel.backgroundColor            = [UIColor whiteColor];
    nameLabel.textColor                  = [UIColor blackColor];
    return nameLabel;
}
- (UILabel *)titleLable {
    titleLabel                           = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    titleLabel.textColor                 = [UIColor whiteColor];
    titleLabel.textAlignment             = NSTextAlignmentCenter;
    titleLabel.text                      = @"个人中心";
    titleLabel.alpha                     = 0;
    return titleLabel;
}
- (UIBarButtonItem*)rightBat {
    rightBtn  =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [rightBtn setTitle:@"设置" forState:UIControlStateNormal];
    rightBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    return rightItem;
}
- (UIBarButtonItem*)leftBat {
    leftBtn  =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
    leftBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    return leftItem;
}
- (void)rightBtnAction {
    NSLog(@"点击右边按钮了");
    
}
- (void)leftBtnAction {
    NSLog(@"点击左边边按钮了");
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - tableViewDelegate&DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]init];
    }
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat yOffset        = scrollView.contentOffset.y;
    CGFloat xOffset        = (yOffset + BackGroupHeight) / 2;
    
    if (yOffset < -BackGroupHeight) {
        
        CGRect rect        = kenbunrsView.frame;
        rect.origin.y      = yOffset;
        rect.size.height   =  -yOffset ;
        rect.origin.x      = xOffset;
        rect.size.width    = KScreen_Width + fabs(xOffset) * 2;
        kenbunrsView.frame = rect;
    }
    
    CGFloat alpha          = (yOffset + BackGroupHeight) / BackGroupHeight;
    
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[[UIColor blueColor]colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];
    
    titleLabel.alpha       = alpha;
    alpha                  = fabs(alpha);
    alpha                  = fabs(1-alpha);
    alpha = alpha < 0.2 ? 0 : alpha - 0.2;
    BGView.alpha           = alpha;
}

- (UIImage *)imageWithColor:(UIColor *)color {
    // 描述矩形
    CGRect rect           = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context  = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    return theImage;
}

@end
