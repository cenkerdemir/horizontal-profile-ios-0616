//
//  FISProfileViewController.m
//  horizontal-profile
//
//  Created by Cenker Demir on 6/27/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISProfileViewController.h"

@interface FISProfileViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *headlineImage;
@property (weak, nonatomic) IBOutlet UIImageView *leftProfileImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *classNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *interestingFact;
@property (weak, nonatomic) IBOutlet UITextView *profileText;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageForView;
@property (nonatomic) NSLayoutConstraint *headlineImageTopConstraint;
@property (nonatomic) NSLayoutConstraint *headlineHeightConstraint;
@property (nonatomic) NSLayoutConstraint *leftImagePortraitHeightConstraint;
@property (nonatomic) NSLayoutConstraint *leftImageLandscapeHeightConstraint;
@property (nonatomic) NSLayoutConstraint *leftImagePortraitWidthConstraint;
@property (nonatomic) NSLayoutConstraint *leftImageLandscapeWidthConstraint;
@property (nonatomic) NSLayoutConstraint *headlineImageBottomConstraint;
@property (nonatomic) UIVisualEffect *blurEffect;
@property (nonatomic) UIVisualEffectView *visualEffectView;

@end

@implementation FISProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // work on the constraings first:
    [self.view removeConstraints:self.view.constraints];
 
    [self.headlineImage removeConstraints:self.headlineImage.constraints];
    self.headlineImage.translatesAutoresizingMaskIntoConstraints = NO;
    [self.leftProfileImage removeConstraints:self.leftProfileImage.constraints];
    self.leftProfileImage.translatesAutoresizingMaskIntoConstraints = NO;
    [self.nameLabel removeConstraints:self.nameLabel.constraints];
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.classNameLabel removeConstraints:self.classNameLabel.constraints];
    self.classNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.interestingFact removeConstraints:self.interestingFact.constraints];
    self.interestingFact.translatesAutoresizingMaskIntoConstraints = NO;
    [self.profileText removeConstraints:self.profileText.constraints];
    self.profileText.translatesAutoresizingMaskIntoConstraints = NO;
    

    self.headlineImageTopConstraint = [self.headlineImage.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20];
    self.headlineImageTopConstraint.active = YES;
    self.headlineHeightConstraint = [self.headlineImage.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:0.3];
    self.headlineHeightConstraint.active = YES;
    [self.headlineImage.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10].active = YES;
    [self.headlineImage.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10].active = YES;
    self.headlineImageBottomConstraint = [self.headlineImage.bottomAnchor constraintEqualToAnchor:self.view.topAnchor constant:0];
    self.headlineImageBottomConstraint.active = NO;
    
    [self.leftProfileImage.topAnchor constraintEqualToAnchor:self.headlineImage.bottomAnchor constant:20].active = YES;
    [self.leftProfileImage.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10].active = YES;
    self.leftImagePortraitWidthConstraint = [self.leftProfileImage.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:0.5];
    self.leftImagePortraitWidthConstraint.active = YES;
    self.leftImagePortraitHeightConstraint = [self.leftProfileImage.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:0.18];
    self.leftImagePortraitHeightConstraint.active = YES;
    self.leftImageLandscapeWidthConstraint = [self.leftProfileImage.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:0.25];
    self.leftImageLandscapeWidthConstraint.active = NO;
    self.leftImageLandscapeHeightConstraint = [self.leftProfileImage.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:0.3];
    self.leftImageLandscapeHeightConstraint.active = NO;
    
    
    [self.nameLabel.topAnchor constraintEqualToAnchor:self.headlineImage.bottomAnchor constant:20].active = YES;
    [self.nameLabel.leftAnchor constraintEqualToAnchor:self.leftProfileImage.rightAnchor constant:20].active = YES;
    [self.classNameLabel.topAnchor constraintEqualToAnchor:self.nameLabel.bottomAnchor constant:25].active = YES;
    [self.classNameLabel.leftAnchor constraintEqualToAnchor:self.leftProfileImage.rightAnchor constant:20].active = YES;
    [self.interestingFact.topAnchor constraintEqualToAnchor:self.classNameLabel.bottomAnchor constant:25].active = YES;
    [self.interestingFact.leftAnchor constraintEqualToAnchor:self.leftProfileImage.rightAnchor constant:20].active = YES;
    
    [self.profileText.topAnchor constraintEqualToAnchor:self.leftProfileImage.bottomAnchor constant:20].active = YES;
    [self.profileText.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:10].active = YES;
    [self.profileText.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10].active = YES;
    [self.profileText.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-20].active = YES;
    
    // give everything values:
    self.headlineImage.image = [UIImage imageNamed:@"bentley.jpg"];
    self.leftProfileImage.image = [UIImage imageNamed:@"bentley.jpg"];
    self.nameLabel.text = @"Name: Bentley";
    self.nameLabel.textColor = [UIColor whiteColor];
    self.classNameLabel.text = @"Class: Luxury";
    self.classNameLabel.textColor = [UIColor whiteColor];
    self.interestingFact.text = @"A VW Brand";
    self.interestingFact.textColor = [UIColor whiteColor];
    self.profileText.text = @"Bentley Motors Limited (/ˈbɛntli/) is a British registered company that designs, develops, and manufactures Bentley luxury motorcars which are largely hand-built. It is a subsidiary of Volkswagen AG.[12] Now based in Crewe, England, Bentley Motors Limited was founded by W. O. Bentley on 18 January 1919 in Cricklewood, North London.\nBentley cars are sold via franchised dealers worldwide, and as of November 2012, China was the largest market.Most Bentley cars are assembled at the Crewe factory, but a small number of Continental Flying Spurs are assembled at the factory in Dresden, Germany.[14] and bodies for the Continental are produced in Zwickau, Germany.";
    self.profileText.textColor = [UIColor whiteColor];
    
