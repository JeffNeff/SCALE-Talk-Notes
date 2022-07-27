# Step 3 Event Targets

Now that we can send our own events to Sockeye, lets try replacing it with a Triggermesh event Target.

For this example we will be sending events from Google Cloud Pub Sub to SQS.

# Example Usage of Event Targets

After replacing the properties wrapped in `<>` brackets in the provided `./pubsub-to-SQS.yaml` manifest with your own values, apply the manifest to your cluster.

```
kubectl apply -f pubsub-to-sqs.yaml
```

Now push some messages to pubsub and you should see the events appear in SQS!

## Working Practice

Try configuring a `wire-tap` by replacing the `sink` property of the `PubSubSource` with a `Broker`. Then configure a `Trigger` to route the events to a `sockeye` service.

If you cant figure it out, the solution lives in the `./WorkingPracticeSolution/solution.yaml` file.
