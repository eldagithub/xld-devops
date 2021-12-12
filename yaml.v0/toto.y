---
apiVersion: xl-deploy/v1
kind: Applications
spec:
- name: Applications/QSVC/ORDERPASSING/qsvc-orderpassing-war/a.b.c/orderpassing-war
  type: jee.War
  tags:
  - pmsa
  scanPlaceholders: true
  fileEncodings:
    ".+\\.properties": ISO-8859-1
  file: !file "artifacts/Applications/QSVC/ORDERPASSING/qsvc-orderpassing-war/a.b.c/orderpassing-war/orderPassing-feature1.0.0.war"
