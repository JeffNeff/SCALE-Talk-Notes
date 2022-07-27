# Example Usage of Pingsource

Here we have an Example of a Pingsource -> Sockeye. Just a simple example demonstrating event sending and receiving.

```
kubectl apply -f ping-sockeye.yaml
kubectl get ksvc
```

Then open the exposed Sockeye URL.


Or you can check the logs of Sockeye:

```
kubectl logs <sockeye-pod-name> user-container
```

## Working Practice

Try re-wring the provided `ping-to-sockeye.yaml` example, configure the `sink` proptery of the pingsource to instead point to a `Broker`. Then configure a `Trigger` to route the events to the Sockeye!

This will give you a better understanding of what a `sink` is and also how a `Broker` or `Trigger` works. If you cant figure it out, the solution lives in the `./WorkingPracticeSolution/solution.yaml` file.


[]: # Language: markdown
[]: # Path: Next-Steps/Triggermesh-Components/Debugging/PingSource/Example/README.md
