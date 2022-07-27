# Step 2 Using Event Sources

Now that we understand the basic flow of events, lets use one of the Triggermesh event sources to send some real events to Sockeye.

# Example Usage of Event Sources

For this example we will use the Triggermesh `AWSSQSSource` event source. But you can replace it with any source you want :).


After replacing the properties wrapped in `<>` brackets in the provided `./sqs-to-sockeye.yaml` manifest with your own values, apply the manifest to your cluster.

```
kubectl apply -f sqs-to-sockeye.yaml
kubectl get ksvc
```

Then open the exposed Sockeye URL.

Post a message to your SQS queue and you should now see the event appear in Sockeye!


## Working Practice

Try re-wring the provided `./sqs-to-sockeye.yaml.yaml` example, configure the `sink` proptery of the SQS Source to instead point to a `Broker`. Then configure a `Trigger` to route the events to the Sockeye!

This will give you a better understanding of what a `sink` is and also how a `Broker` or `Trigger` works. If you cant figure it out, the solution lives in the `./WorkingPracticeSolution/solution.yaml` file.
