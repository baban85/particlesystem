//
//  ViewController.m
//  ParticleSystem
//
//  Created by Ba Ban on 18/11/2023.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup background image
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"snow_bg"]];
    bgView.frame = self.view.bounds;
    [self.view addSubview:bgView];
    
    // Create the emitter layer
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    
    // Set the emitter's position
    snowEmitter.emitterPosition = CGPointMake(self.view.bounds.size.width / 2, -30);
    
    // Configure the emitter
    snowEmitter.emitterShape = kCAEmitterLayerLine;
    snowEmitter.emitterSize = CGSizeMake(self.view.bounds.size.width, 2.0);
    
    CAEmitterCell *snowflake1 = [self emitterCell:@"snowflake_t"];
    CAEmitterCell *snowflake2 = [self emitterCell:@"snowflake_t2"];
    CAEmitterCell *snowflake3 = [self emitterCell:@"snowflake_t3"];
    CAEmitterCell *snowflake4 = [self emitterCell:@"snowflake2"];
    CAEmitterCell *snowflake5 = [self emitterCell:@"snowflake3"];
    
    // Add the snowflake particle to the emitter
    snowEmitter.emitterCells = @[snowflake4, snowflake5];
    
    // Add the emitter layer to the view's layer
    [self.view.layer addSublayer:snowEmitter];
}

- (CAEmitterCell *)emitterCell:(NSString *)name {
    // Create a snowflake particle
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    snowflake.contents = (id)[[UIImage imageNamed:name] CGImage];
    
    snowflake.birthRate = 5.0;
    snowflake.lifetime = 36.0;
    snowflake.velocity = 10.0;
    snowflake.velocityRange = 10.0;
    snowflake.yAcceleration = 2.0;
    snowflake.emissionRange = M_PI_4;
    
    return snowflake;
}


@end
