AWS::CloudFormation::Macro:

Enables custom transformations using AWS Lambda functions.
Provides the flexibility to implement complex logic to transform CloudFormation templates before they are processed.
AWS::CloudFormation::Transform:

Applies predefined transformations to simplify templates.
Commonly used for specific AWS use cases like AWS Serverless Application Model (SAM).

Use update-stack 
if you need more fine-grained control over the stack update process and you're comfortable manually specifying parameters and template details.
Use deploy 
if you want a simplified command that automates much of the stack creation and update process, making it ideal for CI/CD workflows or simpler deployment scenarios. It is the recommended command in most cases, especially when working with Lambda and other resources that require handling artifacts or packaged template
CreationPolicy 
```Resources:
  MyEC2Instance:
    Type: 'AWS::EC2::Instance'
    Properties:
      ImageId: ami-12345678
      InstanceType: t2.micro
    CreationPolicy:
      ResourceSignal:
        Count: '1'  # Number of signals to wait for
        Timeout: 'PT15M'  # Timeout duration
```

Ensures that resources are properly created and initialized before the stack creation completes.

UpdatePolicy
```
Resources:
  MyAutoScalingGroup:
    Type: 'AWS::AutoScaling::AutoScalingGroup'
    Properties:
      MinSize: '1'
      MaxSize: '3'
      DesiredCapacity: '2'
      LaunchConfigurationName: !Ref MyLaunchConfig
    UpdatePolicy:
      AutoScalingRollingUpdate:
        MinInstancesInService: '1'  # Minimum number of instances that must be running during the update
        MaxBatchSize: '1'  # Maximum number of instances to update at once
        PauseTime: 'PT5M'  # Wait for 5 minutes before continuing to next batch
```

Ensures that updates to resources are handled properly during stack updates, often used with Auto Scaling groups, EC2 instances, and other resources that need to be updated in a controlled way.
