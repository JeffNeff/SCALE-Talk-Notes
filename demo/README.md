# SCALE Demo

## Introduction


## Set up a Triggermesh Development Environment

1. Install Docker Desktop

https://www.docker.com/products/docker-desktop/


1. Enable Kubernetes in Docker Desktop

https://docs.docker.com/desktop/kubernetes/



1. Run the `DockerDesktop.sh` script from the `/Triggermesh-Quick-Start/Install/DockerDesktop` directory


```bash
./Triggermesh-Quick-Start/Install/DockerDesktop/DockerDesktop.sh
```


1. If everything installed properly, you should see a message like this:

```
NAME      URL                                                                        AGE   READY   REASON
default   http://broker-ingress.knative-eventing.svc.cluster.local/default/default   40s   True
-e  🚀 Triggermesh install took: 1m59s
-e  🎉 Now have some fun with Serverless and Event Driven Apps
```


## Playing with Triggermesh

I have created a small series of demos to show how to leverage the different components that Triggermesh exposes.

The demos can be found in the `/demo/Triggermesh-Quick-Start/Demo` directory of this repository.

The demos are broken down into the following categories:

`./Step1/Debugging/` - Learn the flow of events and how to view/inject events.

`./Step2/EventSources/` - Use one of the Triggermesh event Sources to send events.

`./Step3/EventTargets/` - Use one of the Triggermesh event Targets to receive events.

`./Step4/Transformations/` - Use one of the Triggermesh transformations to transform events.

`./Step5/AdvancedRouting/` - Use one of the Triggermesh event routing mechanisms to route events. (TODO)

`./Step6/Testing/` - Use the Triggermesh testing framework to test your Triggermesh components. (TODO)

`./Step7/BringYourOwn/` - Bring your own data to the Triggermesh ecosystem. (TODO)
