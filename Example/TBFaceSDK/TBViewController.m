//
//  TBViewController.m
//  TBFaceSDK
//
//  Created by zpz5789 on 02/17/2023.
//  Copyright (c) 2023 zpz5789. All rights reserved.
//

#import "TBViewController.h"
#import "IDLFaceSDK/IDLFaceSDK.h"
#import "BDFaceLivenessViewController.h"
#import "BDFaceDetectionViewController.h"
#import "BDFaceLivingConfigModel.h"
#import "BDFaceLivingConfigViewController.h"
#import "BDFaceAgreementViewController.h"
#import "BDFaceLogoView.h"
#import "BDFaceAdjustParamsTool.h"
#import "BDFaceLog.h"
#import "BDFaceCalculateTool.h"
#import "BDFaceToastView.h"
#import "TBFaceSDKUtil.h"
#define ScreenRect [UIScreen mainScreen].bounds
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define ScreenSafeTopMargin [BDFaceCalculateTool safeTopMargin]

static float toBottomMargin = 80.0f;

@interface TBViewController ()
@property (weak, nonatomic) UIButton *settingBtn;

@end

@implementation TBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat height = (int)(CGRectGetWidth(self.view.frame) / 2.1);
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), height)];
    [self.view addSubview:bgView];
    bgView.image = [TBFaceSDKUtil imageNamed:@"image_guide"];
    bgView.backgroundColor = [UIColor greenColor];
    // 设置按钮
    self.settingBtn.frame = CGRectMake((ScreenWidth-22-20), 42.7 + ScreenSafeTopMargin, 22, 22);
    [self.settingBtn setImage:[TBFaceSDKUtil imageNamed:@"icon_titlebar_setting"] forState:UIControlStateNormal];
    [_settingBtn addTarget:self action:@selector(settingAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.settingBtn];
    
    // 欢迎使用的label
    UILabel *welcome = [[UILabel alloc] init];
    welcome.frame = CGRectMake(51.8, 47.3 + ScreenSafeTopMargin, 82.3, 33.3);
    welcome.text = @"欢迎使用";
    welcome.font =  [UIFont fontWithName:@"PingFangSC-Medium" size:19.3];
    welcome.textColor = [UIColor colorWithRed:0 / 255.0 green:0 / 255.0 blue:0 / 255.0 alpha:1 / 1.0];
    [self.view addSubview:welcome];
    
    // 欢迎使用的下一行
    UILabel *welcomeNext = [[UILabel alloc] init];
    welcomeNext.frame = CGRectMake(50, 80.7 + ScreenSafeTopMargin, 214.7, 33.3);
    welcomeNext.text = @"百度人脸采集SDK";
    welcomeNext.font = [UIFont fontWithName:@"PingFangSC-Medium" size:25.3];
    welcomeNext.textColor = [UIColor colorWithRed:0 / 255.0 green:0 / 255.0 blue:0 / 255.0 alpha:1 / 1.0];
    [self.view addSubview:welcomeNext];
    
    CGFloat mainOriginY = 190.0f + ScreenSafeTopMargin;
    CGRect middleContentFrame = CGRectMake(50, mainOriginY, ScreenWidth, 0);
    UIView *middleContentView = [[UIView alloc] initWithFrame:middleContentFrame];
    {
        // 光线的提示和图片
        UIImageView *lightImage = [[UIImageView alloc] init];
        lightImage.frame =  CGRectMake(0, -1, 60, 60);
        lightImage.image = [TBFaceSDKUtil imageNamed:@"light"];
        [middleContentView addSubview:lightImage];
        UILabel *adjustLight = [[UILabel alloc] init];
        adjustLight.frame =  CGRectMake(76, 8.7, 120, 18);
        adjustLight.text = @"识别光线适中";
        adjustLight.font = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
        adjustLight.textColor = [UIColor colorWithRed:0 / 255.0 green:0 / 255.0 blue:0 / 255.0 alpha:1 / 1.0];
        [middleContentView addSubview:adjustLight];
        UILabel *adjustLight2 = [[UILabel alloc] init];
        adjustLight2.frame =  CGRectMake(76, 36, 155, 12);
        adjustLight2.text = @"请保证光线不要过暗或过亮";
        adjustLight2.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        adjustLight2.textColor = [UIColor colorWithRed:153 / 255.0 green:153 / 255.0 blue:153 / 255.0 alpha:1 / 1.0];
        [middleContentView addSubview:adjustLight2];
        
        // 正对手机的图片t和提示
        UIImageView *angleImage = [[UIImageView alloc] init];
        angleImage.frame = CGRectMake(0, 91, 60, 60);
        angleImage.image = [TBFaceSDKUtil imageNamed:@"front"];
        [middleContentView addSubview:angleImage];
        UILabel *focesText = [[UILabel alloc] init];
        focesText.frame = CGRectMake(76, 100.7, 100, 18);
        focesText.text = @"请正对手机";
        focesText.font = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
        focesText.textColor = [UIColor colorWithRed:0 / 255.0 green:0 / 255.0 blue:0 / 255.0 alpha:1 / 1.0];
        [middleContentView addSubview:focesText];
        UILabel *focesTextNext = [[UILabel alloc] init];
        focesTextNext.frame = CGRectMake(76, 128, 155, 12);
        focesTextNext.text = @"保持您的脸出现在取景框内";
        focesTextNext.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        focesTextNext.textColor = [UIColor colorWithRed:153 / 255.0 green:153 / 255.0 blue:153 / 255.0 alpha:1 / 1.0];
        [middleContentView addSubview:focesTextNext];
        
        // 口罩的图片和提示
        UIImageView *maskImage = [[UIImageView alloc] init];
        maskImage.frame = CGRectMake(0, 183, 60, 60);
        maskImage.image = [TBFaceSDKUtil imageNamed:@"occlusion"];
        [middleContentView addSubview:maskImage];
        UILabel *maskText = [[UILabel alloc] init];
        maskText.frame = CGRectMake(76, 192.7, 96, 18);
        maskText.text = @"避免遮挡";
        maskText.font = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
        maskText.textColor = [UIColor colorWithRed:0 / 255.0 green:0 / 255.0 blue:0 / 255.0 alpha:1 / 1.0];
        [middleContentView addSubview:maskText];
        UILabel *maskTextNext = [[UILabel alloc] init];
        maskTextNext.frame = CGRectMake(76, 220, 155, 12);
        maskTextNext.text = @"请保持您的脸部清晰无遮挡";
        maskTextNext.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        maskTextNext.textColor = [UIColor colorWithRed:153 / 255.0 green:153 / 255.0 blue:153 / 255.0 alpha:1 / 1.0];
        [middleContentView addSubview:maskTextNext];
        
        middleContentFrame.size.height = CGRectGetMaxY(maskImage.frame);
        middleContentFrame.size.width = CGRectGetMaxX(maskTextNext.frame);
        middleContentView.frame = middleContentFrame;
    }
    [self.view addSubview:middleContentView];
    
    // 调整中间部分View居中
    CGFloat bottomMinY = [self loadBottomButtons];
    CGFloat middleMaxHeight = (bottomMinY - CGRectGetMaxY(welcomeNext.frame));
    CGFloat middleViewOriginY = CGRectGetMaxY(welcomeNext.frame) + (middleMaxHeight - CGRectGetHeight(middleContentView.frame)) / 2.0f;
    middleContentFrame.origin.y = middleViewOriginY;
    middleContentFrame.origin.x = (ScreenWidth - CGRectGetWidth(middleContentFrame))/2;
    middleContentView.frame = middleContentFrame;
    
    // 设置logo，底部的位置和大小，实例化显示
    BDFaceLogoView* logoView = [[BDFaceLogoView alloc] initWithFrame:CGRectMake(0, (ScreenHeight-15-12), ScreenWidth, 12)];
    [self.view addSubview:logoView];
    
    [self initSDK];
    [self initLivenesswithList];
}

