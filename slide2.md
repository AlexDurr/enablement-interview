layout: true
class: compact
background-image: url(../../assets/images/backgrounds/HashiCorp-Content-bkg.png)
background-size: cover
name: slide2

# Consul-Terraform-Sync (CTS)

## Why is it needed?

???
Why is Consul-Terraform-Sync needed?

* Enterprise network and security Changes often require manual intervention
  * Frequently ticket based, requiring separate teams
* Can take days or weeks to implement
* Manual processes increase chances of misconfiguration
  * Humans are error prone, we all make mistakes (miskeys, copy errors, misspellings, etc)
* Slows down pace of innovation
  * The continuos Delivery portion of a modern CI/CD pipeline should not impede the progress of innovation
* Network and security teams cannot handle the scale and speed of changes
  * Modern cloud or microservices deployments may have hundreds of scale events a day
  * Legacy ticket based systems can not keep up
* Costs due to inefficient use of human and computer resources
  * Not being able to scale resources effectively costs money (especially in the cloud)
  * Having well trained well paid engineers manually update firewalls or complete other easily automated functions is a waste of time and money.

--

* Enterprise network and security Changes often require manual intervention
--

* Can take days or weeks to implement
--

* Manual processes increase chances of misconfiguration
--

* Slows down pace of innovation
--

* Network and security teams cannot handle the scale and speed of changes
--

* Costs due to inefficient use of human and computer resources

???

---
