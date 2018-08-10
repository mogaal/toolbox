# Alpine docker container to troubleshoot infrastructure issues

This is tiny container (Alpine) used to debug or troubleshoot infrastructure issues within kubewrnetes clusters. It include tools like MySQL and postgreSQL clients to make database connections.

## How to run it inside a Kubernetes Cluster?

```bash
$ kubectl run my-toolbox --rm -i --tty --image mogaal/toolbox -- bash
root@my-toolbox-f6f884878-7vqj8:~# nc -v 100.67.251.4 80
wp-wp-ume.wp-ume.svc.cluster.local [100.67.251.4] 80 (http) open
^C
root@my-toolbox-f6f884878-7vqj8:~# exit
Session ended, resume using 'kubectl attach my-toolbox-f6f884878-7vqj8 -c my-toolbox -i -t' command when the pod is running
deployment.apps "my-toolbox" deleted
$ 
```

If you want to run it within determined namespace just add `-n $namespace` to the `kubectl` command.

## What if I want more tools/apps inside the container?

Just copy-paste/fork this repo and add whatever you want inside the Dockerfile.