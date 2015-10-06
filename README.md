# flint-vault
Read Vault Secrets from Flintbits
#### What is Flint IT Automation Patform?
Flint is a lean IT Process Automation & Orchestration Platform for IT infrastructure and applications. It empowers teams to leverage existing scripting (Ruby or Groovy) skills to develop powerful workflows and processes which can be published as microservices.

Flint helps in automation of routine IT tasks & activities which saves time and cost thus allowing the team to focus on strategic initiatives and innovation. Know more: http://www.getflint.io

#### What is Vault?
Vault is a tool for securely accessing secrets. A secret is anything that you want to tightly control access to, such as API keys, passwords, certificates, and more. Vault provides a unified interface to any secret, while providing tight access control and recording a detailed audit log.
Know more: https://vaultproject.io

## Add new Flintbox from Flint Console
* Go to flintbox
* Click on Add Flintbox
* set Git url of this repo 
* Click add
* Enable the flintbox

## Global Configuration in flint

#### Name: flint-vault
#### Config JSON
```json
{
    "token": "afd14490-7230-e724-84d3-678863bc37ac",
    "url": "http://127.0.0.1:8200",
    "http_connector": "http"
}
```
| Name | Description          |
| ------------- | ----------- |
| token      | Hashicorp Vault User Token|
| url     | Hashicorp Vault Server URL with port|
| http_connector| Name of HTTP connector which is enabeled on Flint|

## How to use it from Flintbits
#### Ruby
```ruby 
# call the flintbit
@result = @call.bit("flint-vault:read.rb").set("key","name_of_key_to_read").sync

# Alternatively token can also be given at runtime
@result1 = @call.bit("flint-vault:read.rb")
             .set("key","name_of_key_to_read")
             .set("token","afd14490-7230-e724-84d3-678863bc37ac")
             .sync

# read the value
value = @result.get("value")

# read the value
value1 = @result1.get("value")
```



