# Billing components into Amazon AWS

## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_budgets_budget.accounts_all](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |
| [aws_budgets_budget.root_everything](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |
| [aws_sns_topic.budgets_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.account_budgets_alarm_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_caller_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.sns_topic_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_ids"></a> [account\_ids](#input\_account\_ids) | AWS Account IDs | `map(number)` | `{}` | no |
| <a name="input_budget_limit_amounts"></a> [budget\_limit\_amounts](#input\_budget\_limit\_amounts) | The unit of measurement used for the budget forecast, actual spend, or budget threshold. | `list(string)` | <pre>[<br>  5,<br>  25,<br>  50,<br>  100,<br>  200,<br>  300,<br>  400,<br>  500<br>]</pre> | no |
| <a name="input_budget_limit_unit"></a> [budget\_limit\_unit](#input\_budget\_limit\_unit) | The unit of measurement used for the budget forecast, actual spend, or budget threshold. | `string` | `"USD"` | no |
| <a name="input_budget_time_unit"></a> [budget\_time\_unit](#input\_budget\_time\_unit) | The length of time until a budget resets the actual and forecasted spend. Valid values: `MONTHLY`, `QUARTERLY`, `ANNUALLY`. | `string` | `"MONTHLY"` | no |
| <a name="input_emails"></a> [emails](#input\_emails) | List of emails for alerting | `list(string)` | n/a | yes |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | The organization name | `string` | n/a | yes |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | SNS Topic name for budget alerts | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for Billing | `map(string)` | <pre>{<br>  "made-by": "terraform"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
