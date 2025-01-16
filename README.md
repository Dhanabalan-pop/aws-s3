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
