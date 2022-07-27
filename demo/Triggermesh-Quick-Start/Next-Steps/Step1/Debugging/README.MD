# STEP 1 Debugging

Learning the flow of events and how to view/inject events is key to becoming sucessful in the EDA development process.

We will start with a mock event source called `PingSource` to create dummy events for us to play with.

We will then injest the events in a event-viewer called `Sockeye` to see the events as they are sent.

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

## Working Practice 1

Try re-wring the provided `ping-to-sockeye.yaml` example, configure the `sink` proptery of the pingsource to instead point to a `Broker`. Then configure a `Trigger` to route the events to the Sockeye!

This will give you a better understanding of what a `sink` is and also how a `Broker` or `Trigger` works. If you cant figure it out, the solution lives in the `./WorkingPracticeSolution/solution.yaml` file.


## Working Practice 2

Try removing the `PingSource` object and send your own events to Sockeye.

This is accomplished in several methods, some of the most popular are:
```
curl
curl pod
...
```
## TODO add info on curl and curl pod


[]: # Language: markdown
[]: # Path: Next-Steps/Triggermesh-Components/Debugging/PingSource/Example/README.md
