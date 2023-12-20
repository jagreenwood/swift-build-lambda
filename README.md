# Swift Build Lambda action

This action builds an AWS Lambda written for the [Swift AWS Lambda Runtime](https://github.com/swift-server/swift-aws-lambda-runtime), then package it in a zip... ready to deploy.

## Inputs

### `executable`

**Required** The name of the Swift executable defined in the package manifest.

## Outputs

File written to `$GITHUB_WORKSPACE/lambda.zip`

## Usage

This action is tagged/versioned with a tag that matches the version of Swift used to build and test the Lambda.

| Swift Version | Action Version |
|---------------|----------------|
| 5.7           | 1.0.1, 5.7     |
| 5.8           | 5.8            |
| 5.9           | 5.9            |

For the latest:

```yaml
uses: jagreenwood/swift-build-lambda@5.9
    with:
        executable: 'ExecutableName'
```