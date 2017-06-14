//
//  ViewController.m
//  SceneKit-04
//
//  Created by ShiWen on 2017/6/14.
//  Copyright © 2017年 ShiWen. All rights reserved.
//

#import "ViewController.h"
#import <SceneKit/SceneKit.h>
@interface ViewController ()
@property (nonatomic,strong) SCNView *scnView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SCNScene *scene = [SCNScene scene];
    self.scnView.scene = scene;
    
    SCNBox *box1 = [SCNBox boxWithWidth:20 height:20 length:20 chamferRadius:0];
    box1.firstMaterial.diffuse.contents = [UIImage imageNamed:@"box1.jpg"];
    SCNNode *box1Node = [SCNNode node];
    box1Node.geometry = box1;
    box1Node.position = SCNVector3Make(0, -10, 0);
    [scene.rootNode addChildNode:box1Node];
    [self.view addSubview:self.scnView];
    
    SCNText *text = [SCNText textWithString:@"每次的成长，目标更进一步" extrusionDepth:3];
    text.firstMaterial.diffuse.contents = [UIColor whiteColor];
    text.font = [UIFont systemFontOfSize:5];
    SCNNode *textNode = [SCNNode nodeWithGeometry:text];
    textNode.position = SCNVector3Make(-30, 0, 0);
    [scene.rootNode addChildNode:textNode];
    
    SCNBox *box2 = [SCNBox boxWithWidth:10 height:10 length:10 chamferRadius:0];
    box2.firstMaterial.diffuse.contents = [UIImage imageNamed:@"box2.jpg"];
    SCNNode *boxNode2 =[SCNNode node];
    boxNode2.position = SCNVector3Make(0, 10, 20);
    boxNode2.geometry = box2;
    [scene.rootNode addChildNode:boxNode2];
    
    SCNLight *light = [SCNLight light];
    light.castsShadow = YES;
    light.type = SCNLightTypeOmni;
    light.color = [UIColor whiteColor];
    
    SCNNode *lightNode = [SCNNode node];
    lightNode.light  = light;
    lightNode.position = SCNVector3Make(50, 40, 50);
    [scene.rootNode addChildNode:lightNode];
    
    

    

}

-(SCNView *)scnView{
    if (!_scnView) {
        _scnView = [[SCNView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
        _scnView.center = self.view.center;
        _scnView.backgroundColor = [UIColor colorWithRed:46.0/255.0 green:135.0/255.0 blue:1 alpha:1];
        _scnView.allowsCameraControl = YES;
        _scnView.autoenablesDefaultLighting = YES;
    }
    return _scnView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
