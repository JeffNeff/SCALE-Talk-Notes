#!/bin/bash
KNATIVE_NET=${KNATIVE_NET:-kourier}
KNATIVE_VERSION=${KNATIVE_VERSION:-1.2.2}
KNATIVE_EVENTING_VERSION=${KNATIVE_EVENTING_VERSION:-1.2.0}
NAMESPACE=${NAMESPACE:-default}
BROKER_NAME=${BROKER_NAME:-default}
KNATIVE_NET_KOURIER_VERSION=${KNATIVE_NET_KOURIER_VERSION:-1.2.0}
TRIGGERMESH_VERSION=${TRIGGERMESH_VERSION:-v1.18.1}

STARTTIME=$(date +%s)
echo -e "🍿 Installing Knative Serving... \033[0m"
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v${KNATIVE_VERSION}/serving-crds.yaml
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v${KNATIVE_VERSION}/serving-core.yaml
sleep 10

echo -e "🔌 Installing Knative Serving Networking Layer Kourier... \033[0m"
kubectl apply -f https://github.com/knative/net-kourier/releases/download/knative-v${KNATIVE_VERSION}/kourier.yaml
sleep 10

kubectl patch configmap/config-network \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"ingress-class":"kourier.ingress.networking.knative.dev"}}'
kubectl --namespace kourier-system get service kourier
kubectl get pods -n knative-serving
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v${KNATIVE_EVENTING_VERSION}/serving-default-domain.yaml

echo -e "🔥 Installing Knative Eventing... \033[0m"
n=0
until [ $n -ge 2 ]; do
  kubectl apply -f https://github.com/knative/eventing/releases/download/knative-v${KNATIVE_EVENTING_VERSION}/eventing-crds.yaml > /dev/null && break
  echo "Eventing CRDs failed to install on first try"
  n=$[$n+1]
  sleep 5
done
kubectl wait --for=condition=Established --all crd > /dev/null
n=0
until [ $n -ge 2 ]; do
  kubectl apply -f https://github.com/knative/eventing/releases/download/knative-v${KNATIVE_EVENTING_VERSION}/eventing-core.yaml > /dev/null && break
  echo "Eventing Core failed to install on first try"
  n=$[$n+1]
  sleep 5
done
kubectl wait pod --timeout=-1s --for=condition=Ready -l '!job-name' -n knative-eventing > /dev/null
n=0
until [ $n -ge 2 ]; do
  kubectl apply -f https://github.com/knative/eventing/releases/download/knative-v${KNATIVE_EVENTING_VERSION}/in-memory-channel.yaml > /dev/null && break
  echo "Eventing Memory Channel failed to install on first try"
  n=$[$n+1]
  sleep 5
done
kubectl wait pod --timeout=-1s --for=condition=Ready -l '!job-name' -n knative-eventing > /dev/null
n=0
until [ $n -ge 2 ]; do
  kubectl apply -f https://github.com/knative/eventing/releases/download/knative-v${KNATIVE_EVENTING_VERSION}/mt-channel-broker.yaml > /dev/null && break
  echo "Eventing MT Memory Broker failed to install on first try"
  n=$[$n+1]
  sleep 5
done
kubectl wait pod --timeout=-1s --for=condition=Ready -l '!job-name' -n knative-eventing > /dev/null

kubectl apply -f - <<EOF
apiVersion: eventing.knative.dev/v1
kind: broker
metadata:
 name: ${BROKER_NAME}
 namespace: ${NAMESPACE}
EOF

echo -e "🦾 Installing Triggermesh ... \033[0m"
echo "Setting up Triggermesh"
kubectl apply -f https://github.com/triggermesh/triggermesh/releases/download/${TRIGGERMESH_VERSION}/triggermesh-crds.yaml
kubectl wait --for=condition=Established --all crd
kubectl apply -f https://github.com/triggermesh/triggermesh/releases/download/${TRIGGERMESH_VERSION}/triggermesh.yaml
kubectl wait pod --timeout=-1s --for=condition=Ready -l '!job-name' -n triggermesh
kubectl -n ${NAMESPACE} get broker ${BROKER_NAME}
DURATION=$(($(date +%s) - $STARTTIME))
echo -e "\033[0;92m 🚀 Triggermesh install took: $(($DURATION / 60))m$(($DURATION % 60))s \033[0m"
echo -e "\033[0;92m 🎉 Now have some fun with Serverless and Event Driven Apps \033[0m"
