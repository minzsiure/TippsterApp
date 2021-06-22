//
//  TipViewController.m
//  TippyAppEva
//
//  Created by Eva Xie on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onTap:(id)sender {
    NSLog(@"hello");
    NSLog(@"label dimen, %f", _labelsContainerView.frame.origin.y);
    NSLog(@"total dimen, %f", _totalLabel.frame.origin.y);
    
    [self.view endEditing:true];
}

- (IBAction)UpdateLabels:(id)sender {
    if (self.billField.text.length == 0) {
        [self hideLabels];
    }
    
    else {
        [self showLabels];
    }
    
    //created an array
    double tipPercentages[] = {0.15, 0.2, 0.25};
    
//    depends on the tab index, give diff percentage value
    double tipPercentage = tipPercentages [self.tipPercentageControl.selectedSegmentIndex];
    
    double bill = [self.billField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

- (void)hideLabels {
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billField.frame;
        billFrame.origin.y = 350;
        
        self.billField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y = 266;
        
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 0;
    }];
}

- (void)showLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billField.frame;
        billFrame.origin.y = 123;
        
        self.billField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y = billFrame.origin.y + 143;
        
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 1;
    }];
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
