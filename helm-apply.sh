#!/bin/bash
# Files are ordered in proper order with needed wait for the dependent custom resource definitions to get initialized.
# Usage: bash helm-apply.sh
cs=csvc
suffix=helm
kubectl apply -f namespace.yml
kubectl label namespace jhipster istio-injection=enabled
helmVersion=$(helm version --client | grep -E -c "v3\\.[0-9]{1,3}\\.[0-9]{1,3}")
if [ -d "${cs}-${suffix}" ]; then
  if [ "$helmVersion" -eq 1 ]; then
helm uninstall ${cs} 2>/dev/null
  else
helm delete --purge ${cs} 2>/dev/null
  fi
helm dep up ./${cs}-${suffix}
  if [ "$helmVersion" -eq 1 ]; then
helm install ${cs} ./${cs}-${suffix} --replace --namespace jhipster
  else
helm install --name ${cs} ./${cs}-${suffix} --replace --namespace jhipster
  fi
fi
  if [ "$helmVersion" -eq 1 ]; then
helm uninstall invoice 2>/dev/null
  else
helm delete --purge invoice 2>/dev/null
  fi
helm dep up ./invoice-${suffix}
  if [ "$helmVersion" -eq 1 ]; then
helm install invoice  ./invoice-${suffix} --replace --namespace jhipster
  else
helm install --name invoice  ./invoice-${suffix} --replace --namespace jhipster
  fi
  if [ "$helmVersion" -eq 1 ]; then
helm uninstall notification 2>/dev/null
  else
helm delete --purge notification 2>/dev/null
  fi
helm dep up ./notification-${suffix}
  if [ "$helmVersion" -eq 1 ]; then
helm install notification  ./notification-${suffix} --replace --namespace jhipster
  else
helm install --name notification  ./notification-${suffix} --replace --namespace jhipster
  fi
  if [ "$helmVersion" -eq 1 ]; then
helm uninstall product 2>/dev/null
  else
helm delete --purge product 2>/dev/null
  fi
helm dep up ./product-${suffix}
  if [ "$helmVersion" -eq 1 ]; then
helm install product  ./product-${suffix} --replace --namespace jhipster
  else
helm install --name product  ./product-${suffix} --replace --namespace jhipster
  fi
  if [ "$helmVersion" -eq 1 ]; then
helm uninstall store 2>/dev/null
  else
helm delete --purge store 2>/dev/null
  fi
helm dep up ./store-${suffix}
  if [ "$helmVersion" -eq 1 ]; then
helm install store  ./store-${suffix} --replace --namespace jhipster
  else
helm install --name store  ./store-${suffix} --replace --namespace jhipster
  fi


