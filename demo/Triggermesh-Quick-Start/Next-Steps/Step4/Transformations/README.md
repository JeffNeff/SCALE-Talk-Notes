# Step 4 Transformations

Now that we have a pretty good picture of how to use event Sources and Targets, lets talk about another important part of Triggermesh.

Transformation components provide an interface to easily create custom transformations of events based on your individual buisness logic needs.

## Example Usage of Transformations

In this example we will be injesting events from Github via the `GithubEventSource`, transforming them using the Triggermesh `Bumblebee` transformation, and then sending the transformed events to Splunk.

The flow could be visualized as follows:
```
┌───────────┐   ┌───────────┐    ┌───────────┐
│ Github    │   │           │    │           │
│ Events    ├──►│Bumblebee  ├───►│  Twilio   ├
│           │   │           │    │           │
└───────────┘   └───────────┘    └───────────┘
```
