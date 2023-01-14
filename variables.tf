

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

#############################################################################
# Provider

#############################################################################
# Billing

variable "org_name" {
  type        = string
  description = "The organization name"
}

variable "account_ids" {
  type        = map(number)
  description = "AWS Account IDs"
  default     = {}
}

variable "emails" {
  type        = list(string)
  description = "List of emails for alerting"
}

variable "budget_limit_amounts" {
  description = "The unit of measurement used for the budget forecast, actual spend, or budget threshold."
  type        = list(string)
  default = [
    5,
    25,
    50,
    100,
    200,
    300,
    400,
    500
  ]
}

variable "budget_limit_unit" {
  description = "The unit of measurement used for the budget forecast, actual spend, or budget threshold."
  type        = string
  default     = "USD"
}

variable "budget_time_unit" {
  description = "The length of time until a budget resets the actual and forecasted spend. Valid values: `MONTHLY`, `QUARTERLY`, `ANNUALLY`."
  type        = string
  default     = "MONTHLY"
}

variable "sns_topic_name" {
  type        = string
  description = "SNS Topic name for budget alerts"
}

variable "tags" {
  type        = map(string)
  description = "Tags for Billing"
  default = {
    "made-by" = "terraform"
  }
}
