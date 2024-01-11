layout: true
class: compact, col-2
background-image: url(../../assets/images/backgrounds/HashiCorp-Content-bkg.png)
background-size: cover
name: slide5

# Implementation

## Driver Block

```hcl
driver "terraform" {
  log         = false
  persist_log = true
  path        = "/opt/consul-nia/"

  backend "consul" {
    gzip = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.43"
    }
  }
}
```

## Task Block

```hcl
task {
  name      = "jumphost-ssh"
  description = "execute every minute using service information from nginx"
  module    = "/opt/consul-nia/cts-jumphost-module"
  providers = ["aws"]
  variable_files = ["/opt/consul-nia/cts-jumphost-module.tfvars"]

  condition "services" {
    names = "nginx"
  }

  module_input "services" {
    names = "nginx"
  }
}
```

???

Two code blocks that are from a CTS configuration file are shown.
The code block on the left is the **driver** block used to propagate
the infrastructure change.

* The terraform driver is always is required.
* By Default CTS uses Consul for the Terraform state files
* Other Terraform backends could be specified

The required providers is for the infrastructure to be changed.

* any Terraform provider can be included
* multiple providers can be included
* commonly used ones are cloud providers, networking providers and security providers

The code block on the right is the **task** block. Multiple task
blocks can be specified.

The task block is configured with a condition that must be met in order to execute that task. 
* only one condition per task
* "schedule" not dynamically triggered by changes to Consul, static triggered by a cron
* "services" most common reacts to changes in the specified service
  * can use regex, namespace, or other filters to further limit your task execution condition
* "catalog-services" only executes on first service instance registration and on last instance deregistration
  * can use similar filters as "servces"
* "consul-kv" only executes on chages to the consul KV entry

The "module_input" specifies a Consul object containing values or Metadata to be provided to the Terraform module. 

---
