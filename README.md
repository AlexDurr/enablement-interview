# Consul-Terraform-Sync Presentation

Repo to facilitate a presentation on Consul-Terraform-Sync (CTS) for the Hashicorp Enablement Engineer position technical assessment. 

This presentation is designed for an audience that is familiar with both Consul and Terraform.

<center>
<img width=400px src="assets/logos/CTS_horizontal2.png" />
</center>

The presentation should give the audience an overview of what problems CTS solves, how it works, a brief overview of implementation, and some links for further information. 

## setup.sh - about

`setup.sh` is a bash script that:

- Sets an environment variable with your github username in /root/.bash_profile
- Writes the following code to a file called `config.hcl`

```hcl
cluster_addr  = "https://<HOSTNAME>:8201"
api_addr      = "https://<HOSTNAME>:8200"
disable_mlock = true
```

- Replaces `<HOSTNAME>` value in config.hcl

### setup.sh - usage

`setup.sh` accepts inputs for GitHub username "-u" and Vault server hostname "-v". A help message can be accessed with "-h"

EX:

```bash
./setup.sh -u superman -v fake-hashicorp.com
```

If no inputs are provided on the command line, default values will be used.

The script writes to the root directory and must be run with sufficient permissions

<br>

## Additional Information

### Markdown

The presentation is using [remarkjs](https://remarkjs.com/) and the [story](https://github.com/xaprb/story/tree/master) template for display. Story's framework provides predefined layouts for a simple modular way to create custom presentations.

### Local Presenting

You should be able to present the slides by spinning up a local webserver. There are several options, a few are listed below.

**Live Server in VSCode** <br>
Download the [plugin](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) It is a supported VSC plugin so you can run it in VSC directly.

**LiveReload**

`pip3 install livereload` or `brew install livereload`

Run `livereload . ` in the repository directory. Navigate to the URL provided in the output

**Simple HTTP Server** <br>
From the command line, navigate to the repository directory and run

```bash
python3 -m http.server 9000
```

Navigate to localhost:9000

### Shortcut Keys

The following Chrome commands may come in handy:

- SHIFT + C to make a copy of the window
- SHIFT + P to bring up the 'presenter' view if you would like to have notes
