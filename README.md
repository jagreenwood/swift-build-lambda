# Swift Build Lambda action

This action builds an AWS Lambda written for the [Swift AWS Lambda Runtime](https://github.com/swift-server/swift-aws-lambda-runtime), then package it in a zip... ready to deploy.

## Inputs

### `executable`

**Required** The name of the Swift executable defined in the package manifest.

## Outputs

File written to `output/lambda.zip`

## Usage

```yaml
uses: jagreenwood/swift-build-lambda@1.0.0
    with:
        executable: 'ExecutableName'
```