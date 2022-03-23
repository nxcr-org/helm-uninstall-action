# Helm Uninstall Action

This action allows you helm uninstall releases.

## Parameters
| Parameter          | Type     | Default  | Description                                                                                                                |
|--------------------|----------|----------|----------------------------------------------------------------------------------------------------------------------------|
| `aws_access_key_id`       | `string` |          | The AWS access key id                                                                                                            |
| `aws_secret_access_key`       | `string` |          | The AWS secret access key                                                                                                            |
| `aws_region`       | `string` | us-west-2      | Your AWS region                                                                                                            |
| `cluster_name`     | `string` |          | EKS cluster name                                                                                                           |
| `namespace`        | `string` |          | Kubernetes namespace to use                         |
| `timeout`          | `string` | `2m0s`   | Timeout for the job                                                   |

## Usage

```yaml
jobs:
  helm-uninstall:
    runs-on: ubuntu-latest
    steps:
    - uses: nxcr-org/helm-uninstall-action@main
      with:
        aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws_secret_access_key: ${{ secrets.AWS_SECRET_KEY_ID }}
        cluster_name: qa-eks
        namespace: default
        name: <name_of_your_release>
```

## License
The MIT License (MIT)
