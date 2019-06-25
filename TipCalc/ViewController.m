//
//  ViewController.m
//  TipCalc
//
//  Created by sbernal0115 on 6/25/19.
//  Copyright © 2019 sbernal0115. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *mealBillField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing:YES];
    
}

- (IBAction)onEdit:(id)sender {
    
    NSArray *percentages = @[@(.15),@(.2),@(.22)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double bill = [self.mealBillField.text doubleValue];
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f",tip];
    
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f",total];
    

}
- (IBAction)onEditingBegin:(id)sender {
    
    
    [UIView animateWithDuration:0.2 animations:^{
    
        self.mealBillField.frame = CGRectMake(self.mealBillField.frame.origin.x,self.mealBillField.frame.origin.y + 30, self.mealBillField.frame.size.width,self.mealBillField.frame.size.height);
        
        self.tipLabel.alpha = 0;
        
    }];
    
    
    [UIView animateWithDuration:1  animations:^{
        self.tipLabel.alpha = 0;
    }];
    
    
    
    
}
- (IBAction)onEditingEnd:(id)sender {
    
    CGRect newFrame = self.mealBillField.frame;
    
    newFrame.origin.y -= 30;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.mealBillField.frame = newFrame;
        
            
    }];
    
    [UIView animateWithDuration:1  animations:^{
        self.tipLabel.alpha = 1;
    }];
    
    
}


@end
