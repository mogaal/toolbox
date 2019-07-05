# Alpine docker container to troubleshoot infrastructure issues

This is tiny container (Alpine) used to debug or troubleshoot infrastructure issues within kubewrnetes clusters. It include tools like MySQL and postgreSQL clients to make database connections.

## How to run it inside a Kubernetes Cluster?

```bash
$ kubectl run toolbox --generator=run-pod/v1 --rm -i --tty --image mogaal/toolbox
root@my-toolbox-f6f884878-7vqj8:~# nc -v 100.67.251.4 80
wp-wp-ume.wp-ume.svc.cluster.local [100.67.251.4] 80 (http) open
^C
root@my-toolbox-f6f884878-7vqj8:~# exit
Session ended, resume using 'kubectl attach my-toolbox-f6f884878-7vqj8 -c my-toolbox -i -t' command when the pod is running
deployment.apps "my-toolbox" deleted
$ 
```

If you want to run it within determined namespace just add `-n $namespace` to the `kubectl` command.

## How to run it inside specific node

```bash
$ kubectl run toolbox --generator=run-pod/v1 --rm -i --tty --image mogaal/toolbox --overrides='{ "apiVersion": "v1", "spec": { "nodeName": "ip-10-16-4-218.eu-west-1.compute.internal" } }'
If you don't see a command prompt, try pressing enter.
bash-4.4# echo "Hola, from toolbox"
bash-4.4# exit
exit
Session ended, resume using 'kubectl attach toolbox -c toolbox -i -t' command when the pod is running
pod "toolbox" deleted

```

## What if I want more tools/apps inside the container?

Just copy-paste/fork this repo and add whatever you want inside the Dockerfile.
