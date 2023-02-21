#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "FaceParameterConfig.h"
#import "BDFaceLog.h"
#import "BDFaceVideoCaptureDevice.h"
#import "BDFaceLivingConfigModel.h"
#import "BDFaceDevice.h"
#import "BDFaceImageUtils.h"
#import "BDFaceAdjustParamsController.h"
#import "BDFaceAdjustParamsRootController.h"
#import "BDFaceAlertController.h"
#import "BDFaceSelectConfigController.h"
#import "BDFaceAdjustParams.h"
#import "BDFaceAdjustParamsConstants.h"
#import "BDFaceAdjustParamsFileManager.h"
#import "BDFaceAdjustParamsItem.h"
#import "BDFaceAdjustParamsModel.h"
#import "BDFaceSelectConfigModel.h"
#import "BDFaceSelectItem.h"
#import "BDFaceAdjustParamsCell.h"
#import "BDFaceAdjustParamsRootCell.h"
#import "BDFaceSelectConfigCell.h"
#import "BDFaceSelectRadio.h"
#import "BDFaceCalculateTool.h"
#import "BDFaceToastView.h"
#import "UIColor+BDFaceColorUtils.h"
#import "BDFaceAgreementViewController.h"
#import "BDFaceBaseViewController.h"
#import "BDFaceDetectionViewController.h"
#import "BDFaceLivenessViewController.h"
#import "BDFaceLivingConfigViewController.h"
#import "BDFaceSuccessViewController.h"
#import "BDFaceAdjustParamsTool.h"
#import "TBFaceSDKUtil.h"
#import "BDFaceCircleView.h"
#import "BDFaceCycleProgressView.h"
#import "BDFaceImageShow.h"
#import "BDFaceLogoView.h"
#import "BDFaceRemindAnimationView.h"
#import "BDFaceRemindView.h"
#import "NSBundle+NSBundleAdd.h"
#import "NSObject+PAITSwizzle.h"

FOUNDATION_EXPORT double TBFaceSDKVersionNumber;
FOUNDATION_EXPORT const unsigned char TBFaceSDKVersionString[];