//    self.backgroundImageForView.image = [UIImage imageNamed:@"bentley.jpg"];
//    self.blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    self.visualEffectView = [[UIVisualEffectView alloc] initWithEffect:self.blurEffect];
//    self.visualEffectView.frame = self.view.frame;
//    self.visualEffectView.alpha = 0.9;
//    [self.backgroundImageForView addSubview:self.visualEffectView];
}


- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {

    
    if (size.width > size.height) {
//      NSLog(@"\n\nThis should be LANDSCAPE\n\n");
//      NSLog(@"\n\n\nwidth: %f, height %f\n\n\n", size.width, size.height);
        if (size.width > 700) {
            // then it is an iphone6 plus - or an ipad...
            self.headlineImageBottomConstraint.active = NO;
            self.headlineImageTopConstraint.active = YES;
            self.headlineHeightConstraint.active = YES;
            self.leftImagePortraitWidthConstraint.active = NO;
            self.leftImagePortraitHeightConstraint.active = NO;
            self.leftImageLandscapeWidthConstraint.active = YES;
            self.leftImageLandscapeHeightConstraint.active = YES;
            
        }
        else {
            self.headlineImageTopConstraint.active = NO;
            self.headlineHeightConstraint.active = NO;
            self.leftImagePortraitWidthConstraint.active = NO;
            self.leftImagePortraitHeightConstraint.active = NO;
            self.headlineImageBottomConstraint.active = YES;
            self.leftImageLandscapeWidthConstraint.active = YES;
            self.leftImageLandscapeHeightConstraint.active = YES;
        }
        //self.visualEffectView.frame = self.view.frame;
        //self.visualEffectView.alpha = 0.9;
        //[self.backgroundImageForView addSubview:self.visualEffectView];
    }
    else {
        self.headlineImageBottomConstraint.active = NO;
        self.leftImageLandscapeWidthConstraint.active = NO;
        self.leftImageLandscapeHeightConstraint.active = NO;
        self.headlineImageTopConstraint.active = YES;
        self.headlineHeightConstraint.active = YES;
        self.leftImagePortraitWidthConstraint.active = YES;
        self.leftImagePortraitHeightConstraint.active = YES;
        
        //self.visualEffectView.frame = self.view.frame;
        //self.visualEffectView.alpha = 0.9;
        //[self.backgroundImageForView addSubview:self.visualEffectView];
        
//      NSLog(@"\n\nThis should be PORTRAIT\n\n");
//      NSLog(@"\n\n\nwidth: %f, height %f\n\n\n", size.width, size.height);
        // [self.headlineImage.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20].active = YES;
    }


}


//-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
//    [super traitCollectionDidChange:previousTraitCollection];
//    
//    if (self.traitCollection.verticalSizeClass != previousTraitCollection.verticalSizeClass && self.traitCollection.horizontalSizeClass != previousTraitCollection.horizontalSizeClass) {
//        if ([[UIScreen mainScreen] bounds].size.width > [[UIScreen mainScreen] bounds].size.height) {
//            [self.headlineImage removeConstraint:self.headlineImageTopConstraint];
//            [self.headlineImage removeConstraint:self.headlineHeightConstraint];
//            [self.headlineImage.bottomAnchor constraintEqualToAnchor:self.view.topAnchor constant:0].active = YES;
//            //self.headlineImage.hidden = YES;
//        }
//        else {
//           // [self.headlineImage.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20].active = YES;
//        }
//    }
//}

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
