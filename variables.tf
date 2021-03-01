/**
 * Copyright 2021 Mantel Group Pty Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

# Global options
variable "ci_token" {
  type        = string
  description = "The runner registration token obtained from GitLab."
}
variable "gcp_project" {
  type        = string
  description = "The GCP project to deploy the runner into."
}
variable "gcp_zone" {
  type        = string
  description = "The GCP zone to deploy the runner into."
}
variable "gitlab_url" {
  type        = string
  description = "The URL of the GitLab server hosting the projects to be built."
}
variable "gcp_resource_prefix" {
  type    = string
  default = "gitlab-ci"
}

# Runner options
variable "ci_runner_gitlab_name" {
  type        = string
  default     = ""
  description = "The name of the runner to be identified inside gitlab.  If empty the value gcp-${var.gcp_project} will be used."
}
variable "ci_runner_instance_type" {
  type        = string
  default     = "f1-micro"
  description = <<EOF
The instance type used for the runner. This shouldn't need to be changed because the builds
themselves run on separate worker instances.
EOF
}
variable "ci_runner_tags" {
    type        = string
    default     = ""
    description = "Gitlab Tags for the new runner"
}
variable "ci_runner_untagged" {
    type        = string
    default     = "true"
    description = "also run jobs without any tags"
}

# Worker options
variable "ci_concurrency" {
  type        = number
  default     = 1
  description = "The maximum number of worker instances to create."
}
variable "ci_worker_disk_size" {
  type    = string
  default = "10"
}
variable "ci_worker_idle_time" {
  type        = number
  default     = 300
  description = "The maximum idle time for workers before they are shutdown."
}
variable "ci_worker_instance_tags" {
  type    = string
  default = "gitlab-ci-worker"
}
variable "ci_worker_instance_type" {
  type        = string
  default     = "n1-standard-1"
  description = "The worker instance size.  This can be adjusted to meet the demands of builds jobs."
}
variable "docker_privileged" {
  type    = string
  default = "false"
}
