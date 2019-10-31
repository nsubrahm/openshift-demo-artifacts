#!/bin/bash
function init {
    INSTALL_DIR=${PWD}
    PROJECT_HOME=${INSTALL_DIR}/openshift-demo-artifacts
    YAML_HOME=${PROJECT_HOME}/yaml
}
#
function ocCheck {
    if [ `oc version --short ` -eq 0 ] ; then
        echo 'OpenShift cluster is running'
        return 1
    else
        echo 'Could not connect to OpenShift cluster. Exiting.'
        return 0
    fi
}
#
function createObjects {
    oc create -f ${YAML_HOME}/openshift-demo-project.yaml
    if [ $? -eq 0 ] ; then 
        echo 'Project added.'
    else
        echo 'Project not added.'
#    
    oc create -f ${YAML_HOME}/openshift-demo-configmap.yaml
    if [ $? -eq 0 ] ; then 
        echo 'Configuration map added.'
    else
        echo 'Configuration map not added.'
#
    oc create -f ${YAML_HOME}/openshift-demo-service.yaml
    if [ $? -eq 0 ] ; then 
        echo 'Service added.'
    else
        echo 'Service not added.'
#
    oc create -f ${YAML_HOME}/openshift-demo-endpoint.yaml
    if [ $? -eq 0 ] ; then 
        echo 'Endpoint added.'
    else
        echo 'Endpoint not added.'
#
    oc create -f ${YAML_HOME}/openshift-demo-route.yaml
    if [ $? -eq 0 ] ; then 
        echo 'Route added.'
    else
        echo 'Route not added.'
#
}
#
function run {
    init
    if [ ocCheck -eq 1 ] ; then
        createObjects
    fi
    exit $?
}