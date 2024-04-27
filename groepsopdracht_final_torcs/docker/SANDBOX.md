# Operating Systems

## OS Sandbox

## [Installation instructions](os_practice_environment/installation/INSTALL.md)

## Linux Sandbox Environment 

<p>Use the following scripts to create, start, stop and destroy the Linux Sandbox Environment</p>

<ul>

<li>

**Create (new) Sandbox**

This script will create a Docker Image for your Linux Sandbox Environment customized with your user credentials. 

```bash
python create_sandbox.py 
```
</li>
<li>

**(Re)Start Sandbox**

This script will start a container for your Linux Sandbox Environment based on the Image that was created during the previous step. It can also be used to restart a stopped container (step 3).
 
```bash
python start_sandbox.py 
```

</li>
<li>

**Stop Sandbox**

This script will shutdown your Linux Sandbox Environment by stopping the container that was created during the previous step.

```bash
python stop_sandbox.py 
```

</li>
<li>

**Destroy Sandbox**

This script will shutdown your Linux Sandbox Environment by removing the container that was stopped in the previous step. Instead of destroying an existing Environemnt and creating a new one, you can restart the Environment by running stop_sandbox.py and start_sandbox.py respectively. 

```bash
python destroy_sandbox.py 
```

</li>

</ul>

---

## References and Online Resources

<ol>

<li>

[Advanced Bash-Scripting Guide](https://www.linuxtopia.org/online_books/advanced_bash_scripting_guide/index.html)
</li>
<li>

[Docker Toolbox Windows](https://docs.bitnami.com/containers/how-to/install-docker-in-windows/enable-hardware-assisted-virtualization)
</li>
<li>

[Docker Toolbox MacOS](https://vegastack.com/tutorials/how-to-install-docker-toolbox-on-macos/)
</li>
<li>

[Docker SDK for Python](https://docker-py.readthedocs.io/en/stable/)
</li>
<li>

[The subprocess Module: Wrapping Programs With Python](https://realpython.com/python-subprocess/)
</li>

</ol>