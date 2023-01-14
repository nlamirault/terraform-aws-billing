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

# tfsec:ignore:aws-sns-enable-topic-encryption
resource "aws_sns_topic" "budgets_alarm" {
  name = var.sns_topic_name

  tags = merge({
    "Name" = var.sns_topic_name,
    },
    var.tags
  )
}

resource "aws_sns_topic_policy" "account_budgets_alarm_policy" {
  arn    = aws_sns_topic.budgets_alarm.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}
