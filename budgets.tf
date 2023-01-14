# Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

resource "aws_budgets_budget" "root_everything" {
  for_each = toset(var.budget_limit_amounts)

  name              = format("%s / ALL / Monthly %s", title(var.org_name), each.value)
  account_id        = data.aws_caller_identity.this.account_id
  budget_type       = "COST"
  limit_amount      = each.value
  limit_unit        = var.budget_limit_unit
  time_unit         = var.budget_time_unit
  time_period_start = "2022-01-01_00:00"

  cost_types {
    include_credit             = true
    include_discount           = true
    include_other_subscription = true
    include_recurring          = true
    include_refund             = true
    include_subscription       = true
    include_support            = true
    include_tax                = true
    include_upfront            = true
    use_amortized              = false
    use_blended                = false
  }

  notification {
    comparison_operator = "GREATER_THAN"
    threshold           = 80
    threshold_type      = "PERCENTAGE"
    notification_type   = "ACTUAL"
    subscriber_email_addresses = [
      local.budget_admin_email
    ]
  }

  notification {
    comparison_operator = "GREATER_THAN"
    threshold           = 70
    threshold_type      = "PERCENTAGE"
    notification_type   = "ACTUAL"
    subscriber_sns_topic_arns = [
      aws_sns_topic.budgets_alarm.arn
    ]
  }

  notification {
    comparison_operator = "GREATER_THAN"
    threshold           = 100
    threshold_type      = "PERCENTAGE"
    notification_type   = "FORECASTED"
    subscriber_email_addresses = [
      local.budget_admin_email
    ]
  }
}

resource "aws_budgets_budget" "accounts_all" {
  for_each = var.account_ids

  name              = format("%s-%s / ALL / Monthly", title(var.org_name), title(each.value))
  budget_type       = "COST"
  limit_amount      = 10
  limit_unit        = var.budget_limit_unit
  time_unit         = var.budget_time_unit
  time_period_start = "2022-01-01_00:00"

  cost_filter {
    name = "LinkedAccount"
    values = [
      each.key
    ]
  }

  cost_types {
    include_credit             = true
    include_discount           = true
    include_other_subscription = true
    include_recurring          = true
    include_refund             = true
    include_subscription       = true
    include_support            = true
    include_tax                = true
    include_upfront            = true
    use_amortized              = false
    use_blended                = false
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 80
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = var.emails
  }

  notification {
    comparison_operator = "GREATER_THAN"
    threshold           = 70
    threshold_type      = "PERCENTAGE"
    notification_type   = "ACTUAL"
    subscriber_sns_topic_arns = [
      aws_sns_topic.budgets_alarm.arn
    ]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = var.emails
  }
}
