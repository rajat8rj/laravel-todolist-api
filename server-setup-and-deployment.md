
## Server Setup Instructions
Make sure you have following installed:
- ansible

### 1. setup multipass servers

Install multipass
```bash
snap install multipass
```

### 2. Create servers

Navigate to the ansible folder 

Run the vm.yml playbook
```bash
ansible-playbook vm-main.yml
```
This will do the following:
- The file contains an Ansible playbook.
- The first task reads the contents of the “vm.yml” file and stores the key-value pairs in a variable named “vms”.
- The next task includes the tasks from the file “create-keys-and-cloudinit.yml”. This task creates the SSH keys and the cloud-init file, as the filename indicates. Note that this task-file is only included once per execution of the playbook.
- The final task includes the tasks from the file “create-new-vm-tasks.yml”. This task loops over the items in the vms variable setting the vmname variable to the key and the vmcreationparams variable to the value of each item. For each item in the vms variable, the “create-new-vm-tasks.yml” file is included, which each time creates one virtual machine.


### 3. Setup servers

Navigate to ansible_setup folder
```bash
ansible-playbook -i inventory.ini server-conf.yml
```
This will do the following:
- The file contains an Ansible playbook.
- The inventory.ini file contains the information of servers created in earlier step and location tho the ssh key for access to the servers.
- The playbook installs php, nginx, mysql and redis to respective servers. 



## Deployment Instructions
Make sure you have following on app-php sever (created earlier) installed:
- ansible

### 1. Setup self-hosted github runner.

Navigate to home directory for vmadmin user; download, extract and run eun.sh file mentioned per github self hosted runner setup doc.

### 2. Set repository varibles for deployment

```bash
DEPLOY_PATH: path to the project folder

DEPLOY_SERVER: ip of the app-php server

DEPLOY_USER: ssh user to the server

SSH_PRIVATE_KEY: ssh user private key
```

### 3. Deployment file

Navigate to /github/workflows to find the deployment file that initiates a runner for deployment whenever a new change is pushed to the main branch and deployment server is active. 
