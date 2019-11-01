#!/bin/bash
function init {
    INSTALL_DIR=${PWD}
    PROJECT_HOME=${INSTALL_DIR}/openshift-demo-artifacts
    YAML_HOME=${PROJECT_HOME}/yaml
}
#
function ocCheck {
    if `oc version --short > /dev/null` ; then
        echo 'OpenShift cluster is running'
        return 0
    else
        echo 'Could not connect to OpenShift cluster. Exiting.'
        return 1
    fi
}
#
function createObjects {
    oc new-project custdemo
    if [ $? -eq 0 ] ; then 
        echo 'Project added.'
    else
        echo 'Project not added.'
    fi
#    
    oc create -f ${YAML_HOME}/openshift-demo-configmap.yaml
    if [ $? -eq 0 ] ; then 
        echo 'Configuration map added.'
    else
        echo 'Configuration map not added.'
    fi        
#
    oc create -f ${YAML_HOME}/openshift-demo-service.yaml
    if [ $? -eq 0 ] ; then 
        echo 'Service added.'
    else
        echo 'Service not added.'
    fi        
#
    oc create -f ${YAML_HOME}/openshift-demo-endpoint.yaml
    if [ $? -eq 0 ] ; then 
        echo 'Endpoint added.'
    else
        echo 'Endpoint not added.'
    fi        
#
    oc create -f ${YAML_HOME}/openshift-demo-route.yaml
    if [ $? -eq 0 ] ; then 
        echo 'Route added.'
    else
        echo 'Route not added.'
    fi        
#
    oc create -f ${YAML_HOME}/openshift-demo-deployment-config.yaml
    if [ $? -eq 0 ] ; then 
        echo 'Deployment configuration added.'
    else
        echo 'Deployment configuration not added.'
    fi        
#
}
#
function run {
    init
    if ocCheck ; then
        createObjects
    fi
    exit $?
}
#
run