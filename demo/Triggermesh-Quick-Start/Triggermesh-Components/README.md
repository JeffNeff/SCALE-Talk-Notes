# Next-Steps

Here you will find 5 folders that contain various Triggermesh components:


- `./Debugging` contains several example debugging tools, and some senario usage.

- `./Sources` contains several example event Sources.

- `./Targets` contains several example event Targets(aka sink).

- `./Transformations` contains several example event transformations.

- `./Routing` contains several routing components, used to dynamically route events.

- `./Bridges` contains several example Bridge, or complete integration, examples. This is the most important folder, as its here we put all the above components to use!


In each folder the manifest can be applied by running `kubectl apply -f <manifest>`. For example in the `./Debugging/PingSource/Example` folder you can run `kubectl apply -f ping-sockeye.yaml` to apply the example manifest.

Verify the deployment was successful by running `kubectl get pods` or `kubectl get ksvc`. This will return a list of pods/services that are running in the namespace, like so:
```
% kubectl get ksvc
NAME      URL                                         LATESTCREATED   LATESTREADY     READY   REASON
sockeye   http://sockeye.default.127.0.0.1.sslip.io   sockeye-00001   sockeye-00001   True
```

If the service exposes a public url, like Sockeye does, one can view this service in a browser by navigating to the url.

In this example, If you navigate to the Sockeye url, and then to the `Cloudevents` tab, you will see a list of all the events that have been sent to the Sockeye by the Pingsource.

One can also view the events via the logs by running `kubectl logs <sockeye-pod-name> user-container`.

example:
```
$ kubectl logs sockeye-00001-deployment-65bbb9bf4c-rf7zn user-container
  2022/06/26 20:47:29 Server starting on port 8080
  2022/06/26 20:47:41 WS connection...
  got Validation: valid
  Context Attributes,
    specversion: 1.0
    type: dev.knative.sources.ping
    source: /apis/v1/namespaces/default/pingsources/ping-sockeye
    id: a49f484a-185d-4ec0-915b-0a4ac694ce1c
    time: 2022-06-26T20:48:00.348269162Z
  Data,
    {"name": "triggermesh"}

  2022/06/26 20:48:00 Broadasting to 1 clients: {"data":{"name":"triggermesh"},"id":"a49f484a-185d-4ec0-915b-0a4ac694ce1c","source":"/apis/v1/namespaces/default/pingsources/ping-sockeye","specversion":"1.0","time":"2022-06-26T20:48:00.348269162Z","type":"dev.knative.sources.ping"}
  2022/06/26 20:48:00 Broadasting message to client 272f9eec-3eb7-47fb-9023-915816d98919
  2022/06/26 20:48:00 On send {"data":{"name":"triggermesh"},"id":"a49f484a-185d-4ec0-915b-0a4ac694ce1c","source":"/apis/v1/namespaces/default/pingsources/ping-sockeye","specversion":"1.0","time":"2022-06-26T20:48:00.348269162Z","type":"dev.knative.sources.ping"} - true
  2022/06/26 20:48:00 WS connection...
```



This repository is a work in progress, soon each sub directory will contain a README.md file with a short description of the example or component and provide usage instructions.
