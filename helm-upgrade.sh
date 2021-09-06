#!/bin/bash
# Files are ordered in proper order with needed wait for the dependent custom resource definitions to get initialized.
# Usage: bash helm-apply.sh
cs=csvc
suffix=helm
if [ -d "${cs}-${suffix}" ]; then
helm dep up ./${cs}-${suffix}
helm upgrade --install ${cs} ./${cs}-${suffix} --namespace jhipster
fi
helm dep up ./invoice-${suffix}
helm upgrade --install invoice ./invoice-${suffix} --namespace jhipster
helm dep up ./notification-${suffix}
helm upgrade --install notification ./notification-${suffix} --namespace jhipster
helm dep up ./product-${suffix}
helm upgrade --install product ./product-${suffix} --namespace jhipster
helm dep up ./store-${suffix}
helm upgrade --install store ./store-${suffix} --namespace jhipster