- (CGFloat)loadBottomButtons {
    CGFloat toBottom = toBottomMargin;
    CGFloat screenHeight = CGRectGetHeight(self.view.frame) - [BDFaceCalculateTool safeBottomMargin];
    CGFloat remdinderHeight = 14.0f;
    UIView *remindView = [[UIView alloc] init];
    remindView.frame = CGRectMake((self.view.frame.size.width-162)/2, screenHeight - remdinderHeight - toBottom, ScreenWidth, remdinderHeight);
    
    // 勾选人脸验证协议的button
    UIButton *checkAgreeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    checkAgreeBtn.frame = CGRectMake(-2.0f * remdinderHeight, -2.0f * remdinderHeight, remdinderHeight *5, remdinderHeight*5);
    [checkAgreeBtn setImage:[TBFaceSDKUtil imageNamed:@"icon_guide"] forState:UIControlStateNormal];
    [checkAgreeBtn addTarget:self action:@selector(checkAgreeClick:) forControlEvents:UIControlEventTouchUpInside];
    [remindView addSubview:checkAgreeBtn];
    
    UILabel *agreeLabel = [[UILabel alloc] init];
    agreeLabel.frame = CGRectMake(22, 0, 28, remdinderHeight);
    agreeLabel.text = @"同意";
    agreeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:remdinderHeight];
    agreeLabel.textColor = [UIColor colorWithRed:102 / 255.0 green:102 / 255.0 blue:102 / 255.0 alpha:1 / 1.0];
    [remindView addSubview:agreeLabel];
    
    // 人脸验证协议的label，提供了点击响应事件
    UILabel *remindLabel = [[UILabel alloc] init];
    remindLabel.frame = CGRectMake(50, 0, 112, remdinderHeight);
    remindLabel.text = @"《人脸验证协议》";
    remindLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:remdinderHeight];
    remindLabel.textColor = [UIColor colorWithRed:0 / 255.0 green:186 / 255.0 blue:242 / 255.0 alpha:1 / 1.0];
    remindLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(agreementAction:)];
    [remindLabel addGestureRecognizer:labelTapGestureRecognizer];
    [remindView addSubview:remindLabel];
    [self.view addSubview:remindView];
    
    CGFloat startBtnBottomMargin = 16.0f;
    CGFloat startBtnHeight = 52;
    
    // 开始采集的Button
    UIButton *startBtn  = [[UIButton alloc] init];
    startBtn.frame = CGRectMake((self.view.frame.size.width-266.7)/2, CGRectGetMinY(remindView.frame) - startBtnHeight - startBtnBottomMargin, 266.7, startBtnHeight);
    [startBtn setImage:[TBFaceSDKUtil imageNamed:@"btn_main_normal"] forState:UIControlStateNormal];
    [startBtn setImage:[TBFaceSDKUtil imageNamed:@"btn_main_p"] forState:UIControlStateSelected];
    UILabel *btnLabel = [[UILabel alloc] init];
    CGFloat labelHeight = 18.0f;
    CGFloat labelWidth = 108;
    CGFloat labelOriginX = (CGRectGetWidth(startBtn.frame) - labelWidth) / 2.0f;
    CGFloat labelOriginY = (CGRectGetHeight(startBtn.frame) - labelHeight) / 2.0f;
    btnLabel.frame = CGRectMake(labelOriginX, labelOriginY, labelWidth, labelHeight);
    btnLabel.text = @"开始人脸采集";
    btnLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
    btnLabel.textColor = [UIColor colorWithRed:255 / 255.0 green:255 / 255.0 blue:255 / 255.0 alpha:1 / 1.0];
    [self.view addSubview:startBtn];
    [startBtn addSubview:btnLabel];
    [startBtn addTarget:self action:@selector(startGatherAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view bringSubviewToFront:checkAgreeBtn];
    CGRect rect = [remindView convertRect:checkAgreeBtn.frame toView:self.view];
    [checkAgreeBtn removeFromSuperview];
    [self.view addSubview:checkAgreeBtn];
    checkAgreeBtn.frame = rect;
    
    return CGRectGetMinY(startBtn.frame);
}

