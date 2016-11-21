//
//  HomeViewController.m
//  XinShun
//
//  Created by Corepass on 16/11/17.
//  Copyright © 2016年 LONG. All rights reserved.
//

#import "HomeViewController.h"

#import "OwnerViewController.h"
#import "PassengerViewController.h"

#import "NewPagedFlowView.h"
#import "PGIndexBannerSubiew.h"

#import "XSSegmentedView.h"

#import "LeftMenuView.h"

#import "SelfTableViewController.h"

#define Width [UIScreen mainScreen].bounds.size.width


@interface HomeViewController ()<XSSegmentedViewDelegate,HomeMenuViewDelegate>
{
    OwnerViewController *ownerVC;
    PassengerViewController *passengerVC;
}

@property (weak, nonatomic) IBOutlet XSSegmentedView *segmentedView;

/**
 *  图片数组
 */
@property (nonatomic, strong) NSMutableArray *imageArray;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    
    LeftMenuView *demo = [[LeftMenuView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width * 0.8, [[UIScreen mainScreen] bounds].size.height)];
    demo.customDelegate = self;
    demo.nav = self.navigationController;
    
    MenuView *menu = [MenuView MenuViewWithDependencyView:self.view MenuView:demo isShowCoverView:YES];
    //    MenuView *menu = [[MenuView alloc]initWithDependencyView:self.view MenuView:demo isShowCoverView:YES];
    self.menu = menu;

    
    
    [self.segmentedView setTitles:@[@"乘客",@"车主"]];
    self.segmentedView.delegate = self;
    
    
    ownerVC = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"OwnerViewController"];
    passengerVC = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"PassengerViewController"];
    [self.view addSubview:passengerVC.view];
    [self addChildViewController:ownerVC];
    [self addChildViewController:passengerVC];
    
    


}


#pragma mark HomeMenuViewDelegate
-(void)LeftMenuViewClick:(NSInteger)tag{
    [self.menu hidenWithAnimation];
    NSString *tagstr = [NSString stringWithFormat:@"%ld",(long)tag];
    [[[UIAlertView alloc] initWithTitle:@"提示" message:tagstr delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];

   
}

-(void)jump{
    [self.menu hidenWithAnimation];
    SelfTableViewController *vc = initVCFromSTBWithIdentifer(@"SelfTableViewController");
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark  XSSegmentedViewDelegate
- (void)xsSegmentedView:(XSSegmentedView *)XSSegmentedView selectTitleInteger:(NSInteger)integer {
    
    
    switch (integer) {
        case 1:
            [self.view addSubview:ownerVC.view];
            [passengerVC.view removeFromSuperview];
            NSLog(@"%@",passengerVC.description);
            
            break;
        case 0:
            [self.view addSubview:passengerVC.view];
            [ownerVC.view removeFromSuperview];
            
            break;
        default:
            break;
    }
    
}

- (BOOL)xsSegmentedView:(XSSegmentedView *)XSSegmentedView didSelectTitleInteger:(NSInteger)integer {
    
    NSLog(@"didSelect:%ld",(long)integer);
    
    return YES;
}
- (IBAction)leftNavAction:(id)sender {
    [self.menu show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
