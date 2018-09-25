# How to create swarm worker script 

#### Step 0: Create build env
```
make create-env
```
#### Step 1: Modify module config
* Edit `.modules/swarm_worker/config`
  * `ssh dorry@<managerIP> docker swarm join-token worker` 
  * Modify the `TOKEN`
* Edit `.modules/download_conf_m/config`
* Edit `.modules/dns_proxy/config`

#### Step 2: Create swarm worker script
```
make create-worker-sh
```
where `cbin/worker.sh` is created

#### Step 3: Paste into Linode and Vultr as stack script 
* [Linode stack script](https://manager.linode.com/stackscripts)
  * Edit stack script using `cbin/worker.sh`
  * Rebuild machine
* [Vultr stack script]()

#### Step 4: Check the deployment result
* [Linode](https://cloud.linode.com/dashboard)
  * Power On 
  * Launch Console
  * Interactive configuration
* [Vultr]()