- (void)checkAgreeClick:(UIButton *)sender {
    sender.selected ^= 1;
    // 如果再次点击选中button，提示窗口消失
    if (sender.selected) {
        [sender setImage:[TBFaceSDKUtil imageNamed:@"icon_guide_s"] forState:UIControlStateSelected];
        [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:@"checkAgreeBtn"];
    } else {
        [sender setImage:[TBFaceSDKUtil imageNamed:@"icon_guide"] forState:UIControlStateNormal];
        [[NSUserDefaults standardUserDefaults] setObject:@(NO) forKey:@"checkAgreeBtn"];
    }
}


#pragma mark - Button Action
- (IBAction)startGatherAction:(UIButton *)sender{
    // 检测是否同意，如果同意"开始人脸采集"可点击
    NSNumber *checkAgree = [[NSUserDefaults standardUserDefaults] objectForKey:@"checkAgreeBtn"];
    if (!checkAgree.boolValue){
        [BDFaceToastView showToast:self.view text:@"请先同意《人脸验证协议》"];
        return;
    }
    // 读取设置配置，启动活体检测与否
    NSNumber *LiveMode = [[NSUserDefaults standardUserDefaults] objectForKey:@"LiveMode"];
    if (LiveMode.boolValue){
        [self faceLiveness];
    } else {
        [self faceDetect];
    }
}


- (void)faceDetect {
    BDFaceDetectionViewController* dvc = [[BDFaceDetectionViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:dvc];
    navi.navigationBarHidden = true;
    navi.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:navi animated:YES completion:nil];
}

