{{/* vim: set filetype=mustache: */}}
{{/*
mongodb customisation
*/}}
{{- define "mongodb-replicaset.name" -}}
{{- default "notification-mongodb" -}}
{{- end -}}

{{- define "mongodb-replicaset.fullname" -}}
{{- default "notification-mongodb" -}}
{{- end -}}
