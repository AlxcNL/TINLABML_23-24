# TINLABML_23-24 Vagrant / VirtualBox Environment

<p>

For the TINLAB TORCS (group)assignment, a preinstalled Torcs Environment is as a [Vagrant Cloud VirtualBox Image](https://app.vagrantup.com/AlxcNL/boxes/torcs-server/versions/0.3).
<br>
<note>This environment does NOT support arm64 / aarch64 architectures</note>
<br>
Apple Silicon processors users are advised to use the Docker Webtop Environment.
</p>

## Setup

<ul>

<li>

Install [VirtualBox](https://www.virtualbox.org/)

</li>

<li>

Install [VirtualBox 7.0.8 Oracle VM VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads?ref=vnxi.net)

</li>

<li>

Install [Vagrant](https://ww.vagrantup.com/)

</li>

</ul>

## Usage

<ol>

<li>

**Spin up a Virtual Ubuntu Desktop Environment**

<p>In <i>opdrachten/groepsopdracht_final_torcs</i> run 

```sh
./start_vbox.sh
```
</p>

</li>

<li>

**Login**

<p>

Enter the Ubuntu Virtual Machine (VM) and login with password <i>vagrant</i><br>
To <strong>escape</strong> from the VM press 
<ul>

<li>Right Control Key (Windows)</li>

<li>Left Control Key (MacOS)</li>

</ul>

</p>

</li>

<li>

**Start Torcs Server**

<p>Open a terminal and enter

```sh
/vagrant/start_server.sh
```

In the Torcs GUI select 
<i>Race</i> -> <i>Quick Race</i> -> <i>New Race</i>

</p>

</li>

<li>

**Test with Torcs Client**

<p>Open a second terminal(tab) and enter

```sh
/vagrant/start_client.sh
```

you will now see an autonomous racing car in the Torcs GUI.

</li>

</ol>

</li>

</ul>