- (void)faceLiveness {
    BDFaceLivenessViewController* lvc = [[BDFaceLivenessViewController alloc] init];
    BDFaceLivingConfigModel* model = [BDFaceLivingConfigModel sharedInstance];
    [lvc livenesswithList:model.liveActionArray order:model.isByOrder numberOfLiveness:model.numOfLiveness];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:lvc];
    navi.navigationBarHidden = true;
    navi.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:navi animated:YES completion:nil];
}

- (IBAction)agreementAction:(UILabel *)sender{
    BDFaceAgreementViewController *avc = [[BDFaceAgreementViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:avc];
    navi.navigationBarHidden = true;
    navi.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:navi animated:YES completion:nil];
}

- (IBAction)settingAction:(UIButton *)sender{
    BDFaceLivingConfigViewController *lvc = [[BDFaceLivingConfigViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:lvc];
    navi.navigationBarHidden = true;
    navi.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:navi animated:YES completion:nil];
    
}

#pragma mark - UI Action
- (void) initSDK {
    
//    if (![[FaceSDKManager sharedInstance] canWork]){
//        NSLog(@"授权失败，请检测ID 和 授权文件是否可用");
//        return;
//    }

    // 初始化SDK配置参数，可使用默认配置
    // 设置最小检测人脸阈值
    [[FaceSDKManager sharedInstance] setMinFaceSize:200];
    // 设置截取人脸图片高
    [[FaceSDKManager sharedInstance] setCropFaceSizeWidth:480];
    // 设置截取人脸图片宽
    [[FaceSDKManager sharedInstance] setCropFaceSizeHeight:640];
    // 设置人脸遮挡阀值
    [[FaceSDKManager sharedInstance] setOccluThreshold:0.5];
    // 设置亮度阀值
    [[FaceSDKManager sharedInstance] setMinIllumThreshold:40];
    [[FaceSDKManager sharedInstance] setMaxIllumThreshold:240];
    // 设置图像模糊阀值
    [[FaceSDKManager sharedInstance] setBlurThreshold:0.3];
    // 设置头部姿态角度
    [[FaceSDKManager sharedInstance] setEulurAngleThrPitch:10 yaw:10 roll:10];
    // 设置人脸检测精度阀值
    [[FaceSDKManager sharedInstance] setNotFaceThreshold:0.6];
    // 设置抠图的缩放倍数
    [[FaceSDKManager sharedInstance] setCropEnlargeRatio:2.5];
    // 设置照片采集张数
    [[FaceSDKManager sharedInstance] setMaxCropImageNum:3];
    // 设置超时时间
    [[FaceSDKManager sharedInstance] setConditionTimeout:15];
    // 设置原始图缩放比例
    [[FaceSDKManager sharedInstance] setImageWithScale:0.8f];
    // 设置图片加密类型，type=0 基于base64 加密；type=1 基于百度安全算法加密
    [[FaceSDKManager sharedInstance] setImageEncrypteType:0];
    // 初始化SDK功能函数
    [[FaceSDKManager sharedInstance] initCollect];
    // 设置人脸过远框比例
    [[FaceSDKManager sharedInstance] setMinRect:0.4];
    
//    /// 设置用户设置的配置参数
    [BDFaceAdjustParamsTool setDefaultConfig];
}

- (void)initLivenesswithList {
    // 默认活体检测打开，顺序执行
    /*
     添加当前默认的动作，是否需要按照顺序，动作活体的数量（设置页面会根据这个numOfLiveness来判断选择了几个动作）
     */
    [BDFaceLivingConfigModel.sharedInstance.liveActionArray addObject:@(FaceLivenessActionTypeLiveEye)];
    [BDFaceLivingConfigModel.sharedInstance.liveActionArray addObject:@(FaceLivenessActionTypeLiveMouth)];
    [BDFaceLivingConfigModel.sharedInstance.liveActionArray addObject:@(FaceLivenessActionTypeLiveYawRight)];
//    [BDFaceLivingConfigModel.sharedInstance.liveActionArray addObject:@(FaceLivenessActionTypeLiveYawLeft)];
//    [BDFaceLivingConfigModel.sharedInstance.liveActionArray addObject:@(FaceLivenessActionTypeLivePitchUp)];
//    [BDFaceLivingConfigModel.sharedInstance.liveActionArray addObject:@(FaceLivenessActionTypeLivePitchDown)];
//    [BDFaceLivingConfigModel.sharedInstance.liveActionArray addObject:@(FaceLivenessActionTypeLiveYaw)];
    BDFaceLivingConfigModel.sharedInstance.isByOrder = NO;
    BDFaceLivingConfigModel.sharedInstance.numOfLiveness = 3;
}

- (void) destorySDK{
    // 销毁SDK功能函数
    [[FaceSDKManager sharedInstance] uninitCollect];
}

@end
